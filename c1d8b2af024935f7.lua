-- ts file was generated at discord.gg/25ms


local v0 = game:GetService("Players");
local v1 = game:GetService("RunService");
local v2 = game:GetService("UserInputService");
local v3 = game:GetService("TweenService");
local v4 = game:GetService("Workspace");
local v5 = game:GetService("TeleportService");
local v6 = game:GetService("HttpService");
local v7 = game:GetService("VirtualUser");
local v8 = game:GetService("CoreGui");
local v9 = v0.LocalPlayer;
local v10 = v9:GetMouse();
local v11 = v4.CurrentCamera;
local v12 = v9:WaitForChild("PlayerGui");
local v13 = {
    Background = Color3.fromRGB(298 - (125 + 158), 1618 - (1417 + 186), 28 - 8),
    Sidebar = Color3.fromRGB(29 - 9, 87 - 67, 28),
    Card = Color3.fromRGB(25, 25, 1480 - (1290 + 155)),
    Text = Color3.fromRGB(240, 240, 432 - 192),
    SubText = Color3.fromRGB(24 + 136, 160, 170),
    Accent = Color3.fromRGB(121 - 61, 195 - (30 + 35), 250),
    Hover = Color3.fromRGB(25 + 10, 1292 - (1043 + 214), 45),
    ToggleOn = Color3.fromRGB(60, 491 - 361, 250),
    ToggleOff = Color3.fromRGB(50, 1262 - (323 + 889), 161 - 101),
    ToggleBgOn = Color3.fromRGB(30, 70, 710 - (361 + 219))
};
local v14 = {
    Speed = {
        Active = false,
        Value = 336 - (53 + 267)
    },
    Jump = {
        Active = false,
        Value = 12 + 38
    },
    Fly = {
        Active = false,
        Speed = 463 - (15 + 398)
    },
    Noclip = {
        Active = false
    },
    InfJump = {
        Active = false
    },
    ClickTP = {
        Active = false,
        Key = Enum.KeyCode.T
    },
    KillAura = {
        Active = false,
        Range = 997 - (18 + 964),
        TeamCheck = false,
        Visualizer = false
    },
    GodMode = {
        Active = false
    },
    ESP = {
        Active = false,
        TeamCheck = false
    },
    AntiAFK = {
        Active = false
    },
    NoStun = {
        Active = false
    },
    GhostMode = {
        Active = false
    },
    Bypass = {
        Active = false
    },
    Aimbot = {
        Active = false,
        ShowFOV = false,
        FOV = 376 - 276,
        TeamCheck = false,
        Key = Enum.KeyCode.E,
        Smoothing = 0.5 + 0,
        ExcludedTeams = {
            Guards = false,
            Inmates = false,
            Criminals = false
        }
    },
    SilentAim = {
        Active = false,
        TeamCheck = false,
        FOV = 64 + 36
    },
    Hitbox = {
        Active = false,
        Size = 5,
        TeamCheck = false
    },
    GunMods = {
        NoSpread = false,
        FastReload = false,
        AutoFire = false,
        InfAmmo = false,
        RapidFire = false
    },
    AutoArrest = {
        Active = false,
        Range = 15
    },
    Fling = {
        Active = true,
        Speed = 500
    },
    Fullbright = {
        Active = false
    },
    FOV = {
        Value = 70
    },
    XRay = {
        Active = false
    },
    AntiKick = {
        Active = false
    },
    AntiTase = {
        Active = false
    }
};
local v15 = Drawing.new("Circle");
v15.Thickness = 852 - (20 + 830) ;
v15.NumSides = 47 + 13 ;
v15.Radius = 100;
v15.Filled = false;
v15.Visible = false;
v15.Color = Color3.fromRGB(381 - (116 + 10), 255, 255);
v15.Transparency = 1 + 0 ;
local v23 = nil;
local v24 = {};
local v25 = Instance.new("Folder", v12);
v25.Name = "PRISON_ESP";
local v27 = {};
v27.Create = function(v50, v51)
    local v52 = Instance.new("ScreenGui");
    v52.Name = "PRISON_UI";
    v52.ResetOnSpawn = false;
    v52.IgnoreGuiInset = true;
    v52.DisplayOrder = 999999;
    local v57, v58 = pcall(function()
        v52.Parent = game:GetService("CoreGui");
    end);
    if not v57 then
        v52.Parent = v12;
    end
    local v59 = Instance.new("Frame");
    v59.Name = "MainFrame";
    v59.Size = UDim2.new(0, 1418 - (542 + 196), 0 - 0, 141 + 339);
    v59.Position = UDim2.new(0.5 + 0, - (123 + 217), 0.5 - 0, - (615 - 375));
    v59.BackgroundColor3 = v13.Background;
    v59.BorderSizePixel = 1551 - (1126 + 425) ;
    v59.Active = true;
    v59.Draggable = true;
    v59.ClipsDescendants = true;
    v59.Parent = v52;
    local v70 = Instance.new("UICorner");
    v70.CornerRadius = UDim.new(405 - (118 + 287), 46 - 34);
    v70.Parent = v59;
    local v73 = Instance.new("UIStroke");
    v73.Color = Color3.fromRGB(1161 - (118 + 1003), 117 - 77, 427 - (142 + 235));
    v73.Thickness = 4 - 3 ;
    v73.Transparency = 0.5 + 0 ;
    v73.Parent = v59;
    local v78 = Instance.new("Frame");
    v78.Name = "Sidebar";
    v78.Size = UDim2.new(0, 1177 - (553 + 424), 1 - 0, 0 + 0);
    v78.BackgroundColor3 = v13.Sidebar;
    v78.BorderSizePixel = 0 + 0 ;
    v78.Parent = v59;
    local v85 = Instance.new("UICorner");
    v85.CornerRadius = UDim.new(0 + 0, 6 + 6);
    v85.Parent = v78;
    local v88 = Instance.new("UIGradient");
    v88.Rotation = 45;
    v88.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(32 - 17, 41 - 26, 48 - 26)),
        ColorSequenceKeypoint.new(4 - 3, Color3.fromRGB(763 - (239 + 514), 4 + 6, 1344 - (797 + 532)))
    });
    v88.Parent = v78;
    local v92 = Instance.new("Frame");
    v92.Size = UDim2.new(0, 10, 1 + 0, 0);
    v92.Position = UDim2.new(1 + 0, - 10, 0 - 0, 1202 - (373 + 829));
    v92.BackgroundColor3 = Color3.fromRGB(12, 743 - (476 + 255), 1148 - (369 + 761));
    v92.BorderSizePixel = 0 + 0 ;
    v92.Parent = v78;
    local v98 = Instance.new("Frame");
    v98.Size = UDim2.new(0 - 0, 113 - 53, 238 - (64 + 174), 20);
    v98.Position = UDim2.new(0 + 0, 22 - 7, 336 - (144 + 192), 231 - (42 + 174));
    v98.BackgroundTransparency = 1;
    v98.Parent = v78;
    local function v103(v256, v257, v258)
        local v259 = 0;
        local v260;
        local v261;
        while true do
            if (v259 == 0) then
                local v534 = 0 + 0 ;
                while true do
                    if (v534 == (1 + 0)) then
                        v260.Size = UDim2.new(0 + 0, 1516 - (363 + 1141), 0, 1592 - (1183 + 397));
                        v259 = 2 - 1 ;
                        break;
                    end
                    if (v534 == (0 + 0)) then
                        v260 = Instance.new("TextButton");
                        v260.Text = "";
                        v534 = 1 + 0 ;
                    end
                end
            end
            if (v259 == (1979 - (1913 + 62))) then
                local v535 = 0 + 0 ;
                while true do
                    if (v535 == (0 - 0)) then
                        v260.MouseButton1Click:Connect(v258);
                        return v260;
                    end
                end
            end
            if (v259 == (1935 - (565 + 1368))) then
                v260.Parent = v98;
                v261 = Instance.new("UICorner");
                v261.CornerRadius = UDim.new(1, 0 - 0);
                v259 = 1664 - (1477 + 184) ;
            end
            if (v259 == (1 - 0)) then
                v260.Position = UDim2.new(0 + 0, v257, 856.5 - (564 + 292), - 6);
                v260.BackgroundColor3 = v256;
                v260.AutoButtonColor = false;
                v259 = 2 - 0 ;
            end
            if (v259 == (8 - 5)) then
                v261.Parent = v260;
                v260.MouseEnter:Connect(function()
                    v3:Create(v260, TweenInfo.new(304.2 - (244 + 60)), {
                        BackgroundTransparency = 0.2 + 0
                    }):Play();
                end);
                v260.MouseLeave:Connect(function()
                    v3:Create(v260, TweenInfo.new(476.2 - (41 + 435)), {
                        BackgroundTransparency = 0
                    }):Play();
                end);
                v259 = 1005 - (938 + 63) ;
            end
        end
    end
    v103(Color3.fromRGB(197 + 58, 1220 - (936 + 189), 29 + 58), 1613 - (1565 + 48), function()
        v59.Visible = false;
    end);
    local v104 = false;
    v103(Color3.fromRGB(158 + 97, 189, 46), 1158 - (782 + 356), function()
        local v263 = 267 - (176 + 91) ;
        while true do
            if (v263 == (0 - 0)) then
                v104 = not v104;
                if v104 then
                    local v688 = 0 - 0 ;
                    while true do
                        if (v688 == (1093 - (975 + 117))) then
                            TabContainer.Visible = false;
                            break;
                        end
                        if (v688 == (1875 - (157 + 1718))) then
                            v3:Create(v59, TweenInfo.new(0.3 + 0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0 - 0, 200, 0 - 0, 1068 - (697 + 321))
                            }):Play();
                            ContentArea.Visible = false;
                            v688 = 2 - 1 ;
                        end
                    end
                else
                    v3:Create(v59, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0 - 0, 1567 - 887, 0 + 0, 899 - 419)
                    }):Play();
                    task.delay(0.2, function()
                        local v715 = 0;
                        while true do
                            if (v715 == (0 - 0)) then
                                ContentArea.Visible = true;
                                TabContainer.Visible = true;
                                break;
                            end
                        end
                    end);
                end
                break;
            end
        end
    end);
    local v105 = false;
    v103(Color3.fromRGB(1266 - (322 + 905), 201, 63), 40, function()
        local v264 = 611 - (602 + 9) ;
        while true do
            if (v264 == (1189 - (449 + 740))) then
                v105 = not v105;
                if v105 then
                    v3:Create(v59, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(872 - (826 + 46), 800, 947 - (245 + 702), 1895 - 1295)
                    }):Play();
                else
                    v3:Create(v59, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0 + 0, 680, 1898 - (260 + 1638), 920 - (382 + 58))
                    }):Play();
                end
                break;
            end
        end
    end);
    local v106 = Instance.new("TextLabel");
    v106.Text = v51;
    v106.Font = Enum.Font.GothamBlack;
    v106.TextSize = 64 - 44 ;
    v106.TextColor3 = v13.Accent;
    v106.Size = UDim2.new(1 + 0, - 30, 0 - 0, 89 - 59);
    v106.Position = UDim2.new(1205 - (902 + 303), 43 - 23, 0 - 0, 4 + 41);
    v106.BackgroundTransparency = 1691 - (1121 + 569) ;
    v106.TextXAlignment = Enum.TextXAlignment.Left;
    v106.Parent = v78;
    local v119 = Instance.new("TextLabel");
    v119.Text = "PREMIUM TOOL";
    v119.Font = Enum.Font.GothamBold;
    v119.TextSize = 224 - (22 + 192) ;
    v119.TextColor3 = v13.SubText;
    v119.Size = UDim2.new(684 - (483 + 200), 1463 - (1404 + 59), 0 - 0, 20 - 5);
    v119.Position = UDim2.new(0, 2, 765 - (468 + 297), 24);
    v119.BackgroundTransparency = 563 - (334 + 228) ;
    v119.TextXAlignment = Enum.TextXAlignment.Left;
    v119.Parent = v106;
    local v131 = Instance.new("ScrollingFrame");
    v131.Size = UDim2.new(3 - 2, 0, 2 - 1, - (217 - 97));
    v131.Position = UDim2.new(0 + 0, 0, 0, 120);
    v131.BackgroundTransparency = 237 - (141 + 95) ;
    v131.BorderSizePixel = 0;
    v131.ScrollBarThickness = 0 + 0 ;
    v131.Parent = v78;
    local v138 = Instance.new("UIListLayout");
    v138.SortOrder = Enum.SortOrder.LayoutOrder;
    v138.Padding = UDim.new(0 - 0, 18 - 10);
    v138.Parent = v131;
    local v143 = Instance.new("UIPadding");
    v143.PaddingLeft = UDim.new(0, 4 + 11);
    v143.PaddingTop = UDim.new(0 - 0, 8 + 2);
    v143.Parent = v131;
    local v147 = Instance.new("Frame");
    v147.Name = "ContentArea";
    v147.Size = UDim2.new(1 + 0, - (281 - 81), 1 + 0, 163 - (92 + 71));
    v147.Position = UDim2.new(0, 99 + 101, 0 - 0, 0);
    v147.BackgroundTransparency = 766 - (574 + 191) ;
    v147.Parent = v59;
    local v153 = {};
    local v154 = {};
    local v155 = nil;
    local function v156(v265)
        local v266 = 0 + 0 ;
        local v267;
        while true do
            if (v266 == 0) then
                if v155 then
                    local v689 = 0 - 0 ;
                    local v690;
                    while true do
                        if ((0 + 0) == v689) then
                            v690 = 0;
                            while true do
                                if (v690 == (849 - (254 + 595))) then
                                    v3:Create(v155.Btn, TweenInfo.new(126.3 - (55 + 71), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        BackgroundTransparency = 1 - 0,
                                        TextColor3 = v13.SubText
                                    }):Play();
                                    v155.Page.Visible = false;
                                    break;
                                end
                            end
                            break;
                        end
                    end
                end
                v267 = v154[v265];
                v266 = 1;
            end
            if (v266 == (1791 - (573 + 1217))) then
                if v267 then
                    local v691 = 0 - 0 ;
                    while true do
                        if (v691 == 1) then
                            v267.Page.CanvasPosition = Vector2.new(0, 0);
                            for v790, v791 in ipairs(v267.Page:GetChildren()) do
                                if (v791:IsA("Frame") or v791:IsA("TextButton")) then
                                    local v831 = 0 + 0 ;
                                    while true do
                                        if (v831 == (0 - 0)) then
                                            v791.BackgroundTransparency = 940 - (714 + 225) ;
                                            v3:Create(v791, TweenInfo.new(0.4), {
                                                BackgroundTransparency = v791:GetAttribute("OriginalTrans") or (0 - 0)
                                            }):Play();
                                            break;
                                        end
                                    end
                                end
                            end
                            v691 = 2 - 0 ;
                        end
                        if (v691 == (1 + 1)) then
                            v155 = v267;
                            break;
                        end
                        if (v691 == 0) then
                            v3:Create(v267.Btn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 0.9,
                                BackgroundColor3 = v13.Accent,
                                TextColor3 = v13.Accent
                            }):Play();
                            v267.Page.Visible = true;
                            v691 = 1;
                        end
                    end
                end
                break;
            end
        end
    end
    local v157 = {};
    v157.Tab = function(v268, v269, v270)
        local v271 = Instance.new("TextButton");
        v271.Size = UDim2.new(1, - (43 - 13), 806 - (118 + 688), 40);
        v271.BackgroundTransparency = 49 - (25 + 23) ;
        v271.Text = "";
        v271.Parent = v131;
        local v276 = Instance.new("UICorner");
        v276.CornerRadius = UDim.new(0 + 0, 1894 - (927 + 959));
        v276.Parent = v271;
        local v279 = Instance.new("ImageLabel");
        v279.Size = UDim2.new(0 - 0, 750 - (16 + 716), 0 - 0, 115 - (11 + 86));
        v279.Position = UDim2.new(0 - 0, 297 - (175 + 110), 0.5, - 9);
        v279.BackgroundTransparency = 1;
        v279.Image = v270 or "rbxassetid://7072717950" ;
        v279.ImageColor3 = v13.SubText;
        v279.Parent = v271;
        local v287 = Instance.new("TextLabel");
        v287.Text = v269;
        v287.Font = Enum.Font.GothamSemibold;
        v287.TextSize = 35 - 21 ;
        v287.TextColor3 = v13.SubText;
        v287.Size = UDim2.new(1, - (221 - 176), 1797 - (503 + 1293), 0 - 0);
        v287.Position = UDim2.new(0 + 0, 45, 1061 - (810 + 251), 0 + 0);
        v287.BackgroundTransparency = 1 + 0 ;
        v287.TextXAlignment = Enum.TextXAlignment.Left;
        v287.Parent = v271;
        v271.MouseEnter:Connect(function()
            if (v155 and (v155.Btn == v271)) then
                return;
            end
            v3:Create(v271, TweenInfo.new(0.2), {
                BackgroundTransparency = 0.95 + 0,
                BackgroundColor3 = Color3.new(534 - (43 + 490), 1, 734 - (711 + 22))
            }):Play();
            v3:Create(v279, TweenInfo.new(0.2), {
                ImageColor3 = v13.Text
            }):Play();
            v3:Create(v287, TweenInfo.new(0.2), {
                TextColor3 = v13.Text
            }):Play();
        end);
        v271.MouseLeave:Connect(function()
            if (v155 and (v155.Btn == v271)) then
                return;
            end
            v3:Create(v271, TweenInfo.new(0.2 - 0), {
                BackgroundTransparency = 860 - (240 + 619)
            }):Play();
            v3:Create(v279, TweenInfo.new(0.2 + 0), {
                ImageColor3 = v13.SubText
            }):Play();
            v3:Create(v287, TweenInfo.new(0.2), {
                TextColor3 = v13.SubText
            }):Play();
        end);
        local v299 = Instance.new("ScrollingFrame");
        v299.Name = v269 .. "Page" ;
        v299.Size = UDim2.new(1 - 0, - (2 + 28), 1745 - (1344 + 400), - (435 - (255 + 150)));
        v299.Position = UDim2.new(0 + 0, 9 + 6, 0 - 0, 48 - 33);
        v299.BackgroundTransparency = 1;
        v299.BorderSizePixel = 1739 - (404 + 1335) ;
        v299.ScrollBarThickness = 409 - (183 + 223) ;
        v299.ScrollBarImageColor3 = v13.Accent;
        v299.AutomaticCanvasSize = Enum.AutomaticSize.Y;
        v299.CanvasSize = UDim2.new(0 - 0, 0, 0 + 0, 0 + 0);
        v299.Visible = false;
        v299.Parent = v147;
        local v313 = Instance.new("UIListLayout");
        v313.SortOrder = Enum.SortOrder.LayoutOrder;
        v313.Padding = UDim.new(0, 349 - (10 + 327));
        v313.Parent = v299;
        v154[v269] = {
            Btn = v271,
            Page = v299
        };
        v271.MouseButton1Click:Connect(function()
            v156(v269);
        end);
        if not v155 then
            v156(v269);
        end
        local v319 = {};
        v319.Section = function(v335, v336)
            local v337 = 0 + 0 ;
            local v338;
            while true do
                if (v337 == (340 - (118 + 220))) then
                    v338.TextColor3 = v13.SubText;
                    v338.Size = UDim2.new(1 + 0, 449 - (108 + 341), 0 + 0, 126 - 96);
                    v337 = 1496 - (711 + 782) ;
                end
                if (v337 == (7 - 3)) then
                    v338.Parent = v299;
                    break;
                end
                if ((469 - (270 + 199)) == v337) then
                    v338 = Instance.new("TextLabel");
                    v338.Text = v336:upper();
                    v337 = 1 + 0 ;
                end
                if (v337 == (1822 - (580 + 1239))) then
                    v338.BackgroundTransparency = 2 - 1 ;
                    v338.TextXAlignment = Enum.TextXAlignment.Left;
                    v337 = 4;
                end
                if (1 == v337) then
                    v338.Font = Enum.Font.GothamBold;
                    v338.TextSize = 11;
                    v337 = 2;
                end
            end
        end;
        v319.Toggle = function(v339, v340, v341, v342)
            local v343 = Instance.new("Frame");
            v343.Size = UDim2.new(1 + 0, 0, 0, 2 + 43);
            v343.BackgroundColor3 = v13.Card;
            v343:SetAttribute("OriginalTrans", 0);
            v343.Parent = v299;
            local v348 = Instance.new("UICorner");
            v348.CornerRadius = UDim.new(0 + 0, 20 - 12);
            v348.Parent = v343;
            local v351 = Instance.new("TextLabel");
            v351.Text = v340;
            v351.Font = Enum.Font.GothamMedium;
            v351.TextSize = 9 + 5 ;
            v351.TextColor3 = v13.Text;
            v351.Size = UDim2.new(0.7, 0, 1, 0);
            v351.Position = UDim2.new(1167 - (645 + 522), 1805 - (1010 + 780), 0, 0 + 0);
            v351.BackgroundTransparency = 1;
            v351.TextXAlignment = Enum.TextXAlignment.Left;
            v351.Parent = v343;
            local v364 = Instance.new("TextButton");
            v364.Text = "";
            v364.Size = UDim2.new(0 - 0, 128 - 84, 1836 - (1045 + 791), 24);
            v364.Position = UDim2.new(2 - 1, - (91 - 31), 505.5 - (351 + 154), - 12);
            v364.BackgroundColor3 = (v341 and v13.ToggleBgOn) or v13.ToggleOff ;
            v364.Parent = v343;
            local v370 = Instance.new("UICorner");
            v370.CornerRadius = UDim.new(1575 - (1281 + 293), 0);
            v370.Parent = v364;
            local v373 = Instance.new("Frame");
            v373.Size = UDim2.new(266 - (28 + 238), 39 - 21, 1559 - (1381 + 178), 17 + 1);
            v373.Position = (v341 and UDim2.new(1, - (17 + 4), 0.5, - 9)) or UDim2.new(0 + 0, 10 - 7, 0.5 + 0, - 9) ;
            v373.BackgroundColor3 = v13.ToggleOn;
            v373.Parent = v364;
            local v379 = Instance.new("UICorner");
            v379.CornerRadius = UDim.new(1, 0);
            v379.Parent = v373;
            local v382 = v341;
            v364.MouseButton1Click:Connect(function()
                v382 = not v382;
                v3:Create(v364, TweenInfo.new(470.3 - (381 + 89), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = (v382 and v13.ToggleBgOn) or v13.ToggleOff
                }):Play();
                v3:Create(v373, TweenInfo.new(0.3 + 0, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Position = (v382 and UDim2.new(1, - 21, 0.5 + 0, - 9)) or UDim2.new(0 - 0, 1159 - (1074 + 82), 0.5 - 0, - 9)
                }):Play();
                v342(v382);
            end);
        end;
        v319.Slider = function(v383, v384, v385, v386, v387, v388)
            local v389 = Instance.new("Frame");
            v389.Size = UDim2.new(1, 1784 - (214 + 1570), 0, 1510 - (990 + 465));
            v389.BackgroundColor3 = v13.Card;
            v389:SetAttribute("OriginalTrans", 0 + 0);
            v389.Parent = v299;
            local v394 = Instance.new("UICorner");
            v394.CornerRadius = UDim.new(0 + 0, 8);
            v394.Parent = v389;
            local v397 = Instance.new("TextLabel");
            v397.Text = v384;
            v397.Font = Enum.Font.GothamMedium;
            v397.TextSize = 14;
            v397.TextColor3 = v13.Text;
            v397.Size = UDim2.new(0.5 + 0, 0 - 0, 1726 - (1668 + 58), 656 - (512 + 114));
            v397.Position = UDim2.new(0 - 0, 15, 0 - 0, 0 - 0);
            v397.BackgroundTransparency = 1 + 0 ;
            v397.TextXAlignment = Enum.TextXAlignment.Left;
            v397.Parent = v389;
            local v410 = Instance.new("TextLabel");
            v410.Text = tostring(v387);
            v410.Font = Enum.Font.GothamBold;
            v410.TextSize = 3 + 11 ;
            v410.TextColor3 = v13.Accent;
            v410.Size = UDim2.new(0.5, - (14 + 1), 0 - 0, 2024 - (109 + 1885));
            v410.Position = UDim2.new(0.5, 1469 - (1269 + 200), 0 - 0, 815 - (98 + 717));
            v410.BackgroundTransparency = 1;
            v410.TextXAlignment = Enum.TextXAlignment.Right;
            v410.Parent = v389;
            local v423 = Instance.new("Frame");
            v423.Size = UDim2.new(1, - (856 - (802 + 24)), 0 - 0, 7 - 1);
            v423.Position = UDim2.new(0, 3 + 12, 0, 27 + 8);
            v423.BackgroundColor3 = v13.ToggleOff;
            v423.Parent = v389;
            local v429 = Instance.new("UICorner");
            v429.CornerRadius = UDim.new(1, 0);
            v429.Parent = v423;
            local v432 = Instance.new("Frame");
            v432.Size = UDim2.new((v387 - v385) / (v386 - v385), 0 + 0, 1 + 0, 0 - 0);
            v432.BackgroundColor3 = v13.Accent;
            v432.Parent = v423;
            local v436 = Instance.new("UICorner");
            v436.CornerRadius = UDim.new(1, 0 - 0);
            v436.Parent = v432;
            local v439 = Instance.new("TextButton");
            v439.Text = "";
            v439.BackgroundTransparency = 1 + 0 ;
            v439.Size = UDim2.new(1, 0 + 0, 1, 0 + 0);
            v439.Parent = v423;
            local v444 = false;
            local function v445(v512)
                local v513 = math.clamp((v512.Position.X - v423.AbsolutePosition.X) / v423.AbsoluteSize.X, 0 + 0, 1);
                local v514 = math.floor(v385 + ((v386 - v385) * v513));
                v3:Create(v432, TweenInfo.new(0.1), {
                    Size = UDim2.new(v513, 0, 1 + 0, 1433 - (797 + 636))
                }):Play();
                v410.Text = tostring(v514);
                v388(v514);
            end
            v439.InputBegan:Connect(function(v516)
                if (v516.UserInputType == Enum.UserInputType.MouseButton1) then
                    local v571 = 0 - 0 ;
                    while true do
                        if (v571 == (1619 - (1427 + 192))) then
                            v444 = true;
                            v445(v516);
                            break;
                        end
                    end
                end
            end);
            v2.InputEnded:Connect(function(v517)
                if (v517.UserInputType == Enum.UserInputType.MouseButton1) then
                    v444 = false;
                end
            end);
            v2.InputChanged:Connect(function(v518)
                if (v444 and (v518.UserInputType == Enum.UserInputType.MouseMovement)) then
                    v445(v518);
                end
            end);
        end;
        v319.Button = function(v446, v447, v448)
            local v449 = 0;
            local v450;
            local v451;
            local v452;
            local v453;
            while true do
                if ((1 + 0) == v449) then
                    v450:SetAttribute("OriginalTrans", 0 - 0);
                    v450.Parent = v299;
                    v451 = Instance.new("UICorner");
                    v451.CornerRadius = UDim.new(0 + 0, 4 + 4);
                    v449 = 328 - (192 + 134) ;
                end
                if (v449 == (1282 - (316 + 960))) then
                    v453.ImageColor3 = v13.Accent;
                    v453.Parent = v450;
                    v450.MouseEnter:Connect(function()
                        v3:Create(v450, TweenInfo.new(0.2 + 0), {
                            BackgroundColor3 = v13.Hover
                        }):Play();
                    end);
                    v450.MouseLeave:Connect(function()
                        v3:Create(v450, TweenInfo.new(0.2), {
                            BackgroundColor3 = v13.Card
                        }):Play();
                    end);
                    v449 = 6 + 1 ;
                end
                if (v449 == (3 + 0)) then
                    v452.TextSize = 53 - 39 ;
                    v452.TextColor3 = v13.Text;
                    v452.Size = UDim2.new(1, - (591 - (83 + 468)), 1, 1806 - (1202 + 604));
                    v452.Position = UDim2.new(0 - 0, 15, 0 - 0, 0 - 0);
                    v449 = 329 - (45 + 280) ;
                end
                if (v449 == (2 + 0)) then
                    v451.Parent = v450;
                    v452 = Instance.new("TextLabel");
                    v452.Text = v447;
                    v452.Font = Enum.Font.GothamMedium;
                    v449 = 3 + 0 ;
                end
                if (v449 == (0 + 0)) then
                    v450 = Instance.new("TextButton");
                    v450.Text = "";
                    v450.Size = UDim2.new(1 + 0, 0 + 0, 0 - 0, 1956 - (340 + 1571));
                    v450.BackgroundColor3 = v13.Card;
                    v449 = 1 + 0 ;
                end
                if (v449 == (1777 - (1733 + 39))) then
                    v453.Image = "rbxassetid://7072720450";
                    v453.Size = UDim2.new(0, 54 - 34, 1034 - (125 + 909), 1968 - (1096 + 852));
                    v453.Position = UDim2.new(1 + 0, - 35, 0.5 - 0, - (10 + 0));
                    v453.BackgroundTransparency = 513 - (409 + 103) ;
                    v449 = 6;
                end
                if (v449 == (240 - (46 + 190))) then
                    v452.BackgroundTransparency = 96 - (51 + 44) ;
                    v452.TextXAlignment = Enum.TextXAlignment.Left;
                    v452.Parent = v450;
                    v453 = Instance.new("ImageLabel");
                    v449 = 2 + 3 ;
                end
                if (v449 == 7) then
                    v450.MouseButton1Click:Connect(function()
                        v448();
                    end);
                    break;
                end
            end
        end;
        v319.Input = function(v454, v455, v456, v457)
            local v458 = 0;
            local v459;
            local v460;
            local v461;
            local v462;
            local v463;
            while true do
                if (v458 == (1317 - (1114 + 203))) then
                    v459 = Instance.new("Frame");
                    v459.Size = UDim2.new(727 - (228 + 498), 0, 0, 10 + 35);
                    v459.BackgroundColor3 = v13.Card;
                    v459:SetAttribute("OriginalTrans", 0 + 0);
                    v458 = 1;
                end
                if ((667 - (174 + 489)) == v458) then
                    v461.TextXAlignment = Enum.TextXAlignment.Left;
                    v461.Parent = v459;
                    v462 = Instance.new("TextBox");
                    v462.Text = v456;
                    v458 = 12 - 7 ;
                end
                if (v458 == 7) then
                    v463 = Instance.new("UICorner");
                    v463.CornerRadius = UDim.new(1905 - (830 + 1075), 6);
                    v463.Parent = v462;
                    v462.Focused:Connect(function()
                        v3:Create(v462, TweenInfo.new(0.2), {
                            BackgroundColor3 = v13.Hover
                        }):Play();
                    end);
                    v458 = 532 - (303 + 221) ;
                end
                if (v458 == (1272 - (231 + 1038))) then
                    v461.TextColor3 = v13.Text;
                    v461.Size = UDim2.new(0.6 + 0, 1162 - (171 + 991), 4 - 3, 0 - 0);
                    v461.Position = UDim2.new(0 - 0, 13 + 2, 0, 0 - 0);
                    v461.BackgroundTransparency = 2 - 1 ;
                    v458 = 4;
                end
                if (v458 == (12 - 4)) then
                    v462.FocusLost:Connect(function(v692)
                        v3:Create(v462, TweenInfo.new(0.2 - 0), {
                            BackgroundColor3 = v13.Background
                        }):Play();
                        v457(v462.Text);
                    end);
                    break;
                end
                if (v458 == (1253 - (111 + 1137))) then
                    v462.Font = Enum.Font.Gotham;
                    v462.TextSize = 171 - (91 + 67) ;
                    v462.TextColor3 = v13.Text;
                    v462.PlaceholderText = "...";
                    v458 = 17 - 11 ;
                end
                if (v458 == (1 + 0)) then
                    v459.Parent = v299;
                    v460 = Instance.new("UICorner");
                    v460.CornerRadius = UDim.new(523 - (423 + 100), 1 + 7);
                    v460.Parent = v459;
                    v458 = 2;
                end
                if ((5 - 3) == v458) then
                    v461 = Instance.new("TextLabel");
                    v461.Text = v455;
                    v461.Font = Enum.Font.GothamMedium;
                    v461.TextSize = 8 + 6 ;
                    v458 = 774 - (326 + 445) ;
                end
                if (v458 == 6) then
                    v462.Size = UDim2.new(0.3 - 0, 0, 0.7 - 0, 0);
                    v462.Position = UDim2.new(0.65 - 0, 711 - (530 + 181), 0.15, 881 - (614 + 267));
                    v462.BackgroundColor3 = v13.Background;
                    v462.Parent = v459;
                    v458 = 39 - (19 + 13) ;
                end
            end
        end;
        v319.Keybind = function(v464, v465, v466, v467)
            local v468 = 0;
            local v469;
            local v470;
            local v471;
            local v472;
            local v473;
            local v474;
            while true do
                if (v468 == 4) then
                    v471.TextXAlignment = Enum.TextXAlignment.Left;
                    v471.Parent = v469;
                    v472 = Instance.new("TextButton");
                    v472.Text = v466.Name;
                    v468 = 7 - 2 ;
                end
                if (v468 == (18 - 10)) then
                    v2.InputBegan:Connect(function(v693)
                        if v474 then
                            if (v693.UserInputType == Enum.UserInputType.Keyboard) then
                                local v792 = 0;
                                while true do
                                    if (v792 == 1) then
                                        v472.TextColor3 = v13.Accent;
                                        v467(v693.KeyCode);
                                        break;
                                    end
                                    if (v792 == (0 - 0)) then
                                        v474 = false;
                                        v472.Text = v693.KeyCode.Name;
                                        v792 = 1;
                                    end
                                end
                            elseif ((v693.UserInputType == Enum.UserInputType.MouseButton1) or (v693.UserInputType == Enum.UserInputType.MouseButton2)) then
                                v474 = false;
                                v472.Text = v693.UserInputType.Name;
                                v472.TextColor3 = v13.Accent;
                                v467(v693.UserInputType);
                            end
                        end
                    end);
                    break;
                end
                if (v468 == 0) then
                    v469 = Instance.new("Frame");
                    v469.Size = UDim2.new(1, 0 + 0, 0, 78 - 33);
                    v469.BackgroundColor3 = v13.Card;
                    v469:SetAttribute("OriginalTrans", 0 - 0);
                    v468 = 1;
                end
                if (v468 == (1815 - (1293 + 519))) then
                    v471.TextColor3 = v13.Text;
                    v471.Size = UDim2.new(0.6, 0, 1, 0);
                    v471.Position = UDim2.new(0 - 0, 15, 0 - 0, 0);
                    v471.BackgroundTransparency = 1;
                    v468 = 4;
                end
                if (v468 == (11 - 5)) then
                    v472.Position = UDim2.new(0.65, 0, 0.15 - 0, 0);
                    v472.BackgroundColor3 = v13.Background;
                    v472.Parent = v469;
                    v473 = Instance.new("UICorner");
                    v468 = 16 - 9 ;
                end
                if (v468 == (1 + 0)) then
                    v469.Parent = v299;
                    v470 = Instance.new("UICorner");
                    v470.CornerRadius = UDim.new(0, 2 + 6);
                    v470.Parent = v469;
                    v468 = 2;
                end
                if (v468 == (4 - 2)) then
                    v471 = Instance.new("TextLabel");
                    v471.Text = v465;
                    v471.Font = Enum.Font.GothamMedium;
                    v471.TextSize = 4 + 10 ;
                    v468 = 1 + 2 ;
                end
                if (v468 == 5) then
                    v472.Font = Enum.Font.GothamBold;
                    v472.TextSize = 9 + 4 ;
                    v472.TextColor3 = v13.Accent;
                    v472.Size = UDim2.new(0.3, 1096 - (709 + 387), 1858.7 - (673 + 1185), 0 - 0);
                    v468 = 19 - 13 ;
                end
                if (v468 == 7) then
                    v473.CornerRadius = UDim.new(0 - 0, 5 + 1);
                    v473.Parent = v472;
                    v474 = false;
                    v472.MouseButton1Click:Connect(function()
                        local v694 = 0 + 0 ;
                        while true do
                            if (v694 == 0) then
                                v474 = true;
                                v472.Text = "...";
                                v694 = 1 - 0 ;
                            end
                            if (v694 == 1) then
                                v472.TextColor3 = v13.Text;
                                break;
                            end
                        end
                    end);
                    v468 = 8;
                end
            end
        end;
        return v319;
    end;
    return v157;
end;
local v29 = v27:Create("BCODE PRISON");
local v30 = v29:Tab("Home", "rbxassetid://7733960981");
v30:Button("Rejoin Server", function()
    v5:Teleport(game.PlaceId, v9);
end);
v30:Button("Server Hop", function()
    local v159 = v6:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"));
    for v326, v327 in ipairs(v159.data) do
        if ((v327.playing < v327.maxPlayers) and (v327.id ~= game.JobId)) then
            v5:TeleportToPlaceInstance(game.PlaceId, v327.id, v9);
            break;
        end
    end
end);
v30:Toggle("Anti-AFK", false, function(v160)
    v14.AntiAFK.Active = v160;
end);
local v31 = v29:Tab("Movement", "rbxassetid://7733964640");
v31:Section("Speed & Jump");
v31:Toggle("Speed Hack", false, function(v162)
    v14.Speed.Active = v162;
end);
v31:Slider("Speed Value", 16, 50 + 150, 31 - 15, function(v164)
    v14.Speed.Value = v164;
end);
v31:Toggle("High Jump", false, function(v166)
    v14.Jump.Active = v166;
end);
v31:Slider("Jump Power", 98 - 48, 300, 1930 - (446 + 1434), function(v168)
    v14.Jump.Value = v168;
end);
v31:Toggle("Infinite Jump", false, function(v170)
    v14.InfJump.Active = v170;
end);
v31:Section("Flight & Physics");
v31:Toggle("Fly", false, function(v172)
    v14.Fly.Active = v172;
end);
v31:Slider("Fly Speed", 1293 - (1040 + 243), 596 - 396, 1897 - (559 + 1288), function(v174)
    v14.Fly.Speed = v174;
end);
v31:Toggle("Noclip", false, function(v176)
    v14.Noclip.Active = v176;
end);
v31:Button("Remove Jump Cooldown", function()
    if getconnections then
        for v519, v520 in pairs(getconnections(v9.Character.Humanoid:GetPropertyChangedSignal("Jump"))) do
            v520:Disable();
        end
    end
end);
local v32 = v29:Tab("Combat", "rbxassetid://7733674847");
v32:Section("Aimbot");
v32:Toggle("Aimbot Active", false, function(v178)
    v14.Aimbot.Active = v178;
end);
v32:Toggle("Show FOV", false, function(v180)
    v14.Aimbot.ShowFOV = v180;
end);
v32:Slider("FOV Radius", 50, 2431 - (609 + 1322), 554 - (13 + 441), function(v182)
    v14.Aimbot.FOV = v182;
end);
v32:Slider("Smoothing", 1, 37 - 27, 5, function(v184)
    v14.Aimbot.Smoothing = v184 / 10 ;
end);
v32:Toggle("Team Check", false, function(v186)
    v14.Aimbot.TeamCheck = v186;
end);
v32:Keybind("Toggle Key", Enum.KeyCode.E, function(v188)
    v14.Aimbot.Key = v188;
end);
v32:Section("Aimbot Exclusions");
v32:Toggle("Exclude Guards", false, function(v190)
    v14.Aimbot.ExcludedTeams['Guards'] = v190;
end);
v32:Toggle("Exclude Inmates", false, function(v192)
    v14.Aimbot.ExcludedTeams['Inmates'] = v192;
end);
v32:Toggle("Exclude Criminals", false, function(v194)
    v14.Aimbot.ExcludedTeams['Criminals'] = v194;
end);
v32:Section("Silent Aim");
v32:Toggle("Silent Aim (Coming Soon)", false, function(v196)
    v14.SilentAim.Active = v196;
end);
v32:Slider("Silent FOV", 130 - 80, 500, 498 - 398, function(v198)
    v14.SilentAim.FOV = v198;
end);
v32:Toggle("Team Check", false, function(v200)
    v14.SilentAim.TeamCheck = v200;
end);
v32:Section("Gun Mods");
v32:Toggle("No Spread", false, function(v202)
    v14.GunMods.NoSpread = v202;
end);
v32:Toggle("Fast Reload", false, function(v204)
    v14.GunMods.FastReload = v204;
end);
v32:Toggle("Auto Fire", false, function(v206)
    v14.GunMods.AutoFire = v206;
end);
v32:Toggle("Infinite Ammo", false, function(v208)
    v14.GunMods.InfAmmo = v208;
end);
v32:Toggle("Rapid Fire", false, function(v210)
    v14.GunMods.RapidFire = v210;
end);
v32:Section("Hitbox Expander");
v32:Toggle("Expand Hitbox", false, function(v212)
    v14.Hitbox.Active = v212;
end);
v32:Slider("Size", 1 + 1, 36 - 26, 2 + 3, function(v214)
    v14.Hitbox.Size = v214;
end);
v32:Toggle("Hitbox Team Check", false, function(v216)
    v14.Hitbox.TeamCheck = v216;
end);
local v33 = v29:Tab("Guard", "rbxassetid://7733965184");
v33:Section("Auto Arrest");
v33:Slider("Arrest Range", 5, 14 + 16, 44 - 29, function(v218)
    v14.AutoArrest.Range = v218;
end);
local v34 = v29:Tab("Tools", "rbxassetid://7733964240");
v34:Section("Teams");
v34:Button("Join Guards", function()
    v4.Remote.TeamEvent:FireServer("Bright blue");
end);
v34:Button("Criminal Base", function()
    if (v9.Character and v9.Character:FindFirstChild("HumanoidRootPart")) then
        v9.Character.HumanoidRootPart.CFrame = CFrame.new(- (517 + 426), 94, 3793 - 1730);
    end
end);
v34:Button("Prison Yard", function()
    if (v9.Character and v9.Character:FindFirstChild("HumanoidRootPart")) then
        v9.Character.HumanoidRootPart.CFrame = CFrame.new(523 + 268, 55 + 43, 1795 + 703);
    end
end);
v34:Button("Guard Room", function()
    if (v9.Character and v9.Character:FindFirstChild("HumanoidRootPart")) then
        v9.Character.HumanoidRootPart.CFrame = CFrame.new(702 + 134, 97 + 2, 2307);
    end
end);
v32:Section("Protection");
v32:Toggle("No Stun", false, function(v220)
    v14.NoStun.Active = v220;
end);
v32:Toggle("God Mode", false, function(v222)
    v14.GodMode.Active = v222;
end);
v32:Toggle("Anti-Kick (Anti-Ban)", false, function(v224)
    v14.AntiKick.Active = v224;
end);
v32:Toggle("Anti-Tase", false, function(v226)
    v14.AntiTase.Active = v226;
end);
local v35 = v29:Tab("Visuals", "rbxassetid://7733965639");
v35:Section("Visuals");
v35:Toggle("ESP Players", false, function(v228)
    local v229 = 0;
    while true do
        if ((433 - (153 + 280)) == v229) then
            v14.ESP.Active = v228;
            if not v228 then
                v25:ClearAllChildren();
            end
            break;
        end
    end
end);
v35:Toggle("Hide Teammates", false, function(v230)
    v14.ESP.TeamCheck = v230;
end);
v35:Toggle("Ghost Mode", false, function(v232)
    v14.GhostMode.Active = v232;
end);
v35:Toggle("Fullbright", false, function(v234)
    v14.Fullbright.Active = v234;
end);
v35:Slider("Camera FOV", 173 - 113, 108 + 12, 28 + 42, function(v236)
    v14.FOV.Value = v236;
end);
v35:Toggle("X-Ray (Walls)", false, function(v238)
    v14.XRay.Active = v238;
    for v328, v329 in pairs(workspace:GetDescendants()) do
        if (v329:IsA("BasePart") and not v329.Parent:FindFirstChild("Humanoid") and not v329.Parent:IsA("Tool")) then
            v329.Transparency = (v238 and 0.5) or (0 + 0) ;
        end
    end
end);
task.spawn(function()
    while task.wait(1) do
        if v14.ESP.Active then
            v25:ClearAllChildren();
            for v543, v544 in pairs(v0:GetPlayers()) do
                if ((v544 ~= v9) and v544.Character and v544.Character:FindFirstChild("HumanoidRootPart")) then
                    local v695 = 0;
                    local v696;
                    local v697;
                    local v698;
                    while true do
                        if (v695 == (3 + 0)) then
                            v697.Adornee = v544.Character.HumanoidRootPart;
                            v697.Size = UDim2.new(0 + 0, 304 - 104, 0 + 0, 50);
                            v697.StudsOffset = Vector3.new(667 - (89 + 578), 3.5, 0);
                            v695 = 4;
                        end
                        if (v695 == (5 + 1)) then
                            v698.TextColor3 = v544.TeamColor.Color;
                            v698.TextStrokeTransparency = 0;
                            v698.Font = Enum.Font.GothamBold;
                            v695 = 7;
                        end
                        if (v695 == 7) then
                            v698.TextSize = 28 - 14 ;
                            v698.Parent = v697;
                            break;
                        end
                        if (v695 == 0) then
                            if (v14.ESP.TeamCheck and (v544.Team == v9.Team)) then
                                continue;
                            end
                            v696 = Instance.new("Highlight");
                            v696.Adornee = v544.Character;
                            v695 = 1050 - (572 + 477) ;
                        end
                        if (v695 == (1 + 3)) then
                            v697.AlwaysOnTop = true;
                            v697.Parent = v25;
                            v698 = Instance.new("TextLabel");
                            v695 = 4 + 1 ;
                        end
                        if (v695 == 2) then
                            v696.OutlineTransparency = 0 + 0 ;
                            v696.Parent = v25;
                            v697 = Instance.new("BillboardGui");
                            v695 = 89 - (84 + 2) ;
                        end
                        if (v695 == 1) then
                            v696.FillColor = v544.TeamColor.Color;
                            v696.FillTransparency = 0.5 - 0 ;
                            v696.OutlineColor = v544.TeamColor.Color;
                            v695 = 2 + 0 ;
                        end
                        if (v695 == 5) then
                            v698.Text = v544.Name .. " [" .. math.floor((v9.Character.HumanoidRootPart.Position - v544.Character.HumanoidRootPart.Position).Magnitude) .. "m]" ;
                            v698.Size = UDim2.new(1, 842 - (497 + 345), 1, 0 + 0);
                            v698.BackgroundTransparency = 1 + 0 ;
                            v695 = 1339 - (605 + 728) ;
                        end
                    end
                end
            end
        end
    end
end);
v1.Heartbeat:Connect(function(v240)
    if (v14.Speed.Active and v9.Character) then
        local v478 = 0 + 0 ;
        local v479;
        local v480;
        local v481;
        while true do
            if (v478 == (1 - 0)) then
                v481 = nil;
                while true do
                    if (v479 == (0 + 0)) then
                        v480 = v9.Character:FindFirstChild("Humanoid");
                        v481 = v9.Character:FindFirstChild("HumanoidRootPart");
                        v479 = 3 - 2 ;
                    end
                    if (v479 == (1 + 0)) then
                        if (v480 and v481 and (v480.MoveDirection.Magnitude > 0)) then
                            local v793 = 0 - 0 ;
                            local v794;
                            while true do
                                if (v793 == (0 + 0)) then
                                    v481.CFrame = v481.CFrame + (v480.MoveDirection * (v14.Speed.Value - (505 - (457 + 32))) * v240) ;
                                    v794 = v481.AssemblyLinearVelocity;
                                    v793 = 1;
                                end
                                if ((1 + 0) == v793) then
                                    v481.AssemblyLinearVelocity = Vector3.new(0, v794.Y, 1402 - (832 + 570));
                                    v481.AssemblyAngularVelocity = Vector3.new(0, 0, 0 + 0);
                                    break;
                                end
                            end
                        end
                        break;
                    end
                end
                break;
            end
            if (v478 == (0 + 0)) then
                v479 = 0 - 0 ;
                v480 = nil;
                v478 = 1 + 0 ;
            end
        end
    end
end);
v1.Heartbeat:Connect(function(v241)
    if (v14.Fly.Active and v9.Character) then
        local v482 = 796 - (588 + 208) ;
        local v483;
        local v484;
        while true do
            if (v482 == 1) then
                if (v483 and v484) then
                    local v716 = v4.CurrentCamera;
                    local v717 = Vector3.zero;
                    if v2:IsKeyDown(Enum.KeyCode.W) then
                        v717 = v717 + v716.CFrame.LookVector ;
                    end
                    if v2:IsKeyDown(Enum.KeyCode.S) then
                        v717 = v717 - v716.CFrame.LookVector ;
                    end
                    if v2:IsKeyDown(Enum.KeyCode.A) then
                        v717 = v717 - v716.CFrame.RightVector ;
                    end
                    if v2:IsKeyDown(Enum.KeyCode.D) then
                        v717 = v717 + v716.CFrame.RightVector ;
                    end
                    if v2:IsKeyDown(Enum.KeyCode.Space) then
                        v717 = v717 + Vector3.new(0 - 0, 1801 - (884 + 916), 0) ;
                    end
                    if v2:IsKeyDown(Enum.KeyCode.LeftControl) then
                        v717 = v717 - Vector3.new(0 - 0, 1, 0 + 0) ;
                    end
                    if (v717.Magnitude > 0) then
                        v483.CFrame = v483.CFrame + (v717.Unit * v14.Fly.Speed * v241) ;
                    end
                    v483.AssemblyLinearVelocity = Vector3.new(653 - (232 + 421), 0, 1889 - (1569 + 320));
                    v483.AssemblyAngularVelocity = Vector3.new(0 + 0, 0, 0 + 0);
                    v484:ChangeState(Enum.HumanoidStateType.Physics);
                end
                break;
            end
            if (v482 == 0) then
                v483 = v9.Character:FindFirstChild("HumanoidRootPart");
                v484 = v9.Character:FindFirstChild("Humanoid");
                v482 = 3 - 2 ;
            end
        end
    elseif v9.Character then
        local v545 = 605 - (316 + 289) ;
        local v546;
        while true do
            if (v545 == (0 - 0)) then
                v546 = v9.Character:FindFirstChild("Humanoid");
                if (v546 and (v546:GetState() == Enum.HumanoidStateType.Physics)) then
                    v546:ChangeState(Enum.HumanoidStateType.GettingUp);
                end
                break;
            end
        end
    end
end);
task.spawn(function()
    while task.wait(1 + 0) do
        if v9.Character then
            local v523 = 0;
            local v524;
            while true do
                if (v523 == (1453 - (666 + 787))) then
                    v524 = v9.Character:FindFirstChild("Client");
                    if (v524 and v524:IsA("LocalScript")) then
                        v524:Destroy();
                    end
                    break;
                end
            end
        end
    end
end);
task.spawn(function()
    while task.wait(425.1 - (360 + 65)) do
        if (v14.NoStun.Active and v9.Character) then
            local v525 = v9.Character:FindFirstChild("Humanoid");
            if v525 then
                v525.PlatformStand = false;
                v525.Sit = false;
                v525:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
                v525:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
            end
            for v547, v548 in pairs(v9.Character:GetChildren()) do
                if v548.Name:lower():find("stun") then
                    v548:Destroy();
                end
            end
            for v549, v550 in pairs(v9.Character:GetAttributes()) do
                if v549:lower():find("stun") then
                    v9.Character:SetAttribute(v549, false);
                end
            end
        end
    end
end);
v1.RenderStepped:Connect(function()
    pcall(function()
        local v330 = 0 + 0 ;
        local v331;
        while true do
            if (v330 == (255 - (79 + 175))) then
                if v14.Aimbot.Active then
                    local v699 = 0 - 0 ;
                    local v700;
                    local v701;
                    while true do
                        if (v699 == 0) then
                            local v773 = 0 + 0 ;
                            while true do
                                if (v773 == (2 - 1)) then
                                    v699 = 1;
                                    break;
                                end
                                if (v773 == 0) then
                                    v700 = nil;
                                    v701 = v14.Aimbot.FOV;
                                    v773 = 1 - 0 ;
                                end
                            end
                        end
                        if (v699 == 1) then
                            for v795, v796 in pairs(v0:GetPlayers()) do
                                if ((v796 ~= v9) and v796.Character and v796.Character:FindFirstChild("Head")) then
                                    local v837 = 899 - (503 + 396) ;
                                    local v838;
                                    local v839;
                                    while true do
                                        if (v837 == (181 - (92 + 89))) then
                                            if (v14.Aimbot.TeamCheck and (v796.Team == v9.Team)) then
                                                continue;
                                            end
                                            if v796.Team then
                                                local v881 = 0 - 0 ;
                                                local v882;
                                                while true do
                                                    if (v881 == 0) then
                                                        v882 = v796.Team.Name;
                                                        if (v14.Aimbot.ExcludedTeams and v14.Aimbot.ExcludedTeams[v882]) then
                                                            continue;
                                                        end
                                                        break;
                                                    end
                                                end
                                            end
                                            v837 = 1;
                                        end
                                        if (v837 == 1) then
                                            v838, v839 = v11:WorldToViewportPoint(v796.Character.Head.Position);
                                            if v839 then
                                                local v883 = 0;
                                                local v884;
                                                while true do
                                                    if (v883 == 0) then
                                                        v884 = (Vector2.new(v838.X, v838.Y) - v331).Magnitude;
                                                        if (v884 < v701) then
                                                            v701 = v884;
                                                            v700 = v796.Character.Head;
                                                        end
                                                        break;
                                                    end
                                                end
                                            end
                                            break;
                                        end
                                    end
                                end
                            end
                            if v700 then
                                local v821 = 0 + 0 ;
                                local v822;
                                local v823;
                                while true do
                                    if (v821 == 0) then
                                        local v864 = 0 + 0 ;
                                        while true do
                                            if (v864 == (3 - 2)) then
                                                v821 = 1;
                                                break;
                                            end
                                            if (v864 == (0 + 0)) then
                                                v822 = CFrame.new(v11.CFrame.Position, v700.Position);
                                                v823 = math.clamp(v14.Aimbot.Smoothing or 0.5, 0.1, 1);
                                                v864 = 2 - 1 ;
                                            end
                                        end
                                    end
                                    if (v821 == (1 + 0)) then
                                        v11.CFrame = v11.CFrame:Lerp(v822, v823);
                                        break;
                                    end
                                end
                            end
                            break;
                        end
                    end
                end
                break;
            end
            if (v330 == (0 + 0)) then
                v331 = v2:GetMouseLocation();
                if v14.Aimbot.ShowFOV then
                    v15.Position = v331;
                    v15.Radius = v14.Aimbot.FOV;
                    v15.Visible = true;
                else
                    v15.Visible = false;
                end
                v330 = 2 - 1 ;
            end
        end
    end);
end);
local v36 = game:GetService("ReplicatedStorage");
local v37 = v36:FindFirstChild("ShootEvent");
local v38;
if hookmetamethod then
    v38 = hookmetamethod(game, "__namecall", function(v485, ...)
        local v486 = getnamecallmethod();
        local v487 = {
            ...
        };
        if (v14.SilentAim.Active and (v486 == "FireServer") and (v485.Name == "ShootEvent")) then
            local v551, v552 = pcall(function()
                local v664 = 0 + 0 ;
                local v665;
                local v666;
                local v667;
                while true do
                    if (v664 == (2 - 0)) then
                        if (v666 and v487[1245 - (485 + 759) ]) then
                            local v797 = v487[2 - 1 ].Origin;
                            local v798 = (v666.Position - v797).Unit * (2189 - (442 + 747)) ;
                            local v799 = Ray.new(v797, v798);
                            v487[1] = v799;
                            v487[2] = v666;
                            v487[1138 - (832 + 303) ] = v666.Position;
                        end
                        break;
                    end
                    if (v664 == (947 - (88 + 858))) then
                        v667 = v14.Aimbot.FOV;
                        for v774, v775 in pairs(v0:GetPlayers()) do
                            if ((v775 ~= v9) and v775.Character and v775.Character:FindFirstChild("Head")) then
                                if (v14.SilentAim.TeamCheck and (v775.Team == v9.Team)) then
                                    continue;
                                end
                                local v824, v825 = v11:WorldToViewportPoint(v775.Character.Head.Position);
                                if v825 then
                                    local v859 = 0;
                                    local v860;
                                    while true do
                                        if (v859 == 0) then
                                            v860 = (Vector2.new(v824.X, v824.Y) - v665).Magnitude;
                                            if (v860 < v667) then
                                                local v886 = 0 + 0 ;
                                                while true do
                                                    if (v886 == 0) then
                                                        v667 = v860;
                                                        v666 = v775.Character.Head;
                                                        break;
                                                    end
                                                end
                                            end
                                            break;
                                        end
                                    end
                                end
                            end
                        end
                        v664 = 2 + 0 ;
                    end
                    if (v664 == (0 + 0)) then
                        v665 = v2:GetMouseLocation();
                        v666 = nil;
                        v664 = 790 - (766 + 23) ;
                    end
                end
            end);
            if not v551 then
                warn("Silent Aim Error:", v552);
            end
            if (v487[1] and v487[1].Unit) then
                return v38(v485, unpack(v487));
            end
        end
        return v38(v485, ...);
    end);
else
    warn("Executor does not support hookmetamethod. Silent Aim will not work.");
end
if hookmetamethod then
    local v332;
    v332 = hookmetamethod(game, "__namecall", function(v488, ...)
        local v489 = 0 - 0 ;
        local v490;
        while true do
            if (v489 == 0) then
                local v668 = 0 - 0 ;
                while true do
                    if (v668 == 1) then
                        v489 = 2 - 1 ;
                        break;
                    end
                    if (v668 == 0) then
                        v490 = getnamecallmethod();
                        if v14.AntiKick.Active then
                            local v804 = 0;
                            while true do
                                if (v804 == (0 - 0)) then
                                    if ((v490:lower() == "kick") and (v488 == v9)) then
                                        return nil;
                                    end
                                    if (v490:lower() == "shutdown") then
                                        return nil;
                                    end
                                    break;
                                end
                            end
                        end
                        v668 = 1074 - (1036 + 37) ;
                    end
                end
            end
            if (v489 == (1 + 0)) then
                if (v14.AntiTase.Active and (v490:lower() == "fireserver") and (v488.Name == "PlayerTased")) then
                    return nil;
                end
                return v332(v488, ...);
            end
        end
    end);
    local v333;
    v333 = hookmetamethod(game, "__index", function(v491, v492)
        local v493 = 0 - 0 ;
        local v494;
        while true do
            if ((0 + 0) == v493) then
                v494 = 0;
                while true do
                    if (v494 == (1480 - (641 + 839))) then
                        if v14.AntiKick.Active then
                            local v805 = 913 - (910 + 3) ;
                            while true do
                                if (v805 == (0 - 0)) then
                                    if ((tostring(v492):lower() == "kick") and (v491 == v9)) then
                                        return function()
                                        end;
                                    end
                                    if (tostring(v492):lower() == "shutdown") then
                                        return function()
                                        end;
                                    end
                                    break;
                                end
                            end
                        end
                        return v333(v491, v492);
                    end
                end
                break;
            end
        end
    end);
end
v2.JumpRequest:Connect(function()
    if v9.Character then
        local v495 = 1684 - (1466 + 218) ;
        local v496;
        local v497;
        while true do
            if (v495 == 0) then
                v496 = v9.Character:FindFirstChild("Humanoid");
                v497 = v9.Character:FindFirstChild("HumanoidRootPart");
                v495 = 1 + 0 ;
            end
            if (v495 == (1149 - (556 + 592))) then
                if (v14.InfJump.Active and v496) then
                    v496:ChangeState(Enum.HumanoidStateType.Jumping);
                end
                if (v14.Jump.Active and v496 and v497) then
                    local v720 = 0;
                    while true do
                        if (v720 == (0 + 0)) then
                            v496.UseJumpPower = true;
                            v496.JumpPower = v14.Jump.Value;
                            v720 = 809 - (329 + 479) ;
                        end
                        if (v720 == 1) then
                            v496:ChangeState(Enum.HumanoidStateType.Jumping);
                            break;
                        end
                    end
                end
                break;
            end
        end
    end
end);
local v39, v40;
v1.RenderStepped:Connect(function()
    if (v14.Fly.Active and v9.Character and v9.Character:FindFirstChild("HumanoidRootPart")) then
        local v498 = 854 - (174 + 680) ;
        local v499;
        local v500;
        local v501;
        local v502;
        local v503;
        while true do
            if (v498 == 1) then
                if not v39 then
                    v39 = Instance.new("BodyGyro", v499);
                    v39.P = 309255 - 219255 ;
                    v39.maxTorque = Vector3.new(9628333546 - 628334058, 9000000023 - (198 + 337), 8999999488 - 0);
                    v40 = Instance.new("BodyVelocity", v499);
                    v40.maxForce = Vector3.new(9000000877 - (135 + 1254), 8999999488 - 0, 8999999488 - 0);
                    v500.PlatformStand = true;
                end
                v39.CFrame = v501;
                v502 = v14.Fly.Speed;
                v498 = 2 + 0 ;
            end
            if ((1527 - (389 + 1138)) == v498) then
                local v671 = 0;
                while true do
                    if ((575 - (102 + 472)) == v671) then
                        v501 = v11.CFrame;
                        v498 = 1;
                        break;
                    end
                    if (v671 == (0 + 0)) then
                        v499 = v9.Character.HumanoidRootPart;
                        v500 = v9.Character:FindFirstChild("Humanoid");
                        v671 = 1 + 0 ;
                    end
                end
            end
            if (v498 == 3) then
                local v672 = 0 + 0 ;
                while true do
                    if (v672 == (1545 - (320 + 1225))) then
                        if v2:IsKeyDown(Enum.KeyCode.A) then
                            v503 = v503 - (v501.RightVector * v502) ;
                        end
                        if v2:IsKeyDown(Enum.KeyCode.D) then
                            v503 = v503 + (v501.RightVector * v502) ;
                        end
                        v672 = 1 - 0 ;
                    end
                    if (v672 == (1 + 0)) then
                        if v2:IsKeyDown(Enum.KeyCode.Space) then
                            v503 = v503 + Vector3.new(0, v502 / (1466 - (157 + 1307)), 0) ;
                        end
                        v498 = 1863 - (821 + 1038) ;
                        break;
                    end
                end
            end
            if (v498 == 4) then
                if v2:IsKeyDown(Enum.KeyCode.LeftControl) then
                    v503 = v503 - Vector3.new(0 - 0, v502 / (1 + 1), 0 - 0) ;
                end
                v40.Velocity = v503;
                break;
            end
            if (v498 == 2) then
                v503 = Vector3.new(0 + 0, 0, 0);
                if v2:IsKeyDown(Enum.KeyCode.W) then
                    v503 = v503 + (v501.LookVector * v502) ;
                end
                if v2:IsKeyDown(Enum.KeyCode.S) then
                    v503 = v503 - (v501.LookVector * v502) ;
                end
                v498 = 7 - 4 ;
            end
        end
    elseif v39 then
        local v553 = 0;
        while true do
            if (v553 == (1027 - (834 + 192))) then
                v40:Destroy();
                v40 = nil;
                v553 = 2;
            end
            if (0 == v553) then
                v39:Destroy();
                v39 = nil;
                v553 = 1 + 0 ;
            end
            if ((1 + 1) == v553) then
                if (v9.Character and v9.Character:FindFirstChild("Humanoid")) then
                    v9.Character.Humanoid.PlatformStand = false;
                end
                break;
            end
        end
    end
end);
v1.Stepped:Connect(function()
    if (v14.Noclip.Active and v9.Character) then
        for v526, v527 in pairs(v9.Character:GetDescendants()) do
            if (v527:IsA("BasePart") and v527.CanCollide) then
                v527.CanCollide = false;
            end
        end
    end
end);
task.spawn(function()
    while task.wait(0.1) do
        if (v14.AutoArrest.Active and v9.Character) then
            if myRoot then
                local v675 = 0 + 0 ;
                local v676;
                local v677;
                while true do
                    if (v675 == (0 - 0)) then
                        v676 = v9.Backpack:FindFirstChild("Handcuffs");
                        if v676 then
                            v9.Character.Humanoid:EquipTool(v676);
                        end
                        v675 = 305 - (300 + 4) ;
                    end
                    if (v675 == (1 + 0)) then
                        v677 = v9.Character:FindFirstChild("Handcuffs");
                        if v677 then
                            for v826, v827 in pairs(v0:GetPlayers()) do
                                if ((v827 ~= v9) and (v827.Team.Name == "Criminals") and v827.Character) then
                                    local v861 = 0 - 0 ;
                                    local v862;
                                    while true do
                                        if (v861 == (362 - (112 + 250))) then
                                            v862 = v827.Character:FindFirstChild("HumanoidRootPart");
                                            if v862 then
                                                local v887 = 0;
                                                local v888;
                                                while true do
                                                    if (v887 == (0 + 0)) then
                                                        v888 = (v862.Position - myRoot.Position).Magnitude;
                                                        if (v888 <= v14.AutoArrest.Range) then
                                                            workspace.Remote.arrest:InvokeServer(v862);
                                                        end
                                                        break;
                                                    end
                                                end
                                            end
                                            break;
                                        end
                                    end
                                end
                            end
                        end
                        break;
                    end
                end
            end
        end
    end
end);
task.spawn(function()
    local v242 = 0;
    local v243;
    while true do
        if (0 == v242) then
            v243 = game:GetService("Lighting");
            while task.wait(2 - 1) do
                if v14.Fullbright.Active then
                    v243.Brightness = 2;
                    v243.ClockTime = 9 + 5 ;
                    v243.FogEnd = 51717 + 48283 ;
                    v243.GlobalShadows = false;
                    v243.OutdoorAmbient = Color3.fromRGB(128, 96 + 32, 64 + 64);
                end
            end
            break;
        end
    end
end);
v1.RenderStepped:Connect(function()
    workspace.CurrentCamera.FieldOfView = v14.FOV.Value;
end);
v1.RenderStepped:Connect(function()
    if v14.GodMode.Active then
        if v9.Character then
            local v554 = 0 + 0 ;
            local v555;
            while true do
                if (v554 == 0) then
                    v555 = v9.Character:FindFirstChild("Humanoid");
                    if v555 then
                        local v777 = 1414 - (1001 + 413) ;
                        while true do
                            if (v777 == (2 - 1)) then
                                v555:SetStateEnabled(Enum.HumanoidStateType.Dead, false);
                                if not v555:FindFirstChild("GodModeConn") then
                                    local v866 = 882 - (244 + 638) ;
                                    local v867;
                                    local v868;
                                    while true do
                                        if (v866 == (694 - (627 + 66))) then
                                            v868.Name = "GodModeConn";
                                            break;
                                        end
                                        if (v866 == 0) then
                                            v867 = v555.HealthChanged:Connect(function(v889)
                                                if (v889 < v555.MaxHealth) then
                                                    v555.Health = v555.MaxHealth;
                                                end
                                            end);
                                            v868 = Instance.new("BoolValue", v555);
                                            v866 = 2 - 1 ;
                                        end
                                    end
                                end
                                break;
                            end
                            if ((602 - (512 + 90)) == v777) then
                                v555.Health = v555.MaxHealth;
                                v555.BreakJointsOnDeath = false;
                                v777 = 1;
                            end
                        end
                    end
                    v554 = 1;
                end
                if (v554 == (1907 - (1665 + 241))) then
                    for v735, v736 in pairs(v0:GetPlayers()) do
                        if ((v736 ~= v9) and v736.Character) then
                            local v809 = 717 - (373 + 344) ;
                            local v810;
                            while true do
                                if (v809 == (0 + 0)) then
                                    v810 = v736.Character:FindFirstChildOfClass("Tool");
                                    if (v810 and v810:FindFirstChild("Handle")) then
                                        local v875 = 0 + 0 ;
                                        local v876;
                                        while true do
                                            if (0 == v875) then
                                                v876 = v810.Handle:FindFirstChild("TouchInterest");
                                                if v876 then
                                                    v876:Destroy();
                                                end
                                                break;
                                            end
                                        end
                                    end
                                    break;
                                end
                            end
                        end
                    end
                    break;
                end
            end
        end
    end
end);
v1.Stepped:Connect(function()
    if (v14.GhostMode.Active and v9.Character) then
        for v528, v529 in pairs(v9.Character:GetDescendants()) do
            if v529:IsA("BasePart") then
                v529.Transparency = 0.5 - 0 ;
            end
        end
    end
end);
v2.InputBegan:Connect(function(v246, v247)
    if not v247 then
        local v504 = 0 - 0 ;
        local v505;
        while true do
            if (v504 == (1099 - (35 + 1064))) then
                v505 = v9.Character:FindFirstChild("HumanoidRootPart");
                if (v14.InfJump.Active and hum) then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping);
                end
                v504 = 1;
            end
            if (v504 == 1) then
                if (v14.Jump.Active and hum and v505) then
                    local v725 = 0 + 0 ;
                    while true do
                        if (v725 == (0 - 0)) then
                            hum.UseJumpPower = true;
                            hum.JumpPower = v14.Jump.Value;
                            v725 = 1 + 0 ;
                        end
                        if (v725 == (1237 - (298 + 938))) then
                            hum:ChangeState(Enum.HumanoidStateType.Jumping);
                            break;
                        end
                    end
                end
                break;
            end
        end
    end
end);
local v39, v40;
v1.RenderStepped:Connect(function()
    if (v14.Fly.Active and v9.Character and v9.Character:FindFirstChild("HumanoidRootPart")) then
        local v506 = 1259 - (233 + 1026) ;
        local v507;
        local v508;
        local v509;
        local v510;
        local v511;
        while true do
            if (v506 == (1666 - (636 + 1030))) then
                v507 = v9.Character.HumanoidRootPart;
                v508 = v9.Character:FindFirstChild("Humanoid");
                v509 = v11.CFrame;
                if not v39 then
                    local v726 = 0 + 0 ;
                    while true do
                        if ((2 + 0) == v726) then
                            v40.maxForce = Vector3.new(8999999488, 9194272224 - 194272736, 8999999968 - (209 + 271));
                            v508.PlatformStand = true;
                            break;
                        end
                        if (v726 == (0 - 0)) then
                            v39 = Instance.new("BodyGyro", v507);
                            v39.P = 90000;
                            v726 = 1;
                        end
                        if (v726 == (1 - 0)) then
                            v39.maxTorque = Vector3.new(8999999715 - (226 + 1), 9000000598 - (296 + 814), 8999999488);
                            v40 = Instance.new("BodyVelocity", v507);
                            v726 = 2;
                        end
                    end
                end
                v506 = 1;
            end
            if (v506 == (1371 - (34 + 1334))) then
                if v2:IsKeyDown(Enum.KeyCode.LeftControl) then
                    v511 = v511 - Vector3.new(0 + 0, v510 / (2 + 0), 0) ;
                end
                v40.Velocity = v511;
                break;
            end
            if (v506 == 1) then
                v39.CFrame = v509;
                v510 = v14.Fly.Speed;
                v511 = Vector3.new(1283 - (1035 + 248), 0, 21 - (20 + 1));
                if v2:IsKeyDown(Enum.KeyCode.W) then
                    v511 = v511 + (v509.LookVector * v510) ;
                end
                v506 = 2;
            end
            if (v506 == (2 + 0)) then
                if v2:IsKeyDown(Enum.KeyCode.S) then
                    v511 = v511 - (v509.LookVector * v510) ;
                end
                if v2:IsKeyDown(Enum.KeyCode.A) then
                    v511 = v511 - (v509.RightVector * v510) ;
                end
                if v2:IsKeyDown(Enum.KeyCode.D) then
                    v511 = v511 + (v509.RightVector * v510) ;
                end
                if v2:IsKeyDown(Enum.KeyCode.Space) then
                    v511 = v511 + Vector3.new(0, v510 / 2, 0) ;
                end
                v506 = 322 - (134 + 185) ;
            end
        end
    elseif v39 then
        local v556 = 0;
        local v557;
        while true do
            if (0 == v556) then
                v557 = 1133 - (549 + 584) ;
                while true do
                    if (v557 == (685 - (314 + 371))) then
                        v39:Destroy();
                        v39 = nil;
                        v557 = 3 - 2 ;
                    end
                    if (v557 == (969 - (478 + 490))) then
                        v40:Destroy();
                        v40 = nil;
                        v557 = 2;
                    end
                    if (v557 == (2 + 0)) then
                        if (v9.Character and v9.Character:FindFirstChild("Humanoid")) then
                            v9.Character.Humanoid.PlatformStand = false;
                        end
                        break;
                    end
                end
                break;
            end
        end
    end
end);
v1.Stepped:Connect(function()
    if (v14.Noclip.Active and v9.Character) then
        for v530, v531 in pairs(v9.Character:GetDescendants()) do
            if (v531:IsA("BasePart") and v531.CanCollide) then
                v531.CanCollide = false;
            end
        end
    end
end);
task.spawn(function()
    while task.wait(1172.1 - (786 + 386)) do
        if (v14.AutoArrest.Active and v9.Character) then
            if myRoot then
                local v685 = v9.Backpack:FindFirstChild("Handcuffs");
                if v685 then
                    v9.Character.Humanoid:EquipTool(v685);
                end
                local v686 = v9.Character:FindFirstChild("Handcuffs");
                if v686 then
                    for v737, v738 in pairs(v0:GetPlayers()) do
                        if ((v738 ~= v9) and (v738.Team.Name == "Criminals") and v738.Character) then
                            local v818 = v738.Character:FindFirstChild("HumanoidRootPart");
                            if v818 then
                                local v844 = 0 - 0 ;
                                local v845;
                                while true do
                                    if (v844 == (1379 - (1055 + 324))) then
                                        v845 = (v818.Position - myRoot.Position).Magnitude;
                                        if (v845 <= v14.AutoArrest.Range) then
                                            workspace.Remote.arrest:InvokeServer(v818);
                                        end
                                        break;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end);
task.spawn(function()
    local v248 = 1340 - (1093 + 247) ;
    local v249;
    while true do
        if (v248 == (0 + 0)) then
            v249 = game:GetService("Lighting");
            while task.wait(1 + 0) do
                if v14.Fullbright.Active then
                    local v712 = 0 - 0 ;
                    while true do
                        if (v712 == (0 - 0)) then
                            v249.Brightness = 2;
                            v249.ClockTime = 39 - 25 ;
                            v712 = 2 - 1 ;
                        end
                        if (v712 == (1 + 1)) then
                            v249.OutdoorAmbient = Color3.fromRGB(128, 492 - 364, 441 - 313);
                            break;
                        end
                        if (v712 == 1) then
                            v249.FogEnd = 75404 + 24596 ;
                            v249.GlobalShadows = false;
                            v712 = 4 - 2 ;
                        end
                    end
                end
            end
            break;
        end
    end
end);
v1.RenderStepped:Connect(function()
    workspace.CurrentCamera.FieldOfView = v14.FOV.Value;
end);
v1.RenderStepped:Connect(function()
    if v14.GodMode.Active then
        if v9.Character then
            local v558 = 688 - (364 + 324) ;
            local v559;
            while true do
                if ((0 - 0) == v558) then
                    v559 = v9.Character:FindFirstChild("Humanoid");
                    if v559 then
                        local v783 = 0 - 0 ;
                        while true do
                            if (v783 == (0 + 0)) then
                                v559.Health = v559.MaxHealth;
                                v559.BreakJointsOnDeath = false;
                                v783 = 4 - 3 ;
                            end
                            if (v783 == 1) then
                                v559:SetStateEnabled(Enum.HumanoidStateType.Dead, false);
                                if not v559:FindFirstChild("GodModeConn") then
                                    local v869 = 0 - 0 ;
                                    local v870;
                                    local v871;
                                    local v872;
                                    while true do
                                        if (v869 == (0 - 0)) then
                                            v870 = 0;
                                            v871 = nil;
                                            v869 = 1269 - (1249 + 19) ;
                                        end
                                        if (v869 == (1 + 0)) then
                                            v872 = nil;
                                            while true do
                                                if (v870 == 0) then
                                                    v871 = v559.HealthChanged:Connect(function(v899)
                                                        if (v899 < v559.MaxHealth) then
                                                            v559.Health = v559.MaxHealth;
                                                        end
                                                    end);
                                                    v872 = Instance.new("BoolValue", v559);
                                                    v870 = 3 - 2 ;
                                                end
                                                if (v870 == 1) then
                                                    v872.Name = "GodModeConn";
                                                    break;
                                                end
                                            end
                                            break;
                                        end
                                    end
                                end
                                break;
                            end
                        end
                    end
                    v558 = 1087 - (686 + 400) ;
                end
                if ((1 + 0) == v558) then
                    for v739, v740 in pairs(v0:GetPlayers()) do
                        if ((v740 ~= v9) and v740.Character) then
                            local v819 = 229 - (73 + 156) ;
                            local v820;
                            while true do
                                if (v819 == 0) then
                                    v820 = v740.Character:FindFirstChildOfClass("Tool");
                                    if (v820 and v820:FindFirstChild("Handle")) then
                                        local v878 = 0;
                                        local v879;
                                        while true do
                                            if (v878 == 0) then
                                                v879 = v820.Handle:FindFirstChild("TouchInterest");
                                                if v879 then
                                                    v879:Destroy();
                                                end
                                                break;
                                            end
                                        end
                                    end
                                    break;
                                end
                            end
                        end
                    end
                    break;
                end
            end
        end
    end
end);
v1.Stepped:Connect(function()
    if (v14.GhostMode.Active and v9.Character) then
        for v532, v533 in pairs(v9.Character:GetDescendants()) do
            if v533:IsA("BasePart") then
                v533.Transparency = 0.5 + 0 ;
            end
        end
    end
end);
local v41 = Instance.new("Seat");
v41.Name = "BCODE_SafeSeat";
v41.Size = Vector3.new(4, 812 - (721 + 90), 1 + 3);
v41.Position = Vector3.new(- (3246 - 2246), 150, 2220 - (224 + 246));
v41.Anchored = true;
v41.CanCollide = true;
v41.Transparency = 0.5;
v41.Parent = workspace;
local v49 = nil;
v2.InputBegan:Connect(function(v252, v253)
    local v254 = 0 - 0 ;
    while true do
        if (v254 == 0) then
            if not v253 then
                if (v252.KeyCode == v14.Aimbot.Key) then
                    v14.Aimbot.Active = not v14.Aimbot.Active;
                end
                if (v252.KeyCode == Enum.KeyCode.Period) then
                    v14.Fly.Active = not v14.Fly.Active;
                end
                if (v252.KeyCode == Enum.KeyCode.Z) then
                    if v9.Character then
                        local v784 = v9.Character:FindFirstChild("Humanoid");
                        local v785 = v9.Character:FindFirstChild("HumanoidRootPart");
                        if (v784 and v785) then
                            local v828 = 0 - 0 ;
                            while true do
                                if (v828 == (0 + 0)) then
                                    v49 = v785.CFrame;
                                    v785.CFrame = v41.CFrame + Vector3.new(0 + 0, 2 + 0, 0) ;
                                    v828 = 1;
                                end
                                if ((1 - 0) == v828) then
                                    task.wait(0.1 - 0);
                                    v41:Sit(v784);
                                    break;
                                end
                            end
                        end
                    end
                end
                if (v252.KeyCode == Enum.KeyCode.Space) then
                    if v9.Character then
                        local v786 = v9.Character:FindFirstChild("Humanoid");
                        local v787 = v9.Character:FindFirstChild("HumanoidRootPart");
                        if (v786 and v786.Sit) then
                            v786.Sit = false;
                            if (((v787.Position - v41.Position).Magnitude < 10) and v49) then
                                task.wait(0.1);
                                v787.CFrame = v49;
                            end
                        end
                    end
                end
                if (v252.KeyCode == Enum.KeyCode.LeftControl) then
                    local v729 = 0;
                    local v730;
                    while true do
                        if (v729 == (513 - (203 + 310))) then
                            v730 = v12:FindFirstChild("PRISON_UI");
                            if v730 then
                                local v849 = 1993 - (1238 + 755) ;
                                local v850;
                                while true do
                                    if (v849 == (0 + 0)) then
                                        v850 = v730:FindFirstChild("MainFrame");
                                        if v850 then
                                            if v850.Visible then
                                                local v890 = 1534 - (709 + 825) ;
                                                while true do
                                                    if (v890 == (0 - 0)) then
                                                        v3:Create(v850, TweenInfo.new(0.3 - 0, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                                                            Size = UDim2.new(864 - (196 + 668), 0 - 0, 0, 0 - 0)
                                                        }):Play();
                                                        task.wait(0.3);
                                                        v890 = 834 - (171 + 662) ;
                                                    end
                                                    if (v890 == 1) then
                                                        v850.Visible = false;
                                                        break;
                                                    end
                                                end
                                            else
                                                local v891 = 0;
                                                while true do
                                                    if (v891 == (93 - (4 + 89))) then
                                                        v850.Visible = true;
                                                        v850.Size = UDim2.new(0 - 0, 0 + 0, 0 - 0, 0);
                                                        v891 = 1 + 0 ;
                                                    end
                                                    if (v891 == (1487 - (35 + 1451))) then
                                                        v3:Create(v850, TweenInfo.new(1453.4 - (28 + 1425), Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                            Size = UDim2.new(1993 - (941 + 1052), 653 + 27, 0, 480)
                                                        }):Play();
                                                        break;
                                                    end
                                                end
                                            end
                                        end
                                        break;
                                    end
                                end
                            end
                            break;
                        end
                    end
                end
            end
            if (not v253 and v14.ClickTP.Active and (v252.KeyCode == v14.ClickTP.Key)) then
                if (v9.Character and v9.Character:FindFirstChild("HumanoidRootPart")) then
                    v9.Character.HumanoidRootPart.CFrame = CFrame.new(v10.Hit.Position + Vector3.new(1514 - (822 + 692), 3 - 0, 0));
                end
            end
            break;
        end
    end
end);