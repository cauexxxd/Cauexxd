-- Carregar Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
    Name = "Cauezim Hub | Blox Fruits",
    LoadingTitle = "Cauezim Loader",
    LoadingSubtitle = "Script por CauêDEV",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "CauezimHub",
        FileName = "BloxFruitsConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false
})

local FarmTab = Window:CreateTab("Farm", 4483362458)

FarmTab:CreateToggle({
    Name = "Auto Farm Level",
    CurrentValue = false,
    Callback = function(Value)
        while Value and task.wait() do
            local player = game.Players.LocalPlayer
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            local enemy = workspace.Enemies:FindFirstChildWhichIsA("Model")
            if hrp and enemy then
                local enemyHRP = enemy:FindFirstChild("HumanoidRootPart")
                if enemyHRP then
                    hrp.CFrame = enemyHRP.CFrame * CFrame.new(0, 0, 3)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                end
            end
        end
    end
})
FarmTab:CreateToggle({
    Name = "Auto Haki",
    CurrentValue = false,
    Callback = function(Value)
        while Value and task.wait(1) do
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "J", false, game)
        end
    end
})
local TeleportTab = Window:CreateTab("Teleporte", 4483362458)

TeleportTab:CreateButton({
    Name = "Ilha Inicial",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1033, 130, 1285)
    end
})

TeleportTab:CreateButton({
    Name = "Segunda Ilha",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6508, 7, -132)
    end
})
