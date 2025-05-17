-- Script Universal com GUI (Fly, Speed, Noclip, ESP)
-- Compatível com a maioria dos jogos Roblox (requer executor)

-- Carregar UI Library (Kavo UI Library)
loadstring(game:HttpGet("https://raw.githubusercontent.com/CaueDev/UILib/main/Lib.lua"))()

local Window = Library:CreateWindow("Universal Script") -- Nome da Janela

-- Abas
local MainTab = Window:CreateTab("Jogador")
local VisualTab = Window:CreateTab("Visual")
local MiscTab = Window:CreateTab("Miscelânea")

-- Função Fly
local flying = false
MainTab:CreateToggle("Fly", function(state)
    flying = state
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    if flying then
        local bp = Instance.new("BodyPosition", hrp)
        bp.Name = "FlyPos"
        bp.MaxForce = Vector3.new(100000, 100000, 100000)
        bp.Position = hrp.Position

        game:GetService("RunService").Heartbeat:Connect(function()
            if flying and bp then
                bp.Position = hrp.Position + Vector3.new(0, 5, 0)
            end
        end)
    else
        if hrp:FindFirstChild("FlyPos") then
            hrp.FlyPos:Destroy()
        end
    end
end)

-- Speed
MainTab:CreateSlider("Velocidade", 16, 100, function(val)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)

-- Noclip
local noclip = false
MainTab:CreateToggle("Noclip", function(state)
    noclip = state
    game:GetService("RunService").Stepped:Connect(function()
        if noclip then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

-- ESP (ver jogadores)
VisualTab:CreateButton("Ativar ESP de Jogadores", function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= game.Players.LocalPlayer then
            local esp = Instance.new("Highlight", plr.Character)
            esp.Name = "ESP"
            esp.FillColor = Color3.new(1, 0, 0)
            esp.OutlineColor = Color3.new(1, 1, 1)
        end
    end
end)

-- Remover paredes invisíveis (Miscelânea)
MiscTab:CreateButton("Remover Paredes Invisíveis", function()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and part.Transparency == 1 and part.CanCollide == true then
            part:Destroy()
        end
    end
end)
