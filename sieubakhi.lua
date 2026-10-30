-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Xóa menu cũ nếu chạy lại script nhiều lần
if CoreGui:FindFirstChild("FakeAEggMenu") then
    CoreGui.FakeAEggMenu:Destroy()
end

-- Tạo GUI Menu chính (Chuẩn 4K Sharp UI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FakeAEggMenu"
ScreenGui.Parent = CoreGui
ScreenGui.IgnoreGuiInset = true

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 290, 0, 185)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(80, 80, 120)
MainStroke.Thickness = 1.5

-- Tiêu đề Menu
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 36)
Title.Font = Enum.Font.GothamBold
Title.Text = "  ⚡ FAKE A EGG"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13
Title.TextXAlignment = Enum.TextXAlignment.Left

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

local TitleFix = Instance.new("Frame")
TitleFix.Parent = Title
TitleFix.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
TitleFix.BorderSizePixel = 0
TitleFix.Position = UDim2.new(0, 0, 0.7, 0)
TitleFix.Size = UDim2.new(1, 0, 0.3, 0)

-- Nút Thu Nhỏ / Ẩn Hiện Menu (-)
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = Title
MinimizeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(1, -32, 0.15, 0)
MinimizeButton.Size = UDim2.new(0, 24, 0, 24)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeButton

-- Thanh chuyển đổi 4 Tab
local TabBar = Instance.new("Frame")
TabBar.Parent = MainFrame
TabBar.BackgroundTransparency = 1
TabBar.Position = UDim2.new(0, 10, 0, 42)
TabBar.Size = UDim2.new(1, -20, 0, 26)

local function createTabButton(name, posX)
    local btn = Instance.new("TextButton")
    btn.Parent = TabBar
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    btn.BorderSizePixel = 0
    btn.Position = UDim2.new(posX, 0, 0, 0)
    btn.Size = UDim2.new(0.235, 0, 1, 0)
    btn.Font = Enum.Font.GothamBold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(160, 160, 180)
    btn.TextSize = 9.5
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    return btn
end

local Tab1Btn = createTabButton("ESP/Form", 0.00)
local Tab2Btn = createTabButton("Teleport", 0.255)
local Tab3Btn = createTabButton("Speed", 0.51)
local Tab4Btn = createTabButton("Cài Đặt", 0.765)

-- Container chứa nội dung các Tab
local ContentContainer = Instance.new("Frame")
ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 10, 0, 74)
ContentContainer.Size = UDim2.new(1, -20, 0, 100)

-- ==================== TAB 1: ESP & BIẾN HÌNH ====================
local Tab1Content = Instance.new("Frame")
Tab1Content.Parent = ContentContainer
Tab1Content.BackgroundTransparency = 1
Tab1Content.Size = UDim2.new(1, 0, 1, 0)
Tab1Content.Visible = true

local RedToggleButton = Instance.new("TextButton")
RedToggleButton.Parent = Tab1Content
RedToggleButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
RedToggleButton.Size = UDim2.new(0.48, 0, 0, 45)
RedToggleButton.Position = UDim2.new(0, 0, 0.1, 0)
RedToggleButton.Font = Enum.Font.GothamBold
RedToggleButton.Text = "ESP Đỏ: OFF"
RedToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RedToggleButton.TextSize = 11

local RedCorner = Instance.new("UICorner")
RedCorner.CornerRadius = UDim.new(0, 6)
RedCorner.Parent = RedToggleButton

local PropToggleButton = Instance.new("TextButton")
PropToggleButton.Parent = Tab1Content
PropToggleButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
PropToggleButton.Size = UDim2.new(0.48, 0, 0, 45)
PropToggleButton.Position = UDim2.new(0.52, 0, 0.1, 0)
PropToggleButton.Font = Enum.Font.GothamBold
PropToggleButton.Text = "Biến Hình: OFF"
PropToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PropToggleButton.TextSize = 11

local PropCorner = Instance.new("UICorner")
PropCorner.CornerRadius = UDim.new(0, 6)
PropCorner.Parent = PropToggleButton

-- ==================== TAB 2: DỊCH CHUYỂN ====================
local Tab2Content = Instance.new("Frame")
Tab2Content.Parent = ContentContainer
Tab2Content.BackgroundTransparency = 1
Tab2Content.Size = UDim2.new(1, 0, 1, 0)
Tab2Content.Visible = false

local SavePosBtn = Instance.new("TextButton")
SavePosBtn.Parent = Tab2Content
SavePosBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 180)
SavePosBtn.Size = UDim2.new(0.48, 0, 0, 45)
SavePosBtn.Position = UDim2.new(0, 0, 0.1, 0)
SavePosBtn.Font = Enum.Font.GothamBold
SavePosBtn.Text = "Lưu Vị Trí"
SavePosBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SavePosBtn.TextSize = 11

local SaveCorner = Instance.new("UICorner")
SaveCorner.CornerRadius = UDim.new(0, 6)
SaveCorner.Parent = SavePosBtn

local TpBtn = Instance.new("TextButton")
TpBtn.Parent = Tab2Content
TpBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
TpBtn.Size = UDim2.new(0.48, 0, 0, 45)
TpBtn.Position = UDim2.new(0.52, 0, 0.1, 0)
TpBtn.Font = Enum.Font.GothamBold
TpBtn.Text = "Dịch Chuyển"
TpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TpBtn.TextSize = 11

local TpCorner = Instance.new("UICorner")
TpCorner.CornerRadius = UDim.new(0, 6)
TpCorner.Parent = TpBtn

-- ==================== TAB 3: SPEED (TÙY CHỈNH TỰ DO) ====================
local Tab3Content = Instance.new("Frame")
Tab3Content.Parent = ContentContainer
Tab3Content.BackgroundTransparency = 1
Tab3Content.Size = UDim2.new(1, 0, 1, 0)
Tab3Content.Visible = false

-- Ô nhập số tùy chỉnh tốc độ
local SpeedBox = Instance.new("TextBox")
SpeedBox.Parent = Tab3Content
SpeedBox.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
SpeedBox.Size = UDim2.new(0.60, 0, 0, 35)
SpeedBox.Position = UDim2.new(0, 0, 0.05, 0)
SpeedBox.Font = Enum.Font.GothamBold
SpeedBox.PlaceholderText = "Nhập tốc độ..."
SpeedBox.Text = "16"
SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBox.TextSize = 12
SpeedBox.ClearTextOnFocus = false

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = SpeedBox

-- Nút Xác Nhận Áp Dụng Tốc Độ Gõ
local ApplySpeedBtn = Instance.new("TextButton")
ApplySpeedBtn.Parent = Tab3Content
ApplySpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 140, 80)
ApplySpeedBtn.Size = UDim2.new(0.36, 0, 0, 35)
ApplySpeedBtn.Position = UDim2.new(0.64, 0, 0.05, 0)
ApplySpeedBtn.Font = Enum.Font.GothamBold
ApplySpeedBtn.Text = "Đổi Speed"
ApplySpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ApplySpeedBtn.TextSize = 10.5

local ApplyCorner = Instance.new("UICorner")
ApplyCorner.CornerRadius = UDim.new(0, 6)
ApplyCorner.Parent = ApplySpeedBtn

-- Các nút chọn nhanh (Bình thường / Nhanh / Siêu tốc)
local Speed16Btn = Instance.new("TextButton")
Speed16Btn.Parent = Tab3Content
Speed16Btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
Speed16Btn.Size = UDim2.new(0.31, 0, 0, 32)
Speed16Btn.Position = UDim2.new(0, 0, 0.52, 0)
Speed16Btn.Font = Enum.Font.GothamBold
Speed16Btn.Text = "Mặc định (16)"
Speed16Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Speed16Btn.TextSize = 9

local S16Corner = Instance.new("UICorner")
S16Corner.CornerRadius = UDim.new(0, 6)
S16Corner.Parent = Speed16Btn

local Speed50Btn = Instance.new("TextButton")
Speed50Btn.Parent = Tab3Content
Speed50Btn.BackgroundColor3 = Color3.fromRGB(40, 120, 180)
Speed50Btn.Size = UDim2.new(0.31, 0, 0, 32)
Speed50Btn.Position = UDim2.new(0.345, 0, 0.52, 0)
Speed50Btn.Font = Enum.Font.GothamBold
Speed50Btn.Text = "Nhanh (50)"
Speed50Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Speed50Btn.TextSize = 9

local S50Corner = Instance.new("UICorner")
S50Corner.CornerRadius = UDim.new(0, 6)
S50Corner.Parent = Speed50Btn

local Speed100Btn = Instance.new("TextButton")
Speed100Btn.Parent = Tab3Content
Speed100Btn.BackgroundColor3 = Color3.fromRGB(180, 80, 40)
Speed100Btn.Size = UDim2.new(0.31, 0, 0, 32)
Speed100Btn.Position = UDim2.new(0.69, 0, 0.52, 0)
Speed100Btn.Font = Enum.Font.GothamBold
Speed100Btn.Text = "Siêu tốc (150)"
Speed100Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Speed100Btn.TextSize = 9

local S100Corner = Instance.new("UICorner")
S100Corner.CornerRadius = UDim.new(0, 6)
S100Corner.Parent = Speed100Btn

-- ==================== TAB 4: CÀI ĐẶT ====================
local Tab4Content = Instance.new("Frame")
Tab4Content.Parent = ContentContainer
Tab4Content.BackgroundTransparency = 1
Tab4Content.Size = UDim2.new(1, 0, 1, 0)
Tab4Content.Visible = false

local CloseMenuBtn = Instance.new("TextButton")
CloseMenuBtn.Parent = Tab4Content
CloseMenuBtn.BackgroundColor3 = Color3.fromRGB(140, 30, 30)
CloseMenuBtn.Size = UDim2.new(1, 0, 0, 45)
CloseMenuBtn.Position = UDim2.new(0, 0, 0.1, 0)
CloseMenuBtn.Font = Enum.Font.GothamBold
CloseMenuBtn.Text = "Tắt / Xóa Hoàn Toàn Menu"
CloseMenuBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseMenuBtn.TextSize = 11

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseMenuBtn

-- Biến logic trạng thái
local redEspEnabled = false
local propEspEnabled = false
local menuExpanded = true
local redConnection = nil
local propConnection = nil
local savedCFrame = nil
local currentSpeed = 16

-- Hàm chuyển đổi Tab mượt mà
local function switchTab(activeTab)
    Tab1Content.Visible = (activeTab == 1)
    Tab2Content.Visible = (activeTab == 2)
    Tab3Content.Visible = (activeTab == 3)
    Tab4Content.Visible = (activeTab == 4)
    
    Tab1Btn.BackgroundColor3 = (activeTab == 1) and Color3.fromRGB(60, 60, 85) or Color3.fromRGB(35, 35, 48)
    Tab1Btn.TextColor3 = (activeTab == 1) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 180)
    
    Tab2Btn.BackgroundColor3 = (activeTab == 2) and Color3.fromRGB(60, 60, 85) or Color3.fromRGB(35, 35, 48)
    Tab2Btn.TextColor3 = (activeTab == 2) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 180)

    Tab3Btn.BackgroundColor3 = (activeTab == 3) and Color3.fromRGB(60, 60, 85) or Color3.fromRGB(35, 35, 48)
    Tab3Btn.TextColor3 = (activeTab == 3) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 180)

    Tab4Btn.BackgroundColor3 = (activeTab == 4) and Color3.fromRGB(60, 60, 85) or Color3.fromRGB(35, 35, 48)
    Tab4Btn.TextColor3 = (activeTab == 4) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 180)
end

Tab1Btn.MouseButton1Click:Connect(function() switchTab(1) end)
Tab2Btn.MouseButton1Click:Connect(function() switchTab(2) end)
Tab3Btn.MouseButton1Click:Connect(function() switchTab(3) end)
Tab4Btn.MouseButton1Click:Connect(function() switchTab(4) end)

-- Hàm tìm tên vật thể biến hình
local function getDisguiseName(character)
    if not character then return "Normal" end
    local children = character:GetChildren()
    for _, child in ipairs(children) do
        if child:IsA("Model") and child.Name ~= character.Name then
            return child.Name
        elseif child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" and child.Name ~= "Head" and child.Name ~= "UpperTorso" and child.Name ~= "LowerTorso" then
            return child.Name
        end
    end
    return "Player"
end

-- Logic 1: ESP Màu Đỏ
RedToggleButton.MouseButton1Click:Connect(function()
    redEspEnabled = not redEspEnabled
    if redEspEnabled then
        RedToggleButton.Text = "ESP Đỏ: ON"
        RedToggleButton.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
        
        redConnection = RunService.RenderStepped:Connect(function()
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local char = player.Character
                    if not char:FindFirstChild("RedESP_Highlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "RedESP_Highlight"
                        highlight.Adornee = char
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.FillTransparency = 0.5
                        highlight.OutlineTransparency = 0
                        highlight.Parent = char
                    end
                end
            end
        end)
    else
        RedToggleButton.Text = "ESP Đỏ: OFF"
        RedToggleButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        
        if redConnection then
            redConnection:Disconnect()
            redConnection = nil
        end
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("RedESP_Highlight") then
                player.Character.RedESP_Highlight:Destroy()
            end
        end
    end
end)

-- Logic 2: Định Vị Vật Thể Biến Hình
PropToggleButton.MouseButton1Click:Connect(function()
    propEspEnabled = not propEspEnabled
    if propEspEnabled then
        PropToggleButton.Text = "Biến Hình: ON"
        PropToggleButton.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
        
        propConnection = RunService.RenderStepped:Connect(function()
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local char = player.Character
                    local head = char:FindFirstChild("Head")
                    
                    if head and not head:FindFirstChild("PropESP_Tag") then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "PropESP_Tag"
                        billboard.Adornee = head
                        billboard.Size = UDim2.new(0, 120, 0, 35)
                        billboard.StudsOffset = Vector3.new(0, 2, 0)
                        billboard.AlwaysOnTop = true
                        billboard.MaxDistance = 150
                        billboard.Parent = head
                        
                        local textLabel = Instance.new("TextLabel")
                        textLabel.Name = "InfoText"
                        textLabel.Parent = billboard
                        textLabel.BackgroundTransparency = 1
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.Font = Enum.Font.GothamBold
                        textLabel.TextSize = 11
                        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        textLabel.TextStrokeTransparency = 0.3
                    end
                    
                    if head and head:FindFirstChild("PropESP_Tag") then
                        local textLabel = head.PropESP_Tag:FindFirstChild("InfoText")
                        if textLabel then
                            local disguise = getDisguiseName(char)
                            textLabel.Text = player.Name .. "\n[" .. disguise .. "]"
                        end
                    end
                end
            end
        end)
    else
        PropToggleButton.Text = "Biến Hình: OFF"
        PropToggleButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        
        if propConnection then
            propConnection:Disconnect()
            propConnection = nil
        end
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                local head = player.Character:FindFirstChild("Head")
                if head and head:FindFirstChild("PropESP_Tag") then
                    head.PropESP_Tag:Destroy()
                end
            end
        end
    end
end)

-- Logic 3: Lưu Vị Trí & Dịch Chuyển
SavePosBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        savedCFrame = char.HumanoidRootPart.CFrame
        SavePosBtn.Text = "Đã Lưu!"
        task.wait(1)
        SavePosBtn.Text = "Lưu Vị Trí"
    end
end)

TpBtn.MouseButton1Click:Connect(function()
    if savedCFrame then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = savedCFrame
            TpBtn.Text = "Đã Tới!"
            task.wait(1)
            TpBtn.Text = "Dịch Chuyển"
        end
    else
        TpBtn.Text = "Chưa Lưu!"
        task.wait(1)
        TpBtn.Text = "Dịch Chuyển"
    end
end)

-- Logic 4: Chỉnh Tốc Độ Tự Do (Speed Tab)
local function setSpeed(val)
    local num = tonumber(val)
    if num then
        currentSpeed = num
        SpeedBox.Text = tostring(currentSpeed)
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid").WalkSpeed = currentSpeed
        end
    end
end

ApplySpeedBtn.MouseButton1Click:Connect(function()
    setSpeed(SpeedBox.Text)
end)

Speed16Btn.MouseButton1Click:Connect(function() setSpeed(16) end)
Speed50Btn.MouseButton1Click:Connect(function() setSpeed(50) end)
Speed100Btn.MouseButton1Click:Connect(function() setSpeed(150) end)

-- Giữ speed khi hồi sinh
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    local humanoid = char:WaitForChild("Humanoid", 5)
    if humanoid then
        humanoid.WalkSpeed = currentSpeed
    end
end)

-- Logic 5: Đóng Menu
CloseMenuBtn.MouseButton1Click:Connect(function()
    if redConnection then redConnection:Disconnect() end
    if propConnection then propConnection:Disconnect() end
    ScreenGui:Destroy()
end)

-- Thu Nhỏ / Ẩn Hiện Menu (-)
MinimizeButton.MouseButton1Click:Connect(function()
    menuExpanded = not menuExpanded
    if menuExpanded then
        MainFrame.Size = UDim2.new(0, 290, 0, 185)
        TabBar.Visible = true
        ContentContainer.Visible = true
        MinimizeButton.Text = "-"
    else
        TabBar.Visible = false
        ContentContainer.Visible = false
        MainFrame.Size = UDim2.new(0, 290, 0, 36)
        MinimizeButton.Text = "+"
    end
end)
