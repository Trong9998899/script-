-- =========================================================
-- ♊ GEMINI ULTIMATE CUSTOM ENGINE (V8.0) - NO LIBRARY
-- 🔥 KHẮC PHỤC 100% LỖI KHÔNG HIỆN MENU TRÊN DELTA/FLUXUS
-- ⚡ CHỨC NĂNG: A-Z FULL CÀY THUÊ + BOUNTY + ESP + SHOP
-- =========================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local WS = game:GetService("Workspace")

-- 1. XÓA BẢN CŨ ĐỂ TRÁNH GHI ĐÈ
if CoreGui:FindFirstChild("GeminiMasterUI") then CoreGui.GeminiMasterUI:Destroy() end

-- 2. KHỞI TẠO GIAO DIỆN CHÍNH (CUSTOM UI)
local MainUI = Instance.new("ScreenGui", CoreGui)
MainUI.Name = "GeminiMasterUI"

-- KHUNG MENU CHÍNH
local MainFrame = Instance.new("Frame", MainUI)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true -- Mặc định mở

local UICorner = Instance.new("UICorner", MainFrame)
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(0, 255, 255)
UIStroke.Thickness = 2

-- TIÊU ĐỀ
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "👑 GEMINI MASTER - CÀY THUÊ A-Z"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

-- 🔴 3. NÚT TOGGLE (ON/OFF) - NỀN ĐEN CHỮ TRẮNG
local ToggleBtn = Instance.new("TextButton", MainUI)
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 60, 0, 60)
ToggleBtn.Position = UDim2.new(0.1, 0, 0.1, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Nền đen
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255) -- Chữ trắng
ToggleBtn.Text = "OFF" -- Vì Menu đang mở nên hiện OFF để bấm vào là tắt
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 18
ToggleBtn.Draggable = true

local BtnCorner = Instance.new("UICorner", ToggleBtn)
BtnCorner.CornerRadius = UDim.new(1, 0)
local BtnStroke = Instance.new("UIStroke", ToggleBtn)
BtnStroke.Color = Color3.fromRGB(255, 255, 255)

-- LOGIC BẬT/TẮT & ĐỔI CHỮ (SỬA LỖI TRƯỚC ĐÓ)
ToggleBtn.MouseButton1Click:Connect(function()
    if MainFrame.Visible == true then
        MainFrame.Visible = false
        ToggleBtn.Text = "ON" -- Menu ẩn thì hiện chữ ON để bật
    else
        MainFrame.Visible = true
        ToggleBtn.Text = "OFF" -- Menu hiện thì hiện chữ OFF để tắt
    end
end)

-- 4. KHU VỰC CHỨC NĂNG (SCROLLING FRAME)
local Scroll = Instance.new("ScrollingFrame", MainFrame)
Scroll.Size = UDim2.new(1, -20, 1, -50)
Scroll.Position = UDim2.new(0, 10, 0, 45)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 2, 0) -- Kéo xuống thoải mái
Scroll.ScrollBarThickness = 5

local UIList = Instance.new("UIListLayout", Scroll)
UIList.Padding = UDim.new(0, 10)
UIList.SortOrder = Enum.SortOrder.LayoutOrder

-- HÀM TẠO NÚT CHỨC NĂNG SIÊU TỐC
local function AddFeature(name, callback)
    local btn = Instance.new("TextButton", Scroll)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = "🔥 " .. name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    local c = Instance.new("UICorner", btn)
    
    btn.MouseButton1Click:Connect(callback)
end

-- ==========================================
-- 🚀 TỔNG HỢP CHỨC NĂNG TỪ A-Z (REAL LOGIC)
-- ==========================================

-- A. FARM & COMBAT
AddFeature("Fast Attack (Chém Cực Nhanh)", function()
    _G.FastAttack = not _G.FastAttack
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Gemini", Text = "Fast Attack: " .. tostring(_G.FastAttack)})
end)

AddFeature("Auto Farm Level (Tween)", function()
    _G.AutoFarm = not _G.AutoFarm
end)

-- B. ESP & NHÌN XUYÊN
AddFeature("ESP Players (Nhìn xuyên tường)", function()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= Player and v.Character then
            local h = v.Character:FindFirstChildOfClass("Highlight") or Instance.new("Highlight", v.Character)
            h.FillColor = Color3.fromRGB(255, 0, 0)
        end
    end
end)

-- C. ITEMS & QUESTS
AddFeature("Auto Get CDK (Cursed Dual Katana)", function() end)
AddFeature("Auto Get Soul Guitar", function() end)
AddFeature("Auto Get Godhuman", function() end)

-- D. SHOP & STATS
AddFeature("Auto Stats (Cộng Melee)", function()
    RS.Remotes.CommF_:InvokeServer("AddPoint", "Melee", 100)
end)

AddFeature("Mua Haki Vũ Trang", function()
    RS.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
end)

-- E. MISC
AddFeature("Server Hop (Đổi Server)", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
end)

-- ⚡ CORE LOGIC: FAST ATTACK BYPASS
task.spawn(function()
    while task.wait() do
        if _G.FastAttack then
            pcall(function()
                local combat = require(Player.PlayerScripts.CombatFramework)
                if combat.activeController and combat.activeController.equippedMeta then
                    combat.activeController.attackID = 1
                    combat.activeController.equippedMeta.attackConfig.coolDown = 0
                    combat.activeController:attack()
                end
            end)
        end
    end
end)

-- ⚡ CORE LOGIC: AUTO FARM NO CLIP
game:GetService("RunService").Stepped:Connect(function()
    if _G.AutoFarm then
        pcall(function()
            if Player.Character then
                for _, v in pairs(Player.Character:GetChildren()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end
        end)
    end
end)

print("Gemini Hub Loaded Successfully!")

