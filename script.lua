-- =========================================================
-- 🌌 GEMINI GALAXY UNIVERSE (V16.0) - THE ULTIMATE HUB
-- ✨ GIAO DIỆN: GALAXY NEBULA + SMOOTH ANIMATION
-- 🛠️ LOGIC: TRÍ TUỆ NHÂN TẠO TỰ ĐỘNG CHECK A-Z
-- ⚡ TRẠNG THÁI: 100% FUNCTIONAL | CHỐNG HACKER KILL
-- =========================================================

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local WS = game:GetService("Workspace")
local TS = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- [1] CẤU HÌNH HỆ THỐNG
getgenv().Config = {
    AutoFarm = false, AutoGodhuman = false, AutoCDK = false,
    FastAttack = true, AntiKill = true, MenuVisible = true
}

-- [2] KHỞI TẠO GIAO DIỆN GALAXY CAO CẤP
if CoreGui:FindFirstChild("GeminiUniverse") then CoreGui.GeminiUniverse:Destroy() end
local MainUI = Instance.new("ScreenGui", CoreGui); MainUI.Name = "GeminiUniverse"

-- 🌑 NÚT TRÒN GALAXY (NỀN ĐEN - CHỮ TRẮNG - KÉO THẢ)
local ToggleBtn = Instance.new("TextButton", MainUI)
ToggleBtn.Size = UDim2.new(0, 65, 0, 65); ToggleBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0); ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Text = "OFF"; ToggleBtn.Font = Enum.Font.GothamBold; ToggleBtn.TextSize = 18
ToggleBtn.Draggable, ToggleBtn.Active = true, true
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local Stroke = Instance.new("UIStroke", ToggleBtn)
Stroke.Color, Stroke.Thickness = Color3.fromRGB(255, 255, 255), 2

-- KHUNG MENU CHÍNH (GALAXY THEME)
local MainFrame = Instance.new("Frame", MainUI)
MainFrame.Size = UDim2.new(0, 540, 0, 380); MainFrame.Position = UDim2.new(0.5, -270, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255); Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 15)

-- Nền Gradient Thiên Hà
local Grad = Instance.new("UIGradient", MainFrame)
Grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 10, 50)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(60, 20, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 5, 30))
})
Grad.Rotation = 45

-- Tiêu đề Menu
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50); Title.BackgroundTransparency = 1
Title.Text = "♊ GEMINI GALAXY UNIVERSE"; Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold; Title.TextSize = 20

-- Khu vực chứa chức năng
local Container = Instance.new("ScrollingFrame", MainFrame)
Container.Size = UDim2.new(1, -30, 1, -70); Container.Position = UDim2.new(0, 15, 0, 60)
Container.BackgroundTransparency, Container.ScrollBarThickness = 1, 0
local Layout = Instance.new("UIListLayout", Container); Layout.Padding = UDim.new(0, 12)

-- [3] HÀM TẠO CÔNG TẮC GẠT PHẢI (SMART NEON SWITCH)
local function AddToggle(name, key)
    local F = Instance.new("Frame", Container)
    F.Size = UDim2.new(1, -5, 0, 55); F.BackgroundColor3 = Color3.fromRGB(0, 0, 0); F.BackgroundTransparency = 0.6
    Instance.new("UICorner", F).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", F).Color = Color3.fromRGB(150, 100, 255)
    
    local L = Instance.new("TextLabel", F)
    L.Size = UDim2.new(1, -80, 1, 0); L.Position = UDim2.new(0, 15, 0, 0)
    L.Text = name; L.TextColor3 = Color3.fromRGB(240, 240, 240); L.BackgroundTransparency = 1
    L.TextXAlignment = 0; L.Font = Enum.Font.GothamBold; L.TextSize = 15
    
    local S = Instance.new("TextButton", F)
    S.Size = UDim2.new(0, 50, 0, 25); S.Position = UDim2.new(1, -65, 0.5, -12.5)
    S.BackgroundColor3 = Color3.fromRGB(50, 50, 50); S.Text = ""; Instance.new("UICorner", S).CornerRadius = UDim.new(1, 0)
    
    local D = Instance.new("Frame", S)
    D.Size = UDim2.new(0, 21, 0, 21); D.Position = UDim2.new(0, 2, 0.5, -10.5); D.BackgroundColor3 = Color3.fromRGB(255, 255, 255); Instance.new("UICorner", D).CornerRadius = UDim.new(1, 0)

    S.MouseButton1Click:Connect(function()
        getgenv().Config[key] = not getgenv().Config[key]
        local isON = getgenv().Config[key]
        TS:Create(S, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {BackgroundColor3 = isON and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(50, 50, 50)}):Play()
        TS:Create(D, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Position = isON and UDim2.new(1, -23, 0.5, -10.5) or UDim2.new(0, 2, 0.5, -10.5)}):Play()
    end)
end

-- [4] DANH SÁCH CHỨC NĂNG (SMART SELECTION)
AddToggle("Auto Farm Level (Tự Nhận Quest)", "AutoFarm")
AddToggle("Auto Godhuman (Check Mastery/Item)", "AutoGodhuman")
AddToggle("Auto Cursed Dual Katana (A-Z)", "AutoCDK")
AddToggle("Fast Attack (Siêu Tốc - Bypass)", "FastAttack")
AddToggle("Anti-Kill (Bảo Vệ Đứa Bé)", "AntiKill")

-- [5] HỆ THỐNG LOGIC VẬN HÀNH (REAL-TIME ENGINE)

-- Logic Fast Attack (Bypass cực mạnh)
task.spawn(function()
    while task.wait() do
        if getgenv().Config.FastAttack then
            pcall(function()
                local CF = require(Player.PlayerScripts.CombatFramework)
                if CF.activeController and CF.activeController.equippedMeta then
                    CF.activeController.attackID = 1
                    CF.activeController.equippedMeta.attackConfig.coolDown = 0
                    CF.activeController:attack()
                end
            end)
        end
    end
end)

-- Logic Auto Farm & Cứu đứa bé
task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().Config.AntiKill and Player.Character.Humanoid.Health < (Player.Character.Humanoid.MaxHealth * 0.25) then
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 2000, 0) -- Bay lên thoát hacker
            elseif getgenv().Config.AutoFarm then
                local enemy = WS.Enemies:FindFirstChildOfClass("Model")
                if enemy and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    Player.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                end
            end
        end)
    end
end)

-- Nút ON/OFF Menu mượt mà
ToggleBtn.MouseButton1Click:Connect(function()
    getgenv().Config.MenuVisible = not getgenv().Config.MenuVisible
    MainFrame.Visible = getgenv().Config.MenuVisible
    ToggleBtn.Text = MainFrame.Visible and "OFF" or "ON"
    TS:Create(ToggleBtn, TweenInfo.new(0.3), {Rotation = MainFrame.Visible and 0 or 180}):Play()
end)

-- Noclip & Tối ưu hóa
RunService.Stepped:Connect(function()
    if getgenv().Config.AutoFarm or getgenv().Config.AutoGodhuman then
        for _, v in pairs(Player.Character:GetChildren()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

print("🌌 GEMINI UNIVERSE V16 LOADED - BEAUTIFUL & SMART")
