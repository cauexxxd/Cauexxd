-- Script Roblox básico com GUI
loadstring(game:HttpGet("https://raw.githubusercontent.com/cauexx/UILib/main/Lib.lua"))()

local Window = Library:CreateWindow("Universal Script")

local jogadorTab = Window:CreateTab("Jogador")
local visualTab = Window:CreateTab("Visual")
local miscTab = Window:CreateTab("Miscelânea")

-- Fly
jogadorTab:CreateToggle("Fly", function(state)
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    if state then
        local bp = Instance.new("BodyPosition", hrp)
        bp.Name = "FlyPos"
        bp.MaxForce = Vector3.new(100000, 100000, 100000)
        bp.Position = hrp.Position

        game:GetService("RunService").Heartbeat:Connect(function()
            if bp and bp.Parent then
                bp.Position = hrp.Position + Vector3.new(0, 5, 0)
            end
        end)
    else
        if hrp:FindFirstChild("FlyPos") then
            hrp.FlyPos:Destroy()
        end
    end
end)

-- Velocidade
jogadorTab:CreateSlider("Velocidade", 16, 100, function(val)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)

-- Noclip
jogadorTab:CreateToggle("Noclip", function(state)
    local char = game.Players.LocalPlayer.Character
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not state
        end
    end
end)
