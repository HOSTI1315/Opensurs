local md5 = {}
local hmac = {}
local base64 = {}

do
	do
		local T = {
			0xd76aa478,
			0xe8c7b756,
			0x242070db,
			0xc1bdceee,
			0xf57c0faf,
			0x4787c62a,
			0xa8304613,
			0xfd469501,
			0x698098d8,
			0x8b44f7af,
			0xffff5bb1,
			0x895cd7be,
			0x6b901122,
			0xfd987193,
			0xa679438e,
			0x49b40821,
			0xf61e2562,
			0xc040b340,
			0x265e5a51,
			0xe9b6c7aa,
			0xd62f105d,
			0x02441453,
			0xd8a1e681,
			0xe7d3fbc8,
			0x21e1cde6,
			0xc33707d6,
			0xf4d50d87,
			0x455a14ed,
			0xa9e3e905,
			0xfcefa3f8,
			0x676f02d9,
			0x8d2a4c8a,
			0xfffa3942,
			0x8771f681,
			0x6d9d6122,
			0xfde5380c,
			0xa4beea44,
			0x4bdecfa9,
			0xf6bb4b60,
			0xbebfbc70,
			0x289b7ec6,
			0xeaa127fa,
			0xd4ef3085,
			0x04881d05,
			0xd9d4d039,
			0xe6db99e5,
			0x1fa27cf8,
			0xc4ac5665,
			0xf4292244,
			0x432aff97,
			0xab9423a7,
			0xfc93a039,
			0x655b59c3,
			0x8f0ccc92,
			0xffeff47d,
			0x85845dd1,
			0x6fa87e4f,
			0xfe2ce6e0,
			0xa3014314,
			0x4e0811a1,
			0xf7537e82,
			0xbd3af235,
			0x2ad7d2bb,
			0xeb86d391,
		}

		local function add(a, b)
			local lsw = bit32.band(a, 0xFFFF) + bit32.band(b, 0xFFFF)
			local msw = bit32.rshift(a, 16) + bit32.rshift(b, 16) + bit32.rshift(lsw, 16)
			return bit32.bor(bit32.lshift(msw, 16), bit32.band(lsw, 0xFFFF))
		end

		local function rol(x, n)
			return bit32.bor(bit32.lshift(x, n), bit32.rshift(x, 32 - n))
		end

		local function F(x, y, z)
			return bit32.bor(bit32.band(x, y), bit32.band(bit32.bnot(x), z))
		end
		local function G(x, y, z)
			return bit32.bor(bit32.band(x, z), bit32.band(y, bit32.bnot(z)))
		end
		local function H(x, y, z)
			return bit32.bxor(x, bit32.bxor(y, z))
		end
		local function I(x, y, z)
			return bit32.bxor(y, bit32.bor(x, bit32.bnot(z)))
		end

		function md5.sum(message)
			local a, b, c, d = 0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476

			local message_len = #message
			local padded_message = message .. "\128"
			while #padded_message % 64 ~= 56 do
				padded_message = padded_message .. "\0"
			end

			local len_bytes = ""
			local len_bits = message_len * 8
			for i = 0, 7 do
				len_bytes = len_bytes .. string.char(bit32.band(bit32.rshift(len_bits, i * 8), 0xFF))
			end
			padded_message = padded_message .. len_bytes

			for i = 1, #padded_message, 64 do
				local chunk = padded_message:sub(i, i + 63)
				local X = {}
				for j = 0, 15 do
					local b1, b2, b3, b4 = chunk:byte(j * 4 + 1, j * 4 + 4)
					X[j] = bit32.bor(b1, bit32.lshift(b2, 8), bit32.lshift(b3, 16), bit32.lshift(b4, 24))
				end

				local aa, bb, cc, dd = a, b, c, d

				local s = { 7, 12, 17, 22, 5, 9, 14, 20, 4, 11, 16, 23, 6, 10, 15, 21 }

				for j = 0, 63 do
					local f, k, shift_index
					if j < 16 then
						f = F(b, c, d)
						k = j
						shift_index = j % 4
					elseif j < 32 then
						f = G(b, c, d)
						k = (1 + 5 * j) % 16
						shift_index = 4 + (j % 4)
					elseif j < 48 then
						f = H(b, c, d)
						k = (5 + 3 * j) % 16
						shift_index = 8 + (j % 4)
					else
						f = I(b, c, d)
						k = (7 * j) % 16
						shift_index = 12 + (j % 4)
					end

					local temp = add(a, f)
					temp = add(temp, X[k])
					temp = add(temp, T[j + 1])
					temp = rol(temp, s[shift_index + 1])

					local new_b = add(b, temp)
					a, b, c, d = d, new_b, b, c
				end

				a = add(a, aa)
				b = add(b, bb)
				c = add(c, cc)
				d = add(d, dd)
			end

			local function to_le_hex(n)
				local s = ""
				for i = 0, 3 do
					s = s .. string.char(bit32.band(bit32.rshift(n, i * 8), 0xFF))
				end
				return s
			end

			return to_le_hex(a) .. to_le_hex(b) .. to_le_hex(c) .. to_le_hex(d)
		end
	end

	do
		function hmac.new(key, msg, hash_func)
			if #key > 64 then
				key = hash_func(key)
			end

			local o_key_pad = ""
			local i_key_pad = ""
			for i = 1, 64 do
				local byte = (i <= #key and string.byte(key, i)) or 0
				o_key_pad = o_key_pad .. string.char(bit32.bxor(byte, 0x5C))
				i_key_pad = i_key_pad .. string.char(bit32.bxor(byte, 0x36))
			end

			return hash_func(o_key_pad .. hash_func(i_key_pad .. msg))
		end
	end

	do
		local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

		function base64.encode(data)
			return (
				(data:gsub(".", function(x)
					local r, b_val = "", x:byte()
					for i = 8, 1, -1 do
						r = r .. (b_val % 2 ^ i - b_val % 2 ^ (i - 1) > 0 and "1" or "0")
					end
					return r
				end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(x)
					if #x < 6 then
						return ""
					end
					local c = 0
					for i = 1, 6 do
						c = c + (x:sub(i, i) == "1" and 2 ^ (6 - i) or 0)
					end
					return b:sub(c + 1, c + 1)
				end) .. ({ "", "==", "=" })[#data % 3 + 1]
			)
		end
	end
end

local function GenerateReservedServerCode(placeId)
	local uuid = {}
	for i = 1, 16 do
		uuid[i] = math.random(0, 255)
	end

	uuid[7] = bit32.bor(bit32.band(uuid[7], 0x0F), 0x40) -- v4
	uuid[9] = bit32.bor(bit32.band(uuid[9], 0x3F), 0x80) -- RFC 4122

	local firstBytes = ""
	for i = 1, 16 do
		firstBytes = firstBytes .. string.char(uuid[i])
	end

	local gameCode =
		string.format("%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x", table.unpack(uuid))

	local placeIdBytes = ""
	local pIdRec = placeId
	for _ = 1, 8 do
		placeIdBytes = placeIdBytes .. string.char(pIdRec % 256)
		pIdRec = math.floor(pIdRec / 256)
	end

	local content = firstBytes .. placeIdBytes

	local SUPERDUPERSECRETROBLOXKEYTHATTHEYDIDNTCHANGEEVERSINCEFOREVER = "e4Yn8ckbCJtw2sv7qmbg" -- legacy leaked key from ages ago that still works due to roblox being roblox.
	local signature = hmac.new(SUPERDUPERSECRETROBLOXKEYTHATTHEYDIDNTCHANGEEVERSINCEFOREVER, content, md5.sum)

	local accessCodeBytes = signature .. content

	local accessCode = base64.encode(accessCodeBytes)
	accessCode = accessCode:gsub("+", "-"):gsub("/", "_")

	local pdding = 0
	accessCode, _ = accessCode:gsub("=", function()
		pdding = pdding + 1
		return ""
	end)

	accessCode = accessCode .. tostring(pdding)

	return accessCode, gameCode
end

local accessCode, _ = GenerateReservedServerCode(game.PlaceId)
game.RobloxReplicatedStorage.ContactListIrisInviteTeleport:FireServer(game.PlaceId, "", accessCode)
