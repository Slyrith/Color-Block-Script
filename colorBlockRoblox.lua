-- https://web.roblox.com/games/5926001758/Color-Block



getgenv().detectgoodorbad = false -- wouldnt recommend
getgenv().autotp = false

for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if v.Name == "BanBehavior" and v.Parent then
        v:Destroy()
    else
        if v.Name == "CheckCheat" and v.Parent then
            v:Destroy()
        end
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local w = Library.CreateLib("color block", "Sentinel")
local a = w:NewTab("color block")
local b = w:NewTab("other helpful stuff")
local a1 = a:NewSection("color block")
local b1 = b:NewSection("other helpful stuff")

a1:NewToggle("auto tp to block", "autotp", function(bool)
    getgenv().autotp = bool
    if bool then
        autotp()
    end
end)

b1:NewButton("infinite yield", "credits to original creators", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)


function autotp()
    spawn(function()
        while getgenv().autotp == true do
            local brickcolor = game:GetService("Players").LocalPlayer.PlayerGui.inGameGui.Frame.Color.BackgroundColor
            for i,v in pairs(game.Workspace.Blocks:GetDescendants()) do
                if v.ClassName ~= "Model" and v.ClassName ~= "Script" and v.ClassName ~= "TouchTransmitter" then
                    if v.BrickColor == brickcolor then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.CFrame.X,v.CFrame.Y+4.5,v.CFrame.Z)
                        wait()
                    end
                end
            end
            wait()
        end
    end)
end





if getgenv().detectgoodorbad == true then
    game.Workspace.Blocks.DescendantAdded:Connect(function(v)
        if v.ClassName ~= "Model" and v.ClassName ~= "Script" and v.ClassName ~= "TouchTransmitter" then
            game:GetService("Players").LocalPlayer.PlayerGui.inGameGui.Frame.Color:GetPropertyChangedSignal("BackgroundColor"):Connect(function()
                wait(1)
                if v.BrickColor == game:GetService("Players").LocalPlayer.PlayerGui.inGameGui.Frame.Color.BackgroundColor then
                    v.Color = Color3.fromRGB(0,255,0)
                else
                    v.Color = Color3.fromRGB(255,0,0)
                end
            end)
        end
    end)
end