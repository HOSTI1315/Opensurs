local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/librarynew",true))()
local tab = library:CreateWindow("Your Title")
-- local tab2 if u want another tab

-- if you want folder 
local folder = tab:AddFolder("Folder")

-- ## If you dont want folder then remove folder part and replace all folder word with tab in buttons toggles and all.\

-- button 
folder:AddButton({
	text = "Click me",
	flag = "button",
	callback = function()
	print("hello world")
end
})

folder:AddToggle({
	text = "Toggle",
	flag = "toggle",
	callback = function(v)
	print(v)
end
})

folder:AddLabel({
	text = "This Is Sick!",
	type = "label"
})

folder:AddSlider({
	text = "Fov",
	min = 70,
	max = 170,
	dual = true,
	type = "slider",
	callback = function(v)
	print(v)
end
})

folder:AddColor({
	text = "Color Picker",
	flag = "color",
	type = "color",
	callback = function(v)
	print(v)
end
})

folder:AddList({
    text = "Color",
    values = {"Red", "Green", "Blue"},
    callback = function(value)
        print("Selected color:", value)
    end,
    open = false,
    flag = "color_option"
})

folder:AddBind({
    text = "bind",
    key = "X",
    hold = false,
    callback = function()
    end
})

library:Close() -- this close library
library:Init() -- if u dont add this at end of the ui it will not load ui