local falseLibrary = {}
-- instances --
local falselib = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Color = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Icon = Instance.new("ImageLabel")
local Drop = Instance.new("Frame")
local Frame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Toggle = Instance.new("ImageButton")
local Text = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local Button = Instance.new("TextButton")
local Border = Instance.new("ImageLabel")
local ImageLabel = Instance.new("ImageLabel")
local BorderText = Instance.new("TextLabel")
local Box = Instance.new("TextBox")
local Minimize = Instance.new("TextButton")
-- functions --
function falseLibrary:NewWindow(Text)
	falselib.Name = "falselib"
	falselib.Parent = game:GetService("CoreGui")
	falselib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	Main.Name = "Main"
	Main.Parent = falselib
	Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.0270009637, 0, 0.0971993431, 0)
	Main.Size = UDim2.new(0, 240, 0, 54)
	
	Color.Name = "Color"
	Color.Parent = Main
	Color.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
	Color.BorderSizePixel = 0
	Color.Position = UDim2.new(0, 0, 0.826086819, 0)
	Color.Size = UDim2.new(0, 240, 0, 15)
	
	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Main
	
	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.180756718, 0, 0.0925928801, 0)
	Title.Size = UDim2.new(0, 138, 0, 35)
	Title.Font = Enum.Font.GothamSemibold
	Title.Text = Text or "NewWindow"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left
	
	Icon.Name = "Icon"
	Icon.Parent = Main
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.Position = UDim2.new(0, 0, 0.0185185224, 0)
	Icon.Size = UDim2.new(0, 44, 0, 44)
	Icon.Image = "rbxassetid://5680989217"
	
	Drop.Name = "Drop"
	Drop.Parent = Main
	Drop.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Drop.BorderSizePixel = 0
	Drop.Position = UDim2.new(0, 0, 1.0925926, 0)
	Drop.Size = UDim2.new(0, 240, 0, 319)
	
	Frame.Parent = Drop
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.Size = UDim2.new(0, 240, 0, 319)
	
	UIListLayout.Parent = Frame
	UIListLayout.Padding = UDim.new(0, 6)
	
	Minimize.Name = "Minimize"
	Minimize.Parent = Main
	Minimize.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Minimize.BackgroundTransparency = 1.000
	Minimize.Position = UDim2.new(0.833333373, 0, 0.12962991, 0)
	Minimize.Size = UDim2.new(0, 31, 0, 31)
	Minimize.Font = Enum.Font.GothamBold
	Minimize.Text = "-"
	Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
	Minimize.TextScaled = true
	Minimize.TextSize = 14.000
	Minimize.TextWrapped = true
end
function falseLibrary:NewToggle(Text)
	Toggle.Name = "Toggle"
	Toggle.Parent = Frame
	Toggle.BackgroundColor3 = Color3.fromRGB(188, 0, 0)
	Toggle.BorderSizePixel = 0
	Toggle.Position = UDim2.new(0, 0, 0.197492167, 0)
	Toggle.Size = UDim2.new(0, 40, 0, 40)
	Toggle.Image = "rbxassetid://0"
	
	Text.Name = "Text"
	Text.Parent = Toggle
	Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Text.BackgroundTransparency = 1.000
	Text.BorderSizePixel = 0
	Text.Position = UDim2.new(1.10000002, 0, 0, 0)
	Text.Size = UDim2.new(0, 196, 0, 40)
	Text.Font = Enum.Font.GothamSemibold
	Text.Text = Text or "ToggleButton"
	Text.TextColor3 = Color3.fromRGB(255, 255, 255)
	Text.TextSize = 14.000
	Text.TextWrapped = true
	Text.TextXAlignment = Enum.TextXAlignment.Left
	
	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = Toggle
end
function falseLibrary:NewButton(Text)
	Button.Name = "Button"
	Button.Parent = Frame
	Button.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
	Button.BorderSizePixel = 0
	Button.Position = UDim2.new(0, 0, 0.0815047026, 0)
	Button.Size = UDim2.new(0, 240, 0, 31)
	Button.Font = Enum.Font.GothamSemibold
	Button.Text = "ButtonText"
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextSize = 14.000
	Button.TextXAlignment = Enum.TextXAlignment.Left
end
function falseLibrary:NewBorder(Text)
	Border.Name = "Border"
	Border.Parent = Frame
	Border.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Border.BackgroundTransparency = 1.000
	Border.BorderSizePixel = 0
	Border.Size = UDim2.new(0, 240, 0, 20)
	Border.Image = "rbxassetid://0"
	
	ImageLabel.Parent = Border
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BorderColor3 = Color3.fromRGB(255, 255, 25)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.0500000007, 0, 0.449999988, 0)
	ImageLabel.Size = UDim2.new(0, 216, 0, 1)
	ImageLabel.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
	
	BorderText.Name = "BorderText"
	BorderText.Parent = Border
	BorderText.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	BorderText.BorderSizePixel = 0
	BorderText.Position = UDim2.new(0.304166675, 0, 0.149999976, 0)
	BorderText.Size = UDim2.new(0, 93, 0, 13)
	BorderText.Font = Enum.Font.Gotham
	BorderText.Text = Text or "BorderText"
	BorderText.TextColor3 = Color3.fromRGB(255, 255, 255)
	BorderText.TextSize = 14.000
end
function falseLibrary:NewBox(Text, PlaceHolderText)
	Box.Name = "Box"
	Box.Parent = Frame
	Box.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
	Box.BorderSizePixel = 0
	Box.Position = UDim2.new(0, 0, 0.0815047026, 0)
	Box.Size = UDim2.new(0, 240, 0, 31)
	Box.Font = Enum.Font.GothamSemibold
	Box.PlaceholderText = PlaceHolderText or "BoxPlaceHolderText"
	Box.Text = Text or "BoxText"
	Box.TextColor3 = Color3.fromRGB(255, 255, 255)
	Box.TextSize = 14.000
	Box.TextXAlignment = Enum.TextXAlignment.Left
end
return falseLibrary;
