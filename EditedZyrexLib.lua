--[[
Created by Zyrex#3641
Modified by Pikalyzix
MASSIVE THANK YOU to zyrex
Documentation:
library:CreateWindow(Name <string>)
Window:Toggle(Name <string>, Callback <function>)
Window:Button(Name <string>, Callback <function>)
Window:Slider(Name <string>, Min <number>, Max <number>, Callback <function>)
Window:Dropdown(Name <string>, List <table>, Callback <function>)
Window:Box(Name <string>, Callback <function>)
Window:Label(Name <string>)

This is open-sourced and free to use.
You may use it for your own scripts as long as you give credits.
--]]

_G.Toggle_GUI = _G.Toggle_GUI or Enum.KeyCode.RightControl

local library = {WindowCount = 0}
local Windows = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local function RS(Length)
	math.randomseed(os.time())
	local Possible = "QWERTYUIOPASDFGKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890"
	local Characters = {}
	local Output = ""
	Possible:gsub(".", function(v)
		table.insert(Characters, v)
	end)
	for i = 1, Length do
		local RandomChar = math.random(1, #Characters)
		Output = Output .. Characters[RandomChar]
	end
	return Output
end

local function makeDraggable(obj) 
    --// Original code by Tiffblocks, edited so that it has a cool tween to it. 
    local gui = obj
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
		local delta = input.Position - dragStart
		local EndPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        local Tween = TweenService:Create(
			gui, 
			TweenInfo.new(0.2), 
			{Position = EndPos}
		)
		Tween:Play()
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = RS(7)
local GuiToggled = false
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(v)
    if v.KeyCode == _G.Toggle_GUI then
        GuiToggled = not GuiToggled
        if GuiToggled == true then
            ScreenGui.Enabled = false
        else
            ScreenGui.Enabled = true
        end
    end
end)


function library:CreateWindow(text)
	library.WindowCount = library.WindowCount + 1
	
	text = text or "Title"
	
	local Frame = Instance.new("ImageLabel")
	local Header = Instance.new("ImageLabel")
	local ObjectFrame = Instance.new("Frame")
	local UIListLayout1 = Instance.new("UIListLayout")
	local ToggleWindowBtn = Instance.new("ImageButton")
	local Title = Instance.new("TextLabel")
	table.insert(Windows, Frame)
	
	Frame.Name = "Frame"
	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
	Frame.BackgroundTransparency = 1.000
	Frame.ClipsDescendants = false
	Frame.Position = UDim2.new(0, (40 + (200 * library.WindowCount) - 200), 0, 11)
	Frame.Size = UDim2.new(0, 187, 0, UIListLayout1.AbsoluteContentSize.Y + 45)
	Frame.Image = "rbxassetid://3570695787"
	Frame.ImageColor3 = Color3.fromRGB(26, 26, 26)
	Frame.ScaleType = Enum.ScaleType.Slice
	Frame.SliceCenter = Rect.new(100, 100, 100, 100)
	Frame.SliceScale = 0.040
	makeDraggable(Frame)
	
	Header.Name = "Header"
	Header.Parent = Frame
	Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Header.BackgroundTransparency = 1.000
	Header.Size = UDim2.new(0, 187, 0, 30)
	Header.Image = "rbxassetid://3570695787"
	Header.ImageColor3 = Color3.fromRGB(30, 20, 40)
	Header.ScaleType = Enum.ScaleType.Slice
	Header.SliceCenter = Rect.new(100, 100, 100, 100)
	Header.SliceScale = 0.040
	
	ObjectFrame.Name = "ObjectFrame"
	ObjectFrame.Parent = Header
	ObjectFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ObjectFrame.BackgroundTransparency = 1.000
	ObjectFrame.Position = UDim2.new(0.0374331549, 0, 1.23090911, 0)
	ObjectFrame.Size = UDim2.new(0, 173, 0, Frame.Size.Y.Offset - 45)
	ObjectFrame.ClipsDescendants = false
	
	UIListLayout1.Name = "UIListLayout1"
	UIListLayout1.Parent = ObjectFrame
	UIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout1.Padding = UDim.new(0, 6)
	
	ToggleWindowBtn.Name = "ToggleWindowBtn"
	ToggleWindowBtn.Parent = Header
	ToggleWindowBtn.AnchorPoint = Vector2.new(0.5, 0.5)
	ToggleWindowBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleWindowBtn.BackgroundTransparency = 1.000
	ToggleWindowBtn.Position = UDim2.new(0.904128313, 0, 0.499000013, 0)
	ToggleWindowBtn.Rotation = 90.000
	ToggleWindowBtn.Size = UDim2.new(0, 20, 0, 20)
	ToggleWindowBtn.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"
	
	Title.Name = "Title"
	Title.Parent = Frame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.053475935, 0, 0, 0)
	Title.Size = UDim2.new(0, 148, 0, 30)
	Title.Font = Enum.Font.Gotham
	Title.Text = text
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
  Title.TextStrokeColor3 = Color3.fromRGB(30, 20, 40)
	Title.TextSize = 20.000
	Title.TextXAlignment = Enum.TextXAlignment.Left
	
	local CloseTween = TweenService:Create(
		ToggleWindowBtn,
		TweenInfo.new(
			0.5,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.InOut
		),
		{
			Rotation = 270
		}
	)
	local OpenTween = TweenService:Create(
		ToggleWindowBtn,
		TweenInfo.new(
			0.5,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.InOut
		),
		{
			Rotation = 90
		}
	)
	local WindowToggled = false
	ToggleWindowBtn.MouseButton1Click:Connect(function()
		if WindowToggled == false then
			Frame.ClipsDescendants = true
			Frame:TweenSize(UDim2.new(0, 187, 0, 30), "InOut", "Quad", 0.5, true)
			CloseTween:Play()
		elseif WindowToggled == true then
			Frame:TweenSize(UDim2.new(0, 187, 0, Frame.Header.ObjectFrame.UIListLayout1.AbsoluteContentSize.Y + 45), "InOut", "Quad", 0.5, true)
			OpenTween:Play() 
			wait(1)
			Frame.ClipsDescendants = false
		end
		WindowToggled = not WindowToggled
	end)
	local Window = {}
    function Window:Button(text, callback)
        local Button = Instance.new("TextButton")
        local Roundify = Instance.new("ImageLabel")
		
		text = text or "Button"
		callback = callback or function(...) end

        Button.Name = "Button"
        Button.Parent = ObjectFrame
        Button.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
        Button.BackgroundTransparency = 1.000
        Button.BorderSizePixel = 0
        Button.Size = UDim2.new(0, 173, 0, 22)
        Button.ZIndex = 2
        Button.Font = Enum.Font.Gotham
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 14.000
        Button.Text = text
        Button.ClipsDescendants = true
        
        Roundify.Name = "Roundify"
        Roundify.Parent = Button
        Roundify.Active = true
        Roundify.AnchorPoint = Vector2.new(0.5, 0.5)
        Roundify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Roundify.BackgroundTransparency = 1.000
        Roundify.Position = UDim2.new(0.5, 0, 0.5, 0)
        Roundify.Selectable = true
        Roundify.Size = UDim2.new(1, 0, 1, 0)
        Roundify.Image = "rbxassetid://3570695787"
        Roundify.ImageColor3 = Color3.fromRGB(16, 16, 16)
        Roundify.ScaleType = Enum.ScaleType.Slice
        Roundify.SliceCenter = Rect.new(100, 100, 100, 100)
        Roundify.SliceScale = 0.030

        local MouseEntered = TweenService:Create(
            Roundify,
            TweenInfo.new(
			0.3,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
            ),
            {
                ImageColor3 = Color3.fromRGB(12, 12, 12)
            }
        )

        local MouseLeft = TweenService:Create(
            Roundify,
            TweenInfo.new(
			0.3,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
            ),
            {
                ImageColor3 = Color3.fromRGB(16, 16, 16)
            }
        )

        Button.MouseEnter:Connect(function()
            MouseEntered:Play()
        end)
        Button.MouseLeave:Connect(function()
            MouseLeft:Play()
        end)
        for i,v in next, Windows do
			v.Size = UDim2.new(0, 187, 0, v.Header.ObjectFrame.UIListLayout1.AbsoluteContentSize.Y + 45)
			v.Header.ObjectFrame.Size = UDim2.new(0, 173, 0, v.Size.Y.Offset - 45)
        end

		local function FireClick()
			spawn(function()
				local Mouse = game.Players.LocalPlayer:GetMouse()
				local Circle = Instance.new("ImageLabel")
				Circle.Name = "Circle"
				Circle.Parent = Button
				Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Circle.BackgroundTransparency = 1.000
				Circle.ZIndex = 10
				Circle.Image = "rbxassetid://266543268"
				Circle.ImageColor3 = Color3.fromRGB(0, 0, 0)
				Circle.ImageTransparency = 0.4
				local NewX, NewY = Mouse.X - Circle.AbsolutePosition.X, Mouse.Y - Circle.AbsolutePosition.Y
				Circle.Position = UDim2.new(0, NewX, 0, NewY)
				local Size = 0
				if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
					Size = Button.AbsoluteSize.X * 1.5
				elseif Button.AbsoluteSize.X < Button.AbsoluteSize.Y then
					Size = Button.AbsoluteSize.Y * 1.5
				elseif Button.AbsoluteSize.X == Button.AbsoluteSize.Y then
					Size = Button.AbsoluteSize.X * 1.5
				end
				Circle:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size), UDim2.new(0.5, - Size / 2, 0.5, - Size / 2), "Out", "Quad", 0.5, false)
				for i = 1, 20 do
					Circle.ImageTransparency = Circle.ImageTransparency + 0.05
					wait(0.3 / 10)
				end
				Circle:Destroy()
			end)
			pcall(callback)
        end
        Button.MouseButton1Click:Connect(FireClick)
	end
	function Window:Label(text)
		local Label = Instance.new("TextLabel")

		text = text or "Label"

		Label.Name = "Label"
		Label.Parent = ObjectFrame
		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Label.BackgroundTransparency = 1.000
		Label.Position = UDim2.new(0, 0, 0.122807018, 0)
		Label.Size = UDim2.new(0, 173, 0, 22)
		Label.Font = Enum.Font.Gotham
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextSize = 14.000
		Label.Text = text
		for i,v in next, Windows do
			v.Size = UDim2.new(0, 187, 0, v.Header.ObjectFrame.UIListLayout1.AbsoluteContentSize.Y + 45)
			v.Header.ObjectFrame.Size = UDim2.new(0, 173, 0, v.Size.Y.Offset - 45)
        end
	end
	function Window:Toggle(text, callback)
		text = text or "Toggle"
		callback = callback or function(...) end

		local Toggle = Instance.new("TextLabel")
		local ToggleButton = Instance.new("TextButton")
		local Roundify = Instance.new("ImageLabel")
		
		Toggle.Name = "Toggle"
		Toggle.Parent = ObjectFrame
		Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Toggle.BackgroundTransparency = 1.000
		Toggle.Position = UDim2.new(0, 0, 0.122807018, 0)
		Toggle.Size = UDim2.new(0, 173, 0, 22)
		Toggle.Font = Enum.Font.Gotham
		Toggle.Text = text
		Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
		Toggle.TextSize = 14.000
		Toggle.TextXAlignment = Enum.TextXAlignment.Left
		
		ToggleButton.Name = "ToggleButton"
		ToggleButton.Parent = Toggle
		ToggleButton.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
		ToggleButton.BackgroundTransparency = 1.000
		ToggleButton.BorderSizePixel = 0
		ToggleButton.Position = UDim2.new(0.872832358, 0, 0, 0)
		ToggleButton.Size = UDim2.new(0, 22, 0, 22)
		ToggleButton.ZIndex = 2
		ToggleButton.Font = Enum.Font.Gotham
		ToggleButton.Text = ""
		ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToggleButton.TextSize = 14.000
		
		Roundify.Name = "Roundify"
		Roundify.Parent = ToggleButton
		Roundify.Active = true
		Roundify.AnchorPoint = Vector2.new(0.5, 0.5)
		Roundify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Roundify.BackgroundTransparency = 1.000
		Roundify.Position = UDim2.new(0.5, 0, 0.5, 0)
		Roundify.Selectable = true
		Roundify.Size = UDim2.new(1, 0, 1, 0)
		Roundify.Image = "rbxassetid://3570695787"
		Roundify.ImageColor3 = Color3.fromRGB(255, 42, 45)
		Roundify.ScaleType = Enum.ScaleType.Slice
		Roundify.SliceCenter = Rect.new(100, 100, 100, 100)
		Roundify.SliceScale = 0.030

		local Toggled = false
		
		local ToggleOn = TweenService:Create(
			Roundify,
			TweenInfo.new(
				0.3,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				ImageColor3 = Color3.fromRGB(56, 255, 42)
			}
		)
		
		local ToggleOff = TweenService:Create(
			Roundify,
			TweenInfo.new(
				0.3,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				ImageColor3 = Color3.fromRGB(255, 42, 45)
			}
		)
		
		local function FireToggle()
			if Toggled == true then
				ToggleOff:Play()
			elseif Toggled == false then
				ToggleOn:Play()
			end
			Toggled = not Toggled
			pcall(callback, Toggled)
		end
		
		ToggleButton.MouseButton1Click:Connect(FireToggle)

		for i,v in next, Windows do
			v.Size = UDim2.new(0, 187, 0, v.Header.ObjectFrame.UIListLayout1.AbsoluteContentSize.Y + 45)
			v.Header.ObjectFrame.Size = UDim2.new(0, 173, 0, v.Size.Y.Offset - 45)
        end
	end
	function Window:Box(text, callback)

		text = text or "Box"
		callback = callback or function(...) end

		local Box = Instance.new("TextLabel")
		local TextBox = Instance.new("TextBox")
		local Roundify = Instance.new("ImageLabel")
		
		Box.Name = "Box"
		Box.Parent = ObjectFrame
		Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Box.BackgroundTransparency = 1.000
		Box.Position = UDim2.new(0, 0, 0.122807018, 0)
		Box.Size = UDim2.new(0, 173, 0, 22)
		Box.Font = Enum.Font.Gotham
		Box.Text = text
		Box.TextColor3 = Color3.fromRGB(255, 255, 255)
		Box.TextSize = 14.000
		Box.TextXAlignment = Enum.TextXAlignment.Left
		
		TextBox.Parent = Box
		TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.BackgroundTransparency = 1.000
		TextBox.BorderSizePixel = 0
		TextBox.Position = UDim2.new(0.560693622, 0, 0, 0)
		TextBox.Size = UDim2.new(0, 76, 0, 22)
		TextBox.ZIndex = 2
		TextBox.Font = Enum.Font.Gotham
		TextBox.Text = ""
		TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.TextSize = 14.000

		Roundify.Name = "Roundify"
		Roundify.Parent = TextBox
		Roundify.Active = true
		Roundify.AnchorPoint = Vector2.new(0.5, 0.5)
		Roundify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Roundify.BackgroundTransparency = 1.000
		Roundify.Position = UDim2.new(0.499248117, 0, 0.5, 0)
		Roundify.Selectable = true
		Roundify.Size = UDim2.new(1.00150371, 0, 1, 0)
		Roundify.Image = "rbxassetid://3570695787"
		Roundify.ImageColor3 = Color3.fromRGB(16, 16, 16)
		Roundify.ScaleType = Enum.ScaleType.Slice
		Roundify.SliceCenter = Rect.new(100, 100, 100, 100)
		Roundify.SliceScale = 0.030

		TextBox.FocusLost:Connect(function()
			pcall(callback, TextBox.Text)
		end)

		for i,v in next, Windows do
			v.Size = UDim2.new(0, 187, 0, v.Header.ObjectFrame.UIListLayout1.AbsoluteContentSize.Y + 45)
			v.Header.ObjectFrame.Size = UDim2.new(0, 173, 0, v.Size.Y.Offset - 45)
        end
	end
	function Window:Dropdown(text, list, callback)
		text = text or "Dropdown"
		callback = callback or function(...) end
		list = list or {}
		
		local selected = list[1]

		local Dropdown = Instance.new("TextButton")
		local Roundify = Instance.new("ImageLabel")
		local DropArrow = Instance.new("ImageButton")
		local DropFrame = Instance.new("ImageLabel")
		local UIListLayout = Instance.new("UIListLayout")
		local Text = Instance.new("TextLabel")
		local DropArrow2 = Instance.new("ImageButton")
		local Clip = Instance.new("TextLabel")
		
		Dropdown.Name = "Dropdown"
		Dropdown.Parent = ObjectFrame
		Dropdown.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
		Dropdown.BackgroundTransparency = 1.000
		Dropdown.BorderSizePixel = 0
		Dropdown.Size = UDim2.new(0, 173, 0, 22)
		Dropdown.ZIndex = 2
		Dropdown.Font = Enum.Font.Gotham
		Dropdown.Text = selected
		Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
		Dropdown.TextSize = 14.000
		
		Clip.Name = "Clip"
		Clip.Parent = Dropdown
		Clip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Clip.BackgroundTransparency = 1.000
		Clip.Size = UDim2.new(0, 173, 0, 22)
		Clip.Font = Enum.Font.SourceSans
		Clip.Text = ""
		Clip.TextColor3 = Color3.fromRGB(0, 0, 0)
		Clip.TextSize = 14.000
		Clip.ClipsDescendants = true

		Roundify.Name = "Roundify"
		Roundify.Parent = Dropdown
		Roundify.Active = true
		Roundify.AnchorPoint = Vector2.new(0.5, 0.5)
		Roundify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Roundify.BackgroundTransparency = 1.000
		Roundify.Position = UDim2.new(0.5, 0, 0.5, 0)
		Roundify.Selectable = true
		Roundify.Size = UDim2.new(1, 0, 1, 0)
		Roundify.Image = "rbxassetid://3570695787"
		Roundify.ImageColor3 = Color3.fromRGB(16, 16, 16)
		Roundify.ScaleType = Enum.ScaleType.Slice
		Roundify.SliceCenter = Rect.new(100, 100, 100, 100)
		Roundify.SliceScale = 0.030
		
		DropArrow.Name = "DropArrow"
		DropArrow.Parent = Dropdown
		DropArrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropArrow.BackgroundTransparency = 1.000
		DropArrow.Position = UDim2.new(0.875999987, 0, 0.08299999100, 0)
		DropArrow.Rotation = 270.000
		DropArrow.Size = UDim2.new(0, 17, 0, 17)
		DropArrow.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"
		
		DropFrame.Name = "DropFrame"
		DropFrame.Parent = Dropdown
		DropFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropFrame.BackgroundTransparency = 1.000
		DropFrame.ClipsDescendants = true
		DropFrame.Size = UDim2.new(0, 173, 0, 22)
		DropFrame.Visible = false
		DropFrame.ZIndex = 3
		DropFrame.Image = "rbxassetid://3570695787"
		DropFrame.ImageColor3 = Color3.fromRGB(16, 16, 16)
		DropFrame.ScaleType = Enum.ScaleType.Slice
		DropFrame.SliceCenter = Rect.new(100, 100, 100, 100)
		DropFrame.SliceScale = 0.040
		
		UIListLayout.Parent = DropFrame
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		
		Text.Name = "Text"
		Text.Parent = DropFrame
		Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text.BackgroundTransparency = 1.000
		Text.Position = UDim2.new(0, 0, 0.0182600394, 0)
		Text.Size = UDim2.new(0, 173, 0, 22)
		Text.ZIndex = 3
		Text.Font = Enum.Font.Gotham
		Text.TextColor3 = Color3.fromRGB(93, 93, 93)
		Text.TextSize = 14.000
		Text.Text = text
		
		DropArrow2.Name = "DropArrow2"
		DropArrow2.Parent = Text
		DropArrow2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropArrow2.BackgroundTransparency = 1.000
		DropArrow2.Position = UDim2.new(0.875999987, 0, 0.0780000016, 0)
		DropArrow2.Rotation = 270.000
		DropArrow2.Size = UDim2.new(0, 17, 0, 17)
		DropArrow2.ZIndex = 3
		DropArrow2.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"
		
		local function RippleEffect(obj)
			local Mouse = game.Players.LocalPlayer:GetMouse()
			local Circle = Instance.new("ImageLabel")
			Circle.Name = "Circle"
			Circle.Parent = obj
			Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Circle.BackgroundTransparency = 1.000
			Circle.ZIndex = 10
			Circle.Image = "rbxassetid://266543268"
			Circle.ImageColor3 = Color3.fromRGB(0, 0, 0)
			Circle.ImageTransparency = 0.4
			local NewX, NewY = Mouse.X - Circle.AbsolutePosition.X, Mouse.Y - Circle.AbsolutePosition.Y
			Circle.Position = UDim2.new(0, NewX, 0, NewY)
			local Size = 0
			if obj.AbsoluteSize.X > obj.AbsoluteSize.Y then
				Size = obj.AbsoluteSize.X * 1.5
			elseif obj.AbsoluteSize.X < obj.AbsoluteSize.Y then
				Size = obj.AbsoluteSize.Y * 1.5
			elseif obj.AbsoluteSize.X == obj.AbsoluteSize.Y then
				Size = obj.AbsoluteSize.X * 1.5
			end
			Circle:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size), UDim2.new(0.5, - Size / 2, 0.5, - Size / 2), "Out", "Quad", 0.5, false)
			for i = 1, 20 do
				Circle.ImageTransparency = Circle.ImageTransparency + 0.05
				wait(0.3 / 10)
			end
			Circle:Destroy()
		end

		local DropToggled = false

		for i,v in next, list do
			local Button = Instance.new("TextButton")
			Button.Name = "Button"
			Button.Parent = DropFrame
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.Position = UDim2.new(0, 0, 0.219999999, 0)
			Button.Size = UDim2.new(0, 173, 0, 22)
			Button.ZIndex = 3
			Button.Font = Enum.Font.Gotham
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 14.000
			Button.Text = tostring(v)
			Button.ClipsDescendants = true
		end

		local ArrowDown = TweenService:Create(
			DropArrow2,
			TweenInfo.new(
				0.5,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.InOut
			),
			{
				Rotation = 90
			}
		)
		local ArrowUp = TweenService:Create(
			DropArrow2,
			TweenInfo.new(
				0.5,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.InOut
			),
			{
				Rotation = 270
			}
		)

		for i,v in pairs(DropFrame:GetChildren()) do
			if v:IsA("TextButton") then
				v.MouseButton1Down:Connect(function()
					spawn(function() RippleEffect(v) end)
					selected = v.Text
					pcall(callback, selected)
					Dropdown.Text = selected
					ArrowUp:Play()
					DropFrame:TweenSize(UDim2.new(0, 173, 0, 22), "InOut", "Quad", 0.5, true)
					DropToggled = false
					wait(0.5)
					DropFrame.Visible = false
				end)
				local MouseEntered = TweenService:Create(
					Roundify,
					TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
					),
					{
						BackgroundColor3 = Color3.fromRGB(12, 12, 12)
					}
				)
		
				local MouseLeft = TweenService:Create(
					Roundify,
					TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
					),
					{
						BackgroundColor3 = Color3.fromRGB(16, 16, 16)
					}
				)
		
				v.MouseEnter:Connect(function()
					MouseEntered:Play()
				end)
				v.MouseLeave:Connect(function()
					MouseLeft:Play()
				end)
			end
		end
		
		Dropdown.MouseButton1Click:Connect(function()
			spawn(function() RippleEffect(Clip) end)
			if DropToggled == false then
				ArrowDown:Play()
				DropFrame.Visible = true
				DropFrame:TweenSize(UDim2.new(0, 173, 0, UIListLayout.AbsoluteContentSize.Y), "InOut", "Quad", 0.5, true)
			else
				ArrowUp:Play()
				DropFrame:TweenSize(UDim2.new(0, 173, 0, 22), "InOut", "Quad", 0.5, true)
				wait(0.5)
				DropFrame.Visible = false
			end
			DropToggled = not DropToggled
		end)

		

		local MouseEntered = TweenService:Create(
            Roundify,
            TweenInfo.new(
			0.3,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
            ),
            {
                ImageColor3 = Color3.fromRGB(12, 12, 12)
            }
        )

        local MouseLeft = TweenService:Create(
            Roundify,
            TweenInfo.new(
			0.3,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
            ),
            {
                ImageColor3 = Color3.fromRGB(16, 16, 16)
            }
        )

        Dropdown.MouseEnter:Connect(function()
            MouseEntered:Play()
        end)
        Dropdown.MouseLeave:Connect(function()
            MouseLeft:Play()
        end)

		for i,v in next, Windows do
			v.Size = UDim2.new(0, 187, 0, v.Header.ObjectFrame.UIListLayout1.AbsoluteContentSize.Y + 45)
			v.Header.ObjectFrame.Size = UDim2.new(0, 173, 0, v.Size.Y.Offset - 45)
        end
	end
	function Window:Slider(text, min, max, callback)
		text = text or "Slider"
		min = min or 0
		max = max or 100
		callback = callback or function(...) end
		
		local Slider = Instance.new("TextLabel")
		local Amount = Instance.new("TextLabel")
		local SliderButton = Instance.new("TextButton")
		local Roundify = Instance.new("ImageLabel")
		local SliderFrame = Instance.new("ImageLabel")
		local Text = Instance.new("TextLabel")
		
		Slider.Name = "Slider"
		Slider.Parent = ObjectFrame
		Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Slider.BackgroundTransparency = 1.000
		Slider.Position = UDim2.new(0, 0, 0.394736856, 0)
		Slider.Size = UDim2.new(0, 173, 0, 38)
		Slider.Font = Enum.Font.Gotham
		Slider.Text = ""
		Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
		Slider.TextSize = 14.000
		Slider.TextXAlignment = Enum.TextXAlignment.Left
		
		Amount.Name = "Amount"
		Amount.Parent = Slider
		Amount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Amount.BackgroundTransparency = 1.000
		Amount.Size = UDim2.new(0, 173, 0, 28)
		Amount.Font = Enum.Font.Gotham
		Amount.Text = min
		Amount.TextColor3 = Color3.fromRGB(255, 255, 255)
		Amount.TextSize = 14.000
		Amount.TextXAlignment = Enum.TextXAlignment.Right

		SliderButton.Name = "SliderButton"
		SliderButton.Parent = Slider
		SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderButton.BackgroundTransparency = 1.000
		SliderButton.BorderSizePixel = 0
		SliderButton.Position = UDim2.new(0, 0, 0.760208607, 0)
		SliderButton.Size = UDim2.new(0, 173, 0, 9)
		SliderButton.Font = Enum.Font.SourceSans
		SliderButton.Text = ""
		SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		SliderButton.TextSize = 14.000
		
		Roundify.Name = "Roundify"
		Roundify.Parent = SliderButton
		Roundify.Active = true
		Roundify.AnchorPoint = Vector2.new(0.5, 0.5)
		Roundify.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		Roundify.BackgroundTransparency = 1.000
		Roundify.Position = UDim2.new(0.5, 0, 0.5, 0)
		Roundify.Selectable = true
		Roundify.Size = UDim2.new(1, 0, 1, 0)
		Roundify.Image = "rbxassetid://3570695787"
		Roundify.ImageColor3 = Color3.fromRGB(16, 16, 16)
		Roundify.ScaleType = Enum.ScaleType.Slice
		Roundify.SliceCenter = Rect.new(100, 100, 100, 100)
		Roundify.SliceScale = 0.030
		
		Roundify.Name = "Roundify"
		Roundify.Parent = SliderButton
		Roundify.Active = true
		Roundify.AnchorPoint = Vector2.new(0.5, 0.5)
		Roundify.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		Roundify.BackgroundTransparency = 1.000
		Roundify.Position = UDim2.new(0.5, 0, 0.5, 0)
		Roundify.Selectable = true
		Roundify.Size = UDim2.new(1, 0, 1, 0)
		Roundify.Image = "rbxassetid://3570695787"
		Roundify.ImageColor3 = Color3.fromRGB(16, 16, 16)
		Roundify.ScaleType = Enum.ScaleType.Slice
		Roundify.SliceCenter = Rect.new(100, 100, 100, 100)
		Roundify.SliceScale = 0.030
		
		SliderFrame.Name = "SliderFrame"
		SliderFrame.Parent = SliderButton
		SliderFrame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		SliderFrame.BackgroundTransparency = 1.000
		SliderFrame.Size = UDim2.new(0, 0, 0, 9)
		SliderFrame.Image = "rbxassetid://3570695787"
		SliderFrame.ImageColor3 = Color3.fromRGB(52, 52, 52)
		SliderFrame.ScaleType = Enum.ScaleType.Slice
		SliderFrame.SliceCenter = Rect.new(100, 100, 100, 100)
		SliderFrame.SliceScale = 0.030

		Text.Name = "Text"
		Text.Parent = Slider
		Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text.BackgroundTransparency = 1.000
		Text.Size = UDim2.new(0, 173, 0, 28)
		Text.Font = Enum.Font.Gotham
		Text.Text = text
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.TextSize = 14.000
		Text.TextXAlignment = Enum.TextXAlignment.Left

		--// Credits to text for the slider functionality
		local mouse = game.Players.LocalPlayer:GetMouse()
		local uis = game:GetService("UserInputService")
		local value = nil
		SliderButton.MouseButton1Down:Connect(function()
            value = math.floor((((tonumber(max) - tonumber(min)) / 173) * SliderFrame.AbsoluteSize.X) + tonumber(min)) or 0
            Amount.Text = value
            pcall(function() callback(value) end)
            SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 173), 0, 9)
            moveconnection = mouse.Move:Connect(function()
                value = math.floor((((tonumber(max) - tonumber(min)) / 173) * SliderFrame.AbsoluteSize.X) + tonumber(min))
                Amount.Text = value
                pcall(function() callback(value) end)
                SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 173), 0, 9)
            end)
            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                    value = math.floor((((tonumber(max) - tonumber(min)) / 173) * SliderFrame.AbsoluteSize.X) + tonumber(min))
                    Amount.Text = value
                    pcall(function() callback(value) end)
                    SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 173), 0, 9)
                    moveconnection:Disconnect()
                    releaseconnection:Disconnect()
                end
            end)
        end)

		for i,v in next, Windows do
			v.Size = UDim2.new(0, 187, 0, v.Header.ObjectFrame.UIListLayout1.AbsoluteContentSize.Y + 45)
			v.Header.ObjectFrame.Size = UDim2.new(0, 173, 0, v.Size.Y.Offset - 45)
		end
	end
    return Window
end
return library
