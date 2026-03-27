local Sound = Instance.new("Sound", game:GetService("SoundService"));
Sound.SoundId = "rbxassetid://232127604";
Sound:Play();
local args1 = {[1] = "RolePlayName", [2] = "Gui Slowed"};
game:GetService("ReplicatedStorage").RE:FindFirstChild(
    "1RPNam1eTex1t"):FireServer(unpack(args1));
local args = {
    [1] = "PickingRPNameColor",
    [2] = Color3.fromRGB(194, 56, 164)
};
game:GetService("ReplicatedStorage").RE:FindFirstChild(
    "1RPNam1eColo1r"):FireServer(unpack(args));
local args4 = {[1] = "RolePlayBio", [2] = "Slowed Studios"};
game:GetService("ReplicatedStorage").RE:FindFirstChild(
    "1RPNam1eTex1t"):FireServer(unpack(args4));
local OrionLib = loadstring(game:HttpGet(
                                "https://you.whimper.xyz/sources/slowed/0"))();
local Window = OrionLib:MakeWindow({
    Name = "Slowed Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "XScriptHub",
    IntroText = "Slowed Studios"
});
local CRD = Window:MakeTab({
    Name = "informações",
    Icon = "rbxassetid://15764521947",
    PremiumOnly = false
});
local HH = Window:MakeTab({
    Name = "Início",
    Icon = "rbxassetid://15764493661",
    PremiumOnly = false
});
local JJ = Window:MakeTab({
    Name = "Jogador",
    Icon = "rbxassetid://18304402950",
    PremiumOnly = false
});
local HouseTab = Window:MakeTab({
    Name = "Casas",
    Icon = "rbxassetid://109334249980199",
    PremiumOnly = false
});
local TT = Window:MakeTab({
    Name = "Troll",
    Icon = "rbxassetid://72879917771754",
    PremiumOnly = false
});
local utilitiesTab = Window:MakeTab({
    Name = "Configurações",
    Icon = "rbxassetid://140270687691975",
    PremiumOnly = false
});
local Section = CRD:AddSection({Name = "🎄 Creator 🎄"});
CRD:AddLabel("Dev - Scritp: CodeCraft / MatheuszinZK");
local function copyText()
    local textToCopy = "https://discord.gg/25ms";
    setclipboard(textToCopy);
    OrionLib:MakeNotification({
        Name = "Texto Copiado",
        Content = "O link do dc foi copiado para a área de transferência",
        Image = "rbxassetid://15918472454",
        Time = 5
    });
end
CRD:AddButton({
    Name = "Copiar Link Do nosso Doscord",
    Callback = copyText
});
local Section = CRD:AddSection({Name = "Jogo Join"});
local playerName = game.Players.LocalPlayer.Name;
local gameName = "Unknown Game";
local success, gameInfo = pcall(function()
    return game:GetService("MarketplaceService"):GetProductInfo(
                game.PlaceId);
end);
if (success and gameInfo) then gameName = gameInfo.Name; end
CRD:AddLabel("Game Name: " .. gameName);
local exploitCountLabel = CRD:AddLabel("Exploit Quantos: 0");
local Section = HH:AddSection({Name = "Settings - Hub"});
local Players = game:GetService("Players");
local notificationsEnabled = true;
local function showNotification(message, time)
    if notificationsEnabled then
        OrionLib:MakeNotification({
            Name = "Notificação",
            Content = message,
            Time = time or 5
        });
    end
end
Players.PlayerAdded:Connect(function(player)
    showNotification(player.Name .. " entrou no jogo!", 5);
end);
Players.PlayerRemoving:Connect(function(player)
    showNotification(player.Name .. " saiu do jogo!", 5);
end);
local notificationToggle;
notificationToggle = HH:AddToggle({
    Name = "Notificação: Entrada/Saída",
    Default = true,
    Callback = function(Value)
        notificationsEnabled = Value;
    end
});
local playerCountLabel = HH:AddLabel("Pessoas: 0");
local function updatePlayerCount()
    local playerCount = #Players:GetPlayers();
    playerCountLabel:Set("Pessoas: " .. playerCount);
end
Players.PlayerAdded:Connect(updatePlayerCount);
Players.PlayerRemoving:Connect(updatePlayerCount);
updatePlayerCount();
local fpsLabel = HH:AddLabel("FPS: 0");
local lastTime = tick();
local frameCount = 0;
local function updateFPS()
    frameCount = frameCount + 1;
    local currentTime = tick();
    if ((currentTime - lastTime) >= 1) then
        local fps = frameCount / (currentTime - lastTime);
        fpsLabel:Set("FPS: " .. string.format("%.2f", fps));
        lastTime = currentTime;
        frameCount = 0;
    end
end
local Section = HH:AddSection({Name = "Settings - Jogador"});
local speedValue = 16;
HH:AddTextbox({
    Name = "Velocidade",
    Default = "16",
    TextDisappear = true,
    Callback = function(value)
        local number = tonumber(value);
        if number then
            speedValue = number;
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed =
                speedValue;
        end
    end
});
local gravityValue = 196.2;
HH:AddTextbox({
    Name = "Set Gravity",
    Default = "196.2",
    TextDisappear = true,
    Callback = function(value)
        local number = tonumber(value);
        if number then
            gravityValue = number;
            game.Workspace.Gravity = gravityValue;
        end
    end
});
local jumpPower = 50;
HH:AddTextbox({
    Name = "Pulos",
    Default = "50",
    TextDisappear = true,
    Callback = function(value)
        local number = tonumber(value);
        if number then
            jumpPower = number;
            game.Players.LocalPlayer.Character.Humanoid.JumpPower =
                jumpPower;
        end
    end
});
HH:AddButton({
    Name = "Reseta Velocidade/Gravidade/Pulos",
    Callback = function()
        jumpPower = 50;
        game.Players.LocalPlayer.Character.Humanoid.JumpPower =
            jumpPower;
        speedValue = 16;
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed =
            speedValue;
        gravityValue = 196.2;
        game.Workspace.Gravity = gravityValue;
    end
});
local Section = HH:AddSection({Name = "Settings - Esp"});
function isnil(thing) return thing == nil; end
local function round(n)
    return math.floor(tonumber(n) + 0.5);
end
Number = math.random(1, 1000000);
function UpdatePlayerChams()
    for i, v in pairs(game:GetService("Players"):GetChildren()) do
        pcall(function()
            if not isnil(v.Character) then
                if ESPPlayer then
                    if (not isnil(v.Character.Head) and
                        not v.Character.Head:FindFirstChild(
                            "NameEsp" .. Number)) then
                        local bill =
                            Instance.new("BillboardGui",
                                            v.Character.Head);
                        bill.Name = "NameEsp" .. Number;
                        bill.ExtentsOffset = Vector3.new(0, 1, 0);
                        bill.Size = UDim2.new(1, 200, 1, 30);
                        bill.Adornee = v.Character.Head;
                        bill.AlwaysOnTop = true;
                        local name = Instance.new("TextLabel", bill);
                        name.Font = "Legacy";
                        name.FontSize = "Size14";
                        name.TextWrapped = true;
                        name.Text = v.Name .. " \n" ..
                                        round(
                                            (game:GetService(
                                                "Players").LocalPlayer
                                                .Character.Head
                                                .Position -
                                                v.Character.Head
                                                    .Position).Magnitude /
                                                3) .. " M";
                        name.Size = UDim2.new(1, 0, 1, 0);
                        name.TextYAlignment = "Top";
                        name.BackgroundTransparency = 1;
                        name.TextStrokeTransparency = 0.5;
                        if (v.Team == game.Players.LocalPlayer.Team) then
                            name.TextColor3 = Color3.new(0, 255, 0);
                        else
                            name.TextColor3 = Color3.new(255, 0, 0);
                        end
                    else
                        v.Character.Head["NameEsp" .. Number]
                            .TextLabel.Text = v.Name .. " | " ..
                                                    round(
                                                        (game:GetService(
                                                            "Players").LocalPlayer
                                                            .Character
                                                            .Head
                                                            .Position -
                                                            v.Character
                                                                .Head
                                                                .Position).Magnitude /
                                                            3) ..
                                                    " M\nHealth : " ..
                                                    round(
                                                        (v.Character
                                                            .Humanoid
                                                            .Health *
                                                            100) /
                                                            v.Character
                                                                .Humanoid
                                                                .MaxHealth) ..
                                                    "%";
                    end
                elseif v.Character.Head:FindFirstChild("NameEsp" ..
                                                            Number) then
                    v.Character.Head:FindFirstChild("NameEsp" ..
                                                        Number)
                        :Destroy();
                end
            end
        end);
    end
end
HH:AddToggle({
    Name = "Esp Nome",
    Default = false,
    Callback = function(value)
        ESPPlayer = value;
        while ESPPlayer do
            wait();
            UpdatePlayerChams();
        end
    end
});
spawn(function()
    while wait() do
        if ESPPlayer then UpdatePlayerChams(); end
    end
end);
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local Camera = game:GetService("Workspace").CurrentCamera;
local espEnabled = false;
local espObjects = {};
local function createESP(player)
    local espLine = Drawing.new("Line");
    espLine.Visible = false;
    espLine.Color = Color3.fromRGB(255, 0, 0);
    espLine.Thickness = 2;
    espLine.Transparency = 1;
    local espName = Drawing.new("Text");
    espName.Visible = false;
    espName.Color = Color3.fromRGB(255, 255, 255);
    espName.Size = 18;
    espName.Center = true;
    espName.Outline = true;
    espName.Text = player.Name;
    local espHealth = Drawing.new("Text");
    espHealth.Visible = false;
    espHealth.Color = Color3.fromRGB(0, 255, 0);
    espHealth.Size = 18;
    espHealth.Center = true;
    espHealth.Outline = true;
    espObjects[player] = {
        Line = espLine,
        Name = espName,
        Health = espHealth
    };
end
local function updateESP()
    for _, player in pairs(Players:GetPlayers()) do
        if ((player ~= LocalPlayer) and player.Character and
            player.Character:FindFirstChild("HumanoidRootPart")) then
            local hrp = player.Character.HumanoidRootPart;
            local humanoid =
                player.Character:FindFirstChild("Humanoid");
            local screenPos, onScreen =
                Camera:WorldToViewportPoint(hrp.Position);
            if onScreen then
                local espLine = espObjects[player].Line;
                local espName = espObjects[player].Name;
                local espHealth = espObjects[player].Health;
                espLine.From = Vector2.new(
                                    Camera.ViewportSize.X / 2,
                                    Camera.ViewportSize.Y);
                espLine.To = Vector2.new(screenPos.X, screenPos.Y);
                espLine.Visible = espEnabled;
                espName.Position =
                    Vector2.new(screenPos.X, screenPos.Y - 25);
                espName.Visible = espEnabled;
                if humanoid then
                    espHealth.Text = "HP: " ..
                                            math.floor(humanoid.Health);
                    espHealth.Position =
                        Vector2.new(screenPos.X, screenPos.Y - 45);
                    espHealth.Visible = espEnabled;
                end
            else
                espObjects[player].Line.Visible = false;
                espObjects[player].Name.Visible = false;
                espObjects[player].Health.Visible = false;
            end
        end
    end
end
local function toggleESP(value)
    espEnabled = value;
    if espEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if not espObjects[player] then
                createESP(player);
            end
        end
    else
        for _, esp in pairs(espObjects) do
            esp.Line.Visible = false;
            esp.Name.Visible = false;
            esp.Health.Visible = false;
        end
    end
end
HH:AddToggle({
    Name = "Esp Nome + Linhas",
    Default = false,
    Callback = function(value) toggleESP(value); end
});
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local Camera = game:GetService("Workspace").CurrentCamera;
local selectedPlayer = nil;
local spectateEnabled = false;
local function updatePlayerList(dropdown)
    local playerNames = {};
    for _, player in pairs(Players:GetPlayers()) do
        if (player ~= LocalPlayer) then
            table.insert(playerNames, player.Name);
        end
    end
    dropdown:Refresh(playerNames, true);
end
local function spectatePlayer(playerName)
    local targetPlayer = Players:FindFirstChild(playerName);
    if (targetPlayer and targetPlayer.Character and
        targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
        Camera.CameraSubject = targetPlayer.Character.Humanoid;
    end
end
local function stopSpectating()
    Camera.CameraSubject = LocalPlayer.Character.Humanoid;
end
local Section = JJ:AddSection({Name = "Settings - Visualizar"});
local playerDropdown = JJ:AddDropdown({
    Name = "Selecionar Jogador",
    Default = "",
    Options = {},
    Callback = function(value)
        selectedPlayer = value;
    end
});
JJ:AddButton({
    Name = "Atualizar Lista",
    Callback = function()
        updatePlayerList(playerDropdown);
    end
});
JJ:AddToggle({
    Name = "Visualizar Jogador",
    Default = false,
    Callback = function(value)
        spectateEnabled = value;
        if (spectateEnabled and selectedPlayer) then
            spectatePlayer(selectedPlayer);
        else
            stopSpectating();
        end
    end
});
local Section = JJ:AddSection({Name = "Settings - Jogador"});
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local RunService = game:GetService("RunService");
local wallhackEnabled = false;
local function enableWallhack()
    if (LocalPlayer.Character and
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid")) then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false;
            end
        end
    end
end
local function disableWallhack()
    if (LocalPlayer.Character and
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid")) then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true;
            end
        end
    end
end
RunService.RenderStepped:Connect(function()
    if wallhackEnabled then
        enableWallhack();
    else
        disableWallhack();
    end
end);
JJ:AddToggle({
    Name = "Travessa Paredes",
    Default = false,
    Callback = function(value)
        wallhackEnabled = value;
        if not value then disableWallhack(); end
    end
});
local UserInputService = game:GetService("UserInputService");
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local infiniteJumpEnabled = false;
local function onJumpRequest()
    if (infiniteJumpEnabled and LocalPlayer.Character and
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid")) then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            :ChangeState("Jumping");
    end
end
UserInputService.JumpRequest:Connect(onJumpRequest);
JJ:AddToggle({
    Name = "Pulos Infinitos",
    Default = false,
    Callback = function(t) infiniteJumpEnabled = t; end
});
local Section = JJ:AddSection({Name = "Settings - Teleporte"});
local selectedPlayer = nil;
local teleportEnabled = false;
local function updatePlayerList()
    local playerNames = {};
    for _, player in ipairs(Players:GetPlayers()) do
        if (player ~= LocalPlayer) then
            table.insert(playerNames, player.Name);
        end
    end
    return playerNames;
end
local function teleportToPlayer()
    if (selectedPlayer and teleportEnabled) then
        local targetPlayer = Players:FindFirstChild(selectedPlayer);
        if (targetPlayer and targetPlayer.Character and
            targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
            LocalPlayer.Character.HumanoidRootPart.CFrame =
                targetPlayer.Character.HumanoidRootPart.CFrame;
        end
    end
end
JJ:AddDropdown({
    Name = "Selecionar Jogador",
    Default = "",
    Options = updatePlayerList(),
    Callback = function(value)
        selectedPlayer = value;
        if teleportEnabled then
            teleportToPlayer();
        end
    end
});
JJ:AddButton({
    Name = "Atualizar Lista",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Lista Atualizada",
            Content = "A lista de jogadores foi atualizada",
            Image = "rbxassetid://4483345998",
            Time = 5
        });
        JJ:UpdateDropdown("Selecionar Jogador", updatePlayerList());
    end
});
JJ:AddToggle({
    Name = "Ativa-Desativa Teleporte",
    Default = false,
    Callback = function(value)
        teleportEnabled = value;
        if teleportEnabled then
            teleportToPlayer();
        end
    end
});
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if (teleportEnabled and (player.Name == selectedPlayer)) then
            teleportToPlayer();
        end
    end);
end);
game:GetService("RunService").Stepped:Connect(function()
    if (teleportEnabled and selectedPlayer) then
        teleportToPlayer();
    end
end);
local Section = JJ:AddSection({
    Name = "Settings - Alteração De Nomes"
});
JJ:AddTextbox({
    Name = "Altera Nome",
    Default = "Coloque o Nome aqui",
    TextDisappear = false,
    Callback = function(value)
        local args = {[1] = "RolePlayName", [2] = value};
        game:GetService("ReplicatedStorage").RE:FindFirstChild(
            "1RPNam1eTex1t"):FireServer(unpack(args));
    end
});
JJ:AddTextbox({
    Name = "Altera Bio Roleplay",
    Default = "Coloque o Nome aqui",
    TextDisappear = false,
    Callback = function(value)
        local args = {[1] = "RolePlayBio", [2] = value};
        game:GetService("ReplicatedStorage").RE:FindFirstChild(
            "1RPNam1eTex1t"):FireServer(unpack(args));
    end
});
local Section = JJ:AddSection({Name = "Settings - Random Color"});
local function getRandomColor()
    return Color3.new(math.random(), math.random(), math.random());
end
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RemoteEvent = ReplicatedStorage.RE:FindFirstChild(
                        "1RPNam1eColo1r");
local nameColorRunning = false;
local bioColorRunning = false;
local function changeNameColor()
    while nameColorRunning do
        local randomColor = getRandomColor();
        local args = {[1] = "PickingRPNameColor", [2] = randomColor};
        RemoteEvent:FireServer(unpack(args));
        wait(0.5);
    end
end
local function changeBioColor()
    while bioColorRunning do
        local randomColor = getRandomColor();
        local args = {[1] = "PickingRPBioColor", [2] = randomColor};
        RemoteEvent:FireServer(unpack(args));
        wait(0.5);
    end
end
local nameColorToggle;
nameColorToggle = JJ:AddToggle({
    Name = "Nome colorido",
    Default = false,
    Callback = function(Value)
        if Value then
            if not nameColorRunning then
                nameColorRunning = true;
                spawn(changeNameColor);
            end
        else
            nameColorRunning = false;
        end
    end
});
local bioColorToggle;
bioColorToggle = JJ:AddToggle({
    Name = "bio colorida",
    Default = false,
    Callback = function(Value)
        if Value then
            if not bioColorRunning then
                bioColorRunning = true;
                spawn(changeBioColor);
            end
        else
            bioColorRunning = false;
        end
    end
});
local houseNumbers = {
    1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
    22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37
};
local selectedHouseNumber = nil;
HouseTab:AddDropdown({
    Name = "Selecione a Casa",
    Options = houseNumbers,
    Default = 1,
    Callback = function(Value)
        selectedHouseNumber = tonumber(Value);
        print("Casa selecionada:", selectedHouseNumber);
    end
});
HouseTab:AddButton({
    Name = "Dar Permissão",
    Callback = function()
        if selectedHouseNumber then
            local args = {
                [1] = "GivePermissionLoopToServer",
                [2] = game:GetService("Players").LocalPlayer,
                [3] = selectedHouseNumber
            };
            game:GetService("ReplicatedStorage").RE:FindFirstChild(
                "1Playe1rTrigge1rEven1t"):FireServer(unpack(args));
            print("Permissão dada para a casa:",
                    selectedHouseNumber);
        else
            print("Nenhuma casa selecionada!");
        end
    end
});
HouseTab:AddButton({
    Name = "Remover Ban",
    Callback = function()
        if selectedHouseNumber then
            local lotNumber = "0o1.L0ts";
            local lot = workspace:FindFirstChild(lotNumber);
            if lot then
                for _, house in pairs(lot:GetChildren()) do
                    if house:FindFirstChild("HousePickedByPlayer") then
                        local bannedBlockName = "BannedBlock" ..
                                                    selectedHouseNumber;
                        local bannedBlock =
                            house.HousePickedByPlayer.HouseModel:FindFirstChild(
                                bannedBlockName);
                        if bannedBlock then
                            bannedBlock:Destroy();
                            print(bannedBlockName ..
                                        " deletado com sucesso em " ..
                                        house.Name);
                        else
                            print(bannedBlockName ..
                                        " não encontrado em " ..
                                        house.Name);
                        end
                    end
                end
            else
                print("Lote " .. lotNumber .. " não encontrado.");
            end
        else
            print("Nenhuma casa selecionada!");
        end
    end
});
local Section = TT:AddSection({Name = "Settings - Get"});
TT:AddButton({
    Name = "Get guitarra (Sound)",
    Callback = function()
        loadstring(game:HttpGet(
                        "https://you.whimper.xyz/sources/slowed/1"))();
    end
});
TT:AddButton({
    Name = "Get Violão (Sound)",
    Callback = function()
        loadstring(game:HttpGet(
                        "https://you.whimper.xyz/sources/slowed/2"))();
    end
});
TT:AddButton({
    Name = "Get Sofa",
    Callback = function()
        loadstring(game:HttpGet("https://you.whimper.xyz/sources/slowed/3"))();
    end
});
TT:AddButton({
    Name = "Get Tp Tool",
    Callback = function()
        mouse = game.Players.LocalPlayer:GetMouse();
        tool = Instance.new("Tool");
        tool.RequiresHandle = false;
        tool.Name = "teleport";
        tool.Activated:connect(function()
            local pos = mouse.Hit + Vector3.new(0, 2.5, 0);
            pos = CFrame.new(pos.X, pos.Y, pos.Z);
            game.Players.LocalPlayer.Character.HumanoidRootPart
                .CFrame = pos;
        end);
        tool.Parent = game.Players.LocalPlayer.Backpack;
    end
});
local Section = TT:AddSection({Name = "Settings - Humano"});
TT:AddButton({
    Name = "Ficar Pequeno",
    Callback = function()
        local args = {
            [1] = "CharacterSizeUp",
            [2] = 4
        }
        
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
    end
});
TT:AddButton({
    Name = "Voltar Tamanho Normal",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args));
    end
});
local TweenService = game:GetService("TweenService");
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local Section = TT:AddSection({Name = "Settings - Orbitar"});
local selectedPlayer;
local orbiting = false;
local function getPlayers()
    local playerNames = {};
    for _, player in pairs(Players:GetPlayers()) do
        if (player ~= LocalPlayer) then
            table.insert(playerNames, player.Name);
        end
    end
    return playerNames;
end
local playerDropdown = TT:AddDropdown({
    Name = "Select Player",
    Default = "",
    Options = getPlayers(),
    Callback = function(value)
        selectedPlayer = Players:FindFirstChild(value);
    end
});
TT:AddToggle({
    Name = "Start Orbit",
    Default = false,
    Callback = function(value)
        orbiting = value;
        if (orbiting and selectedPlayer) then
            while orbiting do
                local targetPosition =
                    selectedPlayer.Character.HumanoidRootPart
                        .Position;
                local orbitPosition = targetPosition +
                                            Vector3.new(
                                                math.cos(tick() * 20) *
                                                    5, 0, math.sin(
                                                    tick() * 20) * 5);
                local tweenInfo = TweenInfo.new(0.05,
                                                Enum.EasingStyle
                                                    .Linear,
                                                Enum.EasingDirection
                                                    .InOut);
                local tween =
                    TweenService:Create(
                        LocalPlayer.Character.HumanoidRootPart,
                        tweenInfo,
                        {CFrame = CFrame.new(orbitPosition)});
                tween:Play();
                tween.Completed:Wait();
            end
        end
    end
});
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local RunService = game:GetService("RunService");
local TeleportService = game:GetService("TeleportService");
local function disableLaggyFeatures()
    for _, v in pairs(workspace:GetDescendants()) do
        if (v:IsA("ParticleEmitter") or v:IsA("Trail") or
            v:IsA("Smoke") or v:IsA("Fire")) then
            v.Enabled = false;
        end
    end
end
utilitiesTab:AddToggle({
    Name = "Anti Sit",
    Default = true,
    Callback = function(value)
        if value then
            RunService.Stepped:Connect(function()
                if (LocalPlayer.Character and
                    LocalPlayer.Character:FindFirstChild("Humanoid")) then
                    if LocalPlayer.Character.Humanoid.Sit then
                        LocalPlayer.Character.Humanoid.Sit = false;
                    end
                end
            end);
        end
    end
});
utilitiesTab:AddToggle({
    Name = "Anti Void",
    Default = true,
    Callback = function(value)
        if value then
            RunService.Stepped:Connect(function()
                if (LocalPlayer.Character and
                    LocalPlayer.Character:FindFirstChild(
                        "HumanoidRootPart")) then
                    if (LocalPlayer.Character.HumanoidRootPart
                        .Position.Y < -50) then
                        LocalPlayer.Character.HumanoidRootPart
                            .CFrame = CFrame.new(0, 50, 0);
                    end
                end
            end);
        end
    end
});
utilitiesTab:AddToggle({
    Name = "Auto Rejoin",
    Default = true,
    Callback = function(value)
        if value then
            game:GetService("CoreGui").RobloxPromptGui.promptOverlay
                .ChildAdded:Connect(function(child)
                if (child.Name == "ErrorPrompt") then
                    TeleportService:Teleport(game.PlaceId,
                                                LocalPlayer);
                end
            end);
        end
    end
});
utilitiesTab:AddToggle({
    Name = "Anti Lag",
    Default = true,
    Callback = function(value)
        if value then
            disableLaggyFeatures();
            workspace.DescendantAdded:Connect(
                function(descendant)
                    if (descendant:IsA("ParticleEmitter") or
                        descendant:IsA("Trail") or
                        descendant:IsA("Smoke") or
                        descendant:IsA("Fire")) then
                        descendant.Enabled = false;
                    end
                end);
        end
    end
});
local Section = utilitiesTab:AddSection({Name = "Settings"});
utilitiesTab:AddButton({
    Name = "Teleporta Pro Spaw",
    Callback = function()
        if (LocalPlayer.Character and
            LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
            LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(0, 50, 0);
        end
    end
});
local function removeLag()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            if not part.Visible then
                part:Destroy();
            elseif (part.Transparency >= 1) then
                part:Destroy();
            end
        end
    end
    for _, light in pairs(workspace:GetDescendants()) do
        if light:IsA("Light") then
            if (not light.Parent or not light.Parent.Parent) then
                light:Destroy();
            end
        end
    end
    for _, texture in pairs(workspace:GetDescendants()) do
        if texture:IsA("Texture") then
            if (texture.Parent and not texture.Parent.Visible) then
                texture:Destroy();
            end
        end
    end
    OrionLib:MakeNotification({
        Name = "Removendo...",
        Content = "Texturas, luzes e objetos invisíveis foram removidos.",
        Time = 5
    });
end
utilitiesTab:AddButton({
    Name = "Remover Lag",
    Callback = function() removeLag(); end
});
game:GetService("RunService").RenderStepped:Connect(updateESP);
updatePlayerList(playerDropdown);
RunService.RenderStepped:Connect(updateFPS);
OrionLib:Init();
print("Hi World :D");
local function detectExploits()
    local exploitCount = 0;
    for _, player in ipairs(Players:GetPlayers()) do
        if (player:FindFirstChild("HumanoidRootPart") and
            player.HumanoidRootPart.Anchored) then
            exploitCount = exploitCount + 1;
        end
    end
    return exploitCount;
end
local function updateExploitCount()
    local exploitCount = detectExploits();
    exploitCountLabel:Set("Exploit Quantos: " .. exploitCount);
end
Players.PlayerAdded:Connect(updateExploitCount);
Players.PlayerRemoving:Connect(updateExploitCount);
updateExploitCount();