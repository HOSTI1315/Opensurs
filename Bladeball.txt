getgenv().GG = {
    Language = {
        CheckboxEnabled = "Enabled",
        CheckboxDisabled = "Disabled",
        SliderValue = "Value",
        DropdownSelect = "Select",
        DropdownNone = "None",
        DropdownSelected = "Selected",
        ButtonClick = "Click",
        TextboxEnter = "Enter",
        ModuleEnabled = "Enabled",
        ModuleDisabled = "Disabled",
        TabGeneral = "General",
        TabSettings = "Settings",
        Loading = "Loading...",
        Error = "Error",
        Success = "Success"
    }
}

local SelectedLanguage = GG.Language

function convertStringToTable(inputString)
    local result = {}
    for value in string.gmatch(inputString, "([^,]+)") do
        local trimmedValue = value:match("^%s*(.-)%s*$")
        table.insert(result, trimmedValue)
    end

    return result
end

function convertTableToString(inputTable)
    return table.concat(inputTable, ", ")
end

local UserInputService = cloneref(game:GetService('UserInputService'))
local ContentProvider = cloneref(game:GetService('ContentProvider'))
local TweenService = cloneref(game:GetService('TweenService'))
local HttpService = cloneref(game:GetService('HttpService'))
local TextService = cloneref(game:GetService('TextService'))
local RunService = cloneref(game:GetService('RunService'))
local Lighting = cloneref(game:GetService('Lighting'))
local Players = cloneref(game:GetService('Players'))
local CoreGui = cloneref(game:GetService('CoreGui'))
local Debris = cloneref(game:GetService('Debris'))

local mouse = Players.LocalPlayer:GetMouse()
local old_Balls = CoreGui:FindFirstChild('Balls')

if old_Balls then
    Debris:AddItem(old_Balls, 0)
end

if not isfolder("Balls") then
    makefolder("Balls")
end


local Connections = setmetatable({
    disconnect = function(self, connection)
        if not self[connection] then
            return
        end
    
        self[connection]:Disconnect()
        self[connection] = nil
    end,
    disconnect_all = function(self)
        for _, value in self do
            if typeof(value) == 'function' then
                continue
            end
    
            value:Disconnect()
        end
    end
}, Connections)


local Util = setmetatable({
    map = function(self: any, value: number, in_minimum: number, in_maximum: number, out_minimum: number, out_maximum: number)
        return (value - in_minimum) * (out_maximum - out_minimum) / (in_maximum - in_minimum) + out_minimum
    end,
    viewport_point_to_world = function(self: any, location: any, distance: number)
        local unit_ray = workspace.CurrentCamera:ScreenPointToRay(location.X, location.Y)

        return unit_ray.Origin + unit_ray.Direction * distance
    end,
    get_offset = function(self: any)
        local viewport_size_Y = workspace.CurrentCamera.ViewportSize.Y

        return self:map(viewport_size_Y, 0, 2560, 8, 56)
    end
}, Util)


local AcrylicBlur = {}
AcrylicBlur.__index = AcrylicBlur


function AcrylicBlur.new(object: GuiObject)
    local self = setmetatable({
        _object = object,
        _folder = nil,
        _frame = nil,
        _root = nil
    }, AcrylicBlur)

    self:setup()

    return self
end


function AcrylicBlur:create_folder()
    local old_folder = workspace.CurrentCamera:FindFirstChild('AcrylicBlur')

    if old_folder then
        Debris:AddItem(old_folder, 0)
    end

    local folder = Instance.new('Folder')
    folder.Name = 'AcrylicBlur'
    folder.Parent = workspace.CurrentCamera

    self._folder = folder
end


function AcrylicBlur:create_depth_of_fields()
    local depth_of_fields = Lighting:FindFirstChild('AcrylicBlur') or Instance.new('DepthOfFieldEffect')
    depth_of_fields.FarIntensity = 0
    depth_of_fields.FocusDistance = 0.05
    depth_of_fields.InFocusRadius = 0.1
    depth_of_fields.NearIntensity = 1
    depth_of_fields.Name = 'AcrylicBlur'
    depth_of_fields.Parent = Lighting

    for _, object in Lighting:GetChildren() do
        if not object:IsA('DepthOfFieldEffect') then
            continue
        end

        if object == depth_of_fields then
            continue
        end

        Connections[object] = object:GetPropertyChangedSignal('FarIntensity'):Connect(function()
            object.FarIntensity = 0
        end)

        object.FarIntensity = 0
    end
end


function AcrylicBlur:create_frame()
    local frame = Instance.new('Frame')
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundTransparency = 1
    frame.Parent = self._object

    self._frame = frame
end


function AcrylicBlur:create_root()
    local part = Instance.new('Part')
    part.Name = 'Root'
    part.Color = Color3.new(0, 0, 0)
    part.Material = Enum.Material.Glass
    part.Size = Vector3.new(1, 1, 0) 
    part.Anchored = true
    part.CanCollide = false
    part.CanQuery = false
    part.Locked = true
    part.CastShadow = false
    part.Transparency = 0.98
    part.Parent = self._folder


    local specialMesh = Instance.new('SpecialMesh')
    specialMesh.MeshType = Enum.MeshType.Brick  
    specialMesh.Offset = Vector3.new(0, 0, -0.000001)  
    specialMesh.Parent = part

    self._root = part 
end


function AcrylicBlur:setup()
    self:create_depth_of_fields()
    self:create_folder()
    self:create_root()
    
    self:create_frame()
    self:render(0.001)

    self:check_quality_level()
end


function AcrylicBlur:render(distance: number)
    local positions = {
        top_left = Vector2.new(),
        top_right = Vector2.new(),
        bottom_right = Vector2.new(),
    }

    local function update_positions(size: any, position: any)
        positions.top_left = position
        positions.top_right = position + Vector2.new(size.X, 0)
        positions.bottom_right = position + size
    end

    local function update()
        local top_left = positions.top_left
        local top_right = positions.top_right
        local bottom_right = positions.bottom_right

        local top_left3D = Util:viewport_point_to_world(top_left, distance)
        local top_right3D = Util:viewport_point_to_world(top_right, distance)
        local bottom_right3D = Util:viewport_point_to_world(bottom_right, distance)

        local width = (top_right3D - top_left3D).Magnitude
        local height = (top_right3D - bottom_right3D).Magnitude

        if not self._root then
            return
        end

        self._root.CFrame = CFrame.fromMatrix((top_left3D + bottom_right3D) / 2, workspace.CurrentCamera.CFrame.XVector, workspace.CurrentCamera.CFrame.YVector, workspace.CurrentCamera.CFrame.ZVector)
        self._root.Mesh.Scale = Vector3.new(width, height, 0)
    end

    local function on_change()
        local offset = Util:get_offset()
        local size = self._frame.AbsoluteSize - Vector2.new(offset, offset)
        local position = self._frame.AbsolutePosition + Vector2.new(offset / 2, offset / 2)

        update_positions(size, position)
        task.spawn(update)
    end

    Connections['cframe_update'] = workspace.CurrentCamera:GetPropertyChangedSignal('CFrame'):Connect(update)
    Connections['viewport_size_update'] = workspace.CurrentCamera:GetPropertyChangedSignal('ViewportSize'):Connect(update)
    Connections['field_of_view_update'] = workspace.CurrentCamera:GetPropertyChangedSignal('FieldOfView'):Connect(update)

    Connections['frame_absolute_position'] = self._frame:GetPropertyChangedSignal('AbsolutePosition'):Connect(on_change)
    Connections['frame_absolute_size'] = self._frame:GetPropertyChangedSignal('AbsoluteSize'):Connect(on_change)
    
    task.spawn(update)
end


function AcrylicBlur:check_quality_level()
    local game_settings = UserSettings().GameSettings
    local quality_level = game_settings.SavedQualityLevel.Value

    if quality_level < 8 then
        self:change_visiblity(false)
    end

    Connections['quality_level'] = game_settings:GetPropertyChangedSignal('SavedQualityLevel'):Connect(function()
        local game_settings = UserSettings().GameSettings
        local quality_level = game_settings.SavedQualityLevel.Value

        self:change_visiblity(quality_level >= 8)
    end)
end


function AcrylicBlur:change_visiblity(state: boolean)
    self._root.Transparency = state and 0.98 or 1
end


local Config = setmetatable({
    save = function(self: any, file_name: any, config: any)
        local success_save, result = pcall(function()
            local flags = HttpService:JSONEncode(config)
            writefile('Balls/'..file_name..'.json', flags)
        end)
    
        if not success_save then
            warn('failed to save config', result)
        end
    end,
    load = function(self: any, file_name: any, config: any)
        local success_load, result = pcall(function()
            if not isfile('Balls/'..file_name..'.json') then
                self:save(file_name, config)
        
                return
            end
        
            local flags = readfile('Balls/'..file_name..'.json')
        
            if not flags then
                self:save(file_name, config)
        
                return
            end

            return HttpService:JSONDecode(flags)
        end)
    
        if not success_load then
            warn('failed to load config', result)
        end
    
        if not result then
            result = {
                _flags = {},
                _keybinds = {},
                _library = {}
            }
        end
    
        return result
    end
}, Config)


local Library = {
    _config = Config:load(game.GameId),

    _choosing_keybind = false,
    _device = nil,

    _ui_open = true,
    _ui_scale = 1,
    _ui_loaded = false,
    _ui = nil,

    _dragging = false,
    _drag_start = nil,
    _container_position = nil
}
Library.__index = Library


function Library.new()
    local self = setmetatable({
        _loaded = false,
        _tab = 0,
    }, Library)
    
    self:create_ui()

    return self
end


local NotificationContainer = Instance.new("Frame")
NotificationContainer.Name = "RobloxCoreGuis"
NotificationContainer.Size = UDim2.new(0, 300, 0, 0)  
NotificationContainer.Position = UDim2.new(0.8, 0, 0, 10)  
NotificationContainer.BackgroundTransparency = 1
NotificationContainer.ClipsDescendants = false;
NotificationContainer.Parent = game:GetService("CoreGui").RobloxGui:FindFirstChild("RobloxCoreGuis") or Instance.new("ScreenGui", game:GetService("CoreGui").RobloxGui)
NotificationContainer.AutomaticSize = Enum.AutomaticSize.Y


local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = NotificationContainer


function Library.SendNotification(settings)
  
    local Notification = Instance.new("Frame")
    Notification.Size = UDim2.new(1, 0, 0, 60)  
    Notification.BackgroundTransparency = 1  
    Notification.BorderSizePixel = 0
    Notification.Name = "Notification"
    Notification.Parent = NotificationContainer  
    Notification.AutomaticSize = Enum.AutomaticSize.Y  

   
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Notification

   
    local InnerFrame = Instance.new("Frame")
    InnerFrame.Size = UDim2.new(1, 0, 0, 60)  
    InnerFrame.Position = UDim2.new(0, 0, 0, 0)  
    InnerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    InnerFrame.BackgroundTransparency = 0.3
    InnerFrame.BorderSizePixel = 0
    InnerFrame.Name = "InnerFrame"
    InnerFrame.Parent = Notification
    InnerFrame.AutomaticSize = Enum.AutomaticSize.Y  

    
    local InnerUICorner = Instance.new("UICorner")
    InnerUICorner.CornerRadius = UDim.new(0, 4)
    InnerUICorner.Parent = InnerFrame

   
    local Title = Instance.new("TextLabel")
    Title.Text = settings.title or "Notification Title"
    Title.TextColor3 = Color3.fromRGB(200, 200, 200)
    Title.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    Title.TextSize = 14
    Title.Size = UDim2.new(1, -10, 0, 20)  
    Title.Position = UDim2.new(0, 5, 0, 5)
    Title.BackgroundTransparency = 1
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextYAlignment = Enum.TextYAlignment.Center
    Title.TextWrapped = true
    Title.AutomaticSize = Enum.AutomaticSize.Y 
    Title.Parent = InnerFrame

    
    local Body = Instance.new("TextLabel")
    Body.Text = settings.text or "This is the body of the notification."
    Body.TextColor3 = Color3.fromRGB(150, 150, 150)
    Body.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    Body.TextSize = 12
    Body.Size = UDim2.new(1, -10, 0, 30) 
    Body.Position = UDim2.new(0, 5, 0, 25)
    Body.BackgroundTransparency = 1
    Body.TextXAlignment = Enum.TextXAlignment.Left
    Body.TextYAlignment = Enum.TextYAlignment.Top
    Body.TextWrapped = true  
    Body.AutomaticSize = Enum.AutomaticSize.Y  
    Body.Parent = InnerFrame

   
    task.spawn(function()
        wait(0.1) 
        
        local totalHeight = Title.TextBounds.Y + Body.TextBounds.Y + 10  
        InnerFrame.Size = UDim2.new(1, 0, 0, totalHeight)  
    end)

   
    task.spawn(function()
       
        local tweenIn = TweenService:Create(InnerFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 10 + NotificationContainer.Size.Y.Offset)
        })
        tweenIn:Play()

        
        local duration = settings.duration or 5  
        wait(duration)

        
        local tweenOut = TweenService:Create(InnerFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 310, 0, 10 + NotificationContainer.Size.Y.Offset) 
        })
        tweenOut:Play()

        
        tweenOut.Completed:Connect(function()
            Notification:Destroy()
        end)
    end)
end

function Library:get_screen_scale()
    local viewport_size_x = workspace.CurrentCamera.ViewportSize.X

    self._ui_scale = viewport_size_x / 1400
end


function Library:get_device()
    local device = 'Unknown'

    if not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
        device = 'PC'
    elseif UserInputService.TouchEnabled then
        device = 'Mobile'
    elseif UserInputService.GamepadEnabled then
        device = 'Console'
    end

    self._device = device
end


function Library:removed(action: any)
    self._ui.AncestryChanged:Once(action)
end


function Library:flag_type(flag: any, flag_type: any)
    if not Library._config._flags[flag] then
        return
    end

    return typeof(Library._config._flags[flag]) == flag_type
end


function Library:remove_table_value(__table: any, table_value: string)
    for index, value in __table do
        if value ~= table_value then
            continue
        end

        table.remove(__table, index)
    end
end


function Library:create_ui()
    local old_Balls = CoreGui:FindFirstChild('Balls')

    if old_Balls then
        Debris:AddItem(old_Balls, 0)
    end

    local Balls = Instance.new('ScreenGui')
    Balls.ResetOnSpawn = false
    Balls.Name = 'Balls'
    Balls.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Balls.Parent = CoreGui
    
    local Container = Instance.new('Frame')
    Container.ClipsDescendants = true
    Container.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Container.AnchorPoint = Vector2.new(0.5, 0.5)
    Container.Name = 'Container'
    Container.BackgroundTransparency = 0.4
    Container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Container.Position = UDim2.new(0.5, 0, 0.5, 0)
    Container.Size = UDim2.new(0, 0, 0, 0)
    Container.Active = true
    Container.BorderSizePixel = 0
    Container.Parent = Balls
    
    local UICorner = Instance.new('UICorner')
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Container
    
    local UIStroke = Instance.new('UIStroke')
    UIStroke.Color = Color3.fromRGB(30, 30, 30)
    UIStroke.Transparency = 0.5
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.Parent = Container
    
    local Handler = Instance.new('Frame')
    Handler.BackgroundTransparency = 1
    Handler.Name = 'Handler'
    Handler.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Handler.Size = UDim2.new(0, 698, 0, 479)
    Handler.BorderSizePixel = 0
    Handler.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Handler.Parent = Container
    
    local Tabs = Instance.new('ScrollingFrame')
    Tabs.ScrollBarImageTransparency = 1
    Tabs.ScrollBarThickness = 0
    Tabs.Name = 'Tabs'
    Tabs.Size = UDim2.new(0, 129, 0, 401)
    Tabs.Selectable = false
    Tabs.AutomaticCanvasSize = Enum.AutomaticSize.XY
    Tabs.BackgroundTransparency = 1
    Tabs.Position = UDim2.new(0.026097271591424942, 0, 0.1111111119389534, 0)
    Tabs.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Tabs.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Tabs.BorderSizePixel = 0
    Tabs.CanvasSize = UDim2.new(0, 0, 0.5, 0)
    Tabs.Parent = Handler
    
    local UIListLayout = Instance.new('UIListLayout')
    UIListLayout.Padding = UDim.new(0, 4)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = Tabs
    
    local ClientName = Instance.new('TextLabel')
    ClientName.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    ClientName.TextColor3 = Color3.fromRGB(150, 150, 150)
    ClientName.TextTransparency = 0.20000000298023224
    ClientName.Text = 'Balls.lol'
    ClientName.Name = 'ClientName'
    ClientName.Size = UDim2.new(0, 31, 0, 13)
    ClientName.AnchorPoint = Vector2.new(0, 0.5)
    ClientName.Position = UDim2.new(0.0560000017285347, 0, 0.054999999701976776, 0)
    ClientName.BackgroundTransparency = 1
    ClientName.TextXAlignment = Enum.TextXAlignment.Left
    ClientName.BorderSizePixel = 0
    ClientName.BorderColor3 = Color3.fromRGB(30, 30, 30)
    ClientName.TextSize = 13
    ClientName.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    ClientName.Parent = Handler
    
    local UIGradient = Instance.new('UIGradient')
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))
    }
    UIGradient.Parent = ClientName
    
    local Pin = Instance.new('Frame')
    Pin.Name = 'Pin'
    Pin.Position = UDim2.new(0.026000000536441803, 0, 0.13600000739097595, 0)
    Pin.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Pin.Size = UDim2.new(0, 2, 0, 16)
    Pin.BorderSizePixel = 0
    Pin.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    Pin.Parent = Handler
    
    local UICorner = Instance.new('UICorner')
    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = Pin
    
    local Icon = Instance.new('ImageLabel')
    Icon.ImageColor3 = Color3.fromRGB(150, 150, 150)
    Icon.ScaleType = Enum.ScaleType.Fit
    Icon.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Icon.AnchorPoint = Vector2.new(0, 0.5)
    Icon.Image = 'rbxassetid://97405229498191'
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0.021, 0,0.053, 0)
    Icon.Name = 'Icon'
    Icon.Size = UDim2.new(0, 27,0, 26)
    Icon.BorderSizePixel = 0
    Icon.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Icon.Parent = Handler
    
    local Divider = Instance.new('Frame')
    Divider.Name = 'Divider'
    Divider.BackgroundTransparency = 0.5
    Divider.Position = UDim2.new(0.23499999940395355, 0, 0, 0)
    Divider.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Divider.Size = UDim2.new(0, 1, 0, 479)
    Divider.BorderSizePixel = 0
    Divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Divider.Parent = Handler
    
    local Sections = Instance.new('Folder')
    Sections.Name = 'Sections'
    Sections.Parent = Handler
    
    local Minimize = Instance.new('TextButton')
    Minimize.FontFace = Font.new('rbxasset://fonts/families/SourceSansPro.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    Minimize.TextColor3 = Color3.fromRGB(30, 30, 30)
    Minimize.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Minimize.Text = ''
    Minimize.AutoButtonColor = false
    Minimize.Name = 'Minimize'
    Minimize.BackgroundTransparency = 1
    Minimize.Position = UDim2.new(0.020057305693626404, 0, 0.02922755666077137, 0)
    Minimize.Size = UDim2.new(0, 24, 0, 24)
    Minimize.BorderSizePixel = 0
    Minimize.TextSize = 14
    Minimize.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Minimize.Parent = Handler
    
    local UIScale = Instance.new('UIScale')
    UIScale.Parent = Container    
    
    self._ui = Balls

    local function on_drag(input: InputObject, process: boolean)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
            self._dragging = true
            self._drag_start = input.Position
            self._container_position = Container.Position

            Connections['container_input_ended'] = input.Changed:Connect(function()
                if input.UserInputState ~= Enum.UserInputState.End then
                    return
                end

                Connections:disconnect('container_input_ended')
                self._dragging = false
            end)
        end
    end

    local function update_drag(input: any)
        local delta = input.Position - self._drag_start
        local position = UDim2.new(self._container_position.X.Scale, self._container_position.X.Offset + delta.X, self._container_position.Y.Scale, self._container_position.Y.Offset + delta.Y)

        TweenService:Create(Container, TweenInfo.new(0.2), {
            Position = position
        }):Play()
    end

    local function drag(input: InputObject, process: boolean)
        if not self._dragging then
            return
        end

        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            update_drag(input)
        end
    end

    Connections['container_input_began'] = Container.InputBegan:Connect(on_drag)
    Connections['input_changed'] = UserInputService.InputChanged:Connect(drag)

    self:removed(function()
        self._ui = nil
        Connections:disconnect_all()
    end)

    function self:Update1Run(a)
        if a == "nil" then
            Container.BackgroundTransparency = 0.4;
        else
            pcall(function()
                Container.BackgroundTransparency = tonumber(a);
            end);
        end;
    end;

    function self:UIVisiblity()
        Balls.Enabled = not Balls.Enabled;
    end;

    function self:change_visiblity(state: boolean)
        if state then
            TweenService:Create(Container, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = UDim2.fromOffset(698, 479)
            }):Play()
        else
            TweenService:Create(Container, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = UDim2.fromOffset(104.5, 52)
            }):Play()
        end
    end
    

    function self:load()
        local content = {}
    
        for _, object in Balls:GetDescendants() do
            if not object:IsA('ImageLabel') then
                continue
            end
    
            table.insert(content, object)
        end
    
        ContentProvider:PreloadAsync(content)
        self:get_device()

        if self._device == 'Mobile' or self._device == 'Unknown' then
            self:get_screen_scale()
            UIScale.Scale = self._ui_scale
    
            Connections['ui_scale'] = workspace.CurrentCamera:GetPropertyChangedSignal('ViewportSize'):Connect(function()
                self:get_screen_scale()
                UIScale.Scale = self._ui_scale
            end)
        end
    
        TweenService:Create(Container, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = UDim2.fromOffset(698, 479)
        }):Play()

        AcrylicBlur.new(Container)
        self._ui_loaded = true
    end

    function self:update_tabs(tab: TextButton)
        for index, object in Tabs:GetChildren() do
            if object.Name ~= 'Tab' then
                continue
            end

            if object == tab then
                if object.BackgroundTransparency ~= 0.5 then
                    local offset = object.LayoutOrder * (0.113 / 1.3)

                    TweenService:Create(Pin, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Position = UDim2.fromScale(0.026, 0.135 + offset)
                    }):Play()    

                    TweenService:Create(object, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 0.5
                    }):Play()

                    TweenService:Create(object.TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        TextTransparency = 0.2,
                        TextColor3 = Color3.fromRGB(150, 150, 150)
                    }):Play()

                    TweenService:Create(object.TextLabel.UIGradient, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Offset = Vector2.new(1, 0)
                    }):Play()

                    TweenService:Create(object.Icon, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        ImageTransparency = 0.2,
                        ImageColor3 = Color3.fromRGB(150, 150, 150)
                    }):Play()
                end

                continue
            end

            if object.BackgroundTransparency ~= 1 then
                TweenService:Create(object, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1
                }):Play()
                
                TweenService:Create(object.TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    TextTransparency = 0.7,
                    TextColor3 = Color3.fromRGB(200, 200, 200)
                }):Play()

                TweenService:Create(object.TextLabel.UIGradient, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Offset = Vector2.new(0, 0)
                }):Play()

                TweenService:Create(object.Icon, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    ImageTransparency = 0.8,
                    ImageColor3 = Color3.fromRGB(200, 200, 200)
                }):Play()
            end
        end
    end

    function self:update_sections(left_section: ScrollingFrame, right_section: ScrollingFrame)
        for _, object in Sections:GetChildren() do
            if object == left_section or object == right_section then
                object.Visible = true

                continue
            end

            object.Visible = false
        end
    end

    function self:create_tab(title: string, icon: string)
        local TabManager = {}

        local LayoutOrder = 0;

        local font_params = Instance.new('GetTextBoundsParams')
        font_params.Text = title
        font_params.Font = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
        font_params.Size = 13
        font_params.Width = 10000

        local font_size = TextService:GetTextBoundsAsync(font_params)
        local first_tab = not Tabs:FindFirstChild('Tab')

        local Tab = Instance.new('TextButton')
        Tab.FontFace = Font.new('rbxasset://fonts/families/SourceSansPro.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        Tab.TextColor3 = Color3.fromRGB(30, 30, 30)
        Tab.BorderColor3 = Color3.fromRGB(30, 30, 30)
        Tab.Text = ''
        Tab.AutoButtonColor = false
        Tab.BackgroundTransparency = 1
        Tab.Name = 'Tab'
        Tab.Size = UDim2.new(0, 129, 0, 38)
        Tab.BorderSizePixel = 0
        Tab.TextSize = 14
        Tab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Tab.Parent = Tabs
        Tab.LayoutOrder = self._tab
        
        local UICorner = Instance.new('UICorner')
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Tab
        
        local TextLabel = Instance.new('TextLabel')
        TextLabel.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
        TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        TextLabel.TextTransparency = 0.7 
        TextLabel.Text = title
        TextLabel.Size = UDim2.new(0, font_size.X, 0, 16)
        TextLabel.AnchorPoint = Vector2.new(0, 0.5)
        TextLabel.Position = UDim2.new(0.2400001734495163, 0, 0.5, 0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.BorderSizePixel = 0
        TextLabel.BorderColor3 = Color3.fromRGB(30, 30, 30)
        TextLabel.TextSize = 13
        TextLabel.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        TextLabel.Parent = Tab
        
        local UIGradient = Instance.new('UIGradient')
        UIGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)),
            ColorSequenceKeypoint.new(0.7, Color3.fromRGB(150, 150, 150)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
        }
        UIGradient.Parent = TextLabel
        
        local Icon = Instance.new('ImageLabel')
        Icon.ScaleType = Enum.ScaleType.Fit
        Icon.ImageTransparency = 0.800000011920929
        Icon.BorderColor3 = Color3.fromRGB(30, 30, 30)
        Icon.AnchorPoint = Vector2.new(0, 0.5)
        Icon.BackgroundTransparency = 1
        Icon.Position = UDim2.new(0.10000000149011612, 0, 0.5, 0)
        Icon.Name = 'Icon'
        Icon.Image = icon
        Icon.Size = UDim2.new(0, 12, 0, 12)
        Icon.BorderSizePixel = 0
        Icon.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        Icon.Parent = Tab

        local LeftSection = Instance.new('ScrollingFrame')
        LeftSection.Name = 'LeftSection'
        LeftSection.AutomaticCanvasSize = Enum.AutomaticSize.XY
        LeftSection.ScrollBarThickness = 0
        LeftSection.Size = UDim2.new(0, 243, 0, 445)
        LeftSection.Selectable = false
        LeftSection.AnchorPoint = Vector2.new(0, 0.5)
        LeftSection.ScrollBarImageTransparency = 1
        LeftSection.BackgroundTransparency = 1
        LeftSection.Position = UDim2.new(0.2594326436519623, 0, 0.5, 0)
        LeftSection.BorderColor3 = Color3.fromRGB(30, 30, 30)
        LeftSection.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        LeftSection.BorderSizePixel = 0
        LeftSection.CanvasSize = UDim2.new(0, 0, 0.5, 0)
        LeftSection.Visible = false
        LeftSection.Parent = Sections
        
        local UIListLayout = Instance.new('UIListLayout')
        UIListLayout.Padding = UDim.new(0, 11)
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Parent = LeftSection
        
        local UIPadding = Instance.new('UIPadding')
        UIPadding.PaddingTop = UDim.new(0, 1)
        UIPadding.Parent = LeftSection

        local RightSection = Instance.new('ScrollingFrame')
        RightSection.Name = 'RightSection'
        RightSection.AutomaticCanvasSize = Enum.AutomaticSize.XY
        RightSection.ScrollBarThickness = 0
        RightSection.Size = UDim2.new(0, 243, 0, 445)
        RightSection.Selectable = false
        RightSection.AnchorPoint = Vector2.new(0, 0.5)
        RightSection.ScrollBarImageTransparency = 1
        RightSection.BackgroundTransparency = 1
        RightSection.Position = UDim2.new(0.6290000081062317, 0, 0.5, 0)
        RightSection.BorderColor3 = Color3.fromRGB(30, 30, 30)
        RightSection.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        RightSection.BorderSizePixel = 0
        RightSection.CanvasSize = UDim2.new(0, 0, 0.5, 0)
        RightSection.Visible = false
        RightSection.Parent = Sections
        
        local UIListLayout = Instance.new('UIListLayout')
        UIListLayout.Padding = UDim.new(0, 11)
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Parent = RightSection
        
        local UIPadding = Instance.new('UIPadding')
        UIPadding.PaddingTop = UDim.new(0, 1)
        UIPadding.Parent = RightSection

        self._tab += 1

        if first_tab then
            self:update_tabs(Tab, LeftSection, RightSection)
            self:update_sections(LeftSection, RightSection)
        end

        Tab.MouseButton1Click:Connect(function()
            self:update_tabs(Tab, LeftSection, RightSection)
            self:update_sections(LeftSection, RightSection)
        end)

        function TabManager:create_module(settings: any)

            local LayoutOrderModule = 0;

            local ModuleManager = {
                _state = false,
                _size = 0,
                _multiplier = 0
            }

            if settings.section == 'right' then
                settings.section = RightSection
            else
                settings.section = LeftSection
            end

            local Module = Instance.new('Frame')
            Module.ClipsDescendants = true
            Module.BorderColor3 = Color3.fromRGB(30, 30, 30)
            Module.BackgroundTransparency = 0.5
            Module.Position = UDim2.new(0.004115226212888956, 0, 0, 0)
            Module.Name = 'Module'
            Module.Size = UDim2.new(0, 241, 0, 93)
            Module.BorderSizePixel = 0
            Module.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Module.Parent = settings.section

            local UIListLayout = Instance.new('UIListLayout')
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Parent = Module
            
            local UICorner = Instance.new('UICorner')
            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Module
            
            local UIStroke = Instance.new('UIStroke')
            UIStroke.Color = Color3.fromRGB(30, 30, 30)
            UIStroke.Transparency = 0.5
            UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            UIStroke.Parent = Module
            
            local Header = Instance.new('TextButton')
            Header.FontFace = Font.new('rbxasset://fonts/families/SourceSansPro.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Header.TextColor3 = Color3.fromRGB(30, 30, 30)
            Header.BorderColor3 = Color3.fromRGB(30, 30, 30)
            Header.Text = ''
            Header.AutoButtonColor = false
            Header.BackgroundTransparency = 1
            Header.Name = 'Header'
            Header.Size = UDim2.new(0, 241, 0, 93)
            Header.BorderSizePixel = 0
            Header.TextSize = 14
            Header.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            Header.Parent = Module
            
            local Icon = Instance.new('ImageLabel')
            Icon.ImageColor3 = Color3.fromRGB(150, 150, 150)
            Icon.ScaleType = Enum.ScaleType.Fit
            Icon.ImageTransparency = 0.699999988079071
            Icon.BorderColor3 = Color3.fromRGB(30, 30, 30)
            Icon.AnchorPoint = Vector2.new(0, 0.5)
            Icon.Image = 'rbxassetid://79095934438045'
            Icon.BackgroundTransparency = 1
            Icon.Position = UDim2.new(0.07100000232458115, 0, 0.8199999928474426, 0)
            Icon.Name = 'Icon'
            Icon.Size = UDim2.new(0, 15, 0, 15)
            Icon.BorderSizePixel = 0
            Icon.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            Icon.Parent = Header
            
            local ModuleName = Instance.new('TextLabel')
            ModuleName.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
            ModuleName.TextColor3 = Color3.fromRGB(150, 150, 150)
            ModuleName.TextTransparency = 0.20000000298023224
            if not settings.rich then
                ModuleName.Text = settings.title or "Skibidi"
            else
                ModuleName.RichText = true
                ModuleName.Text = settings.richtext or "<font color='rgb(255,0,0)'>Balls</font> user"
            end;
            ModuleName.Name = 'ModuleName'
            ModuleName.Size = UDim2.new(0, 205, 0, 13)
            ModuleName.AnchorPoint = Vector2.new(0, 0.5)
            ModuleName.Position = UDim2.new(0.0729999989271164, 0, 0.23999999463558197, 0)
            ModuleName.BackgroundTransparency = 1
            ModuleName.TextXAlignment = Enum.TextXAlignment.Left
            ModuleName.BorderSizePixel = 0
            ModuleName.BorderColor3 = Color3.fromRGB(30, 30, 30)
            ModuleName.TextSize = 13
            ModuleName.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            ModuleName.Parent = Header
            
            local Description = Instance.new('TextLabel')
            Description.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
            Description.TextColor3 = Color3.fromRGB(150, 150, 150)
            Description.TextTransparency = 0.699999988079071
            Description.Text = settings.description
            Description.Name = 'Description'
            Description.Size = UDim2.new(0, 205, 0, 13)
            Description.AnchorPoint = Vector2.new(0, 0.5)
            Description.Position = UDim2.new(0.0729999989271164, 0, 0.41999998688697815, 0)
            Description.BackgroundTransparency = 1
            Description.TextXAlignment = Enum.TextXAlignment.Left
            Description.BorderSizePixel = 0
            Description.BorderColor3 = Color3.fromRGB(30, 30, 30)
            Description.TextSize = 10
            Description.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            Description.Parent = Header
            
            local Toggle = Instance.new('Frame')
            Toggle.Name = 'Toggle'
            Toggle.BackgroundTransparency = 0.699999988079071
            Toggle.Position = UDim2.new(0.8199999928474426, 0, 0.7570000290870667, 0)
            Toggle.BorderColor3 = Color3.fromRGB(30, 30, 30)
            Toggle.Size = UDim2.new(0, 25, 0, 12)
            Toggle.BorderSizePixel = 0
            Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Toggle.Parent = Header
            
            local UICorner = Instance.new('UICorner')
            UICorner.CornerRadius = UDim.new(1, 0)
            UICorner.Parent = Toggle
            
            local Circle = Instance.new('Frame')
            Circle.BorderColor3 = Color3.fromRGB(30, 30, 30)
            Circle.AnchorPoint = Vector2.new(0, 0.5)
            Circle.BackgroundTransparency = 0.40000000298023224
            Circle.Position = UDim2.new(0, 0, 0.5, 0)
            Circle.Name = 'Circle'
            Circle.Size = UDim2.new(0, 12, 0, 12)
            Circle.BorderSizePixel = 0
            Circle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Circle.Parent = Toggle
            
            local UICorner = Instance.new('UICorner')
            UICorner.CornerRadius = UDim.new(1, 0)
            UICorner.Parent = Circle
            
            local Keybind = Instance.new('Frame')
            Keybind.Name = 'Keybind'
            Keybind.BackgroundTransparency = 0.699999988079071
            Keybind.Position = UDim2.new(0.15000000596046448, 0, 0.7350000143051147, 0)
            Keybind.BorderColor3 = Color3.fromRGB(30, 30, 30)
            Keybind.Size = UDim2.new(0, 33, 0, 15)
            Keybind.BorderSizePixel = 0
            Keybind.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
            Keybind.Parent = Header
            
            local UICorner = Instance.new('UICorner')
            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Keybind
            
            local TextLabel = Instance.new('TextLabel')
            TextLabel.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
            TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            TextLabel.BorderColor3 = Color3.fromRGB(30, 30, 30)
            TextLabel.Text = 'None'
            TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel.Size = UDim2.new(0, 25, 0, 13)
            TextLabel.BackgroundTransparency = 1
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextLabel.BorderSizePixel = 0
            TextLabel.TextSize = 10
            TextLabel.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            TextLabel.Parent = Keybind
            
            local Divider = Instance.new('Frame')
            Divider.BorderColor3 = Color3.fromRGB(30, 30, 30)
            Divider.AnchorPoint = Vector2.new(0.5, 0)
            Divider.BackgroundTransparency = 0.5
            Divider.Position = UDim2.new(0.5, 0, 0.6200000047683716, 0)
            Divider.Name = 'Divider'
            Divider.Size = UDim2.new(0, 241, 0, 1)
            Divider.BorderSizePixel = 0
            Divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Divider.Parent = Header
            
            local Divider = Instance.new('Frame')
            Divider.BorderColor3 = Color3.fromRGB(30, 30, 30)
            Divider.AnchorPoint = Vector2.new(0.5, 0)
            Divider.BackgroundTransparency = 0.5
            Divider.Position = UDim2.new(0.5, 0, 1, 0)
            Divider.Name = 'Divider'
            Divider.Size = UDim2.new(0, 241, 0, 1)
            Divider.BorderSizePixel = 0
            Divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Divider.Parent = Header
            
            local Options = Instance.new('Frame')
            Options.Name = 'Options'
            Options.BackgroundTransparency = 1
            Options.Position = UDim2.new(0, 0, 1, 0)
            Options.BorderColor3 = Color3.fromRGB(30, 30, 30)
            Options.Size = UDim2.new(0, 241, 0, 8)
            Options.BorderSizePixel = 0
            Options.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            Options.Parent = Module

            local UIPadding = Instance.new('UIPadding')
            UIPadding.PaddingTop = UDim.new(0, 8)
            UIPadding.Parent = Options

            local UIListLayout = Instance.new('UIListLayout')
            UIListLayout.Padding = UDim.new(0, 5)
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Parent = Options

            function ModuleManager:change_state(state: boolean)
                self._state = state

                if self._state then
                    TweenService:Create(Module, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Size = UDim2.fromOffset(241, 93 + self._size + self._multiplier)
                    }):Play()

                    TweenService:Create(Toggle, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                    }):Play()

                    TweenService:Create(Circle, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(150, 150, 150),
                        Position = UDim2.fromScale(0.53, 0.5)
                    }):Play()
                else
                    TweenService:Create(Module, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Size = UDim2.fromOffset(241, 93)
                    }):Play()

                    TweenService:Create(Toggle, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    }):Play()

                    TweenService:Create(Circle, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                        Position = UDim2.fromScale(0, 0.5)
                    }):Play()
                end

                Library._config._flags[settings.flag] = self._state
                Config:save(game.GameId, Library._config)

                settings.callback(self._state)
            end
            
            function ModuleManager:connect_keybind()
                if not Library._config._keybinds[settings.flag] then
                    return
                end

                Connections[settings.flag..'_keybind'] = UserInputService.InputBegan:Connect(function(input: InputObject, process: boolean)
                    if process then
                        return
                    end
                    
                    if tostring(input.KeyCode) ~= Library._config._keybinds[settings.flag] then
                        return
                    end
                    
                    self:change_state(not self._state)
                end)
            end

            function ModuleManager:scale_keybind(empty: boolean)
                if Library._config._keybinds[settings.flag] and not empty then
                    local keybind_string = string.gsub(tostring(Library._config._keybinds[settings.flag]), 'Enum.KeyCode.', '')

                    local font_params = Instance.new('GetTextBoundsParams')
                    font_params.Text = keybind_string
                    font_params.Font = Font.new('rbxasset://fonts/families/Montserrat.json', Enum.FontWeight.Bold)
                    font_params.Size = 10
                    font_params.Width = 10000
            
                    local font_size = TextService:GetTextBoundsAsync(font_params)
                    
                    Keybind.Size = UDim2.fromOffset(font_size.X + 6, 15)
                    TextLabel.Size = UDim2.fromOffset(font_size.X, 13)
                else
                    Keybind.Size = UDim2.fromOffset(31, 15)
                    TextLabel.Size = UDim2.fromOffset(25, 13)
                end
            end

            if Library:flag_type(settings.flag, 'boolean') then
                ModuleManager._state = true
                settings.callback(ModuleManager._state)

                Toggle.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                Circle.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                Circle.Position = UDim2.fromScale(0.53, 0.5)
            end

            if Library._config._keybinds[settings.flag] then
                local keybind_string = string.gsub(tostring(Library._config._keybinds[settings.flag]), 'Enum.KeyCode.', '')
                TextLabel.Text = keybind_string

                ModuleManager:connect_keybind()
                ModuleManager:scale_keybind()
            end

            Connections[settings.flag..'_input_began'] = Header.InputBegan:Connect(function(input: InputObject)
                if Library._choosing_keybind then
                    return
                end

                if input.UserInputType ~= Enum.UserInputType.MouseButton3 then
                    return
                end
                
                Library._choosing_keybind = true
                
                Connections['keybind_choose_start'] = UserInputService.InputBegan:Connect(function(input: InputObject, process: boolean)
                    if process then
                        return
                    end
                    
                    if input == Enum.UserInputState or input == Enum.UserInputType then
                        return
                    end

                    if input.KeyCode == Enum.KeyCode.Unknown then
                        return
                    end

                    if input.KeyCode == Enum.KeyCode.Backspace then
                        ModuleManager:scale_keybind(true)

                        Library._config._keybinds[settings.flag] = nil
                        Config:save(game.GameId, Library._config)

                        TextLabel.Text = 'None'
                        
                        if Connections[settings.flag..'_keybind'] then
                            Connections[settings.flag..'_keybind']:Disconnect()
                            Connections[settings.flag..'_keybind'] = nil
                        end

                        Connections['keybind_choose_start']:Disconnect()
                        Connections['keybind_choose_start'] = nil

                        Library._choosing_keybind = false

                        return
                    end
                    
                    Connections['keybind_choose_start']:Disconnect()
                    Connections['keybind_choose_start'] = nil
                    
                    Library._config._keybinds[settings.flag] = tostring(input.KeyCode)
                    Config:save(game.GameId, Library._config)

                    if Connections[settings.flag..'_keybind'] then
                        Connections[settings.flag..'_keybind']:Disconnect()
                        Connections[settings.flag..'_keybind'] = nil
                    end

                    ModuleManager:connect_keybind()
                    ModuleManager:scale_keybind()
                    
                    Library._choosing_keybind = false

                    local keybind_string = string.gsub(tostring(Library._config._keybinds[settings.flag]), 'Enum.KeyCode.', '')
                    TextLabel.Text = keybind_string
                end)
            end)

            Header.MouseButton1Click:Connect(function()
                ModuleManager:change_state(not ModuleManager._state)
            end)

            function ModuleManager:create_paragraph(settings: any)
                LayoutOrderModule = LayoutOrderModule + 1;

                local ParagraphManager = {}
                
                if self._size == 0 then
                    self._size = 11
                end
            
                self._size += settings.customScale or 70
            
                if ModuleManager._state then
                    Module.Size = UDim2.fromOffset(241, 93 + self._size)
                end
            
                Options.Size = UDim2.fromOffset(241, self._size)
            
                
                local Paragraph = Instance.new('Frame')
                Paragraph.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Paragraph.BackgroundTransparency = 0.3
                Paragraph.Size = UDim2.new(0, 207, 0, 30) 
                Paragraph.BorderSizePixel = 0
                Paragraph.Name = "Paragraph"
                Paragraph.AutomaticSize = Enum.AutomaticSize.Y 
                Paragraph.Parent = Options
                Paragraph.LayoutOrder = LayoutOrderModule;
            
                local UICorner = Instance.new('UICorner')
                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Paragraph
            
                
                local Title = Instance.new('TextLabel')
                Title.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                Title.TextColor3 = Color3.fromRGB(200, 200, 200)
                Title.Text = settings.title or "Title"
                Title.Size = UDim2.new(1, -10, 0, 20)
                Title.Position = UDim2.new(0, 5, 0, 5)
                Title.BackgroundTransparency = 1
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.TextYAlignment = Enum.TextYAlignment.Center
                Title.TextSize = 12
                Title.AutomaticSize = Enum.AutomaticSize.XY
                Title.Parent = Paragraph
            
               
                local Body = Instance.new('TextLabel')
                Body.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                Body.TextColor3 = Color3.fromRGB(150, 150, 150)
                
                if not settings.rich then
                    Body.Text = settings.text or "Skibidi"
                else
                    Body.RichText = true
                    Body.Text = settings.richtext or "<font color='rgb(255,0,0)'>Balls</font> user"
                end
                
                Body.Size = UDim2.new(1, -10, 0, 20)
                Body.Position = UDim2.new(0, 5, 0, 30)
                Body.BackgroundTransparency = 1
                Body.TextXAlignment = Enum.TextXAlignment.Left
                Body.TextYAlignment = Enum.TextYAlignment.Top
                Body.TextSize = 11
                Body.TextWrapped = true
                Body.AutomaticSize = Enum.AutomaticSize.XY
                Body.Parent = Paragraph
            
                
                Paragraph.MouseEnter:Connect(function()
                    TweenService:Create(Paragraph, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    }):Play()
                end)
            
                Paragraph.MouseLeave:Connect(function()
                    TweenService:Create(Paragraph, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    }):Play()
                end)

                return ParagraphManager
            end

            function ModuleManager:create_text(settings: any)
                LayoutOrderModule = LayoutOrderModule + 1
            
                local TextManager = {}
            
                if self._size == 0 then
                    self._size = 11
                end
            
                self._size += settings.customScale or 50 
            
                if ModuleManager._state then
                    Module.Size = UDim2.fromOffset(241, 93 + self._size)
                end
            
                Options.Size = UDim2.fromOffset(241, self._size)
            
              
                local TextFrame = Instance.new('Frame')
                TextFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                TextFrame.BackgroundTransparency = 0.3
                TextFrame.Size = UDim2.new(0, 207, 0, settings.CustomYSize)
                TextFrame.BorderSizePixel = 0
                TextFrame.Name = "Text"
                TextFrame.AutomaticSize = Enum.AutomaticSize.Y 
                TextFrame.Parent = Options
                TextFrame.LayoutOrder = LayoutOrderModule
            
                local UICorner = Instance.new('UICorner')
                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = TextFrame
            
                
                local Body = Instance.new('TextLabel')
                Body.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                Body.TextColor3 = Color3.fromRGB(150, 150, 150)
            
                if not settings.rich then
                    Body.Text = settings.text or "Skibidi" 
                else
                    Body.RichText = true
                    Body.Text = settings.richtext or "<font color='rgb(255,0,0)'>Balls</font> user" 
                end
            
                Body.Size = UDim2.new(1, -10, 1, 0)
                Body.Position = UDim2.new(0, 5, 0, 5)
                Body.BackgroundTransparency = 1
                Body.TextXAlignment = Enum.TextXAlignment.Left
                Body.TextYAlignment = Enum.TextYAlignment.Top
                Body.TextSize = 10
                Body.TextWrapped = true
                Body.AutomaticSize = Enum.AutomaticSize.XY
                Body.Parent = TextFrame
            
               
                TextFrame.MouseEnter:Connect(function()
                    TweenService:Create(TextFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    }):Play()
                end)
            
                TextFrame.MouseLeave:Connect(function()
                    TweenService:Create(TextFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    }):Play()
                end)

                function TextManager:Set(new_settings)
                    if not new_settings.rich then
                        Body.Text = new_settings.text or "Skibidi"
                    else
                        Body.RichText = true
                        Body.Text = new_settings.richtext or "<font color='rgb(255,0,0)'>Balls</font> user"
                    end
                end;
            
                return TextManager
            end
            function ModuleManager:create_textbox(settings: any)
                LayoutOrderModule = LayoutOrderModule + 1
            
                local TextboxManager = {
                    _text = ""
                }
            
                if self._size == 0 then
                    self._size = 11
                end
            
                self._size += 32
            
                if ModuleManager._state then
                    Module.Size = UDim2.fromOffset(241, 93 + self._size)
                end
            
                Options.Size = UDim2.fromOffset(241, self._size)
            
                local Label = Instance.new('TextLabel')
                Label.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                Label.TextColor3 = Color3.fromRGB(200, 200, 200)
                Label.TextTransparency = 0.2
                Label.Text = settings.title or "Enter text"
                Label.Size = UDim2.new(0, 207, 0, 13)
                Label.AnchorPoint = Vector2.new(0, 0)
                Label.Position = UDim2.new(0, 0, 0, 0)
                Label.BackgroundTransparency = 1
                Label.TextXAlignment = Enum.TextXAlignment.Left
                Label.BorderSizePixel = 0
                Label.Parent = Options
                Label.TextSize = 10;
                Label.LayoutOrder = LayoutOrderModule
            
                local Textbox = Instance.new('TextBox')
                Textbox.FontFace = Font.new('rbxasset://fonts/families/SourceSansPro.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                Textbox.TextColor3 = Color3.fromRGB(200, 200, 200)
                Textbox.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Textbox.PlaceholderText = settings.placeholder or "Enter text..."
                Textbox.Text = Library._config._flags[settings.flag] or ""
                Textbox.Name = 'Textbox'
                Textbox.Size = UDim2.new(0, 207, 0, 15)
                Textbox.BorderSizePixel = 0
                Textbox.TextSize = 10
                Textbox.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                Textbox.BackgroundTransparency = 0.9
                Textbox.ClearTextOnFocus = false
                Textbox.Parent = Options
                Textbox.LayoutOrder = LayoutOrderModule
            
                local UICorner = Instance.new('UICorner')
                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Textbox
            
                function TextboxManager:update_text(text: string)
                    self._text = text
                    Library._config._flags[settings.flag] = self._text
                    Config:save(game.GameId, Library._config)
                    settings.callback(self._text)
                end
            
                if Library:flag_type(settings.flag, 'string') then
                    TextboxManager:update_text(Library._config._flags[settings.flag])
                end
            
                Textbox.FocusLost:Connect(function()
                    TextboxManager:update_text(Textbox.Text)
                end)
            
                return TextboxManager
            end   

            function ModuleManager:create_checkbox(settings: any)
                LayoutOrderModule = LayoutOrderModule + 1
                local CheckboxManager = { _state = false }
            
                if self._size == 0 then
                    self._size = 11
                end
                self._size += 20
            
                if ModuleManager._state then
                    Module.Size = UDim2.fromOffset(241, 93 + self._size)
                end
                Options.Size = UDim2.fromOffset(241, self._size)
            
                local Checkbox = Instance.new("TextButton")
                Checkbox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                Checkbox.TextColor3 = Color3.fromRGB(30, 30, 30)
                Checkbox.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Checkbox.Text = ""
                Checkbox.AutoButtonColor = false
                Checkbox.BackgroundTransparency = 1
                Checkbox.Name = "Checkbox"
                Checkbox.Size = UDim2.new(0, 207, 0, 15)
                Checkbox.BorderSizePixel = 0
                Checkbox.TextSize = 14
                Checkbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Checkbox.Parent = Options
                Checkbox.LayoutOrder = LayoutOrderModule
            
                local TitleLabel = Instance.new("TextLabel")
                TitleLabel.Name = "TitleLabel"
                if SelectedLanguage == "th" then
                    TitleLabel.FontFace = Font.new("rbxasset://fonts/families/NotoSansThai.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    TitleLabel.TextSize = 13
                else
                    TitleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    TitleLabel.TextSize = 11
                end
                TitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                TitleLabel.TextTransparency = 0.2
                TitleLabel.Text = settings.title or "Skibidi"
                TitleLabel.Size = UDim2.new(0, 142, 0, 13)
                TitleLabel.AnchorPoint = Vector2.new(0, 0.5)
                TitleLabel.Position = UDim2.new(0, 0, 0.5, 0)
                TitleLabel.BackgroundTransparency = 1
                TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
                TitleLabel.Parent = Checkbox

                local KeybindBox = Instance.new("Frame")
                KeybindBox.Name = "KeybindBox"
                KeybindBox.Size = UDim2.fromOffset(14, 14)
                KeybindBox.Position = UDim2.new(1, -35, 0.5, 0)
                KeybindBox.AnchorPoint = Vector2.new(0, 0.5)
                KeybindBox.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                KeybindBox.BorderSizePixel = 0
                KeybindBox.Parent = Checkbox
            
                local KeybindCorner = Instance.new("UICorner")
                KeybindCorner.CornerRadius = UDim.new(0, 4)
                KeybindCorner.Parent = KeybindBox
            
                local KeybindLabel = Instance.new("TextLabel")
                KeybindLabel.Name = "KeybindLabel"
                KeybindLabel.Size = UDim2.new(1, 0, 1, 0)
                KeybindLabel.BackgroundTransparency = 1
                KeybindLabel.TextColor3 = Color3.fromRGB(30, 30, 30)
                KeybindLabel.TextScaled = false
                KeybindLabel.TextSize = 10
                KeybindLabel.Font = Enum.Font.SourceSans
                KeybindLabel.Text = Library._config._keybinds[settings.flag] 
                    and string.gsub(tostring(Library._config._keybinds[settings.flag]), "Enum.KeyCode.", "") 
                    or "..."
                KeybindLabel.Parent = KeybindBox
            
                local Box = Instance.new("Frame")
                Box.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Box.AnchorPoint = Vector2.new(1, 0.5)
                Box.BackgroundTransparency = 0.9
                Box.Position = UDim2.new(1, 0, 0.5, 0)
                Box.Name = "Box"
                Box.Size = UDim2.new(0, 15, 0, 15)
                Box.BorderSizePixel = 0
                Box.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                Box.Parent = Checkbox
            
                local BoxCorner = Instance.new("UICorner")
                BoxCorner.CornerRadius = UDim.new(0, 4)
                BoxCorner.Parent = Box
            
                local Fill = Instance.new("Frame")
                Fill.AnchorPoint = Vector2.new(0.5, 0.5)
                Fill.BackgroundTransparency = 0.4
                Fill.Position = UDim2.new(0.5, 0, 0.5, 0)
                Fill.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Fill.Name = "Fill"
                Fill.BorderSizePixel = 0
                Fill.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                Fill.Parent = Box
            
                local FillCorner = Instance.new("UICorner")
                FillCorner.CornerRadius = UDim.new(0, 3)
                FillCorner.Parent = Fill
            
                function CheckboxManager:change_state(state: boolean)
                    self._state = state
                    if self._state then
                        TweenService:Create(Box, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            BackgroundTransparency = 0.7
                        }):Play()
                        TweenService:Create(Fill, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(9, 9)
                        }):Play()
                    else
                        TweenService:Create(Box, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            BackgroundTransparency = 0.9
                        }):Play()
                        TweenService:Create(Fill, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(0, 0)
                        }):Play()
                    end
                    Library._config._flags[settings.flag] = self._state
                    Config:save(game.GameId, Library._config)
                    settings.callback(self._state)
                end
            
                if Library:flag_type(settings.flag, "boolean") then
                    CheckboxManager:change_state(Library._config._flags[settings.flag])
                end
            
                Checkbox.MouseButton1Click:Connect(function()
                    CheckboxManager:change_state(not CheckboxManager._state)
                end)
            
                Checkbox.InputBegan:Connect(function(input, gameProcessed)
                    if gameProcessed then return end
                    if input.UserInputType ~= Enum.UserInputType.MouseButton3 then return end
                    if Library._choosing_keybind then return end
            
                    Library._choosing_keybind = true
                    local chooseConnection
                    chooseConnection = UserInputService.InputBegan:Connect(function(keyInput, processed)
                        if processed then return end
                        if keyInput.UserInputType ~= Enum.UserInputType.Keyboard then return end
                        if keyInput.KeyCode == Enum.KeyCode.Unknown then return end
            
                        if keyInput.KeyCode == Enum.KeyCode.Backspace then
                            ModuleManager:scale_keybind(true)
                            Library._config._keybinds[settings.flag] = nil
                            Config:save(game.GameId, Library._config)
                            KeybindLabel.Text = "..."
                            if Connections[settings.flag .. "_keybind"] then
                                Connections[settings.flag .. "_keybind"]:Disconnect()
                                Connections[settings.flag .. "_keybind"] = nil
                            end
                            chooseConnection:Disconnect()
                            Library._choosing_keybind = false
                            return
                        end
            
                        chooseConnection:Disconnect()
                        Library._config._keybinds[settings.flag] = tostring(keyInput.KeyCode)
                        Config:save(game.GameId, Library._config)
                        if Connections[settings.flag .. "_keybind"] then
                            Connections[settings.flag .. "_keybind"]:Disconnect()
                            Connections[settings.flag .. "_keybind"] = nil
                        end
                        ModuleManager:connect_keybind()
                        ModuleManager:scale_keybind()
                        Library._choosing_keybind = false
            
                        local keybind_string = string.gsub(tostring(Library._config._keybinds[settings.flag]), "Enum.KeyCode.", "")
                        KeybindLabel.Text = keybind_string
                    end)
                end)
            
                local keyPressConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                    if gameProcessed then return end
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        local storedKey = Library._config._keybinds[settings.flag]
                        if storedKey and tostring(input.KeyCode) == storedKey then
                            CheckboxManager:change_state(not CheckboxManager._state)
                        end
                    end
                end)
                Connections[settings.flag .. "_keypress"] = keyPressConnection
            
                return CheckboxManager
            end

            function ModuleManager:create_divider(settings: any)
                
                LayoutOrderModule = LayoutOrderModule + 1;
            
                if self._size == 0 then
                    self._size = 11
                end
            
                self._size += 27
            
                if ModuleManager._state then
                    Module.Size = UDim2.fromOffset(241, 93 + self._size)
                end

                local dividerHeight = 1
                local dividerWidth = 207 
            
               
                local OuterFrame = Instance.new('Frame')
                OuterFrame.Size = UDim2.new(0, dividerWidth, 0, 20) 
                OuterFrame.BackgroundTransparency = 1 
                OuterFrame.Name = 'OuterFrame'
                OuterFrame.Parent = Options
                OuterFrame.LayoutOrder = LayoutOrderModule

                if settings and settings.showtopic then
                    local TextLabel = Instance.new('TextLabel')
                    TextLabel.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
                    TextLabel.TextTransparency = 0
                    TextLabel.Text = settings.title
                    TextLabel.Size = UDim2.new(0, 153, 0, 13)
                    TextLabel.Position = UDim2.new(0.5, 0, 0.501, 0)
                    TextLabel.BackgroundTransparency = 1
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Center
                    TextLabel.BorderSizePixel = 0
                    TextLabel.AnchorPoint = Vector2.new(0.5,0.5)
                    TextLabel.BorderColor3 = Color3.fromRGB(30, 30, 30)
                    TextLabel.TextSize = 11
                    TextLabel.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                    TextLabel.ZIndex = 3;
                    TextLabel.TextStrokeTransparency = 0;
                    TextLabel.Parent = OuterFrame
                end;
                
                if not settings or settings and not settings.disableline then
                   
                    local Divider = Instance.new('Frame')
                    Divider.Size = UDim2.new(1, 0, 0, dividerHeight)
                    Divider.BackgroundColor3 = Color3.fromRGB(200, 200, 200) 
                    Divider.BorderSizePixel = 0
                    Divider.Name = 'Divider'
                    Divider.Parent = OuterFrame
                    Divider.ZIndex = 2;
                    Divider.Position = UDim2.new(0, 0, 0.5, -dividerHeight / 2) 
                
                   
                    local Gradient = Instance.new('UIGradient')
                    Gradient.Parent = Divider
                    Gradient.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)),  
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 200, 200)), 
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255, 0))  
                    })
                    Gradient.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),   
                        NumberSequenceKeypoint.new(0.5, 0),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                    Gradient.Rotation = 0 
                
                   
                    local UICorner = Instance.new('UICorner')
                    UICorner.CornerRadius = UDim.new(0, 2) 
                    UICorner.Parent = Divider

                end;
            
                return true;
            end
            
            function ModuleManager:create_slider(settings: any)

                LayoutOrderModule = LayoutOrderModule + 1

                local SliderManager = {}

                if self._size == 0 then
                    self._size = 11
                end

                self._size += 27

                if ModuleManager._state then
                    Module.Size = UDim2.fromOffset(241, 93 + self._size)
                end

                Options.Size = UDim2.fromOffset(241, self._size)

                local Slider = Instance.new('TextButton')
                Slider.FontFace = Font.new('rbxasset://fonts/families/SourceSansPro.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                Slider.TextSize = 14;
                Slider.TextColor3 = Color3.fromRGB(30, 30, 30)
                Slider.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Slider.Text = ''
                Slider.AutoButtonColor = false
                Slider.BackgroundTransparency = 1
                Slider.Name = 'Slider'
                Slider.Size = UDim2.new(0, 207, 0, 22)
                Slider.BorderSizePixel = 0
                Slider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Slider.Parent = Options
                Slider.LayoutOrder = LayoutOrderModule
                
                local TextLabel = Instance.new('TextLabel')
                if GG.SelectedLanguage == "th" then
                    TextLabel.FontFace = Font.new("rbxasset://fonts/families/NotoSansThai.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    TextLabel.TextSize = 13;
                else
                    TextLabel.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    TextLabel.TextSize = 11;
                end;
                TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                TextLabel.TextTransparency = 0.20000000298023224
                TextLabel.Text = settings.title
                TextLabel.Size = UDim2.new(0, 153, 0, 13)
                TextLabel.Position = UDim2.new(0, 0, 0.05000000074505806, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                TextLabel.BorderSizePixel = 0
                TextLabel.BorderColor3 = Color3.fromRGB(30, 30, 30)
                TextLabel.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                TextLabel.Parent = Slider
                
                local Drag = Instance.new('Frame')
                Drag.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Drag.AnchorPoint = Vector2.new(0.5, 1)
                Drag.BackgroundTransparency = 0.8999999761581421
                Drag.Position = UDim2.new(0.5, 0, 0.949999988079071, 0)
                Drag.Name = 'Drag'
                Drag.Size = UDim2.new(0, 207, 0, 4)
                Drag.BorderSizePixel = 0
                Drag.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                Drag.Parent = Slider
                
                local UICorner = Instance.new('UICorner')
                UICorner.CornerRadius = UDim.new(1, 0)
                UICorner.Parent = Drag
                
                local Fill = Instance.new('Frame')
                Fill.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Fill.AnchorPoint = Vector2.new(0, 0.5)
                Fill.BackgroundTransparency = 0.5
                Fill.Position = UDim2.new(0, 0, 0.5, 0)
                Fill.Name = 'Fill'
                Fill.Size = UDim2.new(0, 103, 0, 4)
                Fill.BorderSizePixel = 0
                Fill.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                Fill.Parent = Drag
                
                local UICorner = Instance.new('UICorner')
                UICorner.CornerRadius = UDim.new(0, 3)
                UICorner.Parent = Fill
                
                local UIGradient = Instance.new('UIGradient')
                UIGradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
                }
                UIGradient.Parent = Fill
                
                local Circle = Instance.new('Frame')
                Circle.AnchorPoint = Vector2.new(1, 0.5)
                Circle.Name = 'Circle'
                Circle.Position = UDim2.new(1, 0, 0.5, 0)
                Circle.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Circle.Size = UDim2.new(0, 6, 0, 6)
                Circle.BorderSizePixel = 0
                Circle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                Circle.Parent = Fill
                
                local UICorner = Instance.new('UICorner')
                UICorner.CornerRadius = UDim.new(1, 0)
                UICorner.Parent = Circle
                
                local Value = Instance.new('TextLabel')
                Value.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                Value.TextColor3 = Color3.fromRGB(200, 200, 200)
                Value.TextTransparency = 0.20000000298023224
                Value.Text = '50'
                Value.Name = 'Value'
                Value.Size = UDim2.new(0, 42, 0, 13)
                Value.AnchorPoint = Vector2.new(1, 0)
                Value.Position = UDim2.new(1, 0, 0, 0)
                Value.BackgroundTransparency = 1
                Value.TextXAlignment = Enum.TextXAlignment.Right
                Value.BorderSizePixel = 0
                Value.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Value.TextSize = 10
                Value.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                Value.Parent = Slider

                function SliderManager:set_percentage(percentage: number)
                    local rounded_number = 0

                    if settings.round_number then
                        rounded_number = math.floor(percentage)
                    else
                        rounded_number = math.floor(percentage * 10) / 10
                    end

                    percentage = (percentage - settings.minimum_value) / (settings.maximum_value - settings.minimum_value)
                    
                    local slider_size = math.clamp(percentage, 0.02, 1) * Drag.Size.X.Offset
                    local number_threshold = math.clamp(rounded_number, settings.minimum_value, settings.maximum_value)
    
                    Library._config._flags[settings.flag] = number_threshold
                    Value.Text = number_threshold
    
                    TweenService:Create(Fill, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Size = UDim2.fromOffset(slider_size, Drag.Size.Y.Offset)
                    }):Play()
    
                    settings.callback(number_threshold)
                end

                function SliderManager:update()
                    local mouse_position = (mouse.X - Drag.AbsolutePosition.X) / Drag.Size.X.Offset
                    local percentage = settings.minimum_value + (settings.maximum_value - settings.minimum_value) * mouse_position

                    self:set_percentage(percentage)
                end

                function SliderManager:input()
                    SliderManager:update()
    
                    Connections['slider_drag_'..settings.flag] = mouse.Move:Connect(function()
                        SliderManager:update()
                    end)
                    
                    Connections['slider_input_'..settings.flag] = UserInputService.InputEnded:Connect(function(input: InputObject, process: boolean)
                        if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
                            return
                        end
    
                        Connections:disconnect('slider_drag_'..settings.flag)
                        Connections:disconnect('slider_input_'..settings.flag)

                        if not settings.ignoresaved then
                            Config:save(game.GameId, Library._config);
                        end;
                    end)
                end


                if Library:flag_type(settings.flag, 'number') then
                    if not settings.ignoresaved then
                        SliderManager:set_percentage(Library._config._flags[settings.flag]);
                    else
                        SliderManager:set_percentage(settings.value);
                    end;
                else
                    SliderManager:set_percentage(settings.value);
                end;
    
                Slider.MouseButton1Down:Connect(function()
                    SliderManager:input()
                end)

                return SliderManager
            end

            function ModuleManager:create_dropdown(settings: any)

                if not settings.Order then
                    LayoutOrderModule = LayoutOrderModule + 1;
                end;

                local DropdownManager = {
                    _state = false,
                    _size = 0
                }

                if not settings.Order then
                    if self._size == 0 then
                        self._size = 11
                    end

                    self._size += 44
                end;

                if not settings.Order then
                    if ModuleManager._state then
                        Module.Size = UDim2.fromOffset(241, 93 + self._size)
                    end
                    Options.Size = UDim2.fromOffset(241, self._size)
                end

                local Dropdown = Instance.new('TextButton')
                Dropdown.FontFace = Font.new('rbxasset://fonts/families/SourceSansPro.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                Dropdown.TextColor3 = Color3.fromRGB(30, 30, 30)
                Dropdown.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Dropdown.Text = ''
                Dropdown.AutoButtonColor = false
                Dropdown.BackgroundTransparency = 1
                Dropdown.Name = 'Dropdown'
                Dropdown.Size = UDim2.new(0, 207, 0, 39)
                Dropdown.BorderSizePixel = 0
                Dropdown.TextSize = 14
                Dropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Dropdown.Parent = Options

                if not settings.Order then
                    Dropdown.LayoutOrder = LayoutOrderModule;
                else
                    Dropdown.LayoutOrder = settings.OrderValue;
                end;

                if not Library._config._flags[settings.flag] then
                    Library._config._flags[settings.flag] = {};
                end;
                
                local TextLabel = Instance.new('TextLabel')
                if GG.SelectedLanguage == "th" then
                    TextLabel.FontFace = Font.new("rbxasset://fonts/families/NotoSansThai.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    TextLabel.TextSize = 13;
                else
                    TextLabel.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
                    TextLabel.TextSize = 11;
                end;
                TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                TextLabel.TextTransparency = 0.20000000298023224
                TextLabel.Text = settings.title
                TextLabel.Size = UDim2.new(0, 207, 0, 13)
                TextLabel.BackgroundTransparency = 1
                TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                TextLabel.BorderSizePixel = 0
                TextLabel.BorderColor3 = Color3.fromRGB(30, 30, 30)
                TextLabel.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                TextLabel.Parent = Dropdown
                
                local Box = Instance.new('Frame')
                Box.ClipsDescendants = true
                Box.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Box.AnchorPoint = Vector2.new(0.5, 0)
                Box.BackgroundTransparency = 0.8999999761581421
                Box.Position = UDim2.new(0.5, 0, 1.2000000476837158, 0)
                Box.Name = 'Box'
                Box.Size = UDim2.new(0, 207, 0, 22)
                Box.BorderSizePixel = 0
                Box.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                Box.Parent = TextLabel
                
                local UICorner = Instance.new('UICorner')
                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Box
                
                local Header = Instance.new('Frame')
                Header.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Header.AnchorPoint = Vector2.new(0.5, 0)
                Header.BackgroundTransparency = 1
                Header.Position = UDim2.new(0.5, 0, 0, 0)
                Header.Name = 'Header'
                Header.Size = UDim2.new(0, 207, 0, 22)
                Header.BorderSizePixel = 0
                Header.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                Header.Parent = Box
                
                local CurrentOption = Instance.new('TextLabel')
                CurrentOption.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                CurrentOption.TextColor3 = Color3.fromRGB(200, 200, 200)
                CurrentOption.TextTransparency = 0.20000000298023224
                CurrentOption.Name = 'CurrentOption'
                CurrentOption.Size = UDim2.new(0, 161, 0, 13)
                CurrentOption.AnchorPoint = Vector2.new(0, 0.5)
                CurrentOption.Position = UDim2.new(0.04999988153576851, 0, 0.5, 0)
                CurrentOption.BackgroundTransparency = 1
                CurrentOption.TextXAlignment = Enum.TextXAlignment.Left
                CurrentOption.BorderSizePixel = 0
                CurrentOption.BorderColor3 = Color3.fromRGB(30, 30, 30)
                CurrentOption.TextSize = 10
                CurrentOption.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                CurrentOption.Parent = Header
                local UIGradient = Instance.new('UIGradient')
                UIGradient.Transparency = NumberSequence.new{
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.704, 0),
                    NumberSequenceKeypoint.new(0.872, 0.36250001192092896),
                    NumberSequenceKeypoint.new(1, 1)
                }
                UIGradient.Parent = CurrentOption
                
                local Arrow = Instance.new('ImageLabel')
                Arrow.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Arrow.AnchorPoint = Vector2.new(0, 0.5)
                Arrow.Image = 'rbxassetid://84232453189324'
                Arrow.BackgroundTransparency = 1
                Arrow.Position = UDim2.new(0.9100000262260437, 0, 0.5, 0)
                Arrow.Name = 'Arrow'
                Arrow.Size = UDim2.new(0, 8, 0, 8)
                Arrow.BorderSizePixel = 0
                Arrow.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                Arrow.Parent = Header
                
                local Options = Instance.new('ScrollingFrame')
                Options.ScrollBarImageColor3 = Color3.fromRGB(30, 30, 30)
                Options.Active = true
                Options.ScrollBarImageTransparency = 1
                Options.AutomaticCanvasSize = Enum.AutomaticSize.XY
                Options.ScrollBarThickness = 0
                Options.Name = 'Options'
                Options.Size = UDim2.new(0, 207, 0, 0)
                Options.BackgroundTransparency = 1
                Options.Position = UDim2.new(0, 0, 1, 0)
                Options.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                Options.BorderColor3 = Color3.fromRGB(30, 30, 30)
                Options.BorderSizePixel = 0
                Options.CanvasSize = UDim2.new(0, 0, 0.5, 0)
                Options.Parent = Box
                
                local UIListLayout = Instance.new('UIListLayout')
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Parent = Options
                
                local UIPadding = Instance.new('UIPadding')
                UIPadding.PaddingTop = UDim.new(0, -1)
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.Parent = Options
                
                local UIListLayout = Instance.new('UIListLayout')
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Parent = Box

                function DropdownManager:update(option: string)
                    
                    if settings.multi_dropdown then
                     

                        if not Library._config._flags[settings.flag] then
                            Library._config._flags[settings.flag] = {};
                        end;

                        local CurrentTargetValue = nil;
                        
                        if #Library._config._flags[settings.flag] > 0 then

                            CurrentTargetValue = convertTableToString(Library._config._flags[settings.flag]);

                        end;

                        local selected = {}

                        if CurrentTargetValue then
                            for value in string.gmatch(CurrentTargetValue, "([^,]+)") do
                               
                                local trimmedValue = value:match("^%s*(.-)%s*$")  
                                
                              
                                if trimmedValue ~= "Label" then
                                    table.insert(selected, trimmedValue)
                                end
                            end
                        else
                            for value in string.gmatch(CurrentOption.Text, "([^,]+)") do
                             
                                local trimmedValue = value:match("^%s*(.-)%s*$") 
                                
                                
                                if trimmedValue ~= "Label" then
                                    table.insert(selected, trimmedValue)
                                end
                            end
                        end;
                
                        local CurrentTextGet = convertStringToTable(CurrentOption.Text);

                        optionSkibidi = "nil";
                        if typeof(option) ~= 'string' then
                            optionSkibidi = option.Name;
                        else
                            optionSkibidi = option;
                        end;

                        local found = false
                        for i, v in pairs(CurrentTextGet) do
                            if v == optionSkibidi then
                                table.remove(CurrentTextGet, i);
                                break;
                            end
                        end

                        CurrentOption.Text = table.concat(selected, ", ")
                        local OptionsChild = {}
                       
                        for _, object in Options:GetChildren() do
                            if object.Name == "Option" then
                                table.insert(OptionsChild, object.Text)
                                if table.find(selected, object.Text) then
                                    object.TextTransparency = 0.2
                                else
                                    object.TextTransparency = 0.6
                                end
                            end
                        end

                        CurrentTargetValue = convertStringToTable(CurrentOption.Text);

                        for _, v in CurrentTargetValue do
                            if not table.find(OptionsChild, v) and table.find(selected, v) then
                                table.remove(selected, _)
                            end;
                        end;

                        CurrentOption.Text = table.concat(selected, ", ");
                
                        Library._config._flags[settings.flag] = convertStringToTable(CurrentOption.Text);
                    else
                        
                        CurrentOption.Text = (typeof(option) == "string" and option) or option.Name
                        for _, object in Options:GetChildren() do
                            if object.Name == "Option" then
                                
                                if object.Text == CurrentOption.Text then
                                    object.TextTransparency = 0.2
                                else
                                    object.TextTransparency = 0.6
                                end
                            end
                        end
                        Library._config._flags[settings.flag] = option
                    end
                
                   
                    Config:save(game.GameId, Library._config)
                
                  
                    settings.callback(option)
                end
                
                local CurrentDropSizeState = 0;

                function DropdownManager:unfold_settings()
                    self._state = not self._state

                    if self._state then
                        ModuleManager._multiplier += self._size

                        CurrentDropSizeState = self._size;

                        TweenService:Create(Module, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(241, 93 + ModuleManager._size + ModuleManager._multiplier)
                        }):Play()

                        TweenService:Create(Module.Options, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(241, ModuleManager._size + ModuleManager._multiplier)
                        }):Play()

                        TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(207, 39 + self._size)
                        }):Play()

                        TweenService:Create(Box, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(207, 22 + self._size)
                        }):Play()

                        TweenService:Create(Arrow, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Rotation = 180
                        }):Play()
                    else
                        ModuleManager._multiplier -= self._size

                        CurrentDropSizeState = 0;

                        TweenService:Create(Module, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(241, 93 + ModuleManager._size + ModuleManager._multiplier)
                        }):Play()

                        TweenService:Create(Module.Options, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(241, ModuleManager._size + ModuleManager._multiplier)
                        }):Play()

                        TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(207, 39)
                        }):Play()

                        TweenService:Create(Box, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(207, 22)
                        }):Play()

                        TweenService:Create(Arrow, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Rotation = 0
                        }):Play()
                    end
                end

                if #settings.options > 0 then
                    DropdownManager._size = 3

                    for index, value in settings.options do
                        local Option = Instance.new('TextButton')
                        Option.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                        Option.Active = false
                        Option.TextTransparency = 0.6000000238418579
                        Option.AnchorPoint = Vector2.new(0, 0.5)
                        Option.TextSize = 10
                        Option.Size = UDim2.new(0, 186, 0, 16)
                        Option.TextColor3 = Color3.fromRGB(200, 200, 200)
                        Option.BorderColor3 = Color3.fromRGB(30, 30, 30)
                        Option.Text = (typeof(value) == "string" and value) or value.Name;
                        Option.AutoButtonColor = false
                        Option.Name = 'Option'
                        Option.BackgroundTransparency = 1
                        Option.TextXAlignment = Enum.TextXAlignment.Left
                        Option.Selectable = false
                        Option.Position = UDim2.new(0.04999988153576851, 0, 0.34210526943206787, 0)
                        Option.BorderSizePixel = 0
                        Option.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                        Option.Parent = Options
                        
                        local UIGradient = Instance.new('UIGradient')
                        UIGradient.Transparency = NumberSequence.new{
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.704, 0),
                            NumberSequenceKeypoint.new(0.872, 0.36250001192092896),
                            NumberSequenceKeypoint.new(1, 1)
                        }
                        UIGradient.Parent = Option

                        Option.MouseButton1Click:Connect(function()
                            if not Library._config._flags[settings.flag] then
                                Library._config._flags[settings.flag] = {};
                            end;

                            if settings.multi_dropdown then
                                if table.find(Library._config._flags[settings.flag], value) then
                                    Library:remove_table_value(Library._config._flags[settings.flag], value)
                                else
                                    table.insert(Library._config._flags[settings.flag], value)
                                end
                            end

                            DropdownManager:update(value)
                        end)
    
                        if index > settings.maximum_options then
                            continue
                        end
    
                        DropdownManager._size += 16
                        Options.Size = UDim2.fromOffset(207, DropdownManager._size)
                    end
                end

                function DropdownManager:New(value)
                    Dropdown:Destroy(true);
                    value.OrderValue = Dropdown.LayoutOrder
                    ModuleManager._multiplier -= CurrentDropSizeState
                    return ModuleManager:create_dropdown(value)
                end;

                if Library:flag_type(settings.flag, 'string') then
                    DropdownManager:update(Library._config._flags[settings.flag])
                else
                    DropdownManager:update(settings.options[1])
                end
    
                Dropdown.MouseButton1Click:Connect(function()
                    DropdownManager:unfold_settings()
                end)

                return DropdownManager
            end

            function ModuleManager:create_feature(settings)

                local checked = false;
                
                LayoutOrderModule = LayoutOrderModule + 1
            
                if self._size == 0 then
                    self._size = 11
                end
            
                self._size += 20
            
                if ModuleManager._state then
                    Module.Size = UDim2.fromOffset(241, 93 + self._size);
                end
            
                Options.Size = UDim2.fromOffset(241, self._size);
            
                local FeatureContainer = Instance.new("Frame")
                FeatureContainer.Size = UDim2.new(0, 207, 0, 16)
                FeatureContainer.BackgroundTransparency = 1
                FeatureContainer.Parent = Options
                FeatureContainer.LayoutOrder = LayoutOrderModule
            
                local UIListLayout = Instance.new("UIListLayout")
                UIListLayout.FillDirection = Enum.FillDirection.Horizontal
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Parent = FeatureContainer
            
                local FeatureButton = Instance.new("TextButton")
                FeatureButton.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
                FeatureButton.TextSize = 11;
                FeatureButton.Size = UDim2.new(1, -35, 0, 16)
                FeatureButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                FeatureButton.TextColor3 = Color3.fromRGB(200, 200, 200)
                FeatureButton.Text = "    " .. settings.title or "    " .. "Feature"
                FeatureButton.AutoButtonColor = false
                FeatureButton.TextXAlignment = Enum.TextXAlignment.Left
                FeatureButton.TextTransparency = 0.2
                FeatureButton.Parent = FeatureContainer
            
                local RightContainer = Instance.new("Frame")
                RightContainer.Size = UDim2.new(0, 45, 0, 16)
                RightContainer.BackgroundTransparency = 1
                RightContainer.Parent = FeatureContainer
            
                local RightLayout = Instance.new("UIListLayout")
                RightLayout.Padding = UDim.new(0.1, 0)
                RightLayout.FillDirection = Enum.FillDirection.Horizontal
                RightLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
                RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
                RightLayout.Parent = RightContainer
            
                local KeybindBox = Instance.new("TextLabel")
                KeybindBox.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
                KeybindBox.Size = UDim2.new(0, 15, 0, 15)
                KeybindBox.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                KeybindBox.TextColor3 = Color3.fromRGB(200, 200, 200)
                KeybindBox.TextSize = 11
                KeybindBox.BackgroundTransparency = 1
                KeybindBox.LayoutOrder = 2;
                KeybindBox.Parent = RightContainer
            
                local KeybindButton = Instance.new("TextButton")
                KeybindButton.Size = UDim2.new(1, 0, 1, 0)
                KeybindButton.BackgroundTransparency = 1
                KeybindButton.TextTransparency = 1
                KeybindButton.Parent = KeybindBox

                local CheckboxCorner = Instance.new("UICorner", KeybindBox)
                CheckboxCorner.CornerRadius = UDim.new(0, 3)

                local UIStroke = Instance.new("UIStroke", KeybindBox)
                UIStroke.Color = Color3.fromRGB(150, 150, 150)
                UIStroke.Thickness = 1
                UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            
                if not Library._config._flags then
                    Library._config._flags = {}
                end
            
                if not Library._config._flags[settings.flag] then
                    Library._config._flags[settings.flag] = {
                        checked = false,
                        BIND = settings.default or "Unknown"
                    }
                end
            
                checked = Library._config._flags[settings.flag].checked
                KeybindBox.Text = Library._config._flags[settings.flag].BIND

                if KeybindBox.Text == "Unknown" then
                    KeybindBox.Text = "..."
                end

                local UseF_Var = nil;
            
                if not settings.disablecheck then
                    local Checkbox = Instance.new("TextButton")
                    Checkbox.Size = UDim2.new(0, 15, 0, 15)
                    Checkbox.BackgroundColor3 = checked and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(30, 30, 30)
                    Checkbox.Text = ""
                    Checkbox.Parent = RightContainer
                    Checkbox.LayoutOrder = 1;

                    local UIStroke = Instance.new("UIStroke", Checkbox)
                    UIStroke.Color = Color3.fromRGB(150, 150, 150)
                    UIStroke.Thickness = 1
                    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                
                    local CheckboxCorner = Instance.new("UICorner")
                    CheckboxCorner.CornerRadius = UDim.new(0, 3)
                    CheckboxCorner.Parent = Checkbox
            
                    local function toggleState()
                        checked = not checked
                        Checkbox.BackgroundColor3 = checked and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(30, 30, 30)
                        Library._config._flags[settings.flag].checked = checked
                        Config:save(game.GameId, Library._config)
                        if settings.callback then
                            settings.callback(checked)
                        end
                    end

                    UseF_Var = toggleState
                
                    Checkbox.MouseButton1Click:Connect(toggleState)

                else

                    UseF_Var = function()
                        settings.button_callback();
                    end;

                end;
            
                KeybindButton.MouseButton1Click:Connect(function()
                    KeybindBox.Text = "..."
                    local inputConnection
                    inputConnection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                        if gameProcessed then return end
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            local newKey = input.KeyCode.Name
                            Library._config._flags[settings.flag].BIND = newKey
                            if newKey ~= "Unknown" then
                                KeybindBox.Text = newKey;
                            end;
                            Config:save(game.GameId, Library._config) 
                            inputConnection:Disconnect()
                        elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
                            Library._config._flags[settings.flag].BIND = "Unknown"
                            KeybindBox.Text = "..."
                            Config:save(game.GameId, Library._config)
                            inputConnection:Disconnect()
                        end
                    end)
                    Connections["keybind_input_" .. settings.flag] = inputConnection
                end)
            
                local keyPressConnection
                keyPressConnection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                    if gameProcessed then return end
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        if input.KeyCode.Name == Library._config._flags[settings.flag].BIND then
                            UseF_Var();
                        end
                    end
                end)
                Connections["keybind_press_" .. settings.flag] = keyPressConnection
            
                FeatureButton.MouseButton1Click:Connect(function()
                    if settings.button_callback then
                        settings.button_callback()
                    end
                end)

                if not settings.disablecheck then
                    settings.callback(checked);
                end;
            
                return FeatureContainer
            end                    

            return ModuleManager
        end

        return TabManager
    end

    Connections['library_visiblity'] = UserInputService.InputBegan:Connect(function(input: InputObject, process: boolean)
        if input.KeyCode ~= Enum.KeyCode.RightControl then
            return
        end

        self._ui_open = not self._ui_open
        self:change_visiblity(self._ui_open)
    end)

    self._ui.Container.Handler.Minimize.MouseButton1Click:Connect(function()
        self._ui_open = not self._ui_open
        self:change_visiblity(self._ui_open)
    end)

    return self
end

local main = Library.new()
local rage = main:create_tab("Blatant", "rbxassetid://76499042599127")
local player = main:create_tab("Player", "rbxassetid://126017907477623")
local world = main:create_tab("World", "rbxassetid://85168909131990")
local farm = main:create_tab("Farm", "rbxassetid://132243429647479")
local misc = main:create_tab("Exclusive", "rbxassetid://132243429647479")
repeat
	task.wait()
until game:IsLoaded()
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Tornado_Time = tick()
local UserInputService = game:GetService("UserInputService")
local Last_Input = UserInputService:GetLastInputType()
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")
local Vector2_Mouse_Location = nil
local Grab_Parry = nil
local Remotes = {}
local Parry_Key = nil
local Speed_Divisor_Multiplier = 1.1
local LobbyAP_Speed_Divisor_Multiplier = 1.1
local firstParryFired = false
local ParryThreshold = .4
local firstParryType = "F_Key"
local Previous_Positions = {}
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualInputService = game:GetService("VirtualInputManager")
local parryCooldown = 0.0
local lastParryTime = 0
local GuiService = game:GetService("GuiService")
local function updateNavigation(guiObject: GuiObject | nil)
	GuiService.SelectedObject = guiObject
end
local function performFirstPress(parryType)
	if parryType == "F_Key" then
		VirtualInputService:SendKeyEvent(true, Enum.KeyCode.F, false, nil)
	elseif parryType == "Left_Click" then
		VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
	elseif parryType == "Navigation" then
		local button = Players.LocalPlayer.PlayerGui.Hotbar.Block
		updateNavigation(button)
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
		task.wait(0.0)
		updateNavigation(nil)
	end
end
if not LPH_OBFUSCATED then
	function LPH_JIT(Function)
		return Function
	end
	function LPH_JIT_MAX(Function)
		return Function
	end
	function LPH_NO_VIRTUALIZE(Function)
		return Function
	end
end
local PrivateKey = nil
local PropertyChangeOrder = {}
local HashOne
local HashTwo
local HashThree
LPH_NO_VIRTUALIZE(function()
	for Index, Value in next, getgc() do
		if
			rawequal(typeof(Value), "function")
			and islclosure(Value)
			and getrenv().debug.info(Value, "s"):find("SwordsController")
		then
			if rawequal(getrenv().debug.info(Value, "l"), 263) then
				HashOne = getconstant(Value, 62)
				HashTwo = getconstant(Value, 64)
				HashThree = getconstant(Value, 65)
			end
		end
	end
end)()
LPH_NO_VIRTUALIZE(function()
	for Index, Object in next, game:GetDescendants() do
		if Object:IsA("RemoteEvent") and string.find(Object.Name, "\n") then
			Object.Changed:Once(function()
				table.insert(PropertyChangeOrder, Object)
			end)
		end
	end
end)()
repeat
	task.wait()
until #PropertyChangeOrder == 3
local ShouldPlayerJump = PropertyChangeOrder[1]
local MainRemote = PropertyChangeOrder[2]
local GetOpponentPosition = PropertyChangeOrder[3]
local Remotes = {}
local Parry_Key = nil
local activeMethod = "Remote"
task.spawn(function()
	for _, Value in getgc() do
		if type(Value) == "function" and islclosure(Value) then
			local Protos = debug.getprotos(Value)
			local Upvalues = debug.getupvalues(Value)
			local Constants = debug.getconstants(Value)
			if #Protos == 4 and #Upvalues == 24 and #Constants >= 102 then
				local c62 = Constants[62]
				local c64 = Constants[64]
				local c65 = Constants[65]
				Remotes[debug.getupvalue(Value, 16)] = c62
				Parry_Key = debug.getupvalue(Value, 17)
				Remotes[debug.getupvalue(Value, 18)] = c64
				Remotes[debug.getupvalue(Value, 19)] = c65
				break
			end
		end
	end
end)
local Key = Parry_Key
local function Parry(...)
	ShouldPlayerJump:FireServer(HashOne, Parry_Key, ...)
	MainRemote:FireServer(HashTwo, Parry_Key, ...)
	GetOpponentPosition:FireServer(HashThree, Parry_Key, ...)
end
type functionInfo = {
	scriptName: string,
	name: string,
	line: number,
	upvalueCount: number,
	constantCount: number,
}
local function getFunction(t: functionInfo)
	t = t or {}
	local functions = {}
	local function findMatches()
		Setthreadidentity(6)
		for i, v in getgc() do
			if type(v) == "function" and islclosure(v) then
				local match = true
				local info = getinfo(v)
				if t.scriptName and (not tostring(getfenv(v).script):find(t.scriptName)) then
					match = false
				end
				if t.name and info.name ~= t.name then
					match = false
				end
				if t.line and info.currentline ~= t.line then
					match = false
				end
				if t.upvalueCount and #getupvalues(v) ~= t.upvalueCount then
					match = false
				end
				if t.constantCount and #getconstants(v) ~= t.constantsCount then
					match = false
				end
				if match then
					table.insert(functions, v)
				end
			end
		end
		setthreadidentity(8)
	end
	findMatches()
	if #functions == 0 then
		while task.wait(1) and #functions == 0 do
			findMatches()
		end
	end
	if #functions == 1 then
		return functions[1]
	end
end
type tableInfo = {
	highEntropyTableIndex: string,
}
getgenv().skinChanger = false
getgenv().swordModel = ""
getgenv().swordAnimations = ""
getgenv().swordFX = ""
local print = function() end
if getgenv().updateSword and getgenv().skinChanger then
	getgenv().updateSword()
	return
end
local function getTable(t: tableInfo)
	t = t or {}
	local tables = {}
	local function findMatches()
		for i, v in getgc(true) do
			if type(v) == "table" then
				local match = true
				if t.highEntropyTableIndex and (not rawget(v, t.highEntropyTableIndex)) then
					match = false
				end
				if match then
					table.insert(tables, v)
				end
			end
		end
	end
	findMatches()
	if #tables == 0 then
		while task.wait(1) and #tables == 0 do
			findMatches()
		end
	end
	if #tables == 1 then
		return tables[1]
	end
end
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local swordInstancesInstance =
	rs:WaitForChild("Shared", 9e9):WaitForChild("ReplicatedInstances", 9e9):WaitForChild("Swords", 9e9)
local swordInstances = require(swordInstancesInstance)
local swordsController
while task.wait() and not swordsController do
	for i, v in getconnections(rs.Remotes.FireSwordInfo.OnClientEvent) do
		if v.Function and islclosure(v.Function) then
			local upvalues = getupvalues(v.Function)
			if #upvalues == 1 and type(upvalues[1]) == "table" then
				swordsController = upvalues[1]
				break
			end
		end
	end
end
function getSlashName(swordName)
	local slashName = swordInstances:GetSword(swordName)
	return (slashName and slashName.SlashName) or "SlashEffect"
end
function setSword()
	if not getgenv().skinChanger then
		return
	end
	setupvalue(rawget(swordInstances, "EquipSwordTo"), 2, false)
	swordInstances:EquipSwordTo(plr.Character, getgenv().swordModel)
	swordsController:SetSword(getgenv().swordAnimations)
end
local playParryFunc
local parrySuccessAllConnection
while task.wait() and not parrySuccessAllConnection do
	for i, v in getconnections(rs.Remotes.ParrySuccessAll.OnClientEvent) do
		if v.Function and getinfo(v.Function).name == "parrySuccessAll" then
			parrySuccessAllConnection = v
			playParryFunc = v.Function
			v:Disable()
		end
	end
end
local parrySuccessClientConnection
while task.wait() and not parrySuccessClientConnection do
	for i, v in getconnections(rs.Remotes.ParrySuccessClient.Event) do
		if v.Function and getinfo(v.Function).name == "parrySuccessAll" then
			parrySuccessClientConnection = v
			v:Disable()
		end
	end
end
getgenv().slashName = getSlashName(getgenv().swordFX)
local lastOtherParryTimestamp = 0
local clashConnections = {}
rs.Remotes.ParrySuccessAll.OnClientEvent:Connect(function(...)
	setthreadidentity(2)
	local args = { ... }
	if tostring(args[4]) ~= plr.Name then
		lastOtherParryTimestamp = tick()
	elseif getgenv().skinChanger then
		args[1] = getgenv().slashName
		args[3] = getgenv().swordFX
	end
	return playParryFunc(unpack(args))
end)
table.insert(clashConnections, getconnections(rs.Remotes.ParrySuccessAll.OnClientEvent)[1])
getgenv().updateSword = function()
	getgenv().slashName = getSlashName(getgenv().swordFX)
	setSword()
end
task.spawn(function()
	while task.wait(1) do
		if getgenv().skinChanger then
			local char = plr.Character or plr.CharacterAdded:Wait()
			if plr:GetAttribute("CurrentlyEquippedSword") ~= getgenv().swordModel then
				setSword()
			end
			if char and (not char:FindFirstChild(getgenv().swordModel)) then
				setSword()
			end
			for _, v in (char and char:GetChildren()) or {} do
				if v:IsA("Model") and v.Name ~= getgenv().swordModel then
					v:Destroy()
				end
				task.wait()
			end
		end
	end
end)
local Parries = 0
function create_animation(object, info, value)
	local animation = game:GetService("TweenService"):Create(object, info, value)
	animation:Play()
	task.wait(info.Time)
	Debris:AddItem(animation, 0)
	animation:Destroy()
	animation = nil
end
local Animation = {}
Animation.storage = {}
Animation.current = nil
Animation.track = nil
for _, v in pairs(game:GetService("ReplicatedStorage").Misc.Emotes:GetChildren()) do
	if v:IsA("Animation") and v:GetAttribute("EmoteName") then
		local Emote_Name = v:GetAttribute("EmoteName")
		Animation.storage[Emote_Name] = v
	end
end
local Emotes_Data = {}
for Object in pairs(Animation.storage) do
	table.insert(Emotes_Data, Object)
end
table.sort(Emotes_Data)
local Auto_Parry = {}
function Auto_Parry.Parry_Animation()
	local Parry_Animation = game:GetService("ReplicatedStorage").Shared.SwordAPI.Collection.Default
		:FindFirstChild("GrabParry")
	local Current_Sword = Player.Character:GetAttribute("CurrentlyEquippedSword")
	if not Current_Sword then
		return
	end
	if not Parry_Animation then
		return
	end
	local Sword_Data = game:GetService("ReplicatedStorage").Shared.ReplicatedInstances.Swords.GetSword
		:Invoke(Current_Sword)
	if not Sword_Data or not Sword_Data["AnimationType"] then
		return
	end
	for _, object in pairs(game:GetService("ReplicatedStorage").Shared.SwordAPI.Collection:GetChildren()) do
		if object.Name == Sword_Data["AnimationType"] then
			if object:FindFirstChild("GrabParry") or object:FindFirstChild("Grab") then
				local sword_animation_type = "GrabParry"
				if object:FindFirstChild("Grab") then
					sword_animation_type = "Grab"
				end
				Parry_Animation = object[sword_animation_type]
			end
		end
	end
	Grab_Parry = Player.Character.Humanoid.Animator:LoadAnimation(Parry_Animation)
	Grab_Parry:Play()
end
function Auto_Parry.Play_Animation(v)
	local Animations = Animation.storage[v]
	if not Animations then
		return false
	end
	local Animator = Player.Character.Humanoid.Animator
	if Animation.track then
		Animation.track:Stop()
	end
	Animation.track = Animator:LoadAnimation(Animations)
	Animation.track:Play()
	Animation.current = v
end
function Auto_Parry.Get_Balls()
	local Balls = {}
	for _, Instance in pairs(workspace.Balls:GetChildren()) do
		if Instance:GetAttribute("realBall") then
			Instance.CanCollide = false
			table.insert(Balls, Instance)
		end
	end
	return Balls
end
function Auto_Parry.Get_Ball()
	for _, Instance in pairs(workspace.Balls:GetChildren()) do
		if Instance:GetAttribute("realBall") then
			Instance.CanCollide = false
			return Instance
		end
	end
end
function Auto_Parry.Lobby_Balls()
	for _, Instance in pairs(workspace.TrainingBalls:GetChildren()) do
		if Instance:GetAttribute("realBall") then
			return Instance
		end
	end
end
local Closest_Entity = nil
function Auto_Parry.Closest_Player()
	local Max_Distance = math.huge
	local Found_Entity = nil
	for _, Entity in pairs(workspace.Alive:GetChildren()) do
		if tostring(Entity) ~= tostring(Player) then
			if Entity.PrimaryPart then
				local Distance = Player:DistanceFromCharacter(Entity.PrimaryPart.Position)
				if Distance < Max_Distance then
					Max_Distance = Distance
					Found_Entity = Entity
				end
			end
		end
	end
	Closest_Entity = Found_Entity
	return Found_Entity
end
function Auto_Parry:Get_Entity_Properties()
	Auto_Parry.Closest_Player()
	if not Closest_Entity then
		return false
	end
	local Entity_Velocity = Closest_Entity.PrimaryPart.Velocity
	local Entity_Direction = (Player.Character.PrimaryPart.Position - Closest_Entity.PrimaryPart.Position).Unit
	local Entity_Distance = (Player.Character.PrimaryPart.Position - Closest_Entity.PrimaryPart.Position).Magnitude
	return {
		Velocity = Entity_Velocity,
		Direction = Entity_Direction,
		Distance = Entity_Distance,
	}
end
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
function Auto_Parry.Parry_Data(Parry_Type)
	Auto_Parry.Closest_Player()
	local Events = {}
	local Camera = workspace.CurrentCamera
	local Vector2_Mouse_Location
	if
		Last_Input == Enum.UserInputType.MouseButton1
		or (Enum.UserInputType.MouseButton2 or Last_Input == Enum.UserInputType.Keyboard)
	then
		local Mouse_Location = UserInputService:GetMouseLocation()
		Vector2_Mouse_Location = { Mouse_Location.X, Mouse_Location.Y }
	else
		Vector2_Mouse_Location = { Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2 }
	end
	if isMobile then
		Vector2_Mouse_Location = { Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2 }
	end
	local Players_Screen_Positions = {}
	for _, v in pairs(workspace.Alive:GetChildren()) do
		if v ~= Player.Character then
			local worldPos = v.PrimaryPart.Position
			local screenPos, isOnScreen = Camera:WorldToScreenPoint(worldPos)
			if isOnScreen then
				Players_Screen_Positions[v] = Vector2.new(screenPos.X, screenPos.Y)
			end
			Events[tostring(v)] = screenPos
		end
	end
	if Parry_Type == "Camera" then
		return { 0, Camera.CFrame, Events, Vector2_Mouse_Location }
	end
	if Parry_Type == "Backwards" then
		local Backwards_Direction = Camera.CFrame.LookVector * -10000
		Backwards_Direction = Vector3.new(Backwards_Direction.X, 0, Backwards_Direction.Z)
		return {
			0,
			CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + Backwards_Direction),
			Events,
			Vector2_Mouse_Location,
		}
	end
	if Parry_Type == "Straight" then
		local Aimed_Player = nil
		local Closest_Distance = math.huge
		local Mouse_Vector = Vector2.new(Vector2_Mouse_Location[1], Vector2_Mouse_Location[2])
		for _, v in pairs(workspace.Alive:GetChildren()) do
			if v ~= Player.Character then
				local worldPos = v.PrimaryPart.Position
				local screenPos, isOnScreen = Camera:WorldToScreenPoint(worldPos)
				if isOnScreen then
					local playerScreenPos = Vector2.new(screenPos.X, screenPos.Y)
					local distance = (Mouse_Vector - playerScreenPos).Magnitude
					if distance < Closest_Distance then
						Closest_Distance = distance
						Aimed_Player = v
					end
				end
			end
		end
		if Aimed_Player then
			return {
				0,
				CFrame.new(Player.Character.PrimaryPart.Position, Aimed_Player.PrimaryPart.Position),
				Events,
				Vector2_Mouse_Location,
			}
		else
			return {
				0,
				CFrame.new(Player.Character.PrimaryPart.Position, Closest_Entity.PrimaryPart.Position),
				Events,
				Vector2_Mouse_Location,
			}
		end
	end
	if Parry_Type == "Random" then
		return {
			0,
			CFrame.new(
				Camera.CFrame.Position,
				Vector3.new(math.random(-4000, 4000), math.random(-4000, 4000), math.random(-4000, 4000))
			),
			Events,
			Vector2_Mouse_Location,
		}
	end
	if Parry_Type == "High" then
		local High_Direction = Camera.CFrame.UpVector * 10000
		return {
			0,
			CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + High_Direction),
			Events,
			Vector2_Mouse_Location,
		}
	end
	if Parry_Type == "High" then
		local High_Direction = Vector3.new(0, -1, 0) * 10000
		return {
			0,
			CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + High_Direction),
			Events,
			Vector2_Mouse_Location,
		}
	end
	if Parry_Type == "Slowball" then
		local Slowball_Direction = Vector3.new(0, -1, 0) * 99999
		return {
			0,
			CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + Slowball_Direction),
			Events,
			Vector2_Mouse_Location,
		}
	end
    if Parry_Type == "Fastball" then
		local Fastball_Direction = Camera.CFrame.LookVector * 10 + Vector3.new(0, 7, 0)
		return {
			0,
			CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + Fastball_Direction),
			Events,
			Vector2_Mouse_Location,
		}
    end
	if Parry_Type == "Left" then
		local Left_Direction = Camera.CFrame.RightVector * 10000
		return {
			0,
			CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position - Left_Direction),
			Events,
			Vector2_Mouse_Location,
		}
	end
	if Parry_Type == "Right" then
		local Right_Direction = Camera.CFrame.RightVector * 10000
		return {
			0,
			CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + Right_Direction),
			Events,
			Vector2_Mouse_Location,
		}
	end
	if Parry_Type == "RandomTarget" then
		local candidates = {}
		for _, v in pairs(workspace.Alive:GetChildren()) do
			if v ~= Player.Character and v.PrimaryPart then
				local screenPos, isOnScreen = Camera:WorldToScreenPoint(v.PrimaryPart.Position)
				if isOnScreen then
					table.insert(candidates, {
						character = v,
						screenXY = { screenPos.X, screenPos.Y },
					})
				end
			end
		end
		if #candidates > 0 then
			local pick = candidates[math.random(1, #candidates)]
			local lookCFrame = CFrame.new(Player.Character.PrimaryPart.Position, pick.character.PrimaryPart.Position)
			return { 0, lookCFrame, Events, pick.screenXY }
		else
			return { 0, Camera.CFrame, Events, { Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2 } }
		end
	end
	return Parry_Type
end
function Auto_Parry.Parry(Parry_Type)
	if tick() - lastParryTime < parryCooldown then
		return false
	end
	lastParryTime = tick()
	local presses = isSpam and spamSpeed or 1
	if activeMethod == "F Key" then
		for i = 1, presses do
			VirtualInput:SendKeyEvent(true, Enum.KeyCode.F, false, game)
			VirtualInput:SendKeyEvent(false, Enum.KeyCode.F, false, game)
		end
	else
		local foundFake = false
		for _, Args in pairs(Remotes) do
			if Args == "PARRY_HASH_FAKE_1" or Args == "_G" then
				foundFake = true
				break
			end
		end
		local Parry_Data = Auto_Parry.Parry_Data(Parry_Type)
		for i = 1, presses do
			for Remote, Args in pairs(Remotes) do
				local Hash
				if foundFake then
					Hash = nil
				else
					Hash = Args
				end
				Remote:FireServer(Hash, Parry_Key, Parry_Data[1], Parry_Data[2], Parry_Data[3], Parry_Data[4])
			end
		end
	end
	if Parries > 7 then
		return false
	end
	Parries += 1
	task.delay(0.5, function()
		if Parries > 0 then
			Parries -= 1
		end
	end)
end
local Lerp_Radians = 0
local Last_Warping = tick()
function Auto_Parry.Linear_Interpolation(a, b, time_volume)
	return a + (b - a) * time_volume
end
local Previous_Velocity = {}
local Curving = tick()
local Runtime = workspace.Runtime
function Auto_Parry.Is_Curved()
	local Ball = Auto_Parry.Get_Ball()
	if not Ball then
		return false
	end
	local Zoomies = Ball:FindFirstChild("zoomies")
	if not Zoomies then
		return false
	end
	local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
	local Velocity = Zoomies.VectorVelocity
	local Ball_Direction = Velocity.Unit
	local playerPos = Player.Character.PrimaryPart.Position
	local ballPos = Ball.Position
	local Direction = (playerPos - ballPos).Unit
	local Dot = Direction:Dot(Ball_Direction)
	local Speed = Velocity.Magnitude
	local Speed_Threshold = math.min(Speed / 100, 40)
	local Angle_Threshold = 40 * math.max(Dot, 0)
	local Distance = (playerPos - ballPos).Magnitude
	local Reach_Time = Distance / Speed - (Ping / 1000)
	local Ball_Distance_Threshold = 15 - math.min(Distance / 1000, 15) + Speed_Threshold
	table.insert(Previous_Velocity, Velocity)
	if #Previous_Velocity > 4 then
		table.remove(Previous_Velocity, 1)
	end
	if Ball:FindFirstChild("AeroDynamicSlashVFX") then
		Debris:AddItem(Ball.AeroDynamicSlashVFX, 0)
		Tornado_Time = tick()
	end
	if Runtime:FindFirstChild("Tornado") then
		if (tick() - Tornado_Time) < ((Runtime.Tornado:GetAttribute("TornadoTime") or 1) + 0.314159) then
			return true
		end
	end
	local Enough_Speed = Speed > 160
	if Enough_Speed and Reach_Time > (Ping / 10 + 0.03) then
		if Speed < 300 then
			Ball_Distance_Threshold = math.max(Ball_Distance_Threshold - 15, 15)
		elseif Speed <= 600 then
			Ball_Distance_Threshold = math.max(Ball_Distance_Threshold - 17, 17)
		elseif Speed <= 1000 then
			Ball_Distance_Threshold = math.max(Ball_Distance_Threshold - 19, 19)
		else
			Ball_Distance_Threshold = math.max(Ball_Distance_Threshold - 20, 20)
		end
	end
	if Distance < Ball_Distance_Threshold then
		return false
	end
	local adjustedReachTime = Reach_Time + 0.03
	if Speed < 300 then
		if (tick() - Curving) < (adjustedReachTime / 1.2) then
			return true
		end
	elseif Speed < 450 then
		if (tick() - Curving) < (adjustedReachTime / 1.21) then
			return true
		end
	elseif Speed < 600 then
		if (tick() - Curving) < (adjustedReachTime / 1.335) then
			return true
		end
	else
		if (tick() - Curving) < (adjustedReachTime / 1.5) then
			return true
		end
	end
	local Dot_Threshold = (0 - Ping / 1000)
	local Direction_Difference = (Ball_Direction - Velocity.Unit)
	local Direction_Similarity = Direction:Dot(Direction_Difference.Unit)
	local Dot_Difference = Dot - Direction_Similarity
	if Dot_Difference < Dot_Threshold then
		return true
	end
	local Clamped_Dot = math.clamp(Dot, -1, 1)
	local Radians = math.deg(math.asin(Clamped_Dot))
	Lerp_Radians = Auto_Parry.Linear_Interpolation(Lerp_Radians, Radians, 0.8)
	if Speed < 300 then
		if Lerp_Radians < 0.02 then
			Last_Warping = tick()
		end
		if (tick() - Last_Warping) < (adjustedReachTime / 1.19) then
			return true
		end
	else
		if Lerp_Radians < 0.018 then
			Last_Warping = tick()
		end
		if (tick() - Last_Warping) < (adjustedReachTime / 1.5) then
			return true
		end
	end
	if #Previous_Velocity == 4 then
		for i = 1, 2 do
			local prevDir = (Ball_Direction - Previous_Velocity[i].Unit).Unit
			local prevDot = Direction:Dot(prevDir)
			if (Dot - prevDot) < Dot_Threshold then
				return true
			end
		end
	end
	local backwardsCurveDetected = false
	local backwardsAngleThreshold = 60
	local horizDirection = Vector3.new(playerPos.X - ballPos.X, 0, playerPos.Z - ballPos.Z)
	if horizDirection.Magnitude > 0 then
		horizDirection = horizDirection.Unit
	end
	local awayFromPlayer = -horizDirection
	local horizBallDir = Vector3.new(Ball_Direction.X, 0, Ball_Direction.Z)
	if horizBallDir.Magnitude > 0 then
		horizBallDir = horizBallDir.Unit
		local backwardsAngle = math.deg(math.acos(math.clamp(awayFromPlayer:Dot(horizBallDir), -1, 1)))
		if backwardsAngle < backwardsAngleThreshold then
			backwardsCurveDetected = true
		end
	end
	return (Dot < Dot_Threshold) or backwardsCurveDetected
end
function Auto_Parry:Get_Ball_Properties()
	local Ball = Auto_Parry.Get_Ball()
	local Ball_Velocity = Vector3.zero
	local Ball_Origin = Ball
	local Ball_Direction = (Player.Character.PrimaryPart.Position - Ball_Origin.Position).Unit
	local Ball_Distance = (Player.Character.PrimaryPart.Position - Ball.Position).Magnitude
	local Ball_Dot = Ball_Direction:Dot(Ball_Velocity.Unit)
	return {
		Velocity = Ball_Velocity,
		Direction = Ball_Direction,
		Distance = Ball_Distance,
		Dot = Ball_Dot,
	}
end
function Auto_Parry.Spam_Service(self)
	local Ball = Auto_Parry.Get_Ball()
	local Entity = Auto_Parry.Closest_Player()
	if not Ball then
		return false
	end
	if not Entity or not Entity.PrimaryPart then
		return false
	end
	local Spam_Accuracy = 1
	local Velocity = Ball.AssemblyLinearVelocity
	local Speed = Velocity.Magnitude
	local Direction = (Player.Character.PrimaryPart.Position - Ball.Position).Unit
	local Dot = Direction:Dot(Velocity.Unit)
	local Target_Position = Entity.PrimaryPart.Position
	local Target_Distance = Player:DistanceFromCharacter(Target_Position)
	local Movement_Factor = 1
	local MoveDir = Player.Character.Humanoid.MoveDirection
	local TargetDir = (Target_Position - Player.Character.PrimaryPart.Position).Unit
	local TargetMoveDir = Entity.Humanoid.MoveDirection
	_G.Last_Close_Contact = _G.Last_Close_Contact or 0
	_G.In_Close_Contact = _G.In_Close_Contact or false
	local now = tick()
	if Target_Distance <= 3 then
		_G.In_Close_Contact = true
	end
	if _G.In_Close_Contact and Target_Distance > 3.3 then
		_G.In_Close_Contact = false
		_G.Last_Close_Contact = now
	end
	local can_use_div10 = (not _G.In_Close_Contact) and ((now - _G.Last_Close_Contact) >= 1.5)
	if can_use_div10 and MoveDir.Magnitude > 0.2 and MoveDir:Dot(TargetDir) < -0.4 then
		Movement_Factor = 10
	end
	if can_use_div10 and TargetMoveDir.Magnitude > 0.2 and TargetMoveDir:Dot(-TargetDir) < -0.4 then
		Movement_Factor = 10
	end
	local Maximum_Spam_Distance = self.Ping * 0.7 + math.min(Speed / (Movement_Factor * 1.2), 80)
	if self.Entity_Properties.Distance > Maximum_Spam_Distance then
		return Spam_Accuracy
	end
	if self.Ball_Properties.Distance > Maximum_Spam_Distance then
		return Spam_Accuracy
	end
	if Target_Distance > Maximum_Spam_Distance then
		return Spam_Accuracy
	end
	local Dot_Reduction = math.clamp(-Dot, 0, 1)
	local Dot_Impact = math.clamp(Dot_Reduction * (Speed / 40), 0, 4)
	Spam_Accuracy = Maximum_Spam_Distance - Dot_Impact
	return Spam_Accuracy
end
local Connections_Manager = {}
local Selected_Parry_Type = nil
local Parried = false
local Last_Parry = 0
local deathshit = false
ReplicatedStorage.Remotes.DeathBall.OnClientEvent:Connect(function(c, d)
	if d then
		deathshit = true
	else
		deathshit = false
	end
end)
local Infinity = false
ReplicatedStorage.Remotes.InfinityBall.OnClientEvent:Connect(function(a, b)
	if b then
		Infinity = true
	else
		Infinity = false
	end
end)
local timehole = false
ReplicatedStorage.Remotes.TimeHoleHoldBall.OnClientEvent:Connect(function(e, f)
	if f then
		timehole = true
	else
		timehole = false
	end
end)
local AutoParry = true
local Balls = workspace:WaitForChild("Balls")
local CurrentBall = nil
local InputTask = nil
local Cooldown = 0
local RunTime = workspace:FindFirstChild("Runtime")
local function GetBall()
	for _, Ball in ipairs(Balls:GetChildren()) do
		if Ball:FindFirstChild("ff") then
			return Ball
		end
	end
	return nil
end
local function SpamInput(Label)
	if InputTask then
		return
	end
	InputTask = task.spawn(function()
		while AutoParry do
			Auto_Parry.Parry(Selected_Parry_Type)
			task.wait(Cooldown)
		end
		InputTask = nil
	end)
end
Balls.ChildAdded:Connect(function(Value)
	Value.ChildAdded:Connect(function(Child)
		if getgenv().SlashOfFuryDetection and Child.Name == "ComboCounter" then
			local Sof_Label = Child:FindFirstChildOfClass("TextLabel")
			if Sof_Label then
				repeat
					local Slashes_Counter = tonumber(Sof_Label.Text)
					if Slashes_Counter and Slashes_Counter < 32 then
						Auto_Parry.Parry(Selected_Parry_Type)
					end
					task.wait()
				until not Sof_Label.Parent or not Sof_Label
			end
		end
	end)
end)
local Players = game:GetService("Players")
local player10239123 = Players.LocalPlayer
local RunService = game:GetService("RunService")
if not player10239123 then
	return
end
RunTime.ChildAdded:Connect(function(Object)
	local Name = Object.Name
	if getgenv().PhantomV2Detection then
		if Name == "maxTransmission" or Name == "transmissionpart" then
			local Weld = Object:FindFirstChildWhichIsA("WeldConstraint")
			if Weld then
				local Character = player10239123.Character or player10239123.CharacterAdded:Wait()
				if Character and Weld.Part1 == Character.HumanoidRootPart then
					CurrentBall = GetBall()
					Weld:Destroy()
					if CurrentBall then
						local FocusConnection
						FocusConnection = RunService.RenderStepped:Connect(function()
							local Highlighted = CurrentBall:GetAttribute("highlighted")
							if Highlighted == true then
								game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 36
								local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
								if HumanoidRootPart then
									local PlayerPosition = HumanoidRootPart.Position
									local BallPosition = CurrentBall.Position
									local PlayerToBall = (BallPosition - PlayerPosition).Unit
									game.Players.LocalPlayer.Character.Humanoid:Move(PlayerToBall, false)
								end
							elseif Highlighted == false then
								FocusConnection:Disconnect()
								game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 10
								game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 0), false)
								task.delay(3, function()
									game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 36
								end)
								CurrentBall = nil
							end
						end)
						task.delay(3, function()
							if FocusConnection and FocusConnection.Connected then
								FocusConnection:Disconnect()
								game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 0), false)
								game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 36
								CurrentBall = nil
							end
						end)
					end
				end
			end
		end
	end
end)
local player11 = game.Players.LocalPlayer
local PlayerGui = player11:WaitForChild("PlayerGui")
local playerGui = player11:WaitForChild("PlayerGui")
local Hotbar = PlayerGui:WaitForChild("Hotbar")
local ParryCD = playerGui.Hotbar.Block.UIGradient
local AbilityCD = playerGui.Hotbar.Ability.UIGradient
local function isCooldownInEffect1(uigradient)
	return uigradient.Offset.Y < 0.4
end
local function isCooldownInEffect2(uigradient)
	return uigradient.Offset.Y == 0.5
end
local function cooldownProtection()
	if isCooldownInEffect1(ParryCD) then
		game:GetService("ReplicatedStorage").Remotes.AbilityButtonPress:Fire()
		return true
	end
	return false
end
local function AutoAbility()
	if isCooldownInEffect2(AbilityCD) then
		if
			Player.Character.Abilities["Raging Deflection"].Enabled
			or Player.Character.Abilities["Rapture"].Enabled
			or Player.Character.Abilities["Calming Deflection"].Enabled
			or Player.Character.Abilities["Aerodynamic Slash"].Enabled
			or Player.Character.Abilities["Fracture"].Enabled
			or Player.Character.Abilities["Death Slash"].Enabled
		then
			Parried = true
			game:GetService("ReplicatedStorage").Remotes.AbilityButtonPress:Fire()
			task.wait(2.432)
			game:GetService("ReplicatedStorage")
				:WaitForChild("Remotes")
				:WaitForChild("DeathSlashShootActivation")
				:FireServer(true)
			return true
		end
	end
	return false
end
do
	local module = rage:create_module({
		title = "Auto Parry",
		flag = "Auto_Parry",
		description = "Automatically parries ball",
		section = "left",
		callback = function(value: boolean)
			if getgenv().AutoParryNotify then
				if value then
					Library.SendNotification({
						title = "Module Notification",
						text = "Auto Parry has been turned ON",
						duration = 3,
					})
				else
					Library.SendNotification({
						title = "Module Notification",
						text = "Auto Parry has been turned OFF",
						duration = 3,
					})
				end
			end
			if value then
				Connections_Manager["Auto Parry"] = RunService.PreSimulation:Connect(function()
					local One_Ball = Auto_Parry.Get_Ball()
					local Balls = Auto_Parry.Get_Balls()
					for _, Ball in pairs(Balls) do
						if not Ball then
							return
						end
						local Zoomies = Ball:FindFirstChild("zoomies")
						if not Zoomies then
							return
						end
						Ball:GetAttributeChangedSignal("target"):Once(function()
							Parried = false
						end)
						if Parried then
							return
						end
						local Ball_Target = Ball:GetAttribute("target")
						local One_Target = One_Ball:GetAttribute("target")
						local Velocity = Zoomies.VectorVelocity
						local Distance = (Player.Character.PrimaryPart.Position - Ball.Position).Magnitude
						local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 10
						local Ping_Threshold = math.clamp(Ping / 10, 5, 17)
						local Speed = Velocity.Magnitude
						local cappedSpeedDiff = math.min(math.max(Speed - 9.5, 0), 650)
						local speed_divisor_base = 2.4 + cappedSpeedDiff * 0.002
						local effectiveMultiplier = Speed_Divisor_Multiplier
						if getgenv().RandomParryAccuracyEnabled then
							if Speed < 200 then
								effectiveMultiplier = 0.7 + (math.random(40, 100) - 1) * (0.35 / 99)
							else
								effectiveMultiplier = 0.7 + (math.random(1, 100) - 1) * (0.35 / 99)
							end
						end
						local speed_divisor = speed_divisor_base * effectiveMultiplier
						local Parry_Accuracy = Ping_Threshold + math.max(Speed / speed_divisor, 9.5)
						local Curved = Auto_Parry.Is_Curved()
						if Ball:FindFirstChild("AeroDynamicSlashVFX") then
							Debris:AddItem(Ball.AeroDynamicSlashVFX, 0)
							Tornado_Time = tick()
						end
						if Runtime:FindFirstChild("Tornado") then
							if
								(tick() - Tornado_Time)
								< (Runtime.Tornado:GetAttribute("TornadoTime") or 1) + 0.314159
							then
								return
							end
						end
						if One_Target == tostring(Player) and Curved then
							return
						end
						if Ball:FindFirstChild("ComboCounter") then
							return
						end
						local Singularity_Cape = Player.Character.PrimaryPart:FindFirstChild("SingularityCape")
						if Singularity_Cape then
							return
						end
						if getgenv().InfinityDetection and Infinity then
							return
						end
						if getgenv().DeathSlashDetection and deathshit then
							return
						end
						if getgenv().TimeHoleDetection and timehole then
							return
						end
						if Ball_Target == tostring(Player) and Distance <= Parry_Accuracy then
							if getgenv().AutoAbility and AutoAbility() then
								return
							end
						end
						if Ball_Target == tostring(Player) and Distance <= Parry_Accuracy then
							if getgenv().CooldownProtection and cooldownProtection() then
								return
							end
							local Parry_Time = os.clock()
							local Time_View = Parry_Time - Last_Parry
							if Time_View > 0.5 then
								Auto_Parry.Parry_Animation()
							end
							if getgenv().AutoParryKeypress then
								VirtualInputService:SendKeyEvent(true, Enum.KeyCode.F, false, nil)
							else
								Auto_Parry.Parry(Selected_Parry_Type)
							end
							Last_Parry = Parry_Time
							Parried = true
						end
						local Last_Parrys = tick()
						repeat
							RunService.PreSimulation:Wait()
						until (tick() - Last_Parrys) >= 1 or not Parried
						Parried = false
					end
				end)
			else
				if Connections_Manager["Auto Parry"] then
					Connections_Manager["Auto Parry"]:Disconnect()
					Connections_Manager["Auto Parry"] = nil
				end
			end
		end,
	})
	local dropdown3 = module:create_dropdown({
		title = "First Parry Type",
		flag = "First_Parry_Type",
		options = {
			"F_Key",
			"Left_Click",
			"Navigation",
		},
		multi_dropdown = false,
		maximum_options = 3,
		callback = function(value)
			firstParryType = value
		end,
	})
	local parryTypeMap = {
		["Camera"] = "Camera",
		["Slowball"] = "Slowball",
        ["Fastball"] = "Fastball",
		["Random"] = "Random",
		["Backwards"] = "Backwards",
		["Straight"] = "Straight",
		["High"] = "High",
		["Left"] = "Left",
		["Right"] = "Right",
		["Random Target"] = "RandomTarget",
	}
	local dropdown = module:create_dropdown({
		title = "Parry Type",
		flag = "Parry_Type",
		options = {
			"Camera",
			"Slowball",
            "Fastball",
			"Random",
			"Backwards",
			"Straight",
			"High",
			"Left",
			"Right",
			"Random Target",
		},
		multi_dropdown = false,
		maximum_options = 8,
		callback = function(value: string)
			Selected_Parry_Type = parryTypeMap[value] or value
		end,
	})
	local UserInputService = game:GetService("UserInputService")
	local parryOptions = {
		[Enum.KeyCode.One] = "Camera",
		[Enum.KeyCode.Two] = "Random",
		[Enum.KeyCode.Three] = "Backwards",
		[Enum.KeyCode.Four] = "Straight",
		[Enum.KeyCode.Five] = "High",
		[Enum.KeyCode.Six] = "Left",
		[Enum.KeyCode.Seven] = "Right",
		[Enum.KeyCode.Eight] = "Random Target",
		[Enum.KeyCode.Nine] = "Slowball",
        [Enum.KeyCode.Zero] = "Fastball",
	}
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end
		if not getgenv().HotkeyParryType then
			return
		end
		local newType = parryOptions[input.KeyCode]
		if newType then
			Selected_Parry_Type = parryTypeMap[newType] or newType
			dropdown:update(newType)
			if getgenv().HotkeyParryTypeNotify then
				Library.SendNotification({
					title = "Module Notification",
					text = "Parry Type changed to " .. newType,
					duration = 3,
				})
			end
		end
	end)
	module:create_slider({
		title = "Parry Accuracy",
		flag = "Parry_Accuracy",
		maximum_value = 100,
		minimum_value = 1,
		value = 100,
		round_number = true,
		callback = function(value: boolean)
			Speed_Divisor_Multiplier = 0.7 + (value - 1) * (0.35 / 99)
		end,
	})
	module:create_divider({})
	module:create_checkbox({
		title = "Randomized Parry Accuracy",
		flag = "Random_Parry_Accuracy",
		callback = function(value: boolean)
			getgenv().RandomParryAccuracyEnabled = value
			if value then
				getgenv().RandomParryAccuracyEnabled = value
			end
		end,
	})
	module:create_checkbox({
		title = "Infinity Detection",
		flag = "Infinity_Detection",
		callback = function(value: boolean)
			if value then
				getgenv().InfinityDetection = value
			end
		end,
	})
	module:create_checkbox({
		title = "Dribble Detection",
		flag = "Dirbble_detection",
		callback = function(state)
			
		end
	})
	module:create_checkbox({
		title = "Death Slash Detection",
		flag = "DeathSlash_Detection",
		callback = function(value: boolean)
			getgenv().DeathSlashDetection = value
		end,
	})
	module:create_checkbox({
		title = "Time Hole Detection",
		flag = "TimeHole_Detection",
		callback = function(value: boolean)
			getgenv().TimeHoleDetection = value
		end,
	})
	module:create_checkbox({
		title = "Slash Of Fury Detection",
		flag = "SlashOfFuryDetection",
		callback = function(value: boolean)
			getgenv().SlashOfFuryDetection = value
		end,
	})
	module:create_checkbox({
		title = "Anti Phantom",
		flag = "Anti_Phantom",
		callback = function(value: boolean)
			getgenv().PhantomV2Detection = value
		end,
	})
	module:create_checkbox({
		title = "Cooldown Protection",
		flag = "CooldownProtection",
		callback = function(value: boolean)
			getgenv().CooldownProtection = value
		end,
	})
	module:create_checkbox({
		title = "Auto Ability",
		flag = "AutoAbility",
		callback = function(value: boolean)
			getgenv().AutoAbility = value
		end,
	})
	module:create_checkbox({
		title = "Keypress",
		flag = "Auto_Parry_Keypress",
		callback = function(value: boolean)
			getgenv().AutoParryKeypress = value
		end,
	})
	module:create_checkbox({
		title = "Notify",
		flag = "Auto_Parry_Notify",
		callback = function(value: boolean)
			getgenv().AutoParryNotify = value
		end,
	})
	local SpamParry = rage:create_module({
		title = "Auto Spam Parry",
		flag = "Auto_Spam_Parry",
		description = "Automatically spam parries ball",
		section = "right",
		callback = function(value: boolean)
			if getgenv().AutoSpamNotify then
				if value then
					Library.SendNotification({
						title = "Module Notification",
						text = "Auto Spam Parry turned ON",
						duration = 3,
					})
				else
					Library.SendNotification({
						title = "Module Notification",
						text = "Auto Spam Parry turned OFF",
						duration = 3,
					})
				end
			end
			if value then
				Connections_Manager["Auto Spam"] = RunService.PreSimulation:Connect(function()
					local Ball = Auto_Parry.Get_Ball()
					if not Ball then
						return
					end
					local Zoomies = Ball:FindFirstChild("zoomies")
					if not Zoomies then
						return
					end
					Auto_Parry.Closest_Player()
					local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
					local Ping_Threshold = math.clamp(Ping / 10, 1, 16)
					local Ball_Target = Ball:GetAttribute("target")
					local Ball_Properties = Auto_Parry:Get_Ball_Properties()
					local Entity_Properties = Auto_Parry:Get_Entity_Properties()
					local Spam_Accuracy = Auto_Parry.Spam_Service({
						Ball_Properties = Ball_Properties,
						Entity_Properties = Entity_Properties,
						Ping = Ping_Threshold,
					})
					local Target_Position = Closest_Entity.PrimaryPart.Position
					local Target_Distance = Player:DistanceFromCharacter(Target_Position)
					local Direction = (Player.Character.PrimaryPart.Position - Ball.Position).Unit
					local Ball_Direction = Zoomies.VectorVelocity.Unit
					local Dot = Direction:Dot(Ball_Direction)
					local Distance = Player:DistanceFromCharacter(Ball.Position)
					if not Ball_Target then
						return
					end
					if Target_Distance > Spam_Accuracy or Distance > Spam_Accuracy then
						return
					end
					local Pulsed = Player.Character:GetAttribute("Pulsed")
					if Pulsed then
						return
					end
					if Ball_Target == tostring(Player) and Target_Distance > 30 and Distance > 30 then
						return
					end
					local threshold = ParryThreshold
					if Distance <= Spam_Accuracy and Parries > threshold then
						if getgenv().SpamParryKeypress then
							if Distance > Spam_Accuracy or Target_Distance > Spam_Accuracy then
								return
							end
							VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
						else
							Auto_Parry.Parry(Selected_Parry_Type)
						end
					end
				end)
			else
				if Connections_Manager["Auto Spam"] then
					Connections_Manager["Auto Spam"]:Disconnect()
					Connections_Manager["Auto Spam"] = nil
				end
			end
		end,
	})
	local dropdown2 = SpamParry:create_dropdown({
		title = "Parry Type",
		flag = "Spam_Parry_Type",
		options = {
			"Legit",
			"Blatant",
		},
		multi_dropdown = false,
		maximum_options = 2,
		callback = function(value: string) end,
	})
	SpamParry:create_slider({
		title = "Parry Threshold",
		flag = "Parry_Threshold",
		maximum_value = 3,
		minimum_value = 1,
		value = 2.5,
		round_number = false,
		callback = function(value: number)
			ParryThreshold = value
		end,
	})
	SpamParry:create_divider({})
	if not isMobile then
		local AnimationFix = SpamParry:create_checkbox({
			title = "Animation Fix",
			flag = "AnimationFix",
			callback = function(value: boolean)
				if value then
					Connections_Manager["Animation Fix"] = RunService.PreSimulation:Connect(function()
						local Ball = Auto_Parry.Get_Ball()
						if not Ball then
							return
						end
						local Zoomies = Ball:FindFirstChild("zoomies")
						if not Zoomies then
							return
						end
						Auto_Parry.Closest_Player()
						local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
						local Ping_Threshold = math.clamp(Ping / 10, 1, 16)
						local Ball_Target = Ball:GetAttribute("target")
						local Ball_Properties = Auto_Parry:Get_Ball_Properties()
						local Entity_Properties = Auto_Parry:Get_Entity_Properties()
						local Spam_Accuracy = Auto_Parry.Spam_Service({
							Ball_Properties = Ball_Properties,
							Entity_Properties = Entity_Properties,
							Ping = Ping_Threshold,
						})
						local Target_Position = Closest_Entity.PrimaryPart.Position
						local Target_Distance = Player:DistanceFromCharacter(Target_Position)
						local Direction = (Player.Character.PrimaryPart.Position - Ball.Position).Unit
						local Ball_Direction = Zoomies.VectorVelocity.Unit
						local Dot = Direction:Dot(Ball_Direction)
						local Distance = Player:DistanceFromCharacter(Ball.Position)
						if not Ball_Target then
							return
						end
						if Target_Distance > Spam_Accuracy or Distance > Spam_Accuracy then
							return
						end
						local Pulsed = Player.Character:GetAttribute("Pulsed")
						if Pulsed then
							return
						end
						if Ball_Target == tostring(Player) and Target_Distance > 30 and Distance > 30 then
							return
						end
						local threshold = ParryThreshold
						if Distance <= Spam_Accuracy and Parries > threshold then
							if Distance > Spam_Accuracy or Target_Distance > Spam_Accuracy then
								return
							end
							if tick() - (Last_Parry or 0) < 0.1 then
								return
							end
							Last_Parry = tick()
							VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
						end
					end)
				else
					if Connections_Manager["Animation Fix"] then
						Connections_Manager["Animation Fix"]:Disconnect()
						Connections_Manager["Animation Fix"] = nil
					end
				end
			end,
		})
		AnimationFix:change_state(true)
	end
	SpamParry:create_checkbox({
		title = "Keypress",
		flag = "Auto_Spam_Parry_Keypress",
		callback = function(value: boolean)
			getgenv().SpamParryKeypress = value
		end,
	})
	SpamParry:create_checkbox({
		title = "Notify",
		flag = "Auto_Spam_Parry_Notify",
		callback = function(value: boolean)
			getgenv().AutoSpamNotify = value
		end,
	})
	local ManualSpam = rage:create_module({
		title = "Manual Spam Parry",
		flag = "Manual_Spam_Parry",
		description = "Manually Spams Parry",
		section = "right",
		callback = function(value: boolean)
			if getgenv().ManualSpamNotify then
				if value then
					Library.SendNotification({
						title = "Module Notification",
						text = "Manual Spam Parry turned ON",
						duration = 3,
					})
				else
					Library.SendNotification({
						title = "Module Notification",
						text = "Manual Spam Parry turned OFF",
						duration = 3,
					})
				end
			end
			if value then
				Connections_Manager["Manual Spam"] = RunService.PreSimulation:Connect(function()
					if getgenv().spamui then
						return
					end
					if getgenv().ManualSpamKeypress then
						VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
					else
						Auto_Parry.Parry(Selected_Parry_Type)
					end
				end)
			else
				if Connections_Manager["Manual Spam"] then
					Connections_Manager["Manual Spam"]:Disconnect()
					Connections_Manager["Manual Spam"] = nil
				end
			end
		end,
	})

    ManualSpam:create_checkbox({
    title = "UI",
    flag = "Manual_Spam_UI",
    callback = function(value: boolean)
        getgenv().spamui = value

        if value then
         
            local manual = Instance.new("ScreenGui")
            manual.Name = "ManualSpamUI"
            manual.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            manual.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			manual.ResetOnSpawn = true

            local pics = Instance.new("Frame")
            pics.Name = "pics"
            pics.Parent = manual
            pics.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            pics.BorderSizePixel = 0
            pics.Position = UDim2.new(0.46, 0, 0.4075, 0)
            pics.Size = UDim2.new(0, 200, 0, 100)

            local UICorner = Instance.new("UICorner")
            UICorner.Parent = pics

            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Parent = pics
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.Size = UDim2.new(0, 200, 0, 100)
            ImageLabel.Image = "rbxassetid://86935148651021"

            local UICorner_2 = Instance.new("UICorner")
            UICorner_2.Parent = ImageLabel

            local TextButton = Instance.new("TextButton")
            TextButton.Parent = pics
            TextButton.BackgroundTransparency = 1
            TextButton.Position = UDim2.new(0, 0, 0.55, 0)
            TextButton.Size = UDim2.new(0, 200, 0, 48)
            TextButton.Font = Enum.Font.FredokaOne
            TextButton.Text = "Manual Spam"
            TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton.TextScaled = true
            TextButton.TextWrapped = true
			
			local TweenService = game:GetService("TweenService")
				local UserInputService = game:GetService("UserInputService")

				local function makeDraggable(frame)
					local dragging = false
					local dragInput, dragStart, startPos

					local function update(input)
						local delta = input.Position - dragStart
						local newPos = UDim2.new(
							startPos.X.Scale,
							startPos.X.Offset + delta.X,
							startPos.Y.Scale,
							startPos.Y.Offset + delta.Y
						)
						
						TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Position = newPos
						}):Play()
					end

					frame.Active = true
					frame.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							dragStart = input.Position
							startPos = frame.Position

							input.Changed:Connect(function()
								if input.UserInputState == Enum.UserInputState.End then
									dragging = false
								end
							end)
						end
					end)

					frame.InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							dragInput = input
						end
					end)

					UserInputService.InputChanged:Connect(function(input)
						if input == dragInput and dragging then
							update(input)
						end
					end)
				end

				
				makeDraggable(pics)
          
            local activated = false
            local function toggle()
                activated = not activated
                TextButton.Text = activated and "Stop" or "Clash Mode"
                if activated then
                    Connections_Manager["Manual Spam UI"] = game:GetService("RunService").Heartbeat:Connect(function()
                        Auto_Parry.Parry(Selected_Parry_Type)
                    end)
                else
                    if Connections_Manager["Manual Spam UI"] then
                        Connections_Manager["Manual Spam UI"]:Disconnect()
                        Connections_Manager["Manual Spam UI"] = nil
                    end
                end
            end
            TextButton.MouseButton1Click:Connect(toggle)

        else
  
            local existingUI = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ManualSpamUI")
            if existingUI then
                existingUI:Destroy()
            end
            if Connections_Manager["Manual Spam UI"] then
                Connections_Manager["Manual Spam UI"]:Disconnect()
                Connections_Manager["Manual Spam UI"] = nil
            end
        end
    end,
})

	if not isMobile then
		local AnimationFix = ManualSpam:create_checkbox({
			title = "Animation Fix",
			flag = "AnimationFix",
			callback = function(value: boolean)
				if value then
					Connections_Manager["Animation Fix"] = RunService.PreSimulation:Connect(function()
						local Ball = Auto_Parry.Get_Ball()
						if not Ball then
							return
						end
						local Zoomies = Ball:FindFirstChild("zoomies")
						if not Zoomies then
							return
						end
						Auto_Parry.Closest_Player()
						local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
						local Ping_Threshold = math.clamp(Ping / 10, 1, 16)
						local Ball_Target = Ball:GetAttribute("target")
						local Ball_Properties = Auto_Parry:Get_Ball_Properties()
						local Entity_Properties = Auto_Parry:Get_Entity_Properties()
						local Spam_Accuracy = Auto_Parry.Spam_Service({
							Ball_Properties = Ball_Properties,
							Entity_Properties = Entity_Properties,
							Ping = Ping_Threshold,
						})
						local Target_Position = Closest_Entity.PrimaryPart.Position
						local Target_Distance = Player:DistanceFromCharacter(Target_Position)
						local Direction = (Player.Character.PrimaryPart.Position - Ball.Position).Unit
						local Ball_Direction = Zoomies.VectorVelocity.Unit
						local Dot = Direction:Dot(Ball_Direction)
						local Distance = Player:DistanceFromCharacter(Ball.Position)
						if not Ball_Target then
							return
						end
						if Target_Distance > Spam_Accuracy or Distance > Spam_Accuracy then
							return
						end
						local Pulsed = Player.Character:GetAttribute("Pulsed")
						if Pulsed then
							return
						end
						if Ball_Target == tostring(Player) and Target_Distance > 30 and Distance > 30 then
							return
						end
						local threshold = ParryThreshold
						if Distance <= Spam_Accuracy and Parries > threshold then
							if Distance > Spam_Accuracy or Target_Distance > Spam_Accuracy then
								return
							end
							if tick() - (Last_Parry or 0) < 0.1 then
								return
							end
							Last_Parry = tick()
							VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
						end
					end)
				else
					if Connections_Manager["Animation Fix"] then
						Connections_Manager["Animation Fix"]:Disconnect()
						Connections_Manager["Animation Fix"] = nil
					end
				end
			end,
		})
		AnimationFix:change_state(true)
	end
	ManualSpam:create_checkbox({
		title = "Keypress",
		flag = "Manual_Spam_Keypress",
		callback = function(value: boolean)
			getgenv().ManualSpamKeypress = value
		end,
	})
	ManualSpam:create_checkbox({
		title = "Notify",
		flag = "Manual_Spam_Parry_Notify",
		callback = function(value: boolean)
			getgenv().ManualSpamNotify = value
		end,
	})
	local Triggerbot = rage:create_module({
		title = "Triggerbot",
		flag = "Triggerbot",
		description = "Instantly hits ball when targeted",
		section = "left",
		callback = function(value: boolean)
			if getgenv().TriggerbotNotify then
				if value then
					Library.SendNotification({
						title = "Module Notification",
						text = "Triggerbot turned ON",
						duration = 3,
					})
				else
					Library.SendNotification({
						title = "Module Notification",
						text = "Triggerbot turned OFF",
						duration = 3,
					})
				end
			end
			if value then
				Connections_Manager["Triggerbot"] = RunService.PreSimulation:Connect(function()
					local Balls = Auto_Parry.Get_Balls()
					for _, Ball in pairs(Balls) do
						if not Ball then
							return
						end
						Ball:GetAttributeChangedSignal("target"):Once(function()
							TriggerbotParried = false
						end)
						if TriggerbotParried then
							return
						end
						local Ball_Target = Ball:GetAttribute("target")
						local Singularity_Cape = Player.Character.PrimaryPart:FindFirstChild("SingularityCape")
						if Singularity_Cape then
							return
						end
						if getgenv().TriggerbotInfinityDetection and Infinity then
							return
						end
						if Ball_Target == tostring(Player) then
							if getgenv().TriggerbotKeypress then
								VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
							else
								Auto_Parry.Parry(Selected_Parry_Type)
							end
							TriggerbotParried = true
						end
						local Triggerbot_Last_Parrys = tick()
						repeat
							RunService.PreSimulation:Wait()
						until (tick() - Triggerbot_Last_Parrys) >= 1 or not TriggerbotParried
						TriggerbotParried = false
					end
				end)
			else
				if Connections_Manager["Triggerbot"] then
					Connections_Manager["Triggerbot"]:Disconnect()
					Connections_Manager["Triggerbot"] = nil
				end
			end
		end,
	})
	Triggerbot:create_checkbox({
		title = "Keypress",
		flag = "Triggerbot_Keypress",
		callback = function(value: boolean)
			getgenv().TriggerbotKeypress = value
		end,
	})
	Triggerbot:create_checkbox({
		title = "Notify",
		flag = "TriggerbotNotify",
		callback = function(value: boolean)
			getgenv().TriggerbotNotify = value
		end,
	})
	local parryTypeList = {
		"Camera",
		"Random",
		"Backwards",
		"Straight",
		"High",
		"Left",
		"Right",
		"Random Target",
		"Slowball",
		"Fastball",
	}
	local currentIndex = 1
	local HotkeyParryType = rage:create_module({
		title = "Hotkey Parry Type [PC]",
		flag = "HotkeyParryType",
		description = "Allows Hotkey Parry Type",
		section = "left",
		callback = function(value: boolean)
			getgenv().HotkeyParryType = value
		end,
	})
	HotkeyParryType:create_checkbox({
		title = "Notify",
		flag = "HotkeyParryTypeNotify",
		callback = function(value: boolean)
			getgenv().HotkeyParryTypeNotify = value
		end,
	})
	local SetCurveModule = rage:create_module({
		title = "Button select curve",
		flag = "SetCurveModule",
		description = "Enable UI to click and change parry type",
		section = "left",
		callback = function(value: boolean)
			if value then
				local gui = Instance.new("ScreenGui")
				gui.Name = "SetCurveUI"
				gui.ResetOnSpawn = false
				gui.Parent = game.CoreGui
				local frame = Instance.new("Frame")
				frame.Name = "MainFrame"
				frame.Position = UDim2.new(0, 20, 0, 20)
				frame.Size = UDim2.new(0, 200, 0, 100)
				frame.BackgroundColor3 = Color3.fromRGB(90, 60, 180)
				frame.BackgroundTransparency = 0.25
				frame.BorderSizePixel = 0
				frame.Active = true
				frame.Draggable = true
				frame.Parent = gui
				local uiCorner = Instance.new("UICorner")
				uiCorner.CornerRadius = UDim.new(0, 12)
				uiCorner.Parent = frame
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Thickness = 2
				uiStroke.Color = Color3.fromRGB(190, 150, 255)
				uiStroke.Transparency = 0.2
				uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				uiStroke.Parent = frame
				local uiGradient = Instance.new("UIGradient")
				uiGradient.Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 60, 180)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 10, 25)),
				})
				uiGradient.Rotation = 0
				uiGradient.Parent = frame
				local button = Instance.new("TextButton")
				button.Name = "SetCurveButton"
				button.Text = "Set Curve"
				button.Size = UDim2.new(0, 160, 0, 40)
				button.Position = UDim2.new(0.5, -80, 0.5, -20)
				button.BackgroundTransparency = 1
				button.BorderSizePixel = 0
				button.Font = Enum.Font.GothamSemibold
				button.TextColor3 = Color3.fromRGB(235, 215, 255)
				button.TextSize = 22
				button.Parent = frame
				button.MouseButton1Click:Connect(function()
					currentIndex += 1
					if currentIndex > #parryTypeList then
						currentIndex = 1
					end
					local newType = parryTypeList[currentIndex]
					Selected_Parry_Type = parryTypeMap and parryTypeMap[newType] or newType
					if dropdown and dropdown.update then
						dropdown:update(newType)
					end
					button.Text = newType
					if getgenv().HotkeyParryTypeNotify then
						Library.SendNotification({
							title = "Module Notification",
							text = "Parry Type changed to " .. newType,
							duration = 3,
						})
					end
				end)
			else
				local existing = game.CoreGui:FindFirstChild("SetCurveUI")
				if existing then
					existing:Destroy()
				end
			end
		end,
	})
	local LobbyAP = rage:create_module({
		title = "Lobby AP",
		flag = "Lobby_AP",
		description = "Auto parries ball in lobby",
		section = "right",
		callback = function(state)
			if getgenv().LobbyAPNotify then
				if state then
					Library.SendNotification({
						title = "Module Notification",
						text = "Lobby AP has been turned ON",
						duration = 3,
					})
				else
					Library.SendNotification({
						title = "Module Notification",
						text = "Lobby AP has been turned OFF",
						duration = 3,
					})
				end
			end
			if state then
				Connections_Manager["Lobby AP"] = RunService.Heartbeat:Connect(function()
					local Ball = Auto_Parry.Lobby_Balls()
					if not Ball then
						return
					end
					local Zoomies = Ball:FindFirstChild("zoomies")
					if not Zoomies then
						return
					end
					Ball:GetAttributeChangedSignal("target"):Once(function()
						Training_Parried = false
					end)
					if Training_Parried then
						return
					end
					local Ball_Target = Ball:GetAttribute("target")
					local Velocity = Zoomies.VectorVelocity
					local Distance = Player:DistanceFromCharacter(Ball.Position)
					local Speed = Velocity.Magnitude
					local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 10
					local LobbyAPcappedSpeedDiff = math.min(math.max(Speed - 9.5, 0), 650)
					local LobbyAPspeed_divisor_base = 2.4 + LobbyAPcappedSpeedDiff * 0.002
					local LobbyAPeffectiveMultiplier = LobbyAP_Speed_Divisor_Multiplier
					if getgenv().LobbyAPRandomParryAccuracyEnabled then
						LobbyAPeffectiveMultiplier = 0.7 + (math.random(1, 100) - 1) * (0.35 / 99)
					end
					local LobbyAPspeed_divisor = LobbyAPspeed_divisor_base * LobbyAPeffectiveMultiplier
					local LobbyAPParry_Accuracys = Ping + math.max(Speed / LobbyAPspeed_divisor, 9.5)
					if Ball_Target == tostring(Player) and Distance <= LobbyAPParry_Accuracys then
						if getgenv().LobbyAPKeypress then
							VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
						else
							Auto_Parry.Parry(Selected_Parry_Type)
						end
						Training_Parried = true
					end
					local Last_Parrys = tick()
					repeat
						RunService.PreSimulation:Wait()
					until (tick() - Last_Parrys) >= 1 or not Training_Parried
					Training_Parried = false
				end)
			else
				if Connections_Manager["Lobby AP"] then
					Connections_Manager["Lobby AP"]:Disconnect()
					Connections_Manager["Lobby AP"] = nil
				end
			end
		end,
	})
	LobbyAP:create_slider({
		title = "Parry Accuracy",
		flag = "Parry_Accuracy",
		maximum_value = 100,
		minimum_value = 1,
		value = 100,
		round_number = true,
		callback = function(value: number)
			LobbyAP_Speed_Divisor_Multiplier = 0.7 + (value - 1) * (0.35 / 99)
		end,
	})
	LobbyAP:create_divider({})
	LobbyAP:create_checkbox({
		title = "Randomized Parry Accuracy",
		flag = "Random_Parry_Accuracy",
		callback = function(value: boolean)
			getgenv().LobbyAPRandomParryAccuracyEnabled = value
		end,
	})
	LobbyAP:create_checkbox({
		title = "Keypress",
		flag = "Lobby_AP_Keypress",
		callback = function(value: boolean)
			getgenv().LobbyAPKeypress = value
		end,
	})
	LobbyAP:create_checkbox({
		title = "Notify",
		flag = "Lobby_AP_Notify",
		callback = function(value: boolean)
			getgenv().LobbyAPNotify = value
		end,
	})
	local plr = game.Players.LocalPlayer
	local cam = workspace.CurrentCamera
	local hit = game.ReplicatedStorage.Remotes.ParryAttempt
	getgenv().originalCameraSubject = nil
	function getspeed(ball)
		if ball then
			if ball:FindFirstChild("zoomies") and ball.zoomies.VectorVelocity then
				return ball.zoomies.VectorVelocity
			end
		else
			for _, b in pairs(workspace.Balls:GetChildren()) do
				if b:FindFirstChild("zoomies") and b.zoomies.VectorVelocity then
					return b.zoomies.VectorVelocity
				end
			end
		end
		return Vector3.new(0, 0, 0)
	end
	function restoreCamera()
		local character = plr.Character
		if character and character:FindFirstChild("Humanoid") then
			cam.CameraSubject = character.Humanoid
		end
	end
	local BallTP = rage:create_module({
		title = "Ball TP",
		flag = "Ball_TP",
		description = "Teleports to the ball",
		section = "left",
		callback = function(value)
			getgenv().BallTPEnabled = value
			if value then
				if plr.Character and plr.Character:FindFirstChild("Humanoid") then
					getgenv().originalCameraSubject = cam.CameraSubject
				end
				Connections_Manager["BallTP_Added"] = workspace.Balls.ChildAdded:Connect(function(v)
					if v:IsA("BasePart") then
						Connections_Manager["BallTP_Changed_" .. v.Name] = v.Changed:Connect(function(prop)
							local c = plr.Character
							if not c then
								return
							end
							local hrp = c:FindFirstChild("HumanoidRootPart")
							if not hrp then
								return
							end
							local speed = getspeed(v)
							if speed then
								if math.abs(speed.X) > math.abs(speed.Z) then
									hrp.CFrame = v.CFrame + Vector3.new(0, 5, 10)
								else
									hrp.CFrame = v.CFrame + Vector3.new(10, 5, 0)
								end
							end
							cam.CameraSubject = v
							if v:GetAttribute("target") == plr.Name then
								while
									v:GetAttribute("target") == plr.Name
									and v
									and c:FindFirstChild("Humanoid")
									and c.Humanoid.Health > 0
								do
									local cnt = 0
									while v:GetAttribute("target") == plr.Name and cnt ~= 20 do
										cnt = cnt + 1
										task.wait()
									end
								end
								task.wait()
							end
						end)
					end
				end)
			else
				for connName, conn in pairs(Connections_Manager) do
					if string.find(connName, "BallTP") then
						conn:Disconnect()
						Connections_Manager[connName] = nil
					end
				end
				restoreCamera()
			end
		end,
	})
	local InstantBallTP = rage:create_module({
		title = "Instant Ball TP",
		flag = "Instant_Ball_TP",
		description = "Instantly teleports to the ball and back.",
		section = "right",
		callback = function(value)
			getgenv().InstantBallTPEnabled = value
			if value then
				if plr.Character and plr.Character:FindFirstChild("Humanoid") then
					getgenv().originalCameraSubject = cam.CameraSubject
				end
				getgenv().originalCFrame = nil
				for _, ball in ipairs(workspace.Balls:GetChildren()) do
					if ball:IsA("BasePart") then
						Connections_Manager["InstantBallTP_Attr_" .. ball.Name] = ball
							:GetAttributeChangedSignal("target")
							:Connect(function()
								handleBallTargetChange(ball)
							end)
					end
				end
				Connections_Manager["InstantBallTP_Added"] = workspace.Balls.ChildAdded:Connect(function(ball)
					if ball:IsA("BasePart") then
						task.wait(0.1)
						if ball:GetAttribute("target") == plr.Name then
							handleBallTargetChange(ball)
						end
						Connections_Manager["InstantBallTP_Attr_" .. ball.Name] = ball
							:GetAttributeChangedSignal("target")
							:Connect(function()
								handleBallTargetChange(ball)
							end)
					end
				end)
			else
				for connName, conn in pairs(Connections_Manager) do
					if string.find(connName, "InstantBallTP") then
						conn:Disconnect()
						Connections_Manager[connName] = nil
					end
				end
				if getgenv().originalCFrame then
					local c = plr.Character
					if c then
						local hrp = c:FindFirstChild("HumanoidRootPart")
						local hum = c:FindFirstChild("Humanoid")
						if hrp and hum then
							hum.PlatformStand = true
							hrp:PivotTo(getgenv().originalCFrame)
							task.wait(0.1)
							hum.PlatformStand = false
						end
					end
					getgenv().originalCFrame = nil
				end
				restoreCamera()
			end
		end,
	})
	function handleBallTargetChange(ball)
		local target = ball:GetAttribute("target")
		local c = plr.Character
		if not c then
			return
		end
		local hrp = c:FindFirstChild("HumanoidRootPart")
		local hum = c:FindFirstChild("Humanoid")
		if not hrp or not hum then
			return
		end
		if target == plr.Name then
			if not getgenv().originalCFrame then
				getgenv().originalCFrame = hrp.CFrame
			end
			local speed = getspeed(ball)
			if speed.Magnitude > 100 then
				task.wait(0.2)
			end
			local offset = Vector3.new(5, 5, 5)
			hum.PlatformStand = true
			hrp:PivotTo(ball.CFrame + offset)
			task.wait(0.1)
			hum.PlatformStand = false
			cam.CameraSubject = ball
		else
			if getgenv().originalCFrame then
				hum.PlatformStand = true
				hrp:PivotTo(getgenv().originalCFrame)
				task.wait(0.1)
				hum.PlatformStand = false
				getgenv().originalCFrame = nil
				restoreCamera()
			end
		end
	end
	local StrafeSpeed = 36
	local Strafe = player:create_module({
		title = "Speed",
		flag = "Speed",
		description = "Changes character speed",
		section = "left",
		callback = function(value)
			if value then
				Connections_Manager["Strafe"] = game:GetService("RunService").PreSimulation:Connect(function()
					local character = game.Players.LocalPlayer.Character
					if character and character:FindFirstChild("Humanoid") then
						character.Humanoid.WalkSpeed = StrafeSpeed
					end
				end)
			else
				local character = game.Players.LocalPlayer.Character
				if character and character:FindFirstChild("Humanoid") then
					character.Humanoid.WalkSpeed = 36
				end
				if Connections_Manager["Strafe"] then
					Connections_Manager["Strafe"]:Disconnect()
					Connections_Manager["Strafe"] = nil
				end
			end
		end,
	})
	Strafe:create_slider({
		title = "Strafe Speed",
		flag = "Strafe_Speed",
		minimum_value = 36,
		maximum_value = 200,
		value = 36,
		round_number = true,
		callback = function(value)
			StrafeSpeed = value
		end,
	})
	local Spinbot = player:create_module({
		title = "Spinbot",
		flag = "Spinbot",
		description = "Spins Player",
		section = "right",
		callback = function(value: boolean)
			getgenv().Spinbot = value
			if value then
				getgenv().spin = true
				getgenv().spinSpeed = getgenv().spinSpeed or 1
				local Players = game:GetService("Players")
				local RunService = game:GetService("RunService")
				local Client = Players.LocalPlayer
				local function spinCharacter()
					while getgenv().spin do
						RunService.Heartbeat:Wait()
						local char = Client.Character
						local funcHRP = char and char:FindFirstChild("HumanoidRootPart")
						if char and funcHRP then
							funcHRP.CFrame *= CFrame.Angles(0, getgenv().spinSpeed, 0)
						end
					end
				end
				if not getgenv().spinThread then
					getgenv().spinThread = coroutine.create(spinCharacter)
					coroutine.resume(getgenv().spinThread)
				end
			else
				getgenv().spin = false
				if getgenv().spinThread then
					getgenv().spinThread = nil
				end
			end
		end,
	})
	Spinbot:create_slider({
		title = "Spinbot Speed",
		flag = "Spinbot_Speed",
		maximum_value = 100,
		minimum_value = 1,
		value = 1,
		round_number = true,
		callback = function(value)
			getgenv().spinSpeed = math.rad(value)
		end,
	})
	local CameraToggle = player:create_module({
		title = "Field of View",
		flag = "Field_Of_View",
		description = "Changes Camera POV",
		section = "left",
		callback = function(value)
			getgenv().CameraEnabled = value
			local Camera = game:GetService("Workspace").CurrentCamera
			if value then
				getgenv().CameraFOV = getgenv().CameraFOV or 70
				Camera.FieldOfView = getgenv().CameraFOV
				if not getgenv().FOVLoop then
					getgenv().FOVLoop = game:GetService("RunService").RenderStepped:Connect(function()
						if getgenv().CameraEnabled then
							Camera.FieldOfView = getgenv().CameraFOV
						end
					end)
				end
			else
				Camera.FieldOfView = 70
				if getgenv().FOVLoop then
					getgenv().FOVLoop:Disconnect()
					getgenv().FOVLoop = nil
				end
			end
		end,
	})
	CameraToggle:create_slider({
		title = "Camera FOV",
		flag = "Camera_FOV",
		maximum_value = 120,
		minimum_value = 50,
		value = 70,
		round_number = true,
		callback = function(value)
			getgenv().CameraFOV = value
			if getgenv().CameraEnabled then
				game:GetService("Workspace").CurrentCamera.FieldOfView = value
			end
		end,
	})
	local Animations = player:create_module({
		title = "Emotes",
		flag = "Emotes",
		description = "Custom Emotes",
		section = "right",
		callback = function(value)
			getgenv().Animations = value
			if value then
				Connections_Manager["Animations"] = RunService.Heartbeat:Connect(function()
					if not Player.Character or not Player.Character.PrimaryPart then
						return
					end
					local Speed = Player.Character.PrimaryPart.AssemblyLinearVelocity.Magnitude
					if Speed > 30 then
						if Animation.track and not getgenv().LoopEmote then
							Animation.track:Stop()
							Animation.track:Destroy()
							Animation.track = nil
						end
					else
						if not Animation.track and Animation.current then
							Auto_Parry.Play_Animation(Animation.current)
						end
					end
				end)
			else
				if Animation.track then
					Animation.track:Stop()
					Animation.track:Destroy()
					Animation.track = nil
				end
				if Connections_Manager["Animations"] then
					Connections_Manager["Animations"]:Disconnect()
					Connections_Manager["Animations"] = nil
				end
			end
		end,
	})
	Animations:create_checkbox({
		title = "Loop Emote",
		flag = "Loop_Emote",
		default = false,
		callback = function(value)
			getgenv().LoopEmote = value
		end,
	})
	local selected_animation = Emotes_Data[1]
	local AnimationChoice = Animations:create_dropdown({
		title = "Animation Type",
		flag = "Selected_Animation",
		options = Emotes_Data,
		multi_dropdown = false,
		maximum_options = #Emotes_Data,
		callback = function(value)
			selected_animation = value
			if getgenv().Animations then
				Auto_Parry.Play_Animation(value)
			end
		end,
	})
	AnimationChoice:update(selected_animation)
	_G.PlayerCosmeticsCleanup = {}
	local PlayerCosmetics = player:create_module({
		title = "Player Cosmetics",
		flag = "Player_Cosmetics",
		description = "Apply headless and korblox",
		section = "left",
		callback = function(value: boolean)
			local players = game:GetService("Players")
			local lp = players.LocalPlayer
			local function applyKorblox(character)
				local rightLeg = character:FindFirstChild("RightLeg") or character:FindFirstChild("Right Leg")
				if not rightLeg then
					warn("Right leg not found on character")
					return
				end
				for _, child in pairs(rightLeg:GetChildren()) do
					if child:IsA("SpecialMesh") then
						child:Destroy()
					end
				end
				local specialMesh = Instance.new("SpecialMesh")
				specialMesh.MeshId = "rbxassetid://101851696"
				specialMesh.TextureId = "rbxassetid://115727863"
				specialMesh.Scale = Vector3.new(1, 1, 1)
				specialMesh.Parent = rightLeg
			end
			local function saveRightLegProperties(char)
				if char then
					local rightLeg = char:FindFirstChild("RightLeg") or char:FindFirstChild("Right Leg")
					if rightLeg then
						local originalMesh = rightLeg:FindFirstChildOfClass("SpecialMesh")
						if originalMesh then
							_G.PlayerCosmeticsCleanup.originalMeshId = originalMesh.MeshId
							_G.PlayerCosmeticsCleanup.originalTextureId = originalMesh.TextureId
							_G.PlayerCosmeticsCleanup.originalScale = originalMesh.Scale
						else
							_G.PlayerCosmeticsCleanup.hadNoMesh = true
						end
						_G.PlayerCosmeticsCleanup.rightLegChildren = {}
						for _, child in pairs(rightLeg:GetChildren()) do
							if child:IsA("SpecialMesh") then
								table.insert(_G.PlayerCosmeticsCleanup.rightLegChildren, {
									ClassName = child.ClassName,
									Properties = {
										MeshId = child.MeshId,
										TextureId = child.TextureId,
										Scale = child.Scale,
									},
								})
							end
						end
					end
				end
			end
			local function restoreRightLeg(char)
				if char then
					local rightLeg = char:FindFirstChild("RightLeg") or char:FindFirstChild("Right Leg")
					if rightLeg and _G.PlayerCosmeticsCleanup.rightLegChildren then
						for _, child in pairs(rightLeg:GetChildren()) do
							if child:IsA("SpecialMesh") then
								child:Destroy()
							end
						end
						if _G.PlayerCosmeticsCleanup.hadNoMesh then
							return
						end
						for _, childData in ipairs(_G.PlayerCosmeticsCleanup.rightLegChildren) do
							if childData.ClassName == "SpecialMesh" then
								local newMesh = Instance.new("SpecialMesh")
								newMesh.MeshId = childData.Properties.MeshId
								newMesh.TextureId = childData.Properties.TextureId
								newMesh.Scale = childData.Properties.Scale
								newMesh.Parent = rightLeg
							end
						end
					end
				end
			end
			if value then
				CosmeticsActive = true
				getgenv().Config = {
					Headless = true,
				}
				if lp.Character then
					local head = lp.Character:FindFirstChild("Head")
					if head and getgenv().Config.Headless then
						_G.PlayerCosmeticsCleanup.headTransparency = head.Transparency
						local decal = head:FindFirstChildOfClass("Decal")
						if decal then
							_G.PlayerCosmeticsCleanup.faceDecalId = decal.Texture
							_G.PlayerCosmeticsCleanup.faceDecalName = decal.Name
						end
					end
					saveRightLegProperties(lp.Character)
					applyKorblox(lp.Character)
				end
				_G.PlayerCosmeticsCleanup.characterAddedConn = lp.CharacterAdded:Connect(function(char)
    
   				 local head = char:WaitForChild("Head", 5)
    			if head and getgenv().Config.Headless then
        		_G.PlayerCosmeticsCleanup.headTransparency = head.Transparency
       			 local decal = head:FindFirstChildOfClass("Decal")
       		 if decal then
            _G.PlayerCosmeticsCleanup.faceDecalId = decal.Texture
            _G.PlayerCosmeticsCleanup.faceDecalName = decal.Name
       	 end
    	end

    
    				local rightLeg = char:WaitForChild("RightLeg", 0.1) or char:WaitForChild("Right Leg", 0.1)
   			 		if rightLeg then
       		 		applyKorblox(char)
  		  		else
       		 		warn("RightLeg not found after respawn!")
   		 		end
			end)
				if getgenv().Config.Headless then
					headLoop = task.spawn(function()
						while CosmeticsActive do
							local char = lp.Character
							if char then
								local head = char:FindFirstChild("Head")
								if head then
									head.Transparency = 1
									local decal = head:FindFirstChildOfClass("Decal")
									if decal then
										decal:Destroy()
									end
								end
							end
							task.wait(0.1)
						end
					end)
				end
			else
				CosmeticsActive = false
				if _G.PlayerCosmeticsCleanup.characterAddedConn then
					_G.PlayerCosmeticsCleanup.characterAddedConn:Disconnect()
					_G.PlayerCosmeticsCleanup.characterAddedConn = nil
				end
				if headLoop then
					task.cancel(headLoop)
					headLoop = nil
				end
				local char = lp.Character
				if char then
					local head = char:FindFirstChild("Head")
					if head and _G.PlayerCosmeticsCleanup.headTransparency ~= nil then
						head.Transparency = _G.PlayerCosmeticsCleanup.headTransparency
						if _G.PlayerCosmeticsCleanup.faceDecalId then
							local newDecal = head:FindFirstChildOfClass("Decal") or Instance.new("Decal", head)
							newDecal.Name = _G.PlayerCosmeticsCleanup.faceDecalName or "face"
							newDecal.Texture = _G.PlayerCosmeticsCleanup.faceDecalId
							newDecal.Face = Enum.NormalId.Front
						end
					end
					restoreRightLeg(char)
				end
				_G.PlayerCosmeticsCleanup = {}
			end
		end,
	})
	local fly = player:create_module({
		title = "Fly",
		flag = "Fly",
		description = "Allows the player to fly",
		section = "right",
		callback = function(value: boolean)
			if value then
				getgenv().FlyEnabled = true
				local char = Player.Character or Player.CharacterAdded:Wait()
				local hrp = char:WaitForChild("HumanoidRootPart")
				local humanoid = char:WaitForChild("Humanoid")
				getgenv().OriginalStateType = humanoid:GetState()
				getgenv().RagdollHandler = humanoid.StateChanged:Connect(function(oldState, newState)
					if getgenv().FlyEnabled then
						if newState == Enum.HumanoidStateType.Physics or newState == Enum.HumanoidStateType.Ragdoll then
							task.defer(function()
								humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
								humanoid:ChangeState(Enum.HumanoidStateType.Running)
							end)
						end
					end
				end)
				local bodyGyro = Instance.new("BodyGyro")
				bodyGyro.P = 90000
				bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
				bodyGyro.Parent = hrp
				local bodyVelocity = Instance.new("BodyVelocity")
				bodyVelocity.Velocity = Vector3.new(0, 0, 0)
				bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
				bodyVelocity.Parent = hrp
				humanoid.PlatformStand = true
				getgenv().ResetterConnection = RunService.Heartbeat:Connect(function()
					if not getgenv().FlyEnabled then
						return
					end
					if bodyGyro and bodyGyro.Parent then
						bodyGyro.P = 90000
						bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
					end
					if bodyVelocity and bodyVelocity.Parent then
						bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
					end
					humanoid.PlatformStand = true
					if not bodyGyro.Parent or not bodyVelocity.Parent then
						if bodyGyro then
							bodyGyro:Destroy()
						end
						if bodyVelocity then
							bodyVelocity:Destroy()
						end
						bodyGyro = Instance.new("BodyGyro")
						bodyGyro.P = 90000
						bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
						bodyGyro.Parent = hrp
						bodyVelocity = Instance.new("BodyVelocity")
						bodyVelocity.Velocity = Vector3.new(0, 0, 0)
						bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
						bodyVelocity.Parent = hrp
					end
				end)
				getgenv().FlyConnection = RunService.RenderStepped:Connect(function()
					if not getgenv().FlyEnabled then
						return
					end
					local camCF = workspace.CurrentCamera.CFrame
					local moveDir = Vector3.new(0, 0, 0)
					if UserInputService:IsKeyDown(Enum.KeyCode.W) then
						moveDir = moveDir + camCF.LookVector
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.S) then
						moveDir = moveDir - camCF.LookVector
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.A) then
						moveDir = moveDir - camCF.RightVector
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.D) then
						moveDir = moveDir + camCF.RightVector
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.E) then
						moveDir = moveDir + Vector3.new(0, 1, 0)
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
						moveDir = moveDir - Vector3.new(0, 1, 0)
					end
					if moveDir.Magnitude > 0 then
						moveDir = moveDir.Unit
					end
					bodyVelocity.Velocity = moveDir * (getgenv().FlySpeed or 50)
					bodyGyro.CFrame = camCF
				end)
			else
				getgenv().FlyEnabled = false
				if getgenv().FlyConnection then
					getgenv().FlyConnection:Disconnect()
					getgenv().FlyConnection = nil
				end
				if getgenv().RagdollHandler then
					getgenv().RagdollHandler:Disconnect()
					getgenv().RagdollHandler = nil
				end
				if getgenv().ResetterConnection then
					getgenv().ResetterConnection:Disconnect()
					getgenv().ResetterConnection = nil
				end
				local char = Player.Character
				if char then
					local hrp = char:FindFirstChild("HumanoidRootPart")
					local humanoid = char:FindFirstChild("Humanoid")
					if humanoid then
						humanoid.PlatformStand = false
						if getgenv().OriginalStateType then
							humanoid:ChangeState(getgenv().OriginalStateType)
						end
					end
					if hrp then
						for _, v in ipairs(hrp:GetChildren()) do
							if v:IsA("BodyGyro") or v:IsA("BodyVelocity") then
								v:Destroy()
							end
						end
					end
				end
			end
		end,
	})
	fly:create_slider({
		title = "Fly Speed",
		flag = "Fly_Speed",
		minimum_value = 10,
		maximum_value = 200,
		value = 50,
		round_number = true,
		callback = function(value: number)
			getgenv().FlySpeed = value
		end,
	})
	local localPlayer = Players.LocalPlayer
	local SelectedPlayerFollow = nil
	local followDropdown
	local function getPlayerNames()
		local names = {}
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer then
				table.insert(names, player.Name)
			end
		end
		return names
	end
	local function updateFollowTarget()
		local availablePlayers = getPlayerNames()
		if #availablePlayers > 0 then
			SelectedPlayerFollow = availablePlayers[1]
			if followDropdown then
				followDropdown:update(SelectedPlayerFollow)
			end
		else
			SelectedPlayerFollow = nil
		end
	end
	local PlayerFollow = player:create_module({
		title = "Player Follow",
		flag = "Player_Follow",
		description = "Follows the selected player",
		section = "left",
		callback = function(value)
			if value then
				getgenv().PlayerFollowEnabled = true
				getgenv().PlayerFollowConnection = RunService.Heartbeat:Connect(function()
					if not SelectedPlayerFollow then
						return
					end
					local targetPlayer = Players:FindFirstChild(SelectedPlayerFollow)
					if targetPlayer and targetPlayer.Character and targetPlayer.Character.PrimaryPart then
						local char = localPlayer.Character
						if char then
							local humanoid = char:FindFirstChild("Humanoid")
							if humanoid then
								humanoid:MoveTo(targetPlayer.Character.PrimaryPart.Position)
							end
						end
					end
				end)
			else
				getgenv().PlayerFollowEnabled = false
				if getgenv().PlayerFollowConnection then
					getgenv().PlayerFollowConnection:Disconnect()
					getgenv().PlayerFollowConnection = nil
				end
			end
		end,
	})
	local initialOptions = getPlayerNames()
	if #initialOptions > 0 then
		followDropdown = PlayerFollow:create_dropdown({
			title = "Follow Target",
			flag = "Follow_Target",
			options = initialOptions,
			multi_dropdown = false,
			maximum_options = #initialOptions,
			callback = function(value)
				if value then
					SelectedPlayerFollow = value
					if getgenv().FollowNotifyEnabled then
						Library.SendNotification({
							title = "Module Notification",
							text = "Now following: " .. value,
							duration = 3,
						})
					end
				end
			end,
		})
		SelectedPlayerFollow = initialOptions[1]
		followDropdown:update(SelectedPlayerFollow)
		getgenv().FollowDropdown = followDropdown
	else
		SelectedPlayerFollow = nil
	end
	local lastOptionsString = table.concat(initialOptions, ",")
	local updateTimer = 0
	RunService.Heartbeat:Connect(function(dt)
		updateTimer = updateTimer + dt
		if updateTimer >= 10 then
			local newOptions = getPlayerNames()
			table.sort(newOptions)
			local newOptionsString = table.concat(newOptions, ",")
			if newOptionsString ~= lastOptionsString then
				if followDropdown then
					if #newOptions > 0 then
						if followDropdown.set_options then
							followDropdown:set_options(newOptions)
						else
							followDropdown.maximum_options = #newOptions
						end
						if not table.find(newOptions, SelectedPlayerFollow) then
							SelectedPlayerFollow = newOptions[1]
							followDropdown:update(SelectedPlayerFollow)
						end
					else
						SelectedPlayerFollow = nil
					end
				end
				lastOptionsString = newOptionsString
			end
			updateTimer = 0
		end
	end)
	PlayerFollow:create_checkbox({
		title = "Notify",
		flag = "Follow_Notify",
		default = false,
		callback = function(value)
			getgenv().FollowNotifyEnabled = value
		end,
	})
	local HitSounds = player:create_module({
		title = "Hit Sounds",
		flag = "Hit_Sounds",
		description = "Toggles hit sounds",
		section = "right",
		callback = function(value)
			hit_Sound_Enabled = value
		end,
	})
	local Folder = Instance.new("Folder")
	Folder.Name = "Useful Utility"
	Folder.Parent = workspace
	local hit_Sound = Instance.new("Sound", Folder)
	hit_Sound.Volume = 6
	local hitSoundOptions = {
		"Medal",
		"Fatality",
		"Skeet",
		"Switches",
		"Rust Headshot",
		"Neverlose Sound",
		"Bubble",
		"Laser",
		"Steve",
		"Call of Duty",
		"Bat",
		"TF2 Critical",
		"Saber",
		"Bameware",
	}
	local hitSoundIds = {
		Medal = "rbxassetid://6607336718",
		Fatality = "rbxassetid://6607113255",
		Skeet = "rbxassetid://6607204501",
		Switches = "rbxassetid://6607173363",
		["Rust Headshot"] = "rbxassetid://138750331387064",
		["Neverlose Sound"] = "rbxassetid://110168723447153",
		Bubble = "rbxassetid://6534947588",
		Laser = "rbxassetid://7837461331",
		Steve = "rbxassetid://4965083997",
		["Call of Duty"] = "rbxassetid://5952120301",
		Bat = "rbxassetid://3333907347",
		["TF2 Critical"] = "rbxassetid://296102734",
		Saber = "rbxassetid://8415678813",
		Bameware = "rbxassetid://3124331820",
	}
	HitSounds:create_slider({
		title = "Volume",
		flag = "HitSoundVolume",
		minimum_value = 1,
		maximum_value = 10,
		value = 5,
		callback = function(value)
			hit_Sound.Volume = value
		end,
	})
	HitSounds:create_dropdown({
		title = "Hit Sound Type",
		flag = "hit_sound_type",
		options = hitSoundOptions,
		maximum_options = #hitSoundOptions,
		multi_dropdown = false,
		callback = function(selectedOption)
			if hitSoundIds[selectedOption] then
				hit_Sound.SoundId = hitSoundIds[selectedOption]
			else
				warn("Invalid hit sound selection: " .. tostring(selectedOption))
			end
		end,
	})
	ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
		if hit_Sound_Enabled then
			hit_Sound:Play()
		end
	end)
	local soundOptions = {
		["Eeyuh"] = "rbxassetid://16190782181",
		["Sweep"] = "rbxassetid://103508936658553",
		["Bounce"] = "rbxassetid://134818882821660",
		["Everybody Wants To Rule The World"] = "rbxassetid://87209527034670",
		["Missing Money"] = "rbxassetid://134668194128037",
		["Sour Grapes"] = "rbxassetid://117820392172291",
		["Erwachen"] = "rbxassetid://124853612881772",
		["Grasp the Light"] = "rbxassetid://89549155689397",
		["Beyond the Shadows"] = "rbxassetid://120729792529978",
		["Rise to the Horizon"] = "rbxassetid://72573266268313",
		["Echoes of the Candy Kingdom"] = "rbxassetid://103040477333590",
		["Speed"] = "rbxassetid://125550253895893",
		["Lo-fi Chill A"] = "rbxassetid://9043887091",
		["Lo-fi Ambient"] = "rbxassetid://129775776987523",
		["Tears in the Rain"] = "rbxassetid://129710845038263",
	}
	local currentSound = Instance.new("Sound")
	currentSound.Volume = 3
	currentSound.Looped = false
	currentSound.Parent = game:GetService("SoundService")
	local soundModule
	local function playSoundById(soundId)
		currentSound:Stop()
		currentSound.SoundId = soundId
		currentSound:Play()
	end
	local selectedSound = "Eeyuh"
	local soundModule = world:create_module({
		title = "Sound Controller",
		flag = "sound_controller",
		description = "Control background music and sounds",
		section = "left",
		callback = function(value)
			getgenv().soundmodule = value
			if value then
				playSoundById(soundOptions[selectedSound])
			else
				currentSound:Stop()
			end
		end,
	})
	soundModule:create_checkbox({
		title = "Loop Song",
		flag = "LoopSong",
		callback = function(value)
			currentSound.Looped = value
		end,
	})
	soundModule:create_slider({
		title = "Volume",
		flag = "HitSoundVolume",
		minimum_value = 1,
		maximum_value = 10,
		value = 3,
		callback = function(value)
			currentSound.Volume = value
		end,
	})
	soundModule:create_divider({})
	soundModule:create_dropdown({
		title = "Select Sound",
		flag = "sound_selection",
		options = {
			"Eeyuh",
			"Sweep",
			"Bounce",
			"Everybody Wants To Rule The World",
			"Missing Money",
			"Sour Grapes",
			"Erwachen",
			"Grasp the Light",
			"Beyond the Shadows",
			"Rise to the Horizon",
			"Echoes of the Candy Kingdom",
			"Speed",
			"Lo-fi Chill A",
			"Lo-fi Ambient",
			"Tears in the Rain",
		},
		multi_dropdown = false,
		maximum_options = 15,
		callback = function(value)
			selectedSound = value
			if getgenv().soundmodule then
				playSoundById(soundOptions[value])
			end
		end,
	})
	local WorldFilter = world:create_module({
		title = "Filter",
		flag = "Filter",
		description = "Toggles custom world filter effects",
		section = "right",
		callback = function(value)
			getgenv().WorldFilterEnabled = value
			if not value then
				if game.Lighting:FindFirstChild("CustomAtmosphere") then
					game.Lighting.CustomAtmosphere:Destroy()
				end
				game.Lighting.FogEnd = 100000
				game.Lighting.ColorCorrection.TintColor = Color3.new(1, 1, 1)
				game.Lighting.ColorCorrection.Saturation = 0
			end
		end,
	})
	WorldFilter:create_checkbox({
		title = "Enable Atmosphere",
		flag = "World_Filter_Atmosphere",
		callback = function(value)
			getgenv().AtmosphereEnabled = value
			if value then
				if not game.Lighting:FindFirstChild("CustomAtmosphere") then
					local atmosphere = Instance.new("Atmosphere")
					atmosphere.Name = "CustomAtmosphere"
					atmosphere.Parent = game.Lighting
				end
			else
				if game.Lighting:FindFirstChild("CustomAtmosphere") then
					game.Lighting.CustomAtmosphere:Destroy()
				end
			end
		end,
	})
	WorldFilter:create_slider({
		title = "Atmosphere Density",
		flag = "World_Filter_Atmosphere_Slider",
		minimum_value = 0,
		maximum_value = 1,
		value = 0.5,
		callback = function(value)
			if getgenv().AtmosphereEnabled and game.Lighting:FindFirstChild("CustomAtmosphere") then
				game.Lighting.CustomAtmosphere.Density = value
			end
		end,
	})
	WorldFilter:create_checkbox({
		title = "Enable Fog",
		flag = "World_Filter_Fog",
		callback = function(value)
			getgenv().FogEnabled = value
			if not value then
				game.Lighting.FogEnd = 100000
			end
		end,
	})
	WorldFilter:create_slider({
		title = "Fog Distance",
		flag = "World_Filter_Fog_Slider",
		minimum_value = 50,
		maximum_value = 10000,
		value = 1000,
		callback = function(value)
			if getgenv().FogEnabled then
				game.Lighting.FogEnd = value
			end
		end,
	})
	WorldFilter:create_checkbox({
		title = "Enable Saturation",
		flag = "World_Filter_Saturation",
		callback = function(value)
			getgenv().SaturationEnabled = value
			if not value then
				game.Lighting.ColorCorrection.Saturation = 0
			end
		end,
	})
	WorldFilter:create_slider({
		title = "Saturation Level",
		flag = "World_Filter_Saturation_Slider",
		minimum_value = -1,
		maximum_value = 1,
		value = 0,
		callback = function(value)
			if getgenv().SaturationEnabled then
				game.Lighting.ColorCorrection.Saturation = value
			end
		end,
	})
	WorldFilter:create_checkbox({
		title = "Enable Hue",
		flag = "World_Filter_Hue",
		callback = function(value)
			getgenv().HueEnabled = value
			if not value then
				game.Lighting.ColorCorrection.TintColor = Color3.new(1, 1, 1)
			end
		end,
	})
	WorldFilter:create_slider({
		title = "Hue Shift",
		flag = "World_Filter_Hue_Slider",
		minimum_value = -1,
		maximum_value = 1,
		value = 0,
		callback = function(value)
			if getgenv().HueEnabled then
				game.Lighting.ColorCorrection.TintColor = Color3.fromHSV(value, 1, 1)
			end
		end,
	})
	local BallTrail = world:create_module({
		title = "Ball Trail",
		flag = "Ball_Trail",
		description = "Toggles ball trail effects",
		section = "left",
		callback = function(value)
			getgenv().BallTrailEnabled = value
		end,
	})
	BallTrail:create_slider({
		title = "Ball Trail Hue",
		flag = "Ball_Trail_Hue",
		minimum_value = 0,
		maximum_value = 360,
		value = 0,
		round_number = true,
		callback = function(value)
			if not getgenv().BallTrailRainbowEnabled then
				local newColor = Color3.fromHSV(value / 360, 1, 1)
				getgenv().BallTrailColor = newColor
			end
		end,
	})
	BallTrail:create_checkbox({
		title = "Rainbow Trail",
		flag = "Ball_Trail_Rainbow",
		callback = function(value)
			getgenv().BallTrailRainbowEnabled = value
		end,
	})
	BallTrail:create_checkbox({
		title = "Particle Emitter",
		flag = "Ball_Trail_Particle",
		callback = function(value)
			getgenv().BallTrailParticleEnabled = value
		end,
	})
	BallTrail:create_checkbox({
		title = "Glow Effect",
		flag = "Ball_Trail_Glow",
		callback = function(value)
			getgenv().BallTrailGlowEnabled = value
		end,
	})
	local hue = 0
	local trackedBalls = {}
	local function clearEffects(ball)
		local trail = ball:FindFirstChild("Trail")
		if trail then
			trail:Destroy()
		end
		local emitter = ball:FindFirstChild("ParticleEmitter")
		if emitter then
			emitter:Destroy()
		end
		local glow = ball:FindFirstChild("BallGlow")
		if glow then
			glow:Destroy()
		end
		local att0 = ball:FindFirstChild("Attachment0")
		if att0 then
			att0:Destroy()
		end
		local att1 = ball:FindFirstChild("Attachment1")
		if att1 then
			att1:Destroy()
		end
	end
	local function applyEffects(ball)
		if not getgenv().BallTrailEnabled then
			if trackedBalls[ball] then
				clearEffects(ball)
				trackedBalls[ball] = nil
			end
			return
		end
		if trackedBalls[ball] then
			local trail = ball:FindFirstChild("Trail")
			if trail then
				if getgenv().BallTrailRainbowEnabled then
					local color = Color3.fromHSV(hue / 360, 1, 1)
					trail.Color = ColorSequence.new(color)
					getgenv().BallTrailColor = color
				else
					trail.Color = ColorSequence.new(getgenv().BallTrailColor or Color3.new(1, 1, 1))
				end
			end
			return
		end
		trackedBalls[ball] = true
		local trail = Instance.new("Trail")
		trail.Name = "Trail"
		local att0 = Instance.new("Attachment")
		att0.Name = "Attachment0"
		att0.Position = Vector3.new(0, ball.Size.Y / 2, 0)
		att0.Parent = ball
		local att1 = Instance.new("Attachment")
		att1.Name = "Attachment1"
		att1.Position = Vector3.new(0, -ball.Size.Y / 2, 0)
		att1.Parent = ball
		trail.Attachment0 = att0
		trail.Attachment1 = att1
		trail.Lifetime = 0.4
		trail.WidthScale = NumberSequence.new(0.5)
		trail.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(1, 1),
		})
		trail.Color = ColorSequence.new(getgenv().BallTrailColor or Color3.new(1, 1, 1))
		trail.Parent = ball
		if getgenv().BallTrailParticleEnabled then
			local emitter = Instance.new("ParticleEmitter")
			emitter.Name = "ParticleEmitter"
			emitter.Rate = 100
			emitter.Lifetime = NumberRange.new(0.5, 1)
			emitter.Speed = NumberRange.new(0, 1)
			emitter.Size = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.5),
				NumberSequenceKeypoint.new(1, 0),
			})
			emitter.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 1),
			})
			emitter.Parent = ball
		end
		if getgenv().BallTrailGlowEnabled then
			local glow = Instance.new("PointLight")
			glow.Name = "BallGlow"
			glow.Range = 15
			glow.Brightness = 2
			glow.Parent = ball
		end
	end
	game:GetService("RunService").Heartbeat:Connect(function()
		hue = (hue + 1) % 360
		for _, ball in pairs(Auto_Parry.Get_Balls()) do
			applyEffects(ball)
		end
	end)
	local billboardLabels = {}
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local plr = Players.LocalPlayer
	getgenv().AbilityESP = true
	local billboardLabels = {}
	function qolPlayerNameVisibility()
		local function createBillboardGui(p)
			local character = p.Character
			while not (character and character.Parent) do
				task.wait()
				character = p.Character
			end
			local head = character:WaitForChild("Head")
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = "AbilityBillboard"
			billboardGui.Adornee = head
			billboardGui.Size = UDim2.new(0, 200, 0, 25)
			billboardGui.StudsOffset = Vector3.new(0, 3, 0)
			billboardGui.AlwaysOnTop = true
			billboardGui.Parent = head
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
			textLabel.TextSize = 12
			textLabel.Font = Enum.Font.SourceSansSemibold
			textLabel.BackgroundTransparency = 1
			textLabel.TextWrapped = false
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.TextScaled = false
			textLabel.Text = ""
			textLabel.Parent = billboardGui
			billboardLabels[p] = textLabel
			local humanoid = character:FindFirstChild("Humanoid")
			if humanoid then
				humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			end
			RunService.Heartbeat:Connect(function()
				if not character or not character.Parent then
					billboardGui:Destroy()
					billboardLabels[p] = nil
					return
				end
				if getgenv().AbilityESP then
					textLabel.Visible = true
					local abilityName = p:GetAttribute("EquippedAbility")
					if abilityName then
						textLabel.Text = p.DisplayName .. " [" .. tostring(abilityName) .. "]"
					else
						textLabel.Text = p.DisplayName .. " [???]"
					end
				else
					textLabel.Visible = false
				end
			end)
		end
		for _, p in Players:GetPlayers() do
			if p ~= plr then
				p.CharacterAdded:Connect(function()
					createBillboardGui(p)
				end)
				createBillboardGui(p)
			end
		end
		Players.PlayerAdded:Connect(function(newPlayer)
			newPlayer.CharacterAdded:Connect(function()
				createBillboardGui(newPlayer)
			end)
		end)
	end
	qolPlayerNameVisibility()
	local AbilityESP = world:create_module({
		title = "Ability ESP",
		flag = "AbilityESP",
		description = "Displays Player Abilities",
		section = "right",
		callback = function(value: boolean)
			getgenv().AbilityESP = value
			for _, label in pairs(billboardLabels) do
				label.Visible = value
			end
		end,
	})
	local CustomSky = world:create_module({
		title = "Custom Sky",
		flag = "Custom_Sky",
		description = "Toggles a custom skybox",
		section = "left",
		callback = function(value)
			local Lighting = game.Lighting
			local Sky = Lighting:FindFirstChildOfClass("Sky")
			if value then
				if not Sky then
					Sky = Instance.new("Sky", Lighting)
				end
			else
				if Sky then
					local defaultSkyboxIds =
						{ "591058823", "591059876", "591058104", "591057861", "591057625", "591059642" }
					local skyFaces = { "SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp" }
					for index, face in ipairs(skyFaces) do
						Sky[face] = "rbxassetid://" .. defaultSkyboxIds[index]
					end
					Lighting.GlobalShadows = true
				end
			end
		end,
	})
	CustomSky:create_dropdown({
		title = "Select Sky",
		flag = "custom_sky_selector",
		options = {
			"Default",
			"Vaporwave",
			"Redshift",
			"Desert",
			"DaBaby",
			"Minecraft",
			"SpongeBob",
			"Skibidi",
			"Blaze",
			"Pussy Cat",
			"Among Us",
			"Space Wave",
			"Space Wave2",
			"Turquoise Wave",
			"Dark Night",
			"Bright Pink",
			"White Galaxy",
			"Blue Galaxy",
		},
		multi_dropdown = false,
		maximum_options = 18,
		callback = function(selectedOption)
			local skyboxData = nil
			if selectedOption == "Default" then
				skyboxData = { "591058823", "591059876", "591058104", "591057861", "591057625", "591059642" }
			elseif selectedOption == "Vaporwave" then
				skyboxData = { "1417494030", "1417494146", "1417494253", "1417494402", "1417494499", "1417494643" }
			elseif selectedOption == "Redshift" then
				skyboxData = { "401664839", "401664862", "401664960", "401664881", "401664901", "401664936" }
			elseif selectedOption == "Desert" then
				skyboxData = { "1013852", "1013853", "1013850", "1013851", "1013849", "1013854" }
			elseif selectedOption == "DaBaby" then
				skyboxData = { "7245418472", "7245418472", "7245418472", "7245418472", "7245418472", "7245418472" }
			elseif selectedOption == "Minecraft" then
				skyboxData = { "1876545003", "1876544331", "1876542941", "1876543392", "1876543764", "1876544642" }
			elseif selectedOption == "SpongeBob" then
				skyboxData = { "7633178166", "7633178166", "7633178166", "7633178166", "7633178166", "7633178166" }
			elseif selectedOption == "Skibidi" then
				skyboxData =
					{ "14952256113", "14952256113", "14952256113", "14952256113", "14952256113", "14952256113" }
			elseif selectedOption == "Blaze" then
				skyboxData = { "150939022", "150939038", "150939047", "150939056", "150939063", "150939082" }
			elseif selectedOption == "Pussy Cat" then
				skyboxData =
					{ "11154422902", "11154422902", "11154422902", "11154422902", "11154422902", "11154422902" }
			elseif selectedOption == "Among Us" then
				skyboxData = { "5752463190", "5752463190", "5752463190", "5752463190", "5752463190", "5752463190" }
			elseif selectedOption == "Space Wave" then
				skyboxData =
					{ "16262356578", "16262358026", "16262360469", "16262362003", "16262363873", "16262366016" }
			elseif selectedOption == "Space Wave2" then
				skyboxData = { "1233158420", "1233158838", "1233157105", "1233157640", "1233157995", "1233159158" }
			elseif selectedOption == "Turquoise Wave" then
				skyboxData = { "47974894", "47974690", "47974821", "47974776", "47974859", "47974909" }
			elseif selectedOption == "Dark Night" then
				skyboxData = { "6285719338", "6285721078", "6285722964", "6285724682", "6285726335", "6285730635" }
			elseif selectedOption == "Bright Pink" then
				skyboxData = { "271042516", "271077243", "271042556", "271042310", "271042467", "271077958" }
			elseif selectedOption == "White Galaxy" then
				skyboxData = { "5540798456", "5540799894", "5540801779", "5540801192", "5540799108", "5540800635" }
			elseif selectedOption == "Blue Galaxy" then
				skyboxData =
					{ "14961495673", "14961494492", "14961492844", "14961491298", "14961490439", "14961489508" }
			end
			if not skyboxData then
				warn("Sky option not found: " .. tostring(selectedOption))
				return
			end
			local Lighting = game.Lighting
			local Sky = Lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky", Lighting)
			local skyFaces = { "SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp" }
			for index, face in ipairs(skyFaces) do
				Sky[face] = "rbxassetid://" .. skyboxData[index]
			end
			Lighting.GlobalShadows = false
		end,
	})
	local AbilityExploit = world:create_module({
		title = "Ability Exploit",
		flag = "AbilityExploit",
		description = "Ability Exploit",
		section = "right",
		callback = function(value)
			getgenv().AbilityExploit = value
		end,
	})
	AbilityExploit:create_checkbox({
		title = "Thunder Dash No Cooldown",
		flag = "ThunderDashNoCooldown",
		callback = function(value)
			getgenv().ThunderDashNoCooldown = value
			if getgenv().AbilityExploit and getgenv().ThunderDashNoCooldown then
				local thunderModule = game:GetService("ReplicatedStorage")
					:WaitForChild("Shared")
					:WaitForChild("Abilities")
					:WaitForChild("Thunder Dash")
				local mod = require(thunderModule)
				mod.cooldown = 0
				mod.cooldownReductionPerUpgrade = 0
			end
		end,
	})
	AbilityExploit:create_checkbox({
		title = "Continuity Zero Exploit",
		flag = "ContinuityZeroExploit",
		callback = function(value)
			getgenv().ContinuityZeroExploit = value
			if getgenv().AbilityExploit and getgenv().ContinuityZeroExploit then
				local ContinuityZeroRemote =
					game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UseContinuityPortal")
				local oldNamecall
				oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
					local method = getnamecallmethod()
					if self == ContinuityZeroRemote and method == "FireServer" then
						return oldNamecall(
							self,
							CFrame.new(9e17, 9e16, 9e15, 9e14, 9e13, 9e12, 9e11, 9e10, 9e9, 9e8, 9e7, 9e6),
							player.Name
						)
					end
					return oldNamecall(self, ...)
				end)
			end
		end,
	})
	local autoDuelsRequeueEnabled = false
	local AutoDuelsRequeue = farm:create_module({
		title = "Auto Duels Requeue",
		flag = "AutoDuelsRequeue",
		description = "Automatically requeues duels",
		section = "left",
		callback = function(value)
			autoDuelsRequeueEnabled = value
			if autoDuelsRequeueEnabled then
				task.spawn(function()
					while autoDuelsRequeueEnabled do
						game:GetService("ReplicatedStorage")
							:WaitForChild("Packages")
							:WaitForChild("_Index")
							:WaitForChild("sleitnick_net@0.1.0")
							:WaitForChild("net")
							:WaitForChild("RE/PlayerWantsRematch")
							:FireServer()
						task.wait(5)
					end
				end)
			end
		end,
	})
	local validRankedPlaceIds = {
		13772394625,
		14915220621,
	}
	local selectedQueue = "FFA"
	local autoRequeueEnabled = false
	local AutoRankedRequeue = farm:create_module({
		title = "Auto Ranked Requeue",
		flag = "AutoRankedRequeue",
		description = "Automatically requeues Ranked",
		section = "right",
		callback = function(value)
			autoRequeueEnabled = value
			if autoRequeueEnabled then
				if not table.find(validRankedPlaceIds, game.PlaceId) then
					autoRequeueEnabled = false
					return
				end
				task.spawn(function()
					while autoRequeueEnabled do
						game:GetService("ReplicatedStorage")
							:WaitForChild("Remotes")
							:WaitForChild("JoinQueue")
							:FireServer("Ranked", selectedQueue, "Normal")
						task.wait(5)
					end
				end)
			end
		end,
	})
	AutoRankedRequeue:create_dropdown({
		title = "Select Queue Type",
		flag = "QueueType",
		options = {
			"FFA",
			"Duo",
		},
		multi_dropdown = false,
		maximum_options = 2,
		callback = function(selectedOption)
			selectedQueue = selectedOption
		end,
	})
	local autoLTMRequeueEnabled = false
	local validLTMPlaceId = 13772394625
	local AutoLTMRequeue = farm:create_module({
		title = "Auto LTM Requeue",
		flag = "AutoLTMRequeue",
		description = "Automatically requeues LTM",
		section = "left",
		callback = function(value)
			autoLTMRequeueEnabled = value
			if autoLTMRequeueEnabled then
				if game.PlaceId ~= validLTMPlaceId then
					autoLTMRequeueEnabled = false
					return
				end
				task.spawn(function()
					while autoLTMRequeueEnabled do
						game:GetService("ReplicatedStorage")
							:WaitForChild("Packages")
							:WaitForChild("_Index")
							:WaitForChild("sleitnick_net@0.1.0")
							:WaitForChild("net")
							:WaitForChild("RF/JoinTournamentEventQueue")
							:InvokeServer({})
						task.wait(5)
					end
				end)
			end
		end,
	})

    local immortality = misc:create_module({
    title = "Semi Immortality !BETA!",
    flag = "Immortal",
    description = "Let's you hold the ball NOT FOREVER!",
    section = "",
    callback = function(value)
       local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")


if PlayerGui:FindFirstChild("Balls.lol") then
    PlayerGui["Balls.lol"]:Destroy()
end
if PlayerGui:FindFirstChild("ToggleGui") then
    PlayerGui["ToggleGui"]:Destroy()
end


local SemiImmortality = Instance.new("ScreenGui")
SemiImmortality.Name = "SemiImmortality"
SemiImmortality.Parent = PlayerGui
SemiImmortality.ResetOnSpawn = True
SemiImmortality.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Immortality = Instance.new("Frame")
Immortality.Name = "Immortality"
Immortality.Parent = SemiImmortality
Immortality.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Immortality.BackgroundTransparency = 0.3
Immortality.BorderSizePixel = 0
Immortality.Position = UDim2.new(0.057, 0, 0.078, 0)
Immortality.Size = UDim2.new(0, 139, 0, 89)

local UICorner = Instance.new("UICorner")
UICorner.Parent = Immortality

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = Immortality
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 139, 0, 29)
Title.Font = Enum.Font.SourceSans
Title.Text = "Semi Immortal"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextWrapped = true

local Promotion = Instance.new("TextLabel")
Promotion.Name = "Promotion"
Promotion.Parent = Immortality
Promotion.BackgroundTransparency = 1
Promotion.Position = UDim2.new(0, 0, -0.325, 0)
Promotion.Size = UDim2.new(0, 139, 0, 29)
Promotion.Font = Enum.Font.SourceSans
Promotion.Text = "https://discord.gg/8hjETGDnVE"
Promotion.TextColor3 = Color3.fromRGB(0, 0, 0)
Promotion.TextScaled = true
Promotion.TextWrapped = true

local Activation = Instance.new("TextButton")
Activation.Name = "Activation"
Activation.Parent = Immortality
Activation.BackgroundTransparency = 1
Activation.Position = UDim2.new(0, 0, 0.326, 0)
Activation.Size = UDim2.new(0, 139, 0, 60)
Activation.Font = Enum.Font.SourceSans
Activation.Text = "OFF"
Activation.TextColor3 = Color3.fromRGB(255, 0, 0)
Activation.TextScaled = true
Activation.TextWrapped = true


local isActive = false
local function toggle()
    isActive = not isActive
    if isActive then
        Activation.Text = "ON"
        Activation.TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        Activation.Text = "OFF"
        Activation.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end
Activation.MouseButton1Click:Connect(toggle)


do
    local TweenService = game:GetService("TweenService")
				local UserInputService = game:GetService("UserInputService")

				local function makeDraggable(frame)
					local dragging = false
					local dragInput, dragStart, startPos

					local function update(input)
						local delta = input.Position - dragStart
						local newPos = UDim2.new(
							startPos.X.Scale,
							startPos.X.Offset + delta.X,
							startPos.Y.Scale,
							startPos.Y.Offset + delta.Y
						)
						
						TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Position = newPos
						}):Play()
					end

					frame.Active = true
					frame.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							dragStart = input.Position
							startPos = frame.Position

							input.Changed:Connect(function()
								if input.UserInputState == Enum.UserInputState.End then
									dragging = false
								end
							end)
						end
					end)

					frame.InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							dragInput = input
						end
					end)

					UserInputService.InputChanged:Connect(function(input)
						if input == dragInput and dragging then
							update(input)
						end
					end)
				end

				
				makeDraggable(Immortality)
			end


local function RandomNumberRange(a)
    return math.random(-a * 90000009292929399949949496000, a * -1e9) / 5e8
end
local function RandomVectorRange(a, b, c)
    return Vector3.new(RandomNumberRange(a), RandomNumberRange(b), RandomNumberRange(c))
end


local DesyncTypes = {}


RunService.Stepped:Connect(function()
    if isActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        pcall(function()
            LocalPlayer.Character.HumanoidRootPart:SetNetworkOwner(LocalPlayer)
        end)
    end
end)

RunService.Heartbeat:Connect(function()
    if isActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        DesyncTypes[1] = LocalPlayer.Character.HumanoidRootPart.CFrame
        DesyncTypes[2] = LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity

        local SpoofThis = LocalPlayer.Character.HumanoidRootPart.CFrame
        local horizontalOscillation = math.sin(tick() * 60) * 55
        local verticalOscillation = math.sin(tick() * 25) * 15
        SpoofThis = SpoofThis * CFrame.new(horizontalOscillation, verticalOscillation, 0) * CFrame.Angles(
            math.rad(RandomNumberRange(1000)),
            math.rad(RandomNumberRange(1000)),
            math.rad(RandomNumberRange(1000))
        )

        LocalPlayer.Character.HumanoidRootPart.CFrame = SpoofThis
        LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = DesyncTypes[2] + Vector3.new(
            math.cos(tick() * 8) * 6000,
            math.cos(tick() * 8) * 6000,
            0
        )

        RunService.RenderStepped:Wait()

        LocalPlayer.Character.HumanoidRootPart.CFrame = DesyncTypes[1]
        LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = DesyncTypes[2]
    end
end)


local oldIndex
oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if isActive and not checkcaller() then
        if key == "CFrame" and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if self == LocalPlayer.Character.HumanoidRootPart then
                return DesyncTypes[1] or CFrame.new()
            elseif self == LocalPlayer.Character:FindFirstChild("Head") then
                return DesyncTypes[1] and DesyncTypes[1] + Vector3.new(0, LocalPlayer.Character.HumanoidRootPart.Size / 2 + 0.5, 0) or CFrame.new()
            end
        end
    end
    return oldIndex(self, key)
end))
    end,
})

local immortalityv2 = misc:create_module({
    title = "Semi Immortality V2 !BETA!",
    flag = "Immortalv2",
    description = "Let's you hold the ball NOT FOREVER!",
    section = "right",
    callback = function(value)
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        local workspace = game:GetService("Workspace")
        local mapFolder = workspace:FindFirstChild("Map")
        if not mapFolder then
            mapFolder = Instance.new("Folder")
            mapFolder.Name = "Map"
            mapFolder.Parent = workspace
        end

     
        local playerPart = workspace:FindFirstChild("PlayerMapPart")

        local function enableMap()
            for _, obj in pairs(mapFolder:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.Transparency = 0.5
                    obj.CanCollide = false
                end
            end

            if not playerPart or not playerPart.Parent then
                playerPart = Instance.new("Part")
                playerPart.Name = "PlayerMapPart"
                playerPart.Size = Vector3.new(500, 1, 500)
                playerPart.Position = humanoidRootPart.Position - Vector3.new(0, 20, 0)
                playerPart.Anchored = true
                playerPart.Material = Enum.Material.SmoothPlastic
                playerPart.Color = Color3.fromRGB(255, 255, 255)
                playerPart.Parent = workspace
            end
        end

        local function disableMap()
            for _, obj in pairs(mapFolder:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.Transparency = 0
                    obj.CanCollide = true
                end
            end

            if playerPart and playerPart.Parent then
                playerPart:Destroy()
            end
        end

       
        if value then
            enableMap()
        else
            disableMap()
        end
    end,
})


	local SkinChanger = misc:create_module({
		title = "Skin Changer",
		flag = "SkinChanger",
		description = "Skin Changer",
		section = "left",
		callback = function(value: boolean)
			getgenv().skinChanger = value
			if value then
				getgenv().updateSword()
			end
		end,
	})
	SkinChanger:change_state(false)
	SkinChanger:create_paragraph({
		title = "Everyone can see animations",
		text = "",
	})
	local skinchangertextbox = SkinChanger:create_textbox({
		title = "￬ Skin Name (Case Sensitive) ￬",
		placeholder = "Enter Sword Skin Name... ",
		flag = "SkinChangerTextbox",
		callback = function(text)
			getgenv().swordModel = text
			getgenv().swordAnimations = text
			getgenv().swordFX = text
			if getgenv().skinChanger then
				getgenv().updateSword()
			end
		end,
	})
	local AutoPlayModule = {}
	AutoPlayModule.CONFIG = {
		DEFAULT_DISTANCE = 30,
		MULTIPLIER_THRESHOLD = 70,
		TRAVERSING = 25,
		DIRECTION = 1,
		JUMP_PERCENTAGE = 50,
		DOUBLE_JUMP_PERCENTAGE = 50,
		JUMPING_ENABLED = false,
		MOVEMENT_DURATION = 0.8,
		OFFSET_FACTOR = 0.7,
		GENERATION_THRESHOLD = 0.25,
	}
	AutoPlayModule.ball = nil
	AutoPlayModule.lobbyChoice = nil
	AutoPlayModule.animationCache = nil
	AutoPlayModule.doubleJumped = false
	AutoPlayModule.ELAPSED = 0
	AutoPlayModule.CONTROL_POINT = nil
	AutoPlayModule.LAST_GENERATION = 0
	AutoPlayModule.signals = {}
	do
		local getServiceFunction = game.GetService
		local function getClonerefPermission()
			local permission = cloneref(getServiceFunction(game, "ReplicatedFirst"))
			return permission
		end
		AutoPlayModule.clonerefPermission = getClonerefPermission()
		if not AutoPlayModule.clonerefPermission then
			warn("cloneref is not available on your executor! There is a risk of getting detected.")
		end
		function AutoPlayModule.findCachedService(self, name)
			for index, value in self do
				if value.Name == name then
					return value
				end
			end
			return
		end
		function AutoPlayModule.getService(self, name)
			local cachedService = AutoPlayModule.findCachedService(self, name)
			if cachedService then
				return cachedService
			end
			local service = getServiceFunction(game, name)
			if AutoPlayModule.clonerefPermission then
				service = cloneref(service)
			end
			table.insert(self, service)
			return service
		end
		AutoPlayModule.customService = setmetatable({}, {
			__index = AutoPlayModule.getService,
		})
	end
	AutoPlayModule.playerHelper = {
		isAlive = function(player)
			local character = nil
			if player and player:IsA("Player") then
				character = player.Character
			end
			if not character then
				return false
			end
			local rootPart = character:FindFirstChild("HumanoidRootPart")
			local humanoid = character:FindFirstChild("Humanoid")
			if not rootPart or not humanoid then
				return false
			end
			return humanoid.Health > 0
		end,
		inLobby = function(character)
			if not character then
				return false
			end
			return character.Parent == AutoPlayModule.customService.Workspace.Dead
		end,
		onGround = function(character)
			if not character then
				return false
			end
			return character.Humanoid.FloorMaterial ~= Enum.Material.Air
		end,
	}
	function AutoPlayModule.isLimited()
		local passedTime = tick() - AutoPlayModule.LAST_GENERATION
		return passedTime < AutoPlayModule.CONFIG.GENERATION_THRESHOLD
	end
	function AutoPlayModule.percentageCheck(limit)
		if AutoPlayModule.isLimited() then
			return false
		end
		local percentage = math.random(100)
		AutoPlayModule.LAST_GENERATION = tick()
		return limit >= percentage
	end
	AutoPlayModule.ballUtils = {
		getBall = function()
			for _, object in AutoPlayModule.customService.Workspace.Balls:GetChildren() do
				if object:GetAttribute("realBall") then
					AutoPlayModule.ball = object
					return
				end
			end
			AutoPlayModule.ball = nil
		end,
		getDirection = function()
			if not AutoPlayModule.ball then
				return
			end
			local direction = (
				AutoPlayModule.customService.Players.LocalPlayer.Character.HumanoidRootPart.Position
				- AutoPlayModule.ball.Position
			).Unit
			return direction
		end,
		getVelocity = function()
			if not AutoPlayModule.ball then
				return
			end
			local zoomies = AutoPlayModule.ball:FindFirstChild("zoomies")
			if not zoomies then
				return
			end
			return zoomies.VectorVelocity
		end,
		getSpeed = function()
			local velocity = AutoPlayModule.ballUtils.getVelocity()
			if not velocity then
				return
			end
			return velocity.Magnitude
		end,
		isExisting = function()
			return AutoPlayModule.ball ~= nil
		end,
	}
	AutoPlayModule.lerp = function(start, finish, alpha)
		return start + (finish - start) * alpha
	end
	AutoPlayModule.quadratic = function(start, middle, finish, alpha)
		local firstLerp = AutoPlayModule.lerp(start, middle, alpha)
		local secondLerp = AutoPlayModule.lerp(middle, finish, alpha)
		return AutoPlayModule.lerp(firstLerp, secondLerp, alpha)
	end
	AutoPlayModule.getCandidates = function(middle, theta, offsetLength)
		local firstCanditateX = math.cos(theta + math.pi / 2)
		local firstCanditateZ = math.sin(theta + math.pi / 2)
		local firstCandidate = middle + Vector3.new(firstCanditateX, 0, firstCanditateZ) * offsetLength
		local secondCanditateX = math.cos(theta - math.pi / 2)
		local secondCanditateZ = math.sin(theta - math.pi / 2)
		local secondCandidate = middle + Vector3.new(secondCanditateX, 0, secondCanditateZ) * offsetLength
		return firstCandidate, secondCandidate
	end
	AutoPlayModule.getControlPoint = function(start, finish)
		local middle = (start + finish) * 0.5
		local difference = start - finish
		if difference.Magnitude < 5 then
			return finish
		end
		local theta = math.atan2(difference.Z, difference.X)
		local offsetLength = difference.Magnitude * AutoPlayModule.CONFIG.OFFSET_FACTOR
		local firstCandidate, secondCandidate = AutoPlayModule.getCandidates(middle, theta, offsetLength)
		local dotValue = start - middle
		if (firstCandidate - middle):Dot(dotValue) < 0 then
			return firstCandidate
		else
			return secondCandidate
		end
	end
	AutoPlayModule.getCurve = function(start, finish, delta)
		AutoPlayModule.ELAPSED = AutoPlayModule.ELAPSED + delta
		local timeElapsed = math.clamp(AutoPlayModule.ELAPSED / AutoPlayModule.CONFIG.MOVEMENT_DURATION, 0, 1)
		if timeElapsed >= 1 then
			local distance = (start - finish).Magnitude
			if distance >= 10 then
				AutoPlayModule.ELAPSED = 0
			end
			AutoPlayModule.CONTROL_POINT = nil
			return finish
		end
		if not AutoPlayModule.CONTROL_POINT then
			AutoPlayModule.CONTROL_POINT = AutoPlayModule.getControlPoint(start, finish)
		end
		assert(AutoPlayModule.CONTROL_POINT, "CONTROL_POINT: Vector3 expected, got nil")
		return AutoPlayModule.quadratic(start, AutoPlayModule.CONTROL_POINT, finish, timeElapsed)
	end
	AutoPlayModule.map = {
		getFloor = function()
			local floor = AutoPlayModule.customService.Workspace:FindFirstChild("FLOOR")
			if not floor then
				for _, part in pairs(AutoPlayModule.customService.Workspace:GetDescendants()) do
					if part:IsA("MeshPart") or part:IsA("BasePart") then
						local size = part.Size
						if size.X > 50 and size.Z > 50 and part.Position.Y < 5 then
							return part
						end
					end
				end
			end
			return floor
		end,
	}
	AutoPlayModule.getRandomPosition = function()
		local floor = AutoPlayModule.map.getFloor()
		if not floor or not AutoPlayModule.ballUtils.isExisting() then
			return
		end
		local ballDirection = AutoPlayModule.ballUtils.getDirection() * AutoPlayModule.CONFIG.DIRECTION
		local ballSpeed = AutoPlayModule.ballUtils.getSpeed()
		local speedThreshold = math.min(ballSpeed / 10, AutoPlayModule.CONFIG.MULTIPLIER_THRESHOLD)
		local speedMultiplier = AutoPlayModule.CONFIG.DEFAULT_DISTANCE + speedThreshold
		local negativeDirection = ballDirection * speedMultiplier
		local currentTime = os.time() / 1.2
		local sine = math.sin(currentTime) * AutoPlayModule.CONFIG.TRAVERSING
		local cosine = math.cos(currentTime) * AutoPlayModule.CONFIG.TRAVERSING
		local traversing = Vector3.new(sine, 0, cosine)
		local finalPosition = floor.Position + negativeDirection + traversing
		return finalPosition
	end
	AutoPlayModule.lobby = {
		isChooserAvailable = function()
			return AutoPlayModule.customService.Workspace.Spawn.NewPlayerCounter.GUI.SurfaceGui.Top.Options.Visible
		end,
		updateChoice = function(choice)
			AutoPlayModule.lobbyChoice = choice
		end,
		getMapChoice = function()
			local choice = AutoPlayModule.lobbyChoice or math.random(1, 3)
			local collider =
				AutoPlayModule.customService.Workspace.Spawn.NewPlayerCounter.Colliders:FindFirstChild(choice)
			return collider
		end,
		getPadPosition = function()
			if not AutoPlayModule.lobby.isChooserAvailable() then
				AutoPlayModule.lobbyChoice = nil
				return
			end
			local choice = AutoPlayModule.lobby.getMapChoice()
			if not choice then
				return
			end
			return choice.Position, choice.Name
		end,
	}
	AutoPlayModule.movement = {
		removeCache = function()
			if AutoPlayModule.animationCache then
				AutoPlayModule.animationCache = nil
			end
		end,
		createJumpVelocity = function(player)
			local maxForce = math.huge
			local velocity = Instance.new("BodyVelocity")
			velocity.MaxForce = Vector3.new(maxForce, maxForce, maxForce)
			velocity.Velocity = Vector3.new(0, 80, 0)
			velocity.Parent = player.Character.HumanoidRootPart
			AutoPlayModule.customService.Debris:AddItem(velocity, 0.001)
			AutoPlayModule.customService.ReplicatedStorage.Remotes.DoubleJump:FireServer()
		end,
		playJumpAnimation = function(player)
			if not AutoPlayModule.animationCache then
				local doubleJumpAnimation =
					AutoPlayModule.customService.ReplicatedStorage.Assets.Tutorial.Animations.DoubleJump
				AutoPlayModule.animationCache = player.Character.Humanoid.Animator:LoadAnimation(doubleJumpAnimation)
			end
			if AutoPlayModule.animationCache then
				AutoPlayModule.animationCache:Play()
			end
		end,
		doubleJump = function(player)
			if AutoPlayModule.doubleJumped then
				return
			end
			if not AutoPlayModule.percentageCheck(AutoPlayModule.CONFIG.DOUBLE_JUMP_PERCENTAGE) then
				return
			end
			AutoPlayModule.doubleJumped = true
			AutoPlayModule.movement.createJumpVelocity(player)
			AutoPlayModule.movement.playJumpAnimation(player)
		end,
		jump = function(player)
			if not AutoPlayModule.CONFIG.JUMPING_ENABLED then
				return
			end
			if not AutoPlayModule.playerHelper.onGround(player.Character) then
				AutoPlayModule.movement.doubleJump(player)
				return
			end
			if not AutoPlayModule.percentageCheck(AutoPlayModule.CONFIG.JUMP_PERCENTAGE) then
				return
			end
			AutoPlayModule.doubleJumped = false
			player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end,
		move = function(player, playerPosition)
			player.Character.Humanoid:MoveTo(playerPosition)
		end,
		stop = function(player)
			local playerPosition = player.Character.HumanoidRootPart.Position
			player.Character.Humanoid:MoveTo(playerPosition)
		end,
	}
	AutoPlayModule.signal = {
		connect = function(name, connection, callback)
			if not name then
				name = AutoPlayModule.customService.HttpService:GenerateGUID()
			end
			AutoPlayModule.signals[name] = connection:Connect(callback)
			return AutoPlayModule.signals[name]
		end,
		disconnect = function(name)
			if not name or not AutoPlayModule.signals[name] then
				return
			end
			AutoPlayModule.signals[name]:Disconnect()
			AutoPlayModule.signals[name] = nil
		end,
		stop = function()
			for name, connection in pairs(AutoPlayModule.signals) do
				if typeof(connection) ~= "RBXScriptConnection" then
					continue
				end
				connection:Disconnect()
				AutoPlayModule.signals[name] = nil
			end
		end,
	}
	AutoPlayModule.findPath = function(inLobby, delta)
		local rootPosition = AutoPlayModule.customService.Players.LocalPlayer.Character.HumanoidRootPart.Position
		if inLobby then
			local padPosition, padNumber = AutoPlayModule.lobby.getPadPosition()
			local choice = tonumber(padNumber)
			if choice then
				AutoPlayModule.lobby.updateChoice(choice)
				if getgenv().AutoVote then
					game:GetService("ReplicatedStorage")
						:WaitForChild("Packages")
						:WaitForChild("_Index")
						:WaitForChild("sleitnick_net@0.1.0")
						:WaitForChild("net")
						:WaitForChild("RE/UpdateVotes")
						:FireServer("FFA")
				end
			end
			if not padPosition then
				return
			end
			return AutoPlayModule.getCurve(rootPosition, padPosition, delta)
		end
		local randomPosition = AutoPlayModule.getRandomPosition()
		if not randomPosition then
			return
		end
		return AutoPlayModule.getCurve(rootPosition, randomPosition, delta)
	end
	AutoPlayModule.followPath = function(delta)
		if not AutoPlayModule.playerHelper.isAlive(AutoPlayModule.customService.Players.LocalPlayer) then
			AutoPlayModule.movement.removeCache()
			return
		end
		local inLobby = AutoPlayModule.customService.Players.LocalPlayer.Character.Parent
			== AutoPlayModule.customService.Workspace.Dead
		local path = AutoPlayModule.findPath(inLobby, delta)
		if not path then
			AutoPlayModule.movement.stop(AutoPlayModule.customService.Players.LocalPlayer)
			return
		end
		AutoPlayModule.movement.move(AutoPlayModule.customService.Players.LocalPlayer, path)
		AutoPlayModule.movement.jump(AutoPlayModule.customService.Players.LocalPlayer)
	end
	AutoPlayModule.finishThread = function()
		AutoPlayModule.signal.disconnect("auto-play")
		AutoPlayModule.signal.disconnect("synchronize")
		if not AutoPlayModule.playerHelper.isAlive(AutoPlayModule.customService.Players.LocalPlayer) then
			return
		end
		AutoPlayModule.movement.stop(AutoPlayModule.customService.Players.LocalPlayer)
	end
	AutoPlayModule.runThread = function()
		AutoPlayModule.signal.connect(
			"auto-play",
			AutoPlayModule.customService.RunService.PostSimulation,
			AutoPlayModule.followPath
		)
		AutoPlayModule.signal.connect(
			"synchronize",
			AutoPlayModule.customService.RunService.PostSimulation,
			AutoPlayModule.ballUtils.getBall
		)
	end

	local AutoPlay = player:create_module({
		title = "Auto Play",
		flag = "AutoPlay",
		description = "Automatically Plays Game",
		section = "left",
		callback = function(value)
			if value then
				AutoPlayModule.runThread()
			else
				AutoPlayModule.finishThread()
			end
		end,
	})
	local AntiAFK = AutoPlay:create_checkbox({
		title = "Anti AFK",
		flag = "AutoPlayAntiAFK",
		callback = function(value: boolean)
			if value then
				local GC = getconnections or get_signal_cons
				if GC then
					for i, v in pairs(GC(Players.LocalPlayer.Idled)) do
						if v["Disable"] then
							v["Disable"](v)
						elseif v["Disconnect"] then
							v["Disconnect"](v)
						end
					end
				else
					local VirtualUser = cloneref(game:GetService("VirtualUser"))
					Players.LocalPlayer.Idled:Connect(function()
						VirtualUser:CaptureController()
						VirtualUser:ClickButton2(Vector2.new())
					end)
				end
			end
		end,
	})
	AntiAFK:change_state(true)
	AutoPlay:create_checkbox({
		title = "Enable Jumping",
		flag = "jumping_enabled",
		callback = function(value)
			AutoPlayModule.CONFIG.JUMPING_ENABLED = value
		end,
	})
	AutoPlay:create_checkbox({
		title = "Auto Vote",
		flag = "AutoVote",
		callback = function(value)
			getgenv().AutoVote = value
		end,
	})
	AutoPlay:create_divider({})
	AutoPlay:create_slider({
		title = "Distance From Ball",
		flag = "default_distance",
		maximum_value = 100,
		minimum_value = 5,
		value = AutoPlayModule.CONFIG.DEFAULT_DISTANCE,
		round_number = true,
		callback = function(value)
			AutoPlayModule.CONFIG.DEFAULT_DISTANCE = value
		end,
	})
	AutoPlay:create_slider({
		title = "Speed Multiplier",
		flag = "multiplier_threshold",
		maximum_value = 200,
		minimum_value = 10,
		value = AutoPlayModule.CONFIG.MULTIPLIER_THRESHOLD,
		round_number = true,
		callback = function(value)
			AutoPlayModule.CONFIG.MULTIPLIER_THRESHOLD = value
		end,
	})
	AutoPlay:create_slider({
		title = "Transversing",
		flag = "traversing",
		maximum_value = 100,
		minimum_value = 0,
		value = AutoPlayModule.CONFIG.TRAVERSING,
		round_number = true,
		callback = function(value)
			AutoPlayModule.CONFIG.TRAVERSING = value
		end,
	})
	AutoPlay:create_slider({
		title = "Direction",
		flag = "Direction",
		maximum_value = 1,
		minimum_value = -1,
		value = AutoPlayModule.CONFIG.DIRECTION,
		round_number = false,
		callback = function(value)
			AutoPlayModule.CONFIG.DIRECTION = value
		end,
	})
	AutoPlay:create_slider({
		title = "Offset Factor",
		flag = "OffsetFactor",
		maximum_value = 1,
		minimum_value = 0.1,
		value = AutoPlayModule.CONFIG.OFFSET_FACTOR,
		round_number = false,
		callback = function(value)
			AutoPlayModule.CONFIG.OFFSET_FACTOR = value
		end,
	})
	AutoPlay:create_slider({
		title = "Movement Duration",
		flag = "MovementDuration",
		maximum_value = 1,
		minimum_value = 0.1,
		value = AutoPlayModule.CONFIG.MOVEMENT_DURATION,
		round_number = false,
		callback = function(value)
			AutoPlayModule.CONFIG.MOVEMENT_DURATION = value
		end,
	})
	AutoPlay:create_slider({
		title = "Generation Threshold",
		flag = "GenerationThreshold",
		maximum_value = 0.5,
		minimum_value = 0.1,
		value = AutoPlayModule.CONFIG.GENERATION_THRESHOLD,
		round_number = false,
		callback = function(value)
			AutoPlayModule.CONFIG.GENERATION_THRESHOLD = value
		end,
	})
	AutoPlay:create_slider({
		title = "Jump Chance",
		flag = "jump_percentage",
		maximum_value = 100,
		minimum_value = 0,
		value = AutoPlayModule.CONFIG.JUMP_PERCENTAGE,
		round_number = true,
		callback = function(value)
			AutoPlayModule.CONFIG.JUMP_PERCENTAGE = value
		end,
	})
	AutoPlay:create_slider({
		title = "Double Jump Chance",
		flag = "double_jump_percentage",
		maximum_value = 100,
		minimum_value = 0,
		value = AutoPlayModule.CONFIG.DOUBLE_JUMP_PERCENTAGE,
		round_number = true,
		callback = function(value)
			AutoPlayModule.CONFIG.DOUBLE_JUMP_PERCENTAGE = value
		end,
	})
local VelocityGui 
local updateConn
local peakVelocity = 0

local BallStats = misc:create_module({
    title = "Ball Stats",
    flag = "ballStats",
    description = "Displays the current ball speed and peak velocity",
    section = "left",
    callback = function(value)
        if value then
            if not VelocityGui then
                local player = game.Players.LocalPlayer

             
                VelocityGui = Instance.new("ScreenGui")
                local VelocityFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local UIGradient = Instance.new("UIGradient")
                local ImageButton = Instance.new("ImageButton")
                local UICorner_2 = Instance.new("UICorner")
                local PeakVelocity = Instance.new("TextLabel")
                local Velocity = Instance.new("TextLabel")

                VelocityGui.Name = "VelocityGui"
                VelocityGui.Parent = player:WaitForChild("PlayerGui")
                VelocityGui.ResetOnSpawn = false

                VelocityFrame.Name = "VelocityFrame"
                VelocityFrame.Parent = VelocityGui
                VelocityFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                VelocityFrame.BackgroundTransparency = 0.3
                VelocityFrame.Size = UDim2.new(0, 200, 0, 100)
                VelocityFrame.Position = UDim2.new(0.2, 0, 0.18, 0)
                UICorner.Parent = VelocityFrame


				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(42, 43, 47)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(42, 43, 47))}
				UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 1.00)}
				UIGradient.Parent = VelocityFrame

				ImageButton.Parent = VelocityFrame
				ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				ImageButton.BackgroundTransparency = 1.000
				ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageButton.BorderSizePixel = 0
				ImageButton.Size = UDim2.new(0, 200, 0, 100)
				ImageButton.Image = "rbxassetid://10149736886"
				ImageButton.Active = false

				local stroke = Instance.new("UIStroke")
				stroke.Parent = ImageButton
				stroke.Color = Color3.fromRGB(0, 0, 0)
				stroke.Thickness = 3
				stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				UICorner_2.Parent = ImageButton

				PeakVelocity.Name = "PeakVelocity"
				PeakVelocity.Parent = ImageButton
				PeakVelocity.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				PeakVelocity.BackgroundTransparency = 1.000
				PeakVelocity.BorderColor3 = Color3.fromRGB(0, 0, 0)
				PeakVelocity.BorderSizePixel = 0
				PeakVelocity.Position = UDim2.new(0, 0, 0.5, 0)
				PeakVelocity.Size = UDim2.new(0, 200, 0, 50)
				PeakVelocity.Font = Enum.Font.SourceSans
				PeakVelocity.Text = "Peak Velocity:"
				PeakVelocity.TextColor3 = Color3.fromRGB(0, 0, 0)
				PeakVelocity.TextScaled = true
				PeakVelocity.TextSize = 14.000
				PeakVelocity.TextWrapped = true

				Velocity.Name = "Velocity"
				Velocity.Parent = ImageButton
				Velocity.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Velocity.BackgroundTransparency = 1.000
				Velocity.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Velocity.BorderSizePixel = 0
				Velocity.Size = UDim2.new(0, 200, 0, 50)
				Velocity.Font = Enum.Font.SourceSans
				Velocity.Text = "Velocity"
				Velocity.TextColor3 = Color3.fromRGB(0, 0, 0)
				Velocity.TextScaled = true
				Velocity.TextSize = 14.000
				Velocity.TextWrapped = true

               	local TweenService = game:GetService("TweenService")
				local UserInputService = game:GetService("UserInputService")

				local function makeDraggable(frame)
					local dragging = false
					local dragInput, dragStart, startPos

					local function update(input)
						local delta = input.Position - dragStart
						local newPos = UDim2.new(
							startPos.X.Scale,
							startPos.X.Offset + delta.X,
							startPos.Y.Scale,
							startPos.Y.Offset + delta.Y
						)
						
						TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Position = newPos
						}):Play()
					end

					frame.Active = true
					frame.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							dragStart = input.Position
							startPos = frame.Position

							input.Changed:Connect(function()
								if input.UserInputState == Enum.UserInputState.End then
									dragging = false
								end
							end)
						end
					end)

					frame.InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							dragInput = input
						end
					end)

					UserInputService.InputChanged:Connect(function(input)
						if input == dragInput and dragging then
							update(input)
						end
					end)
				end

				
				makeDraggable(ImageButton)

                
                updateConn = game:GetService("RunService").RenderStepped:Connect(function()
                    local Balls = Auto_Parry.Get_Balls() or {}
                    local speedShown = false
                    for _, Ball in ipairs(Balls) do
                        local zoomies = Ball:FindFirstChild("zoomies")
                        if zoomies then
                            local speed = zoomies.VectorVelocity.Magnitude
                            Velocity.Text = ("Velocity: %.2f"):format(speed)
                            if speed > peakVelocity then
                                peakVelocity = speed
                                PeakVelocity.Text = ("Peak Velocity: %.2f"):format(peakVelocity)
                            end
                            speedShown = true
                            break
                        end
                    end
                    if not speedShown then
                        Velocity.Text = "Velocity: 0.0"
                    end
                end)
            end
        else
            if updateConn then
                updateConn:Disconnect()
                updateConn = nil
            end
            if VelocityGui then
                VelocityGui:Destroy()
                VelocityGui = nil
            end
            peakVelocity = 0
        end
    end,
})

	local visualPart
	local Visualiser = misc:create_module({
		title = "Visualiser",
		flag = "Visualiser",
		description = "Parry Range Visualiser",
		section = "right",
		callback = function(value: boolean)
			if value then
				if not visualPart then
					visualPart = Instance.new("Part")
					visualPart.Name = "VisualiserPart"
					visualPart.Shape = Enum.PartType.Ball
					visualPart.Material = Enum.Material.ForceField
					visualPart.Color = Color3.fromRGB(255, 255, 255)
					visualPart.Transparency = 0
					visualPart.CastShadow = false
					visualPart.Anchored = true
					visualPart.CanCollide = false
					visualPart.Parent = workspace
				end
				Connections_Manager["Visualiser"] = game:GetService("RunService").RenderStepped:Connect(function()
					local character = Player.Character
					local HumanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					if HumanoidRootPart and visualPart then
						visualPart.CFrame = HumanoidRootPart.CFrame
					end
					if getgenv().VisualiserRainbow then
						local hue = (tick() % 5) / 5
						visualPart.Color = Color3.fromHSV(hue, 1, 1)
					else
						local hueVal = getgenv().VisualiserHue or 0
						visualPart.Color = Color3.fromHSV(hueVal / 360, 1, 1)
					end
					local speed = 0
					local maxSpeed = 350
					local Balls = Auto_Parry.Get_Balls()
					for _, Ball in pairs(Balls) do
						if Ball and Ball:FindFirstChild("zoomies") then
							local Velocity = Ball.AssemblyLinearVelocity
							speed = math.min(Velocity.Magnitude, maxSpeed) / 6.5
							break
						end
					end
					local size = math.max(speed, 6.5)
					if visualPart then
						visualPart.Size = Vector3.new(size, size, size)
					end
				end)
			else
				if Connections_Manager["Visualiser"] then
					Connections_Manager["Visualiser"]:Disconnect()
					Connections_Manager["Visualiser"] = nil
				end
				if visualPart then
					visualPart:Destroy()
					visualPart = nil
				end
			end
		end,
	})
	Visualiser:create_checkbox({
		title = "Rainbow",
		flag = "VisualiserRainbow",
		callback = function(value)
			getgenv().VisualiserRainbow = value
		end,
	})
	Visualiser:create_slider({
		title = "Color Hue",
		flag = "VisualiserHue",
		minimum_value = 0,
		maximum_value = 360,
		value = 0,
		callback = function(value)
			getgenv().VisualiserHue = value
		end,
	})
	local AutoClaimRewards = farm:create_module({
		title = "Auto Claim Rewards",
		flag = "AutoClaimRewards",
		description = "Automatically claims rewards.",
		section = "left",
		callback = function(value: boolean)
			getgenv().AutoClaimRewards = value
			if value then
				local rs = game:GetService("ReplicatedStorage")
				local net = rs:WaitForChild("Packages")
					:WaitForChild("_Index")
					:WaitForChild("sleitnick_net@0.1.0")
					:WaitForChild("net")
				task.spawn(function()
					net["RF/RedeemQuestsType"]:InvokeServer("Battlepass", "Weekly")
					net["RF/RedeemQuestsType"]:InvokeServer("Battlepass", "Daily")
					net["RF/ClaimAllDailyMissions"]:InvokeServer("Daily")
					net["RF/ClaimAllDailyMissions"]:InvokeServer("Weekly")
					net["RF/ClaimAllClanBPQuests"]:InvokeServer()
					local joinTimestamp = tonumber(plr:GetAttribute("JoinedTimestamp")) + 10
					for i = 1, 6 do
						while workspace:GetServerTimeNow() < joinTimestamp + (i * 300) + 1 do
							task.wait(1)
							if not getgenv().AutoClaimRewards then
								return
							end
						end
						net["RF/ClaimPlaytimeReward"]:InvokeServer(i)
					end
				end)
			end
		end,
	})
	local DisableQuantumEffects = world:create_module({
		title = "Disable Quantum Arena Effects",
		flag = "NoQuantumEffects",
		description = "Disables Quantum Arena effects.",
		section = "left",
		callback = function(value: boolean)
			getgenv().NoQuantumEffects = value
			if value then
				task.spawn(function()
					local quantumfx
					while task.wait() and getgenv().NoQuantumEffects and not quantumfx do
						for _, v in getconnections(ReplicatedStorage.Remotes.QuantumArena.OnClientEvent) do
							quantumfx = v
							v:Disable()
						end
					end
				end)
			end
		end,
	})
	local No_Render = misc:create_module({
		title = "No Render",
		flag = "No_Render",
		description = "Disables rendering of effects",
		section = "right",
		callback = function(state)
			Player.PlayerScripts.EffectScripts.ClientFX.Disabled = state
			if state then
				Connections_Manager["No Render"] = workspace.Runtime.ChildAdded:Connect(function(Value)
					Debris:AddItem(Value, 0)
				end)
			else
				if Connections_Manager["No Render"] then
					Connections_Manager["No Render"]:Disconnect()
					Connections_Manager["No Render"] = nil
				end
			end
		end,
	})
	local CustomAnnouncer = misc:create_module({
		title = "Custom Announcer",
		flag = "Custom_Announcer",
		description = "Customize the game announcements",
		section = "right",
		callback = function(value: boolean)
			if value then
				local Announcer = Player.PlayerGui:WaitForChild("announcer")
				local Winner = Announcer:FindFirstChild("Winner")
				if Winner then
					Winner.Text = Library._config._flags["announcer_text"] or "https://discord.gg/KHPMBbtDUF"
				end
				Announcer.ChildAdded:Connect(function(Value)
					if Value.Name == "Winner" then
						Value.Changed:Connect(function(Property)
							if Property == "Text" and Library._config._flags["Custom_Announcer"] then
								Value.Text = Library._config._flags["announcer_text"] or "https://discord.gg/KHPMBbtDUF"
							end
						end)
						if Library._config._flags["Custom_Announcer"] then
							Value.Text = Library._config._flags["announcer_text"] or "https://discord.gg/KHPMBbtDUF"
						end
					end
				end)
			end
		end,
	})
	CustomAnnouncer:create_textbox({
		title = "Custom Announcement Text",
		placeholder = "Enter custom announcer text... ",
		flag = "announcer_text",
		callback = function(text)
			Library._config._flags["announcer_text"] = text
			if Library._config._flags["Custom_Announcer"] then
				local Announcer = Player.PlayerGui:WaitForChild("announcer")
				local Winner = Announcer:FindFirstChild("Winner")
				if Winner then
					Winner.Text = text
				end
			end
		end,
	})
end
ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent:Connect(function(_, root)
	if root.Parent and root.Parent ~= Player.Character then
		if root.Parent.Parent ~= workspace.Alive then
			return
		end
	end
	Auto_Parry.Closest_Player()
	local Ball = Auto_Parry.Get_Ball()
	if not Ball then
		return
	end
	local Target_Distance = (Player.Character.PrimaryPart.Position - Closest_Entity.PrimaryPart.Position).Magnitude
	local Distance = (Player.Character.PrimaryPart.Position - Ball.Position).Magnitude
	local Direction = (Player.Character.PrimaryPart.Position - Ball.Position).Unit
	local Dot = Direction:Dot(Ball.AssemblyLinearVelocity.Unit)
	local Curve_Detected = Auto_Parry.Is_Curved()
	if Target_Distance < 15 and Distance < 15 and Dot > 0 then
		if Curve_Detected then
			Auto_Parry.Parry(Selected_Parry_Type)
		end
	end
	if not Grab_Parry then
		return
	end
	Grab_Parry:Stop()
end)
ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
	if Player.Character.Parent ~= workspace.Alive then
		return
	end
	if not Grab_Parry then
		return
	end
	Grab_Parry:Stop()
end)
workspace.Balls.ChildAdded:Connect(function()
	Parried = false
end)
workspace.Balls.ChildRemoved:Connect(function(Value)
	Parries = 0
	Parried = false
	if Connections_Manager["Target Change"] then
		Connections_Manager["Target Change"]:Disconnect()
		Connections_Manager["Target Change"] = nil
	end
end)

main:load()
