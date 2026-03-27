if not shared.StarfallKey then
	game:GetService("Players").LocalPlayer:Kick("no key found")
	return
end;
local a = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local b = game:GetService("Players")
local c = game:GetService("RunService")
local d = game:GetService("TweenService")
local e = game:GetService("HttpService")
local e = game:GetService("ReplicatedStorage")
local f = game:GetService("UserInputService")
local g = game:GetService("VirtualUser")
local h = game:GetService("Lighting")
local i = game:GetService("Workspace")
local b = b.LocalPlayer;
local j = b.Character or b.CharacterAdded:Wait()
local k = j:WaitForChild("HumanoidRootPart")
local l = j:WaitForChild("Humanoid")
local m = i.CurrentCamera;
local n = b:GetMouse()
local n = b:WaitForChild("PlayerGui")
local e = e:WaitForChild("RemoteEvents")
local o = e:WaitForChild("RequestStartDraggingItem")
local p = e:WaitForChild("StopDraggingItem")
if not request and not http_request and (not syn or not syn.request) then
	local a = nil
end;
local q = {
	Require = false
}
local q = ""
local q = Instance.new("BindableEvent")
local q = {}
local r = 500;
local s = false;
local t = false;
local u = a:CreateWindow({
	Title = "Starfall - 99 Nights in the Forest",
	IconThemed = true,
	Author = "Made by Severity (pro)",
	Folder = "Starfall Customs",
	Size = UDim2.fromOffset(460, 420),
	Icon = "sparkles",
	Transparent = true,
	Theme = "Dark",
	User = {
		Enabled = true,
		Anonymous = true
	},
	SideBarWidth = 200,
	ScrollBarEnabled = true
})
u:SetToggleKey(Enum.KeyCode.RightShift)
a:Notify({
	Title = "Keybind",
	Content = "To Toggle The Gui Press \'RightShift\'",
	Duration = 8
})
u:Tag({
	Title = "v1.2.5",
	Color = Color3.fromRGB(247, 0, 255)
})
u:CreateTopbarButton("theme-switcher", "moon", function()
	local b = a;
	local c = a:GetCurrentTheme()
	if c == "Dark" then
		c = "Light" or "Dark"
	else
		goto label_10
	end;
	b:SetTheme(c)
	a:Notify({
		Title = "Theme Changed",
		Content = "Current theme: " .. a:GetCurrentTheme(),
		Duration = 4
	})
end, 989)
local v = {
	u:Divider(),
	u:Divider(),
	u:Divider(),
	u:Divider()
}
local w = {
	Title = "Fishing",
	Icon = "fish",
	Desc = "Auto-Fishing Features"
}
w = {
	Title = "Crafting",
	Icon = "pickaxe",
	Desc = "Faster Crafting"
}
local x = {
	Title = "Bring Items",
	Icon = "box",
	Desc = "Bring All Kinds Of Items To You."
}
x = {
	Title = "Bring Children",
	Icon = "baby",
	Desc = "Wyd Diddy?"
}
local y = {
	Title = "Item Visuals",
	Icon = "eye",
	Desc = "Locate Items."
}
y = {
	Title = "World Visuals",
	Icon = "mountain",
	Desc = "Changes world aspect and behaviour."
}
y = {
	Title = "Character",
	Icon = "user",
	Desc = "Change Character Behaviour."
}
y = {
	Title = "Misc",
	Icon = "ellipsis",
	Desc = "Other Features That You Might Need."
}
u:SelectTab(1)
v.AboutUs:Paragraph({
	Title = "Who Are We?",
	Icon = "user-circle",
	Desc = "Starfall is a flexible and powerful script hub for Roblox, designed to enhance your gaming experience with a variety of features and tools."
})
v.AboutUs:Paragraph({
	Title = "Our Team",
	Icon = "user-circle",
	Desc = "Our team consists of experienced developers and designers who are passionate about creating the best possible experience for our users."
})
v.Socials:Section({
	Title = "Discord",
	Icon = "link",
	TextXAlignment = "Left",
	TextSize = 17
})
v.Socials:Paragraph({
	Title = "Discord Invite",
	Icon = "discord",
	Desc = "Join our communities for updates and support!",
	Color = "White"
})
v.Socials:Button({
	Title = "Starfall Discord Link (Click to Copy)",
	Icon = "link",
	Callback = function()
		setclipboard("https://discord.gg/PJ7c7tU4Jd")
		a:Notify({
			Title = "Copied!",
			Content = "Starfall Discord link copied!",
			Duration = 3
		})
	end
})
v.Socials:Section({
	Title = "Developers",
	Icon = "user",
	TextXAlignment = "Left",
	TextSize = 17
})
v.Socials:Paragraph({
	Title = "Our Team\'s Socials",
	Icon = "user-circle",
	Desc = "Our Team Members Socials",
	Color = "White"
})
v.Socials:Button({
	Title = "Severity (severitysvc)",
	Desc = "UI Designer \nScripter",
	Icon = "link",
	Callback = function()
		setclipboard("https://github.com/Severitysvc")
	end
})
v.Socials:Button({
	Title = "Habibi",
	Desc = "Scripter \nBot Developer",
	Icon = "link",
	Callback = function()
		setclipboard("https://habibibloxberg.xyz")
	end
})
local function u(a)
	local a, b = pcall(a)
	assert(a, tostring(b))
end;
local function z(a)
	local c = next;
	local b, d = b.Inventory:GetChildren()
	for b, b in c, b, d do
		if b:GetAttribute(a) and j and j:FindFirstChild("ToolHandle") and j:FindFirstChild("ToolHandle"):GetAttribute("ToolName") == b:GetAttribute("ToolName") then
			return b
		end
	end;
	return nil
end;
local function A(a)
	return a:GetAttribute("LastOwner") == b.UserId
end;
local function B(a)
	k.CFrame = CFrame.new(a:GetPivot().Position)
	o:FireServer(a)
	local b = tick()
	local c = tick()
	while true do
		wait()
		if tick() - b >= 0.02 then
			o:FireServer(a)
			local a = tick()
			b = a
		end;
		local b = pcall(function()
			k.CFrame = CFrame.new(a:GetPivot().Position) + Vector3.new(0, 2.5, 0)
		end)
		if not b then
			break
		end;
		b = A(a)
		if not b then
			b = tick() - c;
			if b > 1 then
				break
			end
		else
			break
		end
	end;
	p:FireServer()
	return A(a)
end;
function w(a, b)
	if not t then
		return false
	end;
	if B(a) then
		a:PivotTo(b)
		return true
	end;
	return false
end;
function x(a, b, c)
	local d = k.CFrame;
	local e = d;
	if c then
		e = i.Map.Campground.MainFire.PrimaryPart.CFrame + Vector3.new(0, 4, 0)
	end;
	local c = 0;
	t = true;
	for d, d in ipairs(q) do
		if not t then
			break
		elseif not b or b > c then
			if d.PrimaryPart and (r == math.huge or (d.PrimaryPart.Position - k.Position).Magnitude <= r) and a(d) and w(d, e + Vector3.new(0, 5, 0)) then
				c = c + 1
			end
		else
			break
		end
	end;
	task.delay(0.3, function()
		k.CFrame = d
	end)
end;
function y(a, b)
	if b then
		for b, c in ipairs(q) do
			if c == a then
				table.remove(q, b)
			end
		end
	elseif a:GetAttribute("Interaction") == "Item" then
		table.insert(q, a)
	end
end;
local function o()
	t = false
end;
for a, a in ipairs(i.Items:GetChildren()) do
	y(a)
end;
i.Items.ChildAdded:Connect(function(a)
	y(a)
end)
i.Items.ChildRemoved:Connect(function(a)
	y(a, true)
end)
local function p(a)
	local b = next;
	local a, c = a:GetDescendants()
	for a, a in b, a, c do
		if a:IsA("ProximityPrompt") then
			return a
		end
	end;
	return nil
end;
local function t(a, b, c, d, e, f)
	if not a then
		return
	end;
	if a:FindFirstChild("ESP") and a:FindFirstChildOfClass("Highlight") then
		return
	end;
	local f = a:FindFirstChildOfClass("Highlight") or Instance.new("Highlight")
	local g = a:FindFirstChild("ESP") or Instance.new("BillboardGui")
	local h = g:FindFirstChildOfClass("TextLabel") or Instance.new("TextLabel")
	f.Name = "ESP_Highlight"
	f.Adornee = a;
	f.FillColor = b;
	f.FillTransparency = 1;
	f.OutlineColor = b;
	f.OutlineTransparency = 0;
	f.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
	f.Enabled = true;
	f.Parent = a;
	g.Name = "ESP"
	g.Size = UDim2.new(0, 50, 0, 25)
	g.AlwaysOnTop = true;
	g.StudsOffset = Vector3.new(0, e, 0)
	g.Adornee = d;
	g.Enabled = true;
	g.Parent = d;
	h.Size = UDim2.new(1, 0, 1, 0)
	h.BackgroundTransparency = 1;
	h.Text = c;
	h.TextColor3 = b;
	h.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	h.TextScaled = true;
	h.Parent = g;
	task.spawn(function()
		while f do
			local a = g;
			if a then
				a = d;
				if a then
					a = d.Parent;
					if a then
						a = m and m.CFrame.Position;
						local b = nil;
						if a then
							b = d;
							if b then
								b = d:IsA("BasePart")
								if b then
									b = (a - d.Position).Magnitude;
									task.spawn(function()
										if s then
											h.Text = c .. " (" .. math.floor(b + 0.5) .. " m)"
										else
											h.Text = c
										end
									end)
								end
							end
						end;
						b = task;
						b = b.wait;
						b(0.1)
					else
						break
					end
				else
					break
				end
			else
				break
			end
		end
	end)
end;
u(function()
	v.Auras:Section({
		Title = "Killaura",
		Icon = "swords"
	})
	local a = nil;
	local d = 25;
	local f = 0;
	local g = false;
	local function h(a, c, d)
		task.spawn(function()
			e.ToolDamageObject:InvokeServer(a, c, "1_" .. b.UserId, d)
		end)
	end;
	local function b(a)
		local b = a:IsA("Model")
		if b then
			b = a.PrimaryPart;
			if b then
				b = a.Name;
				if b ~= "Pelt Trader" then
					b = a.Name:find("Child") or not a.Name:find("Fairy")
				else
					b = false
				end
			end
		end;
		return b
	end;
	v.Auras:Toggle({
		Title = "Killaura",
		Desc = "Automatically damages enemies within range",
		Icon = "check",
		Type = "Checkbox",
		Default = false,
		Callback = function(e)
			if e then
				a = c.Heartbeat:Connect(function()
					local a = z("WeaponDamage")
					if not a then
						return
					end;
					local c = tick()
					if c - f < (a:GetAttribute("ToolCooldown") or 0.5) then
						return
					end;
					for c, c in ipairs(i.Characters:GetChildren()) do
						if b(c) and (c.PrimaryPart.Position - k.Position).Magnitude <= d then
							h(c, a, k.CFrame)
							if not g then
								break
							end
						end
					end;
					f = c
				end)
			elseif a then
				a:Disconnect()
				a = nil
			end
		end
	})
	v.Auras:Toggle({
		Title = "Multi Hit",
		Desc = "Allows you to hit multiple targets at once (may increase ping)",
		Icon = "check",
		Type = "Checkbox",
		Default = false,
		Callback = function(a)
			g = a
		end
	})
	v.Auras:Slider({
		Title = "Killaura Range",
		Step = 1,
		Value = {
			Min = 0,
			Max = 500,
			Default = 25
		},
		Callback = function(a)
			d = tonumber(a)
		end
	})
end)
u(function()
	v.Auras:Section({
		Title = "Tree Aura",
		Icon = "box"
	})
	local a = nil;
	local d = 25;
	local f = 0;
	local g = false;
	local h = {
		"Small Tree",
		"Small Snowy Tree"
	}
	local function j(a, c, d)
		task.spawn(function()
			e.ToolDamageObject:InvokeServer(a, c, "1_" .. b.UserId, d)
		end)
	end;
	local function b(a)
		if not a or not a:IsA("Model") or not a.PrimaryPart then
			return false
		end;
		local a = a.Name:lower()
		for b, b in next, h, nil do
			if a:match(b:gsub("(%W)", "%%%1"):lower()) then
				return true
			end
		end;
		return false
	end;
	v.Auras:Toggle({
		Title = "Tree Aura",
		Desc = "Automatically hits trees within range",
		Icon = "check",
		Type = "Checkbox",
		Default = false,
		Callback = function(e)
			if e then
				a = c.Heartbeat:Connect(function()
					local a = z("WeaponResourceDamage")
					if not a then
						return
					end;
					local c = tick()
					if c - f < (a:GetAttribute("ToolCooldown") or 0.5) then
						return
					end;
					for c, c in ipairs({
						i.Map.Landmarks,
						i.Map.Foliage
					}) do
						for c, c in pairs(c:GetChildren()) do
							if b(c) and (c.PrimaryPart.Position - k.Position).Magnitude <= d then
								j(c, a, k.CFrame)
								if not g then
									break
								end
							end
						end
					end;
					f = c
				end)
			elseif a then
				a:Disconnect()
				a = nil
			end
		end
	})
	v.Auras:Toggle({
		Title = "Multi Hit",
		Desc = "Allows you to hit multiple trees at once (may increase ping)",
		Icon = "check",
		Type = "Checkbox",
		Default = false,
		Callback = function(a)
			g = a
		end
	})
	v.Auras:Dropdown({
		Title = "Tree Filtering",
		Desc = "Select The Trees You Want The Tree Aura To Target And Which To Not",
		Values = {
			"Small Tree",
			"Snowy Small Tree",
			"TreeBig"
		},
		Value = h,
		Multi = true,
		AllowNone = false,
		Callback = function(a)
			h = a
		end
	})
	v.Auras:Slider({
		Title = "Tree Aura Range",
		Step = 1,
		Value = {
			Min = 0,
			Max = 500,
			Default = 25
		},
		Callback = function(a)
			d = tonumber(a)
		end
	})
end)
u(function()
	v.Auras:Section({
		Title = "Cook Aura",
		Icon = "beef"
	})
	local a = nil;
	local b = 25;
	local d = 0;
	local function f()
		local a = {}
		for b, b in pairs(i.Items:GetChildren()) do
			if b:GetAttribute("Cookable", true) and b:GetAttribute("RestoreHealth") < 0 then
				table.insert(a, b)
			end
		end;
		return a
	end;
	v.Auras:Toggle({
		Title = "Cook Aura",
		Icon = "check",
		Desc = "Automatically Cooks Meat In Range",
		Type = "Checkbox",
		Default = false,
		Callback = function(g)
			if g then
				a = c.Heartbeat:Connect(function()
					local a = tick()
					if a - d < 1 then
						return
					end;
					d = a;
					local a = f()
					if # a <= 0 then
						return
					end;
					if not k then
						return
					end;
					for a, a in pairs(a) do
						if a.PrimaryPart and (k.Position - a.PrimaryPart.Position).Magnitude <= b then
							pcall(function()
								e:WaitForChild("RequestCookItem"):FireServer(i:WaitForChild("Map"):WaitForChild("Campground"):WaitForChild("MainFire"), a)
							end)
							break
						else
						end
					end;
					c.Heartbeat:Wait(1)
				end)
			elseif a then
				a:Disconnect()
				a = nil
			end
		end
	})
	v.Auras:Slider({
		Title = "Cook Aura Range",
		Desc = "Change the max range of the Cook Aura",
		Step = 1,
		Value = {
			Min = 0,
			Max = 500,
			Default = 25
		},
		Callback = function(a)
			b = tonumber(a)
		end
	})
end)
u(function()
	v.Auras:Section({
		Title = "Chest Aura",
		Icon = "box"
	})
	local a = nil;
	local b = 25;
	local d = 0;
	local function e()
		local a = {}
		for b, b in pairs(i.Items:GetChildren()) do
			if b.Name:lower():find("chest") then
				for b, b in pairs(b:GetDescendants()) do
					if b:IsA("ProximityPrompt") then
						table.insert(a, b)
					end
				end
			end
		end;
		return a
	end;
	v.Auras:Toggle({
		Title = "Chest Aura",
		Icon = "check",
		Desc = "Automatically Opens Chests In Range",
		Type = "Checkbox",
		Default = false,
		Callback = function(f)
			if f then
				a = c.Heartbeat:Connect(function()
					local a = tick()
					if a - d < 2 then
						return
					end;
					d = a;
					local a = e()
					if # a <= 0 then
						return
					end;
					for a, a in pairs(a) do
						local c = a.Parent and a.Parent.Parent.Parent;
						local c = c and c.PrimaryPart;
						if k and c and (k.Position - c.Position).Magnitude <= b then
							pcall(function()
								fireproximityprompt(a)
							end)
						end
					end
				end)
			elseif a then
				a:Disconnect()
				a = nil
			end
		end
	})
	v.Auras:Slider({
		Title = "Chest Aura Range",
		Desc = "Change the max range of the Chest Aura",
		Step = 1,
		Value = {
			Min = 25,
			Max = 500,
			Default = 25
		},
		Callback = function(a)
			b = tonumber(a)
		end
	})
end)
u(function()
	v.Auras:Section({
		Title = "Coins Aura",
		Icon = "coins"
	})
	local a = 25;
	local b = 0;
	local d = nil;
	local e = e:WaitForChild("RequestCollectCoints")
	local function f()
		local a = {}
		for b, b in pairs(i.Items:GetChildren()) do
			if b.Name:lower():find("coin") then
				table.insert(a, b)
			end
		end;
		return a
	end;
	v.Auras:Toggle({
		Title = "Coins Aura",
		Icon = "check",
		Desc = "Automatically Collects Coins In Range",
		Type = "Checkbox",
		Default = false,
		Callback = function(g)
			if g then
				d = c.Heartbeat:Connect(function()
					local c = tick()
					if c - b < 3 then
						return
					end;
					b = c;
					local b = f()
					if # b <= 0 then
						return
					end;
					if not k then
						return
					end;
					for b, b in pairs(b) do
						if b.PrimaryPart and (k.Position - b.PrimaryPart.Position).Magnitude <= a then
							task.spawn(function()
								e:InvokeServer(b)
							end)
						end
					end
				end)
			elseif d then
				d:Disconnect()
				d = nil
			end
		end
	})
	v.Auras:Slider({
		Title = "Coins Aura Range",
		Desc = "Change The Max Range Of The Coins Aura",
		Step = 1,
		Value = {
			Min = 0,
			Max = 500,
			Default = 25
		},
		Callback = function(b)
			a = tonumber(b)
		end
	})
end)
u(function()
	v.Auras:Section({
		Title = "Diamonds Aura",
		Icon = "gem"
	})
	local a = 25;
	local b = 0;
	local d = nil;
	local e = e:WaitForChild("RequestTakeDiamonds")
	local function f()
		local a = {}
		for b, b in pairs(i.Items:GetChildren()) do
			if b.Name:lower():find("diamond") then
				table.insert(a, b)
			end
		end;
		return a
	end;
	v.Auras:Toggle({
		Title = "Diamonds Aura",
		Icon = "check",
		Desc = "Automatically Collects Diamonds In Range",
		Type = "Checkbox",
		Default = false,
		Callback = function(g)
			if g then
				d = c.Heartbeat:Connect(function()
					local c = tick()
					if c - b < 3 then
						return
					end;
					b = c;
					local b = f()
					if # b <= 0 then
						return
					end;
					if not k then
						return
					end;
					for b, b in pairs(b) do
						if b.PrimaryPart and (k.Position - b.PrimaryPart.Position).Magnitude <= a then
							task.spawn(function()
								e:InvokeServer(b)
							end)
						end
					end
				end)
			elseif d then
				d:Disconnect()
				d = nil
			end
		end
	})
	v.Auras:Slider({
		Title = "Diamond Aura Range",
		Desc = "Change The Max Range Of The Diamond Aura",
		Step = 1,
		Value = {
			Min = 0,
			Max = 500,
			Default = 25
		},
		Callback = function(b)
			a = tonumber(b)
		end
	})
end)
u(function()
	v.Utility:Section({
		Title = "Hitbox Expander",
		Icon = "box"
	})
	local a = 10;
	local b = 0.9;
	local c = {}
	local d = {}
	local e = false;
	local function f(d)
		local e = d:FindFirstChild("HumanoidRootPart") or d.PrimaryPart;
		if e and e:IsA("BasePart") then
			if not c[d] then
				c[d] = {
					Object = e,
					Original = {
						Transparency = e.Transparency,
						CanCollide = e.CanCollide,
						Size = e.Size
					}
				}
			end;
			e.Size = Vector3.new(a, a, a)
			e.Transparency = b;
			e.CanCollide = false
		end
	end;
	v.Utility:Toggle({
		Title = "Resize Hitboxes",
		Icon = "check",
		Desc = "Automatically sets all enemy hitboxes to the selected size",
		Type = "Checkbox",
		Default = false,
		Callback = function(a)
			e = a;
			if a then
				for a, a in pairs(i.Characters:GetChildren()) do
					if a:IsA("Model") and not a.Name:find("Lost Child") and not a.Name:find("Pelt") and not a.Name:find("Fairy") then
						f(a)
					end
				end;
				d.ChildAdded = i.Characters.ChildAdded:Connect(function(a)
					if e and a:IsA("Model") and not a.Name:find("Lost Child") then
						a:WaitForChild("HumanoidRootPart")
						f(a)
					end
				end)
			else
				for a, a in next, c, nil do
					a.Object.Size = a.Original.Size;
					a.Object.Transparency = a.Original.Transparency;
					a.Object.CanCollide = a.Original.CanCollide
				end;
				for a, a in pairs(d) do
					if a then
						a:Disconnect()
					end
				end;
				d = {}
				c = {}
			end
		end
	})
	v.Utility:Slider({
		Title = "Hitbox Size",
		Desc = "Change the size of the hitboxes",
		Step = 0.1,
		Value = {
			Min = 0.1,
			Max = 100,
			Default = 10
		},
		Callback = function(b)
			a = tonumber(b)
			if e then
				for a, b in pairs(c) do
					f(a)
				end
			end
		end
	})
	v.Utility:Slider({
		Title = "Hitbox Transparency",
		Desc = "Change the transparency of the hitboxes",
		Step = 0.1,
		Value = {
			Min = 0,
			Max = 1,
			Default = 0.9
		},
		Callback = function(a)
			b = tonumber(a)
			if e then
				for a, b in pairs(c) do
					f(a)
				end
			end
		end
	})
end)
u(function()
	v.Utility:Section({
		Title = "Auto Eat",
		Icon = "apple"
	})
	local a = nil;
	local b = 0;
	local d = 10;
	local f = 25;
	local e = e:WaitForChild("RequestConsumeItem")
	v.Utility:Paragraph({
		Title = "Note",
		Icon = "info",
		Color = "White",
		Desc = "In Order To Use Auto Eat You Must Be Close To Foods"
	})
	local function g()
		local a = {}
		for b, b in pairs(i.Items:GetChildren()) do
			if b:IsA("Model") and (b:GetAttribute("RestoreHealth") or 0) >= 0 then
				table.insert(a, b)
			end
		end;
		return a
	end;
	v.Utility:Toggle({
		Title = "Auto Eat",
		Icon = "check",
		Desc = "Automatically Eat Stuff Nearby",
		Type = "Checkbox",
		Default = false,
		Callback = function(h)
			if h then
				a = c.Heartbeat:Connect(function()
					local a = tick()
					if a - b < d then
						return
					end;
					b = a;
					local a = g()
					if # a == 0 then
						return
					end;
					for a, a in pairs(a) do
						if a.PrimaryPart and (k.Position - a.PrimaryPart.Position).Magnitude <= f then
							task.spawn(function()
								e:InvokeServer(a)
							end)
							break
						else
						end
					end
				end)
			elseif a then
				a:Disconnect()
				a = nil
			end
		end
	})
	v.Utility:Slider({
		Title = "Auto Eat Delay",
		Desc = "Change The Delay Of Auto Eating ( seconds )",
		Step = 1,
		Value = {
			Min = 1,
			Max = 60,
			Default = 5
		},
		Callback = function(a)
			d = tonumber(a)
		end
	})
	v.Utility:Slider({
		Title = "Auto Eat Range",
		Desc = "Change The Max Range Of Auto Eating",
		Step = 1,
		Value = {
			Min = 0,
			Max = 500,
			Default = 25
		},
		Callback = function(a)
			f = tonumber(a)
		end
	})
end)
u(function()
	v.Utility:Section({
		Title = "Auto Plant Saplings",
		Icon = "shrub"
	})
	local b = false;
	local c = "Under Sapling"
	local d = e:WaitForChild("RequestPlantItem")
	local e = {
		Active = false,
		CurrentIndex = 1,
		Camp = i.Map.Campground.MainFire,
		OffsetFromCamp = 10,
		Angle = 2,
		PlantedCount = 0
	}
	local function f()
		local a = {}
		for b, b in pairs(i.Items:GetChildren()) do
			if b.Name == "Sapling" then
				table.insert(a, b)
			end
		end;
		return a
	end;
	local function g(a, b)
		d:InvokeServer(a, b)
	end;
	local function d(a)
		if not e.Active or not e.Camp then
			return
		end;
		if # a <= 0 then
			return
		end;
		local b = e.Camp.PrimaryPart.Position;
		local c = math.rad(e.Angle)
		local d = e.OffsetFromCamp;
		for a, a in ipairs(a) do
			if a and a.PrimaryPart then
				local c = (e.CurrentIndex - 1) * c;
				g(a, b + Vector3.new(math.cos(c) * d, 0, math.sin(c) * d))
				e.CurrentIndex = e.CurrentIndex + 1;
				e.PlantedCount = e.PlantedCount + 1
			end
		end
	end;
	v.Utility:Toggle({
		Title = "Auto Plant Saplings",
		Icon = "check",
		Desc = "Automatically Plants Saplings",
		Type = "Checkbox",
		Default = false,
		Callback = function(d)
			b = d;
			if d then
				local b = f()
				if # b <= 0 then
					a:Notify({
						Title = "Auto Plant Saplings",
						Content = "No Saplings Found To Plant",
						Duration = 3
					})
					return
				end;
				for a, a in pairs(b) do
					if a and a.PrimaryPart then
						if c == "Under Sapling" then
							g(a, a.PrimaryPart.Position)
						elseif c == "Under Player" then
							g(a, k and k.Position)
						end
					end
				end
			end
		end
	})
	v.Utility:Dropdown({
		Title = "Plant Method",
		Values = {
			"Under Player",
			"Under Sapling"
		},
		Value = c,
		Multi = false,
		AllowNone = false,
		Callback = function(a)
			c = a
		end
	})
	i.Items.ChildAdded:Connect(function(a)
		if a.Name == "Sapling" and a and b then
			if c == "Under Sapling" then
				g(a, a.PrimaryPart.Position)
			elseif c == "Under Player" then
				g(a, k and k.Position)
			end
		end
	end)
	v.Utility:Section({
		Title = "Plant Around Camp",
		Icon = "shrub"
	})
	v.Utility:Toggle({
		Title = "Enable Circle Planting",
		Icon = "check",
		Desc = "Plants Saplings In a Circular Pattern Around The Camp",
		Type = "Checkbox",
		Default = false,
		Callback = function(a)
			e.Active = a;
			if a then
				e.CurrentIndex = 1;
				e.PlantedCount = 0
			end
		end
	})
	v.Utility:Slider({
		Title = "Circle Radius (Studs)",
		Desc = "Distance From Campfire",
		Values = {
			Min = 1,
			Max = 100,
			Default = 1
		},
		Step = 1,
		Default = e.OffsetFromCamp,
		Callback = function(a)
			e.OffsetFromCamp = a
		end
	})
	v.Utility:Slider({
		Title = "Angle Step",
		Desc = "Smaller = More Saplings Around Campfire",
		Values = {
			Min = 1,
			Max = 30,
			Default = 1
		},
		Step = 1,
		Default = e.Angle,
		Callback = function(a)
			e.Angle = a
		end
	})
	v.Utility:Button({
		Title = "Plant Circle",
		Icon = "chevron-right",
		Desc = "Manually plant all saplings in a circle",
		Callback = function()
			local b = f()
			if # b <= 0 then
				a:Notify({
					Title = "Circle Plant",
					Content = "No Saplings Found To Plant",
					Duration = 3
				})
				return
			end;
			d(b)
		end
	})
	i.Items.ChildAdded:Connect(function(a)
		if a.Name == "Sapling" and a and e.Active then
			d({
				a
			})
		end
	end)
end)
v.BringItem:Paragraph({
	Title = "Note",
	Icon = "info",
	Color = "White",
	Desc = "In Order To Use Any Brings, The Selected Items Need To Be Spawned / Discovered.\n You Can Discover More Items By Leveling Up The Campfire"
})
v.BringItem:Button({
	Title = "Stop Bringing Items",
	Desc = "Stops the bringing threads and teleports you back to your old position",
	Callback = o
})
v.BringItem:Section({
	Title = "Distance Limit",
	Icon = "map-pin"
})
v.BringItem:Slider({
	Title = "Max Distance",
	Desc = "Only Bring Items Within This Range (0 = No Limit)",
	Step = 1,
	Value = {
		Min = 0,
		Max = 1000,
		Default = 0
	},
	Callback = function(a)
		if a == 0 then
			r = math.huge
		else
			r = tonumber(a)
		end
	end
})
u(function()
	local a = {
		"Log",
		"Coal",
		"Fuel Canister",
		"Oil Barrel",
		"Chair",
		"Biofuel"
	}
	local b = {
		"Coal"
	}
	v.BringItem:Section({
		Title = "Bring Fuel Items",
		Icon = "flame"
	})
	v.BringItem:Dropdown({
		Title = "Select Items To Bring",
		Values = a,
		Value = b,
		Multi = true,
		AllowNone = false,
		Callback = function(a)
			b = a
		end
	})
	v.BringItem:Button({
		Title = "Bring Selected Items",
		Callback = function()
			x(function(a)
				for b, b in pairs(b) do
					if a.Name == b and a:GetAttribute("BurnFuel") then
						return true
					end
				end;
				return false
			end)
		end
	})
end)
u(function()
	local a = {
		"Bolt",
		"Sheet Metal",
		"Broken Fan",
		"Old Radio",
		"Tyre",
		"Metal Chair",
		"Old Car Engine",
		"Washing Machine"
	}
	local b = {
		"Bolt"
	}
	v.BringItem:Section({
		Title = "Bring Scrap Items",
		Icon = "bolt"
	})
	v.BringItem:Dropdown({
		Title = "Select Items To Bring",
		Values = a,
		Value = b,
		Multi = true,
		AllowNone = false,
		Callback = function(a)
			b = a
		end
	})
	v.BringItem:Button({
		Title = "Bring Selected Items",
		Callback = function()
			x(function(a)
				for b, b in pairs(b) do
					if a.Name == b and a:GetAttribute("Scrappable") then
						return true
					end
				end;
				return false
			end)
		end
	})
end)
u(function()
	local a = {
		"Carrot",
		"Morsel",
		"Steak",
		"Berry",
		"Apple",
		"Chili",
		"Cake",
		"Stew",
		"Corn",
		"Pumpkin"
	}
	local b = {
		"Carrot"
	}
	v.BringItem:Section({
		Title = "Bring Food Items",
		Icon = "beef"
	})
	v.BringItem:Dropdown({
		Title = "Select Items To Bring",
		Values = a,
		Value = b,
		Multi = true,
		AllowNone = false,
		Callback = function(a)
			b = a
		end
	})
	v.BringItem:Button({
		Title = "Bring Selected Items",
		Callback = function()
			x(function(a)
				for b, b in pairs(b) do
					if a.Name == b and a:GetAttribute("RestoreHunger") then
						return true
					end
				end;
				return false
			end)
		end
	})
end)
u(function()
	local a = {
		"Rifle Ammo",
		"Revolver Ammo"
	}
	local b = {
		"Revolver Ammo"
	}
	v.BringItem:Section({
		Title = "Bring Ammo",
		Icon = "bring-to-front"
	})
	v.BringItem:Dropdown({
		Title = "Select Items To Bring",
		Values = a,
		Value = b,
		Multi = true,
		AllowNone = false,
		Callback = function(a)
			b = a
		end
	})
	v.BringItem:Button({
		Title = "Bring Selected Items",
		Callback = function()
			x(function(a)
				for b, b in pairs(b) do
					if a.Name == b then
						return true
					end
				end;
				return false
			end)
		end
	})
end)
u(function()
	local a = {
		"Bandage",
		"Medkit"
	}
	local b = {
		"Bandage",
		"Medkit"
	}
	v.BringItem:Section({
		Title = "Bring Healing Items",
		Icon = "plus"
	})
	v.BringItem:Dropdown({
		Title = "Select Items To Bring",
		Values = a,
		Value = b,
		Multi = true,
		AllowNone = false,
		Callback = function(a)
			b = a
		end
	})
	v.BringItem:Button({
		Title = "Bring Selected Items",
		Callback = function()
			x(function(a)
				for b, b in pairs(b) do
					if a.Name == b or 0 < a:GetAttribute("RestoreHealth") then
						return true
					end
				end;
				return false
			end)
		end
	})
end)
u(function()
	local a = nil;
	local b = false;
	local c = nil;
	local function d()
		local b = {}
		for a, a in ipairs(q) do
			local a = a:GetAttribute("ItemName") or a.Name;
			if not table.find(b, a) then
				table.insert(b, a)
			end
		end;
		if a then
			a:Refresh(b)
		else
			local d = v.BringItem;
			local b = {
				Title = "Item(s) To Bring",
				Desc = "Select The Items You Want To Bring.",
				Values = b,
				Value = c or "",
				Callback = function(a)
					c = a
				end
			}
			a = d:Dropdown(b)
		end
	end;
	v.BringItem:Paragraph({
		Title = "Note",
		Icon = "info",
		Color = "White",
		Desc = "To Use The Bring Selected Items, You Must Select Items From The List At The Bottom."
	})
	v.BringItem:Button({
		Title = "Bring Selected Items",
		Desc = "Brings The Items You Selected.",
		Callback = function()
			if a and a.Value then
				local c = type(a.Value)
				if c == "table" then
					c = a.Value;
					if not c then
						::label_17::
						c = {}
						local a = a.Value
					end
				else
					goto label_17
				end;
				b = true;
				for a, a in ipairs(c) do
					x(function(b)
						return (b:GetAttribute("ItemName") or b.Name) == a
					end)
				end;
				b = false
			end
		end
	})
	v.BringItem:Section({
		Title = "Items Lists",
		Icon = "bring-to-front"
	})
	v.BringItem:Button({
		Title = "Refresh List",
		Desc = "Refreshes The Item List With New Items (Don\'t Spam)",
		Callback = d
	})
	d()
end)
u(function()
	v.Fishing:Section({
		Title = "Rods",
		Icon = "fish"
	})
	v.Fishing:Button({
		Title = "Grab Old rod",
		Desc = "Grabs An Old Rod From The Fishing Hut ( In Case You Dont Have It )",
		Callback = function()
			local a = next;
			local b, c = i.Item:GetChildren()
			for a, a in a, b, c do
				if a.Name == "Old Rod" then
					e:WaitForChild("RequestHotbarItem"):InvokeServer(a)
				end
			end
		end
	})
end)
v.Fishing:Paragraph({
	Title = "Note",
	Icon = "info",
	Color = "White",
	Desc = "Some Fishing Features Might Not Visually Show But They Do Work."
})
u(function()
	v.Fishing:Section({
		Title = "Fishing",
		Icon = "fish"
	})
	local a = nil;
	local b = 0;
	local d = 0.5;
	v.Fishing:Toggle({
		Title = "Instant Catch",
		Icon = "check",
		Desc = "Automatically Catch While Fishing",
		Type = "Checkbox",
		Default = false,
		Callback = function(f)
			if f then
				a = c.Heartbeat:Connect(function()
					local a = tick()
					if a - b < d then
						return
					end;
					b = a;
					e:WaitForChild("ConfirmCatchItem"):FireServer()
				end)
			elseif a then
				a:Disconnect()
				a = nil
			end
		end
	})
end)
u(function()
	v.Fishing:Section({
		Title = "Auto Fish",
		Icon = "fish"
	})
	local a = nil;
	local d = 0;
	local f = 1;
	v.Fishing:Toggle({
		Title = "Auto Fish",
		Icon = "check",
		Desc = "Automatically Uses The Rod",
		Type = "Checkbox",
		Default = false,
		Callback = function(g)
			if g then
				a = c.Heartbeat:Connect(function()
					local a = tick()
					if a - d < f then
						return
					end;
					d = a;
					local a = next;
					local c, d = i.Map.Landmarks:GetDescendants()
					for a, a in a, c, d do
						if a.Name:lower():find("hotspot") and a:GetAttribute("Active") == true then
							local c = e:WaitForChild("StartCatchTimer")
							local b = b:WaitForChild("Inventory"):WaitForChild("Old Rod")
							c:InvokeServer(b, i:WaitForChild("Map"):FindFirstDescendant("Water"):WaitForChild("Water" or i:WaitForChild("Map"):FindFirstDescendant("Water")), a.Position or a.CFrame.Position)
						end
					end
				end)
			elseif a then
				a:Disconnect()
				a = nil
			end
		end
	})
end)
u(function()
	local function a(a)
		task.spawn(function()
			e:WaitForChild("CraftItem"):InvokeServer(a)
		end)
	end;
	local b = {
		"Sun Dial",
		"Compass",
		"Regular Bed",
		"Freezer",
		"Farm Plot",
		"Log Wall",
		"Wood Rain Storage",
		"Shelf",
		"Bear Trap",
		"Crafting Bench Tier 3"
	}
	local c = {
		"Crock Pot",
		"Boost Pad",
		"Biofuel Processor",
		"Radar",
		"Torch",
		"Good Bed",
		"Lightning Rod",
		"Crafting Bench Tier 4"
	}
	local d = {
		"Ammo Crate",
		"Oil Drill",
		"Giant Bed",
		"Teleporter",
		"Crafting Bench Tier 5"
	}
	v.Crafting:Section({
		Title = "Tier 1",
		Icon = "pickaxe"
	})
	v.Crafting:Button({
		Title = "Craft Map",
		Icon = "chevron-right",
		Desc = "Craft The Map",
		Callback = function()
			a("Map")
		end
	})
	v.Crafting:Button({
		Title = "Craft Old Bed",
		Icon = "chevron-right",
		Desc = "Craft The Old Bed",
		Callback = function()
			a("Old Bed")
		end
	})
	v.Crafting:Button({
		Title = "Craft Bunny Trap",
		Icon = "chevron-right",
		Desc = "Craft A Bunny Trap",
		Callback = function()
			a("Bunny Trap")
		end
	})
	v.Crafting:Button({
		Title = "Upgrade To Crafting Bench Tier 2",
		Icon = "chevron-right",
		Desc = "Unlock Tier 2 Crafting",
		Callback = function()
			a("Crafting Bench Tier 2")
		end
	})
	v.Crafting:Section({
		Title = "Tier 2",
		Icon = "gear"
	})
	for b, b in ipairs(b) do
		local a = {
			Title = "Craft " .. b,
			Icon = "chevron-right",
			Desc = "Craft " .. b,
			Callback = function()
				a(b)
			end
		}
		v.Crafting:Button(a)
	end;
	v.Crafting:Section({
		Title = "Tier 3",
		Icon = "hammer"
	})
	for b, b in ipairs(c) do
		local a = {
			Title = "Craft " .. b,
			Icon = "chevron-right",
			Desc = "Craft " .. b,
			Callback = function()
				a(b)
			end
		}
		v.Crafting:Button(a)
	end;
	v.Crafting:Section({
		Title = "Tier 4",
		Icon = "portal"
	})
	for b, b in ipairs(d) do
		local a = {
			Title = "Craft " .. b,
			Icon = "chevron-right",
			Desc = "Craft " .. b,
			Callback = function()
				a(b)
			end
		}
		v.Crafting:Button(a)
	end
end)
u(function()
	v.BringKids:Section({
		Title = "Bring Skids (diddy features)",
		Icon = "baby"
	})
	local a = {
		"Lost Child",
		"Lost Child2",
		"Lost Child3",
		"Lost Child4"
	}
	local a = v.BringKids:Dropdown({
		Title = "Goto Children",
		Desc = "Select The Child You Want To Teleport To",
		Values = a,
		Value = nil,
		Multi = true,
		AllowNone = true,
		Callback = function(b)
			if b then
				for a, a in next, a, nil do
					if i.Characters[a] then
						local a = i.Characters[a].PrimaryPart;
						if a then
							k.CFrame = a.CFrame
						end
					end
				end
			end
		end
	})
end)
u(function()
	v.BringKids:Section({
		Title = "Sack Skids (bluethooth violation)",
		Icon = "baby"
	})
	local a = {
		"Lost Child",
		"Lost Child2",
		"Lost Child3",
		"Lost Child4"
	}
	local a = v.BringKids:Dropdown({
		Title = "Sack Child",
		Desc = "Select The Child You Want To Sack",
		Values = a,
		Value = nil,
		Multi = true,
		AllowNone = true,
		Callback = function(b)
			if b then
				for a, a in next, a, nil do
					if i.Characters[a] then
						local a = p(i.Characters[a])
						if a then
							fireproximityprompt(a)
						end
					end
				end
			end
		end
	})
end)
u(function()
	v.Visuals:Toggle({
		Title = "Show Distances",
		Icon = "check",
		Desc = "Shows the distance from you and the item",
		Type = "Checkbox",
		Default = false,
		Callback = function(a)
			s = a
		end
	})
end)
u(function()
	v.Visuals:Section({
		Title = "Fuel Esp",
		Icon = "eye"
	})
	local a = 0;
	local b = 2;
	local d = Color3.fromRGB(255, 136, 0)
	local e = nil;
	v.Visuals:Toggle({
		Title = "Esp Fuel Items",
		Icon = "check",
		Desc = "Esp\'s all the burnable items",
		Type = "Checkbox",
		Default = false,
		Callback = function(f)
			if f then
				e = c.Heartbeat:Connect(function()
					local c = tick()
					if c - a < b then
						return
					end;
					a = c;
					for a, a in pairs(i.Items:GetChildren()) do
						if a:isA("Model") and a.PrimaryPart and a:GetAttribute("BurnFuel") and not a:FindFirstChildOfClass("Highlight") and not a.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
							t(a, d, a.Name, a.PrimaryPart, s)
						end
					end
				end)
			else
				for a, a in pairs(i.Items:GetChildren()) do
					if a:isA("Model") and a.PrimaryPart and a:GetAttribute("BurnFuel") and a:FindFirstChildOfClass("Highlight") and a.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
						a:FindFirstChildOfClass("Highlight"):Destroy()
						a.PrimaryPart:FindFirstChildOfClass("BillboardGui"):Destroy()
					end
				end;
				if e then
					e:Disconnect()
					e = nil
				end
			end
		end
	})
	v.Visuals:Colorpicker({
		Title = "Color",
		Default = d,
		Callback = function(a)
			d = a
		end
	})
end)
u(function()
	v.Visuals:Section({
		Title = "Scrap Esp",
		Icon = "eye"
	})
	local a = 0;
	local b = 2;
	local d = Color3.fromRGB(199, 199, 199)
	local e = nil;
	v.Visuals:Toggle({
		Title = "Esp Scrap Items",
		Icon = "check",
		Desc = "Esp\'s all the Scrap items",
		Type = "Checkbox",
		Default = false,
		Callback = function(f)
			if f then
				e = c.Heartbeat:Connect(function()
					local c = tick()
					if c - a < b then
						return
					end;
					a = c;
					for a, a in pairs(i.Items:GetChildren()) do
						if a:isA("Model") and a.PrimaryPart and a:GetAttribute("Scrappable") and not a:FindFirstChildOfClass("Highlight") and not a.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
							t(a, d, a.Name, a.PrimaryPart, s)
						end
					end
				end)
			else
				for a, a in pairs(i.Items:GetChildren()) do
					if a:isA("Model") and a.PrimaryPart and a:GetAttribute("Scrappable") and a:FindFirstChildOfClass("Highlight") and a.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
						a:FindFirstChildOfClass("Highlight"):Destroy()
						a.PrimaryPart:FindFirstChildOfClass("BillboardGui"):Destroy()
					end
				end;
				if e then
					e:Disconnect()
					e = nil
				end
			end
		end
	})
	v.Visuals:Colorpicker({
		Title = "Color",
		Default = d,
		Callback = function(a)
			d = a
		end
	})
end)
u(function()
	v.Visuals:Section({
		Title = "Scrap Esp",
		Icon = "eye"
	})
	local a = 0;
	local b = 2;
	local d = Color3.fromRGB(0, 162, 255)
	local e = nil;
	v.Visuals:Toggle({
		Title = "Esp Tools",
		Icon = "check",
		Desc = "Esp\'s all the Tools",
		Type = "Checkbox",
		Default = false,
		Callback = function(f)
			if f then
				e = c.Heartbeat:Connect(function()
					local c = tick()
					if c - a < b then
						return
					end;
					a = c;
					for a, a in pairs(i.Items:GetChildren()) do
						if a:isA("Model") and a.PrimaryPart and a:GetAttribute("ToolName") and not a:FindFirstChildOfClass("Highlight") and not a.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
							t(a, d, a.Name, a.PrimaryPart, s)
						end
					end
				end)
			else
				for a, a in pairs(i.Items:GetChildren()) do
					if a:isA("Model") and a.PrimaryPart and a:GetAttribute("ToolName") and a:FindFirstChildOfClass("Highlight") and a.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
						a:FindFirstChildOfClass("Highlight"):Destroy()
						a.PrimaryPart:FindFirstChildOfClass("BillboardGui"):Destroy()
					end
				end;
				if e then
					e:Disconnect()
					e = nil
				end
			end
		end
	})
	v.Visuals:Colorpicker({
		Title = "Color",
		Default = d,
		Callback = function(a)
			d = a
		end
	})
end)
u(function()
	v.Visuals:Section({
		Title = "Scrap Esp",
		Icon = "eye"
	})
	local a = 0;
	local b = 2;
	local d = Color3.fromRGB(0, 162, 255)
	local e = nil;
	v.Visuals:Toggle({
		Title = "Esp Ammo",
		Icon = "check",
		Desc = "Esp\'s all the Ammo",
		Type = "Checkbox",
		Default = false,
		Callback = function(f)
			if f then
				e = c.Heartbeat:Connect(function()
					local c = tick()
					if c - a < b then
						return
					end;
					a = c;
					for a, a in pairs(i.Items:GetChildren()) do
						if a:isA("Model") and a.PrimaryPart and a:GetAttribute("AmmoType") and not a:FindFirstChildOfClass("Highlight") and not a.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
							t(a, d, a.Name, a.PrimaryPart, s)
						end
					end
				end)
			else
				for a, a in pairs(i.Items:GetChildren()) do
					if a:isA("Model") and a.PrimaryPart and a:GetAttribute("AmmoType") and a:FindFirstChildOfClass("Highlight") and a.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
						a:FindFirstChildOfClass("Highlight"):Destroy()
						a.PrimaryPart:FindFirstChildOfClass("BillboardGui"):Destroy()
					end
				end;
				if e then
					e:Disconnect()
					e = nil
				end
			end
		end
	})
	v.Visuals:Colorpicker({
		Title = "Color",
		Default = d,
		Callback = function(a)
			d = a
		end
	})
end)
u(function()
	v.World:Section({
		Title = "Ambience",
		Icon = "wind"
	})
	local a = nil;
	local b = false;
	local d = {
		Originals = {},
		New = Color3.fromRGB(255, 255, 255)
	}
	v.World:Toggle({
		Title = "Ambience Changer",
		Icon = "check",
		Desc = "Changes The Game Ambience",
		Type = "Checkbox",
		Default = false,
		Callback = function(e)
			if e then
				if not next(d.Originals) then
					d.Originals = {
						Ambient = h.Ambient,
						OutdoorAmbient = h.OutdoorAmbient,
						ClockTime = h.ClockTime,
						ColorShift_Top = h.ColorShift_Top,
						ColorShift_Bottom = h.ColorShift_Bottom
					}
				end;
				a = c.Heartbeat:Connect(function()
					if b then
						local a = Color3.fromHSV(tick() % 5 / 5, 1, 1)
						h.Ambient = a;
						h.OutdoorAmbient = a;
						h.ColorShift_Top = a;
						h.ColorShift_Bottom = a
					else
						h.Ambient = d.New;
						h.OutdoorAmbient = d.New;
						h.ColorShift_Top = d.New;
						h.ColorShift_Bottom = d.New
					end
				end)
			else
				if a then
					a:Disconnect()
					a = nil
				end;
				if next(d.Originals) then
					h.Ambient = d.Originals.Ambient;
					h.OutdoorAmbient = d.Originals.OutdoorAmbient;
					h.ClockTime = d.Originals.ClockTime;
					h.ColorShift_Top = d.Originals.ColorShift_Top;
					h.ColorShift_Bottom = d.Originals.ColorShift_Bottom
				end
			end
		end
	})
	v.World:Toggle({
		Title = "Rainbow Ambience",
		Icon = "check",
		Desc = "Makes The Ambience Rainbow",
		Type = "Checkbox",
		Default = false,
		Callback = function(a)
			b = a
		end
	})
	v.World:Colorpicker({
		Title = "Color",
		Desc = "Change The Color Of The Atmosphere",
		Default = d.New,
		Callback = function(a)
			d.New = a
		end
	})
end)
u(function()
	v.World:Section({
		Title = "Visuals",
		Icon = "eye"
	})
	local a = 0;
	local b = 2;
	local e = nil;
	local f = nil;
	local g = h.FogStart;
	local j = h.FogEnd;
	v.World:Toggle({
		Title = "No Fog",
		Icon = "check",
		Desc = "Remove all fog from the game",
		Type = "Checkbox",
		Default = false,
		Callback = function(k)
			if k == true then
				e = c.Heartbeat:Connect(function()
					local c = tick()
					if c - a < b then
						return
					end;
					a = c;
					for a, a in pairs(i.Map.Boundaries:GetChildren()) do
						if a:isA("Part") then
							d:Create(a, TweenInfo.new(0.4), {
								Transparency = 1
							}):Play()
						end
					end
				end)
				h.FogStart = 99999;
				h.FogEnd = 99999;
				f = h:GetPropertyChangedSignal("FogEnd"):Connect(function()
					if h.FogEnd == 99999 then
						return
					end;
					g = h.FogStart;
					j = h.FogEnd;
					h.FogStart = 99999;
					h.FogEnd = 99999
				end)
			else
				for a, a in pairs(i.Map.Boundaries:GetChildren()) do
					if a:isA("Part") then
						d:Create(a, TweenInfo.new(0.4), {
							Transparency = 0.1
						}):Play()
					end
				end;
				if e then
					e:Disconnect()
					e = nil
				end;
				if f then
					f:Disconnect()
					f = nil
				end;
				h.FogStart = g;
				h.FogEnd = j
			end
		end
	})
end)
u(function()
	v.Character:Section({
		Title = "Speed",
		Icon = "zap"
	})
	local a = 16;
	local b = nil;
	v.Character:Slider({
		Title = "Player Speed",
		Desc = "Adjust your movement speed",
		Step = 1,
		Value = {
			Min = 16,
			Max = 200,
			Default = 16
		},
		Callback = function(b)
			if j and l then
				j.Humanoid.WalkSpeed = b
			end;
			if a == 16 and b ~= 16 then
				local b = j;
				if b then
					b = j.Humanoid and (j.Humanoid.WalkSpeed or 16)
				else
					goto label_26
				end;
				a = b
			end
		end
	})
	v.Character:Button({
		Title = "Reset Speed",
		Desc = "Resets You Speed To The Base Value",
		Icon = "refresh",
		Callback = function()
			if j and j:FindFirstChild("Humanoid") then
				j.Humanoid.WalkSpeed = a or 16
			end
		end
	})
end)
u(function()
	local a = l.JumpPower;
	v.Character:Section({
		Title = "JumpPower",
		Icon = "zap"
	})
	v.Character:Slider({
		Title = "Player JumpPower",
		Desc = "Adjust Your Jump Power",
		Min = 50,
		Max = 500,
		Default = a,
		Step = 1,
		Callback = function(a)
			if l then
				l.JumpPower = tonumber(a)
			end
		end
	})
	v.Character:Button({
		Title = "Reset JumpPower",
		Icon = "chevron-right",
		Callback = function()
			if l then
				l.JumpPower = a
			end
		end
	})
end)
u(function()
	v.Character:Paragraph({
		Title = "Note",
		Icon = "info",
		Color = "White",
		Desc = "Hip Height Can Make You Un-Hitable from enemies"
	})
	v.Character:Section({
		Title = "HipHeight",
		Icon = "chevron-up"
	})
	v.Character:Slider({
		Title = "Player HipHeight",
		Desc = "Adjust Your Characters\'s HipHeight",
		Step = 1,
		Value = {
			Min = 0,
			Max = 250,
			Default = 0
		},
		Callback = function(a)
			l.HipHeight = tonumber(a)
		end
	})
	v.Character:Button({
		Title = "Reset HipHeight",
		Icon = "refresh",
		Callback = function()
			l.HipHeight = 0
		end
	})
end)
u(function()
	v.Character:Section({
		Title = "Movement",
		Icon = "zap"
	})
	local a = false;
	local b = nil;
	v.Character:Toggle({
		Title = "Infinite Jump",
		Icon = "zap",
		Desc = "Allows You To Jump Infinitetly",
		Type = "Checkbox",
		Default = false,
		Callback = function(c)
			a = c;
			if c then
				b = f.JumpRequest:Connect(function()
					if a then
						l:ChangeState("Jumping")
					end
				end)
			elseif b then
				b:Disconnect()
				b = nil
			end
		end
	})
end)
u(function()
	local a = false;
	local b = nil;
	v.Character:Toggle({
		Title = "Noclip",
		Icon = "check",
		Desc = "Allows You To Clip Thru Walls",
		Type = "Checkbox",
		Default = false,
		Callback = function(d)
			a = d;
			if d then
				b = c.Heartbeat:Connect(function()
					local b = next;
					local c, d = j:GetDescendants()
					for b, b in b, c, d do
						if b:IsA("BasePart") and not b.Parent:IsA("Accessory") and not b:FindFirstAncestorOfClass("Tool") then
							b.CanCollide = not a
						end
					end
				end)
			else
				if b then
					b:Disconnect()
					b = nil
				end;
				local a = next;
				local b, c = j:GetDescendants()
				for a, a in a, b, c do
					if a:IsA("BasePart") and not a.Parent:IsA("Accessory") and not a:FindFirstAncestorOfClass("Tool") then
						a.CanCollide = not d
					end
				end
			end
		end
	})
end)
u(function()
	v.Character:Section({
		Title = "Camera",
		Icon = "camera"
	})
	local a = false;
	local b = 90;
	v.Character:Toggle({
		Title = "Fov Changer",
		Icon = "check",
		Desc = "Changes Your Camera Fov",
		Type = "Checkbox",
		Default = false,
		Callback = function(b)
			a = b
		end
	})
	v.Character:Slider({
		Title = "Fov Amount",
		Step = 1,
		Value = {
			Min = 0,
			Max = 120,
			Default = 90
		},
		Callback = function(c)
			b = c;
			if a then
				m.FieldOfView = b
			else
				m.FieldOfView = 90
			end
		end
	})
end)
u(function()
	v.Misc:Section({
		Title = "Teleports",
		Icon = "move"
	})
	v.Misc:Button({
		Title = "Teleport to Campfire",
		Icon = "chevron-right",
		Desc = "Teleports You To The Campfire Thx Np (6 studs higher)",
		Callback = function(a)
			k.CFrame = i.Map.Campground.MainFire.PrimaryPart.CFrame + Vector3.new(0, 15, 0)
		end
	})
	v.Misc:Button({
		Title = "Teleport to Stronghold",
		Icon = "chevron-right",
		Desc = "Teleports You To The Stronghold",
		Callback = function(b)
			if i.Map.Landmarks.Stronghold then
				k.CFrame = i.Map.Landmarks.Stronghold.PrimaryPart.CFrame + Vector3.new(10, 0, 0)
			else
				a:Notify({
					Title = "Teleporter",
					Content = "Stronghold not found, Make sure he is spawned",
					Duration = 3
				})
			end
		end
	})
	v.Misc:Button({
		Title = "Teleport to PeltTrader",
		Icon = "chevron-right",
		Desc = "Teleports You To The PeltTrader (he must be spawned)",
		Callback = function(b)
			if i.Characters:FindFirstChild("Pelt Trader") then
				k.CFrame = i.Characters["Pelt Trader"].PrimaryPart.CFrame + Vector3.new(10, 0, 0)
			else
				a:Notify({
					Title = "Teleporter",
					Content = "PeltTrader not found, Make sure he is spawned",
					Duration = 3
				})
			end
		end
	})
	v.Misc:Button({
		Title = "Teleport to Fairy",
		Icon = "chevron-right",
		Desc = "Teleports ur little ass to the Fairy (she must be spawned)",
		Type = "Checkbox",
		Default = false,
		Callback = function(b)
			if i.Map.Landmarks:FindFirstChild("Fairy House") then
				k.CFrame = i.Map.Landmarks:FindFirstChild("Fairy House").PrimaryPart.CFrame + Vector3.new(0, 15, 0)
			else
				a:Notify({
					Title = "Teleporter",
					Content = "Fairy not found, Make sure he is spawned",
					Duration = 3
				})
			end
		end
	})
end)
u(function()
	v.Misc:Section({
		Title = "Interface",
		Icon = "eye"
	})
	v.Misc:Button({
		Title = "Toggle Crafting UI",
		Icon = "chevron-right",
		Desc = "Toggles The CraftingTable UI",
		Callback = function(a)
			b.PlayerGui.Interface.CraftingTable.Visible = not n.Interface.CraftingTable.Visible
		end
	})
	v.Misc:Button({
		Title = "Toggle FlowerShop UI",
		Icon = "chevron-right",
		Desc = "Toggles The FlowerShop Count UI",
		Callback = function(a)
			n.Interface.Flower.Visible = not n.Interface.Flower.Visible
		end
	})
	v.Misc:Button({
		Title = "Toggle Compass UI",
		Icon = "chevron-right",
		Desc = "Toggles The Compass UI",
		Callback = function(a)
			n.Interface.TopRight.Frame.Compass.Visible = not n.Interface.TopRight.Frame.Compass.Visible
		end
	})
	v.Misc:Button({
		Title = "Toggle Timer UI",
		Icon = "chevron-right",
		Desc = "Toggles The Timer UI",
		Callback = function(a)
			n.Interface.TopRight.Frame.SunDial.Visible = not n.Interface.TopRight.Frame.SunDial.Visible
		end
	})
	v.Misc:Button({
		Title = "Toggle Diamond UI",
		Icon = "chevron-right",
		Desc = "Toggles The Diamond Count UI",
		Callback = function(a)
			n.Interface.DiamondCount.Visible = not n.Interface.DiamondCount.Visible
		end
	})
	v.Misc:Button({
		Title = "Toggle Flower UI",
		Icon = "chevron-right",
		Desc = "Toggles The Flower Count UI",
		Callback = function(a)
			n.Interface.FlowerAmount.Visible = not n.Interface.FlowerAmount.Visible
		end
	})
	v.Misc:Button({
		Title = "Toggle Coin UI",
		Icon = "chevron-right",
		Desc = "Toggles The Coin Count UI",
		Callback = function(a)
			n.Interface.CoinAmmount.Visible = not n.Interface.CoinAmmount.Visible
		end
	})
end)
u(function()
	local a = v.Misc:Section({
		Title = "FPS Booster",
		Icon = "zap"
	})
	local a = false;
	local b = nil;
	local c = settings().Rendering.QualityLevel;
	v.Misc:Toggle({
		Title = "FPS Booster",
		Icon = "zap",
		Desc = "Optimizes game performance for better FPS",
		Type = "Checkbox",
		Default = false,
		Callback = function(d)
			a = d;
			if d then
				pcall(function()
					if settings().Rendering then
						c = settings().Rendering.QualityLevel;
						settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
					end;
					if UserSettings then
						local a = UserSettings():GetService("UserGameSettings")
						if a and a.SetQualityLevel then
							a:SetQualityLevel(1)
						end
					end
				end)
				pcall(function()
					if collectgarbage then
						collectgarbage("collect")
					end
				end)
				b = spawn(function()
					while a do
						local a = ipairs;
						for a, a in a(i:GetDescendants()) do
							if a:IsA("BasePart") then
								a.CastShadow = false
							elseif a:IsA("ParticleEmitter") or a:IsA("Smoke") or a:IsA("Fire") or a:IsA("Sparkles") then
								a.Enabled = false
							elseif a:IsA("Texture") or a:IsA("Decal") then
								a.Transparency = 1
							elseif a:IsA("Terrain") then
								a.WaterWaveSize = 0;
								a.WaterWaveSpeed = 0;
								a.WaterReflectance = 0;
								a.WaterTransparency = 0.8
							end
						end;
						task.wait(1)
					end
				end)
			else
				a = false;
				pcall(function()
					if settings().Rendering then
						settings().Rendering.QualityLevel = c
					end;
					if UserSettings then
						local a = UserSettings():GetService("UserGameSettings")
						if a and a.SetQualityLevel then
							a:SetQualityLevel(c)
						end
					end
				end)
				pcall(function()
					if collectgarbage then
						collectgarbage("collect")
					end
				end)
			end
		end
	})
end)
u(function()
	local a = v.Misc:Section({
		Title = "FPS Booster",
		Icon = "zap"
	})
	v.Misc:Toggle({
		Title = "Infinite FPS Cap",
		Icon = "zap",
		Desc = "Removes The Fps Cap",
		Type = "Checkbox",
		Default = false,
		Callback = function(a)
			if a and setfpscap then
				setfpscap(9999999999999)
			elseif setfpscap then
				setfpscap(120)
			end
		end
	})
end)
u(function()
	local a = v.Misc:Section({
		Title = "Anti AFK",
		Icon = "clock"
	})
	local a = nil;
	v.Misc:Toggle({
		Title = "Anti AFK",
		Icon = "clock",
		Desc = "Prevents being kicked for inactivity using Idled event",
		Type = "Checkbox",
		Default = false,
		Callback = function(c)
			if c then
				if not pcall(function()
					local a = next;
					local b, c = getconnections(b.Idled)
					for a, a in a, b, c do
						a:Disable()
					end
				end) then
					a = b.Idled:Connect(function()
						g:CaptureController()
						g:ClickButton2(Vector2.new())
					end)
				end
			else
				if a then
					a:Disconnect()
					a = nil
				end;
				pcall(function()
					local a = next;
					local b, c = getconnections(b.Idled)
					for a, a in a, b, c do
						a:Enable()
					end
				end)
			end
		end
	})
end)
u(function()
	v.Misc:Section({
		Title = "Instant Prompts",
		Icon = "mouse-pointer-click"
	})
	local a = false;
	v.Misc:Toggle({
		Title = "Instant Prompts",
		Icon = "check",
		Desc = "Makes All The Proximity Prompts Instant (eg: opening chests, etc)",
		Type = "Checkbox",
		Default = false,
		Callback = function(b)
			a = b;
			if b then
				task.spawn(function()
					for a, a in pairs(game.Workspace:GetDescendants()) do
						if a:IsA("ProximityPrompt") and a.HoldDuration ~= 0 then
							a:SetAttribute("HoldDurationOld", a.HoldDuration)
							a.HoldDuration = 0
						end
					end
				end)
			else
				task.spawn(function()
					for a, a in pairs(game.Workspace:GetDescendants()) do
						if a:IsA("ProximityPrompt") and a:GetAttribute("HoldDurationOld") then
							a.HoldDuration = a:GetAttribute("HoldDurationOld")
						end
					end
				end)
			end
		end
	})
	i.DescendantAdded:Connect(function(b)
		if a and b:IsA("ProximityPrompt") then
			b:SetAttribute("HoldDurationOld", b.HoldDuration)
			b.HoldDuration = 0;
			return
		end;
		if b.Name == "Snare Trap" then
			pcall(function()
				b.SensorZone.CanTouch = false
			end)
		end
	end)
end)
b.CharacterAdded:Connect(function(a)
	j = a;
	k = j:WaitForChild("HumanoidRootPart")
	l = j:WaitForChild("Humanoid")
end)