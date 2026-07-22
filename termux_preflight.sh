#!/data/data/com.termux/files/usr/bin/bash
# termux_preflight.sh — проверка готовности телефона под GameChecker "всё на одном устройстве"
# (нода + Roblox+Delta на одном рутнутом Android, без ADB, бридж на 127.0.0.1).
# Запуск в Termux:  bash termux_preflight.sh
# НИЧЕГО не ставит и не меняет — только проверяет и говорит, чего не хватает.

OK=0; WARN=0; BAD=0
line() { printf '%-34s %s\n' "$1" "$2"; }
ok()   { line "$1" "[OK]  $2"; OK=$((OK+1)); }
warn() { line "$1" "[~]   $2"; WARN=$((WARN+1)); }
bad()  { line "$1" "[NO]  $2"; BAD=$((BAD+1)); }

# root: Magisk (su -c) ИЛИ toybox (su 0 sh -c)
R() { su -c "$*" 2>/dev/null || su 0 sh -c "$*" 2>/dev/null; }

echo "=============================================================="
echo " GameChecker · Termux preflight  ($(date '+%Y-%m-%d %H:%M'))"
echo "=============================================================="

# ---------- 1. Termux ----------
if echo "$PREFIX" | grep -q com.termux; then ok "1. Termux окружение" "$PREFIX"
else warn "1. Termux окружение" "PREFIX не как в Termux — запусти внутри Termux"; fi

# ---------- 2. ROOT (КРИТИЧНО) ----------
RID="$(R id)"
if echo "$RID" | grep -q 'uid=0'; then
  MODE=$(su -c id 2>/dev/null | grep -q uid=0 && echo 'su -c' || echo 'su 0')
  ok "2. ROOT (su)  *критично*" "uid=0 · режим '$MODE'"
  HAS_ROOT=1
else
  bad "2. ROOT (su)  *критично*" "нет uid=0 — БЕЗ РУТА проект не запустится (инъекция/logcat/force-stop)"
  HAS_ROOT=0
fi

# ---------- 3. Roblox-клиент / экзекутор ----------
PKGS="$(R 'pm list packages' | sed 's/package://')"
[ -z "$PKGS" ] && PKGS="$(pm list packages 2>/dev/null | sed 's/package://')"
RBX="$(echo "$PKGS" | grep -iE 'roblox|noka' | head -5)"
if [ -n "$RBX" ]; then ok "3. Roblox-клиент" "$(echo $RBX | tr '\n' ' ')"
else bad "3. Roblox-клиент" "не найден com.roblox.client / репак — установи Roblox (или Delta-репак)"; fi
# Delta autoexec-папка = признак экзекутора
if R '[ -d /sdcard/Delta/Autoexecute ] && echo Y' | grep -q Y; then
  ok "   Delta autoexec" "/sdcard/Delta/Autoexecute есть"
elif [ -d /sdcard/Delta/Autoexecute ]; then ok "   Delta autoexec" "есть"
else warn "   Delta autoexec" "нет /sdcard/Delta/ — Delta ещё не ставилась/не запускалась"; fi

# ---------- 4. root дотягивается до приватной папки Roblox (тест инъекции) ----------
RPKG="$(echo "$RBX" | grep -iE 'roblox|noka' | head -1)"; [ -z "$RPKG" ] && RPKG="com.roblox.client"
if [ "$HAS_ROOT" = 1 ]; then
  if R "ls /data/data/$RPKG >/dev/null 2>&1 && echo Y" | grep -q Y; then
    ok "4. root→приватная папка" "/data/data/$RPKG доступна (куку впишем)"
  else warn "4. root→приватная папка" "$RPKG не установлен или папки нет (создастся при первом запуске)"; fi
else bad "4. root→приватная папка" "нужен root"; fi

# ---------- 5. sqlite3 (инъекция куки) ----------
if R 'which sqlite3' | grep -q sqlite3 || R '[ -f /system/bin/sqlite3 ] && echo Y' | grep -q Y; then
  ok "5. sqlite3 (в системе)" "$(R 'which sqlite3' || echo /system/bin/sqlite3)"
elif command -v sqlite3 >/dev/null 2>&1; then
  ok "5. sqlite3 (в Termux)" "$(command -v sqlite3)"
else bad "5. sqlite3" "нет — поставь: pkg install sqlite  (или в системе)"; fi

# ---------- 6. logcat через root (детект захода/276/капчи) ----------
if [ "$HAS_ROOT" = 1 ] && R 'logcat -d -t 1' | grep -q .; then
  ok "6. logcat (root)" "читается — детект событий будет работать"
else bad "6. logcat (root)" "без root logcat отдаёт только свой лог — детект не сработает"; fi

# ---------- 7. am / pm / cmd / pidof (запуск, детект пакета/процесса) ----------
AMOK=$( { R 'which am' ; command -v am; } | grep -c . )
[ "$AMOK" -gt 0 ] && ok "7. am (запуск игры)" "есть" || bad "7. am (запуск игры)" "нет команды am"
R 'cmd package resolve-activity -a android.intent.action.VIEW -d roblox://placeId=1' | grep -qi packageName \
  && ok "   cmd resolve-activity" "детект пакета работает" \
  || warn "   cmd resolve-activity" "не отработала (детект пакета — фолбэк на pm list)"
{ R 'which pidof'; command -v pidof; } | grep -q . && ok "   pidof (жив ли Roblox)" "есть" \
  || warn "   pidof" "нет — детект краша через pgrep-фолбэк"

# ---------- 8. Python + модули ноды ----------
if command -v python >/dev/null 2>&1; then
  PV="$(python --version 2>&1)"; ok "8. Python (Termux)" "$PV"
  for m in websockets flask requests; do
    if python -c "import $m" 2>/dev/null; then ok "   модуль $m" "есть"
    else bad "   модуль $m" "нет — pip install $m"; fi
  done
else bad "8. Python (Termux)" "нет — pkg install python && pip install websockets flask requests"; fi

# ---------- 9. локальный порт для бриджа (Delta → 127.0.0.1:8770) ----------
if command -v python >/dev/null 2>&1; then
  if python - <<'PY' 2>/dev/null
import socket
s=socket.socket(); s.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
s.bind(("127.0.0.1",8770)); s.close()
PY
  then ok "9. bind 127.0.0.1:8770" "порт бриджа свободен"
  else warn "9. bind 127.0.0.1:8770" "порт занят/недоступен — сменить порт бриджа"; fi
else warn "9. bind 127.0.0.1:8770" "нет python — проверить позже"; fi

# ---------- 10. интернет (прайсинг starpets/bloxtunnel) ----------
if command -v curl >/dev/null 2>&1 && curl -s -m 8 -o /dev/null -w '%{http_code}' https://market.apineural.com 2>/dev/null | grep -qE '^[23]'; then
  ok "10. интернет-egress" "apineural/starpets достижимы"
elif command -v python >/dev/null 2>&1 && python -c "import urllib.request as u; u.urlopen('https://market.apineural.com',timeout=8)" 2>/dev/null; then
  ok "10. интернет-egress" "достижимо (python)"
else warn "10. интернет-egress" "не проверилось (нет curl / нет сети) — прайсинг может не тянуться"; fi

# ---------- ИТОГ ----------
echo "--------------------------------------------------------------"
printf ' ИТОГ:  OK=%d   warn=%d   NO=%d\n' "$OK" "$WARN" "$BAD"
if [ "$HAS_ROOT" = 1 ] && [ "$BAD" -eq 0 ]; then
  echo ' ВЕРДИКТ: всё готово — проект портируется на этот телефон.'
elif [ "$HAS_ROOT" = 1 ]; then
  echo ' ВЕРДИКТ: root есть → реально. Доустанови [NO]-пункты (обычно: pkg install python sqlite; pip install websockets flask requests).'
else
  echo ' ВЕРДИКТ: НЕТ ROOT — без него никак (инъекция куки + logcat + force-stop). Это стоппер.'
fi
echo "=============================================================="
