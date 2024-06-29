--[[
Updated: 12/9/2022 @ 10:31 pm pst

This is an open source project.
Please do not use script for monetary gains through linkverse, etc.
Video advertisement is fine, but I intend not to have people download viruses.

Created on Synapse X, I do not know if it support other executors
]]

--Warning:
local Ping = string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), " ")[1]

if tonumber(Ping) >= 250 then
    game.StarterGui:SetCore("SendNotification", {
        Title = "🌸 Sakura System:";
        Text = "Ping greater than/equal 250 ms.";
        Duration = 7;
    })
    game.StarterGui:SetCore("SendNotification", {
        Title = "🌸 Sakura System:";
        Text = "Current server has a high ping for you. Scripts might not run as intended on this server due to your lag.";
        Duration = 7;
    })
end

--[[
for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "Handle" and v.Parent.ClassName == "Tool" then
        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
]]


game.StarterGui:SetCore("SendNotification", {
    Title = "🌸 Sakura System:";
    Text = "Sorry for the late update. I was busy with finals.";
    Duration = 7;
})

--Jan UI Library:
local library = loadstring(game:HttpGet("https://pastebin.com/raw/VqF6KDMs"))()
--Kirito's Esp
local Esp = loadstring(game:HttpGet("https://pastebin.com/raw/KiAEgsKp"))()
Esp.Enabled = false
Esp.Tracers = false
Esp.Boxes = false

local Player = game.Players.LocalPlayer
local generatingFrjuans = false

local window = library:CreateWindow("Modified Sakura Hub", Vector2.new(500, 300), Enum.KeyCode.LeftShift)
local general = window:CreateTab("General")
local war = window:CreateTab("War")
local misc = window:CreateTab("Misc")
local visual = window:CreateTab("Visuals")
local frjuans = window:CreateTab("Frjuans")
local credit = window:CreateTab("Credits")

--General
local toolsSector = general:CreateSector("Tools", "left")
local creatureSector = general:CreateSector("Creatures", "left")
local tpSector = general:CreateSector("Waypoints", "right")
local mJuice = {}
local rPoison = {}
function isUSBsFound()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "classified usb" and v:FindFirstChild("Handle") then
            return true
        end
    end
    return false
end

function isFilesFound()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "classified files" and v:FindFirstChild("Handle") then
            return true
        end
    end
    return false
end

toolsSector:AddButton("Pick up all Classified USBs", function()
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        if isUSBsFound() then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "classified usb" and v:FindFirstChild("Handle") then
                    firetouchinterest(v.Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                end
            end
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "No classified usb found.";
                Duration = 2;
            })
        end
    end
end)

local loopPickUp = false
toolsSector:AddToggle("Auto pick up USBs", false, function(State)
    loopPickUp = State
end)

spawn(function()
    while task.wait() do
        if loopPickUp then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "classified usb" and v:FindFirstChild("Handle") then
                    firetouchinterest(v.Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                end
            end
        end
    end
end)

toolsSector:AddButton("Pick up all Classified Files", function()
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        if isFilesFound() then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "classified files" and v:FindFirstChild("Handle") then
                    firetouchinterest(v.Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                end
            end
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "No classified files found.";
                Duration = 2;
            })
        end
    end
end)

local loopPickUp = false
toolsSector:AddToggle("Auto pick up files", false, function(State)
    loopPickUp = State
end)

spawn(function()
    while task.wait() do
        if loopPickUp then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "classified files" and v:FindFirstChild("Handle") then
                    firetouchinterest(v.Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                end
            end
        end
    end
end)

toolsSector:AddButton("Sell all Classified USBs", function()
    if Player.Character:FindFirstChild("classified usb") or Player.Backpack:FindFirstChild("classified usb") then
        for _, v in ipairs(Player.Backpack:GetChildren()) do
            if v.Name == "classified usb" then
                 v.Parent = Player.Character
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v.Name == "classified usb" then
                firetouchinterest(v.Handle ,game:GetService("Workspace").contrabandman.Head, 0)
            end
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "No classified usb in inventory.";
            Duration = 2;
        })
    end
end)

local loopSell = false
toolsSector:AddToggle("Auto sell USBs", false, function(State)
    loopSell = State
end)

spawn(function()
    while task.wait() do
        if loopSell then
            for _, v in ipairs(Player.Backpack:GetChildren()) do
                if v.Name == "classified usb" then
                    v.Parent = Player.Character
                end
            end
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v.Name == "classified usb" then
                    firetouchinterest(v.Handle ,game:GetService("Workspace").contrabandman.Head, 0)
                end
            end
        end
    end
end)

toolsSector:AddButton("Sell all Classified Files", function()
    if Player.Character:FindFirstChild("classified files") or Player.Backpack:FindFirstChild("classified files") then
        for _, v in ipairs(Player.Backpack:GetChildren()) do
            if v.Name == "classified files" then
                 v.Parent = Player.Character
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v.Name == "classified files" then
                firetouchinterest(v.Handle ,game:GetService("Workspace").contrabandman.Head, 0)
            end
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "No classified files in inventory.";
            Duration = 2;
        })
    end
end)

local loopSell = false
toolsSector:AddToggle("Auto sell files", false, function(State)
    loopSell = State
end)

spawn(function()
    while task.wait() do
        if loopSell then
            for _, v in ipairs(Player.Backpack:GetChildren()) do
                if v.Name == "classified files" then
                    v.Parent = Player.Character
                end
            end
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v.Name == "classified files" then
                    firetouchinterest(v.Handle ,game:GetService("Workspace").contrabandman.Head, 0)
                end
            end
        end
    end
end)

function getMedicalJuice()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "medical box" then
            fireclickdetector(v.fridgedoor.doorhandle.ClickDetector, 0)
            wait(.1)
            firetouchinterest(Player.Character.HumanoidRootPart, v.spawnpoint, 0)
        end
    end
    wait(.2)
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Medical juice" then
            firetouchinterest(v.Handle, Player.Character.HumanoidRootPart, 0)
            return true
        end
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "🌸 Sakura System:";
        Text = "No medical juice found.";
        Duration = 2;
    })
    return false
end

function getRatPoison()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "medical box" then
            fireclickdetector(v.fridgedoor.doorhandle.ClickDetector, 0)
            wait(.1)
            firetouchinterest(Player.Character.HumanoidRootPart, v.spawnpoint, 0)
        end
    end
    wait(.2)
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Rat poison" then
            firetouchinterest(v.Handle, Player.Character.HumanoidRootPart, 0)
            return true
        end
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "🌸 Sakura System:";
        Text = "No rat poison found.";
        Duration = 2;
    })
    return false
end

local pickingUpMedicalJuice = false
toolsSector:AddButton("Pick up all Medical Juice", function()
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and not pickingUpMedicalJuice then
        pickingUpMedicalJuice = true
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "Medical juice" then
                table.insert(mJuice, v)
            end
        end
        if mJuice[1] then
            for i = 1,#mJuice do
                getMedicalJuice()
            end
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "No medical juice found.";
                Duration = 2;
            })
        end
        mJuice = {}
        wait(.2)
        pickingUpMedicalJuice = false
    end
end)

local pickingUpRatPoison = false
toolsSector:AddButton("Pick up all Rat Poison", function()
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and not pickingUpRatPoison then
        pickingUpRatPoison = true
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "Rat poison" then
                table.insert(rPoison, v)
            end
        end
        if rPoison[1] then
            for i = 1,#rPoison do
                getRatPoison()
            end
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "No rat poison found.";
                Duration = 2;
            })
        end
        rPoison = {}
        pickingUpRatPoison = false
    end
end)

toolsSector:AddButton("Pick up all tools", function()
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        for i,v in pairs(game.Workspace:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Handle") then
                firetouchinterest(v.Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            end
        end
    end
end)

if isnetworkowner then
    local repelCreatures = false
    creatureSector:AddToggle("Creature repellent", false, function(State)
        repelCreatures = State
    end)

    spawn(function()
        while task.wait() do
            if repelCreatures then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:FindFirstChild("NonHumanoid") and v:FindFirstChild("HumanoidRootPart") and isnetworkowner(v.PrimaryPart) and v.Name ~= "Former" and repelCreatures and not v.PrimaryPart:FindFirstChild("BodyVelocity") then
                        spawn(function()
                            local bv = Instance.new("BodyVelocity", v.PrimaryPart)
                            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                            bv.Velocity = Vector3.new(math.random(-50,50),30,math.random(-50,50))
                            wait(2)
                            if v:FindFirstChild("BodyVelocity") then
                                bv:Destroy()
                            end
                        end)
                    end
                end
                for i,v in pairs(game.Workspace.zombies:GetChildren()) do
                    if v:FindFirstChild("NonHumanoid") and v:FindFirstChild("HumanoidRootPart") and isnetworkowner(v.PrimaryPart) and repelCreatures and not v.PrimaryPart:FindFirstChild("BodyVelocity") then
                        spawn(function()
                            local bv = Instance.new("BodyVelocity", v.PrimaryPart)
                            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                            bv.Velocity = Vector3.new(math.random(-50,50),30,math.random(-50,50))
                            wait(2)
                            if v:FindFirstChild("BodyVelocity") then
                                bv:Destroy()
                            end
                        end)
                    end
                end
                for i,v in pairs(game.Workspace.invpeople:GetChildren()) do
                    if v:FindFirstChild("NonHumanoid") and v:FindFirstChild("HumanoidRootPart") and isnetworkowner(v.PrimaryPart) and repelCreatures and not v.PrimaryPart:FindFirstChild("BodyVelocity") then
                        spawn(function()
                            local bv = Instance.new("BodyVelocity", v.PrimaryPart)
                            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                            bv.Velocity = Vector3.new(math.random(-50,50),30,math.random(-50,50))
                            wait(2)
                            if v:FindFirstChild("BodyVelocity") then
                                bv:Destroy()
                            end
                        end)
                    end
                end
            end
        end
    end)

    local disableCreatures = false
    creatureSector:AddToggle("Disable creatures", false, function(State)
        disableCreatures = State
    end)

    spawn(function()
        while task.wait() do
            if disableCreatures then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:FindFirstChild("NonHumanoid") and v:FindFirstChild("HumanoidRootPart") and isnetworkowner(v.PrimaryPart) then
                        v.HumanoidRootPart:Destroy()
                    end
                end
                for i,v in pairs(game.Workspace.zombies:GetChildren()) do
                    if v:FindFirstChild("NonHumanoid") and v:FindFirstChild("HumanoidRootPart") and isnetworkowner(v.PrimaryPart) then
                        v.HumanoidRootPart:Destroy()
                    end
                end
                for i,v in pairs(game.Workspace.invpeople:GetChildren()) do
                    if v:FindFirstChild("NonHumanoid") and v:FindFirstChild("HumanoidRootPart") and isnetworkowner(v.PrimaryPart) then
                        v.HumanoidRootPart:Destroy()
                    end
                end
            end
        end
    end)

    local autoKillCreatures = false
    creatureSector:AddToggle("Instant-kill creatures", false, function(State)
        autoKillCreatures = State
    end)

    spawn(function()
        while task.wait() do
            if autoKillCreatures then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:FindFirstChild("NonHumanoid") and v:FindFirstChild("Head") and isnetworkowner(v.PrimaryPart) then
                        v.Head:Destroy()
                    end
                end
                for i,v in pairs(game.Workspace.invpeople:GetChildren()) do
                    if v:FindFirstChild("NonHumanoid") and v:FindFirstChild("Head") and isnetworkowner(v.PrimaryPart) then
                        v.Head:Destroy()
                    end
                end
                for i,v in pairs(game.Workspace.zombies:GetChildren()) do
                    if v:FindFirstChild("NonHumanoid") and v:FindFirstChild("Head") and isnetworkowner(v.PrimaryPart) then
                        v.Head:Destroy()
                    end
                end
            end
        end
    end)
else
    game.StarterGui:SetCore("SendNotification", {
        Title = "🌸 Sakura System:";
        Text = "Cannot load creature exploits. Incompatible executer";
        Duration = 2;
    })
end

--Waypoints
local teleporting = false

function teleport(vector)
    teleporting = true
    --var declare:
    local TweenService = game:GetService("TweenService")
    local tpspeed = 70
    local originWS = Player.Character.Humanoid.WalkSpeed

    --Stabilize:
    local bv = Instance.new("BodyVelocity", Player.Character.HumanoidRootPart)
    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bv.Velocity = Vector3.new(0,0,0)
    Player.Character.Humanoid.PlatformStand = true

    --Down:
    local twn = TweenService:Create(Player.Character.HumanoidRootPart, TweenInfo.new((Player.Character.HumanoidRootPart.Position - Vector3.new(Player.Character.HumanoidRootPart.Position.X, Player.Character.HumanoidRootPart.Position.Y - 200, Player.Character.HumanoidRootPart.Position.Z)).Magnitude / tpspeed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Vector3.new(Player.Character.HumanoidRootPart.Position.X, Player.Character.HumanoidRootPart.Position.Y - 200, Player.Character.HumanoidRootPart.Position.Z))})
    twn:Play()
    twn.Completed:Wait()

    --X,Z:
    local twn1 = TweenService:Create(Player.Character.HumanoidRootPart, TweenInfo.new((Player.Character.HumanoidRootPart.Position - Vector3.new(vector.X, Player.Character.HumanoidRootPart.Position.Y, vector.Z)).Magnitude / tpspeed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Vector3.new(vector.X, Player.Character.HumanoidRootPart.Position.Y, vector.Z))})
    twn1:Play()
    twn1.Completed:Wait()

    --Up:
    local twn2 = TweenService:Create(Player.Character.HumanoidRootPart, TweenInfo.new((Player.Character.HumanoidRootPart.Position - vector).Magnitude / tpspeed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(vector)})
    twn2:Play()
    twn2.Completed:Wait()

    --Unstabilize:
    bv:Destroy()
    Player.Character.Humanoid.PlatformStand = false
    Player.Character.Humanoid.WalkSpeed = originWS
    teleporting = false
end

tpSector:AddButton("Manager room", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(-256, -62, 31))
    end
end)

tpSector:AddButton("Truck", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(317, -4, 8))
    end
end)

tpSector:AddButton("Stairs", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(-370, -62, -141))
    end
end)

tpSector:AddButton("Freezer", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(-304, 8, 66))
    end
end)

tpSector:AddButton("Boiler room", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(-256, 29, -101))
    end
end)

tpSector:AddButton("Kid area", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(-268, 17, -67))
    end
end)

tpSector:AddButton("Garage", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(-334, 3, 160))
    end
end)

tpSector:AddButton("Restroom", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(-210, 8, -29))
    end
end)

tpSector:AddButton("Sewer", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(-181, -13, 51))
    end
end)

tpSector:AddButton("Death ray area", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(256, -111, -47))
    end
end)

tpSector:AddButton("Pump-A", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(-5, -121, -131))
    end
end)

tpSector:AddButton("Pump-B", function()
    if Player.Character and Player.Character.HumanoidRootPart and not teleporting then
        teleport(Vector3.new(-79, -121, 154))
    end
end)

--War
--Weapons
local weapons = war:CreateSector("Contraband Shop", "left")
local death = war:CreateSector("Assassination", "right")
local deathTools = war:CreateSector("Utilities", "right")

--Sort Alphabetically
local tb1 = {}
local i1 = 0

for i,v in pairs(Player.PlayerGui.tradegui:GetChildren()) do
    if v:IsA("TextButton") and v.Name ~= "Xbutton" then
        table.insert(tb1, v.Name)
        i1 = i1 + 1
    end
end

table.sort(tb1, function(a,b)
	return a:split("purchase")[2]:lower() < b:split("purchase")[2]:lower()
end)

for j = 1,i1 do
    for i,v in pairs(Player.PlayerGui.tradegui:GetChildren()) do
        if v:IsA("TextButton") and v.Name ~= "Xbutton" and v.Name == tb1[j] then
            weapons:AddButton(v.Text, function()
                Player.PlayerGui.buysomething:FireServer(j)
            end)
        end
    end
end

--Assassination
local target
local txtbox

--Prelim loader to store punch in nil
local tempPunchStorage = {}
local mt = getrawmetatable(game)
local ncOriginal = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    
    if method == "FireServer" and ... == game.Teams.Customers and not generatingFrjuans then
        for i = 1,30 do
            Player.PlayerGui.clicke:FireServer(game.Teams.Choosing)
        end
    end
    return ncOriginal(self, ...)
end)

--Prelim detection
local prelimBackpackAdd
prelimBackpackAdd = Player.Backpack.ChildAdded:connect(function(obj)
    if not generatingFrjuans then
        task.wait()
        if obj.Name == "punch" and #tempPunchStorage < 30 then
            print(#tempPunchStorage)
            table.insert(tempPunchStorage, obj)
            obj.Parent = nil
        else
            local tempPunch = Player.Backpack.punch
            tempPunch.Parent = nil
            prelimBackpackAdd:Disconnect()
            prelimBackpackAdd = nil
            tempPunch.Parent = Player.Backpack
        end
    end
end)

--Error catch
spawn(function()
    if not generatingFrjuans then
        repeat task.wait() until #tempPunchStorage == 29
        local count = 0
        for i,v in pairs(Player.Backpack:GetChildren()) do
            if v.Name == "punch" then
                count = count + 1
            end
        end
        if count > 1 then
            for i = 1, count - 1 do
                local tempPunch = Player.Backpack.punch
                table.insert(tempPunchStorage, tempPunch)
                tempPunch.Parent = nil
            end
        end
    end
end)

--Refresh table when character die
Player.Character.Humanoid.Died:connect(function()
    tempPunchStorage = {}
end)

--When die refresh detection
Player.CharacterAdded:connect(function(char)
    --Store punch tools in nil. Visual sake.
    local prelimBackpackAdd2
    prelimBackpackAdd2 = Player.Backpack.ChildAdded:connect(function(obj)
        if not generatingFrjuans then
            task.wait()
            if obj.Name == "punch" and #tempPunchStorage < 30 then
                print(#tempPunchStorage)
                table.insert(tempPunchStorage, obj)
                obj.Parent = nil
            else
                local tempPunch = Player.Backpack.punch
                tempPunch.Parent = nil
                prelimBackpackAdd2:Disconnect()
                prelimBackpackAdd2 = nil
                tempPunch.Parent = Player.Backpack
            end
        end
    end)

    --Error catch
    spawn(function()
        if not generatingFrjuans then
            repeat task.wait() until #tempPunchStorage == 29
            local count = 0
            for i,v in pairs(Player.Backpack:GetChildren()) do
                if v.Name == "punch" then
                    count = count + 1
                end
            end
            if count > 1 then
                for i = 1, count - 1 do
                    local tempPunch = Player.Backpack.punch
                    table.insert(tempPunchStorage, tempPunch)
                    tempPunch.Parent = nil
                end
            end
        end
    end)

    --Refresh table when character die
    char:WaitForChild("Humanoid").Died:connect(function()
        tempPunchStorage = {}
    end)
end)

function predictName(inputted)
    if inputted then
        local name = inputted:lower()
        for i,v in pairs(game.Players:GetChildren()) do
            if string.find(v.name:lower(), name) then
                return v
            elseif string.find(v.DisplayName:lower(), name) then
                return v
            end
        end
    end
    return ""
end

death:AddTextbox("Target's Name", "", function(victim)
    target = predictName(victim).Name
    if target == Player.Name then
        target = ""
        txtbox.Text = ""
    else
        txtbox.Text = target
    end
end)

for i,v in pairs(game.CoreGui:GetChildren()) do
    if string.find(v.name, "Sakura") then
        for i2,v2 in pairs(v.main:GetDescendants()) do
            if v2:IsA("TextBox") and v2.PlaceholderText == "Target's Name" then
                txtbox = v2
                v2.ClearTextOnFocus = true
                break
            end
        end
    end
end

death:AddButton("Kaboom [2 frjuans]", function()
    if target ~= "" and game.Players:FindFirstChild(target) then
        if Player.leaderstats.frjuans.Value >= 2 then
            if game.Players[target].Character.Humanoid.Health > 0 then
                pcall(function()
                    local function getLatestMine()
                        for i,v in pairs(game.Workspace:GetChildren()) do
                            if v.name == "landmine" and not v:FindFirstChild("Tagged") then
                                return v
                            end
                        end
                    end

                    --Tag all existing Mines
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "landmine" and not v:FindFirstChild("Tagged") then
                            local tag = Instance.new("IntValue", v)
                            tag.Name = "Tagged"
                        end
                    end

                    --Purchase Mine and Deploy
                    Player.PlayerGui.buysomething:FireServer(7)
                    wait(.5)
                    Player.Character.Humanoid:EquipTool(Player.Backpack.Claymore)
                    wait()
                    Player.Character.Claymore:Activate()
                    wait(1.1)

                    --Calculate movement prediction with ping
                    local urPing = string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), " ")[1] / 1000
                    local targetpos
                    if (math.floor(game.Players[target].Character.HumanoidRootPart.Velocity.Magnitude * 10) / 10) ~= 0 then
                        targetpos = game.Players[target].Character.HumanoidRootPart.CFrame + Vector3.new(game.Players[target].Character.HumanoidRootPart.Velocity.X, 0, game.Players[target].Character.HumanoidRootPart.Velocity.Z) * (0.4 + urPing)
                    else
                        targetpos = game.Players[target].Character.HumanoidRootPart.CFrame
                    end

                    local mine = getLatestMine()
                    repeat
                        firetouchinterest(mine.area, Player.Character.HumanoidRootPart, 0)
                        mine.CFrame = targetpos
                        task.wait()
                    until mine.Sound.Playing
                    for i = 1,100 do
                        mine.CFrame = targetpos
                        task.wait()
                    end
                end)
            else
                game.StarterGui:SetCore("SendNotification", {
                    Title = "🌸 Sakura System:";
                    Text = "Target is already dead.";
                    Duration = 2;
                })
            end
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "Insufficient frjuans";
                Duration = 2;
            })
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Target is not found.";
            Duration = 2;
        })
    end
end)

death:AddButton("Multi-Stab [2 frjuans]", function()
    if target ~= "" and game.Players:FindFirstChild(target) then
        if Player.Character.Humanoid.Health > 0 then
            if game.Players[target].Character.Humanoid.Health > 0 then
                if Player.Backpack:FindFirstChild("Knife") then
                    --equip knife and stab
                    Player.Character.Humanoid:EquipTool(Player.Backpack.Knife)
                    wait(.2)
                    repeat
                        pcall(function()
                            Player.Character.Knife:Activate()
                            firetouchinterest(Player.Character.Knife.Handle, game.Players[target].Character.Head, 0)
                        end)
                        wait(1)
                    until game.Players[target].Character.Humanoid.Health == 0 or not game.Players:FindFirstChild(target) or not game.Players[target].Character or not game.Players[target].Character:FindFirstChild("HumanoidRootPart") or not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character.Humanoid.Health <= 0
                    wait(.2)
                    Player.Character.Humanoid:UnequipTools()
                else
                    if Player.Character:FindFirstChild("Knife") then
                        --stab
                        repeat
                            pcall(function()
                                Player.Character.Knife:Activate()
                                firetouchinterest(Player.Character.Knife.Handle, game.Players[target].Character.Head, 0)
                            end)
                            wait(1)
                        until game.Players[target].Character.Humanoid.Health == 0 or not game.Players:FindFirstChild(target) or not game.Players[target].Character or not game.Players[target].Character:FindFirstChild("HumanoidRootPart") or not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character.Humanoid.Health <= 0
                        wait(.2)
                        Player.Character.Humanoid:UnequipTools()
                    else
                        if Player.leaderstats.frjuans.Value >= 2 then
                            --buy knife and stab
                            Player.PlayerGui.buysomething:FireServer(5)   
                            wait(.3)
                            Player.Character.Humanoid:EquipTool(Player.Backpack.Knife)
                            wait(.2)
                            repeat
                                pcall(function()
                                    Player.Character.Knife:Activate()
                                    firetouchinterest(Player.Character.Knife.Handle, game.Players[target].Character.Head, 0)
                                end)
                                wait(1)
                            until game.Players[target].Character.Humanoid.Health == 0 or not game.Players:FindFirstChild(target) or not game.Players[target].Character or not game.Players[target].Character:FindFirstChild("HumanoidRootPart") or not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character.Humanoid.Health <= 0
                            wait(.2)
                            Player.Character.Humanoid:UnequipTools()
                        else
                            game.StarterGui:SetCore("SendNotification", {
                                Title = "🌸 Sakura System:";
                                Text = "Insufficient frjuans";
                                Duration = 2;
                            })
                        end
                    end
                end
            else
                game.StarterGui:SetCore("SendNotification", {
                    Title = "🌸 Sakura System:";
                    Text = "Target is already dead.";
                    Duration = 2;
                })
            end
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "Please respawn first.";
                Duration = 2;
            })
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Target is not found.";
            Duration = 2;
        })
    end
end)

death:AddButton("One punch [free]", function()
    if target ~= "" and game.Players:FindFirstChild(target) then
        if tempPunchStorage[1] then
            if game.Players[target].Character.Humanoid.Health > 0 then
                game.CoreGui.RobloxGui.Backpack.Visible = false
                for i,v in pairs(tempPunchStorage) do
                    v.Parent = Player.Backpack
                end
                for i,v in pairs(Player.Backpack:GetChildren()) do
                    if v.Name == "punch" then
                        v.Parent = Player.Character
                    end
                end
                repeat
                    pcall(function()
                        for i,v in pairs(Player.Character:GetChildren()) do
                            if v.Name == "punch" then
                                v:Activate()
                            end
                        end
                        for i,v in pairs(Player.Character:GetChildren()) do
                            if v.Name == "punch" then
                                firetouchinterest(v.punchy, game.Players[target].Character.Head, 0)
                            end
                        end
                    end)
                    wait(1)
                until game.Players[target].Character.Humanoid.Health == 0 or not game.Players:FindFirstChild(target) or not game.Players[target].Character or not game.Players[target].Character:FindFirstChild("HumanoidRootPart") or not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character.Humanoid.Health <= 0
                wait(.2)
                Player.Character.Humanoid:UnequipTools()
                for i,v in pairs(tempPunchStorage) do
                    v.Parent = nil
                end
                game.CoreGui.RobloxGui.Backpack.Visible = true
            else
                game.StarterGui:SetCore("SendNotification", {
                    Title = "🌸 Sakura System:";
                    Text = "Target is already dead.";
                    Duration = 2;
                })
            end
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "Please respawn/spawn in as Customer to initiate one punch.";
                Duration = 2;
            })
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Target is not found.";
            Duration = 2;
        })
    end
end)

function countGrenadeInInv()
    local count = 0
    for i,v in pairs(Player.Backpack:GetChildren()) do
        if v.Name == "Grenade" then
            count = count + 1
        end
    end
    for i,v in pairs(Player.Character:GetChildren()) do
        if v.Name == "Grenade" then
            count = count + 1
        end
    end
    return count
end

local Martyrdom = false
deathTools:AddButton("Martyrdom [6 frjuans]", function()
    if Player.leaderstats.frjuans.Value >= 6 then
        if not Martyrdom then
            Martyrdom = true
            if Player.Character and Player.Character.HumanoidRootPart then
                for i = 1,3 do
                    Player.PlayerGui.buysomething:FireServer(3)
                end
                local initCount = countGrenadeInInv()
                repeat wait() until countGrenadeInInv() == initCount + 3
                for _, v in pairs(Player.Backpack:GetChildren()) do
                    if v.Name == "Grenade" then
                        v.Parent = Player.Character
                        v:Activate()
                    end
                end
                Player.Character.Humanoid:UnequipTools()
            end
        end
        wait(.2)
        Martyrdom = false
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Insufficient frjuans";
            Duration = 2;
        })
    end
end)

local suicideBomb = false

function countClaymoreInInv()
    local count = 0
    for i,v in pairs(Player.Backpack:GetChildren()) do
        if v.Name == "Claymore" then
            count = count + 1
        end
    end
    for i,v in pairs(Player.Character:GetChildren()) do
        if v.Name == "Claymore" then
            count = count + 1
        end
    end
    return count
end

deathTools:AddButton("ALLAHU AKBAR [6 frjuans]", function()
    if Player.leaderstats.frjuans.Value >= 6 then
        if Player.Character and Player.Character.HumanoidRootPart then
            if not suicideBomb then
                suicideBomb = true
                for i = 1,3 do
                    Player.PlayerGui.buysomething:FireServer(7)
                end
                Player.Character.Humanoid:UnequipTools()
                local initCount = countClaymoreInInv()
                repeat wait() until countClaymoreInInv() == initCount + 3
                for _, v in pairs(Player.Backpack:GetChildren()) do
                    if v.Name == "Claymore" then
                        v.Parent = Player.Character
                        v:Activate()
                    end
                end
                wait(.5)
                spawn(function()
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "landmine" and (v.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 20 then
                            pcall(function()
                                repeat wait()
                                    firetouchinterest(v.area, Player.Character.HumanoidRootPart, 0)
                                until v.Sound.Playing
                            end)
                        end
                    end
                end)
                suicideBomb = false
            end
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Insufficient frjuans";
            Duration = 2;
        })
    end
end)

local punchingAll = false
deathTools:AddButton("One Punch All [free]", function()
    if tempPunchStorage[1] and Player.Character and Player.Character.HumanoidRootPart then
        if not punchingAll then
            punchingAll = true
            pcall(function()
                local targets = {}
                local refreshTargets = {}
                for i,v in pairs(tempPunchStorage) do
                    v.Parent = Player.Backpack
                end
                for i,v in pairs(Player.Backpack:GetChildren()) do
                    if v.Name == "punch" then
                        v.Parent = Player.Character
                    end
                end
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name ~= Player.Name and v.Character.Humanoid.Health > 0 then
                        table.insert(targets, v)
                    end
                end
                local count = 1
                local refreshCounter = 0
                repeat
                    repeat
                        pcall(function()
                            for i,v in pairs(Player.Character:GetChildren()) do
                                if v.Name == "punch" then
                                    v:Activate()
                                end
                            end
                            for i,v in pairs(Player.Character:GetChildren()) do
                                if v.Name == "punch" then
                                    firetouchinterest(v.punchy, targets[count].Character.Head, 0)
                                end
                            end
                        end)
                        wait()
                    until targets[count].Character.Humanoid.Health <= 0 or not targets[count].Character or not targets[count].Character:FindFirstChild("Humanoid") or not targets[count]
                    refreshCounter = refreshCounter + 1
                    if refreshCounter == 5 then --Lag prevention
                        wait(.2)
                        Player.Character.Humanoid:UnequipTools()
                        for i,v in pairs(tempPunchStorage) do
                            v.Parent = nil
                        end
                        wait(2)
                        for i,v in pairs(tempPunchStorage) do
                            v.Parent = Player.Backpack
                        end
                        for i,v in pairs(Player.Backpack:GetChildren()) do
                            if v.Name == "punch" then
                                v.Parent = Player.Character
                            end
                        end
                        wait(.5)
                        refreshCounter = 0
                    end
                    targets[count] = nil
                    refreshTargets = {}
                    for i,v in pairs(targets) do
                        if v ~= nil then
                            table.insert(refreshTargets, v)
                        end
                    end
                    count = count + 1
                    wait(1)
                until #refreshTargets == 1
                wait(.2)
                Player.Character.Humanoid:UnequipTools()
                for i,v in pairs(tempPunchStorage) do
                    v.Parent = nil
                end
                punchingAll = false
                game.StarterGui:SetCore("SendNotification", {
                    Title = "🌸 Sakura System:";
                    Text = "Finished";
                    Duration = 2;
                })
            end)
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Please respawn/spawn in as Customer to initiate one punch.";
            Duration = 2;
        })
    end
end)

local gettingDeathRay = false
local savedPos

deathTools:AddButton("Get Death Ray", function()
    if not Player.Character:FindFirstChild("Death ray") and not Player.Backpack:FindFirstChild("Death ray") then
        if Player.Character and Player.Character.HumanoidRootPart then
            if not gettingDeathRay then
                gettingDeathRay = true
                savedPos = Player.Character.HumanoidRootPart.CFrame
                repeat
                    Player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(253, -111, -47), game:GetService("Workspace")["laser crate"].givepart.Position)
                    fireproximityprompt(game:GetService("Workspace")["laser crate"].givepart.ProximityPrompt, 1)
                    if math.random(1,10) == 10 then
                        task.wait()
                    end
                until Player.Backpack:FindFirstChild("Death ray") or Player.Character:FindFirstChild("Death ray")
                Player.Character.HumanoidRootPart.CFrame = savedPos
                gettingDeathRay = false
            end
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Already have a Death ray.";
            Duration = 2;
        })
    end
end)

local InfDRayAmmo = false
deathTools:AddToggle("Inf Death ray ammo", false, function(State)
    InfDRayAmmo = State
end)

spawn(function()
    while true do
        if InfDRayAmmo then
            if Player.Character:FindFirstChild("Death ray") then
                Player.Character:FindFirstChild("Death ray").reload:FireServer()
            end
        end
        if math.random(1,3)==3 then
            task.wait()
        end
    end
end)

--Misc
local foodSector = misc:CreateSector("Drinks/Food", "left")
local others = misc:CreateSector("Others", "right")
local antiSector = misc:CreateSector("Anti", "right")

local makingDrink = false
local makingSDrink = false
local gettingDrink = false
local drinkFoodList = {"Coffee", "Espresso", "Tea", "Decaf coffee", "Water"}
local drinkSList = {"Milk Tea", "Latte", "Coffee (milk)", "Americano", "Decaf coffee (milk)", "Iced coffee", "Iced tea", "Ice water", "Double", "Triple", "Skim milk", "Pilk", "Pepsi Coffee", "Crystal Pepsi", "Sparkling water", "Apple cider", "nil"}
local otherFoodList = {"Milk", "Pepsi", "Croissant", "Ice cube", "Apple juice"}

function makeDrink(drinkChoice)
    Player.Character.Humanoid:UnequipTools()

    local savepos
    savepos = Player.Character.HumanoidRootPart.CFrame
        if game.Workspace.PumpA.button.BrickColor == BrickColor.new("Really red") then
            repeat
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-5, -121, -131))
                fireproximityprompt(game.Workspace.PumpA.button.ProximityPrompt, 0)
                if math.random(1,10) == 10 then
                    task.wait()
                end
            until game.Workspace.PumpA.button.BrickColor == BrickColor.new("Lime green")
        end
        if game.Workspace.PumpB.button.BrickColor == BrickColor.new("Really red") then
            repeat
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-79, -121, 154))
                fireproximityprompt(game.Workspace.PumpB.button.ProximityPrompt, 0)
                if math.random(1,10) == 10 then
                    task.wait()
                end
            until game.Workspace.PumpB.button.BrickColor == BrickColor.new("Lime green")
        end
        Player.Character.HumanoidRootPart.CFrame = savepos

    if drinkChoice ~= "Croissant" then
        fireclickdetector(game:GetService("Workspace")["empty cups place"].clickable.ClickDetector, 0)
        repeat task.wait() until Player.Backpack:FindFirstChild("Empty cup")
    end

    if drinkChoice == "Coffee" then
        if game.Workspace.Coffeemaker.dialcoffee.Transparency == 1 then
            fireclickdetector(game.Workspace.Coffeemaker.clickpart.ClickDetector, 0)
        end
        Player.Character.Humanoid:EquipTool(Player.Backpack["Empty cup"])
        repeat task.wait() until Player.Character:FindFirstChild("Empty cup")
        firetouchinterest(Player.Character["Empty cup"].Handle, game.Workspace.Coffeemaker.tube, 0)
    elseif drinkChoice == "Espresso" then
        if game.Workspace.Coffeemaker.dialespresso.Transparency == 1 then
            fireclickdetector(game.Workspace.Coffeemaker.clickpart.ClickDetector, 0)
        end
        Player.Character.Humanoid:EquipTool(Player.Backpack["Empty cup"])
        repeat task.wait() until Player.Character:FindFirstChild("Empty cup")
        firetouchinterest(Player.Character["Empty cup"].Handle, game.Workspace.Coffeemaker.tube, 0)
    elseif drinkChoice == "Decaf coffee" then
        if game.Workspace.OtherCoffeemaker.dialdecaf.Transparency == 1 then
            fireclickdetector(game.Workspace.OtherCoffeemaker.clickpart.ClickDetector, 0)
        end
        Player.Character.Humanoid:EquipTool(Player.Backpack["Empty cup"])
        repeat task.wait() until Player.Character:FindFirstChild("Empty cup")
        firetouchinterest(Player.Character["Empty cup"].Handle, game.Workspace.OtherCoffeemaker.tube, 0)
    elseif drinkChoice == "Tea" then
        if game.Workspace.OtherCoffeemaker.dialtea.Transparency == 1 then
            fireclickdetector(game.Workspace.OtherCoffeemaker.clickpart.ClickDetector, 0)
        end
        Player.Character.Humanoid:EquipTool(Player.Backpack["Empty cup"])
        repeat task.wait() until Player.Character:FindFirstChild("Empty cup")
        firetouchinterest(Player.Character["Empty cup"].Handle, game.Workspace.OtherCoffeemaker.tube, 0)
    elseif drinkChoice == "Croissant" then
        repeat wait()
            fireclickdetector(game.Workspace.toaster.switch.ClickDetector, 0)
        until game.Workspace.toaster.switch.pop.Playing
        local a
        a = game.Workspace.ChildAdded:connect(function(food)
            if food.Name == "Croissant" then
                repeat task.wait() until game.Workspace:FindFirstChild("Croissant")
                firetouchinterest(food.Handle, Player.Character.HumanoidRootPart, 0)
                a:Disconnect()
                a = nil
            end
        end)
        repeat task.wait() until Player.Character:FindFirstChild("Croissant")
    elseif drinkChoice == "Water" then
        Player.Character.Humanoid:EquipTool(Player.Backpack["Empty cup"])
        repeat task.wait() until Player.Character:FindFirstChild("Empty cup")
        firetouchinterest(Player.Character["Empty cup"].Handle, game.Workspace.Sink.tap, 0)
    end
end

function getMilk()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Fridge" then
            firetouchinterest(Player.Character.HumanoidRootPart, v.spawnpoint, 0)
        end
    end
    repeat task.wait() until game.Workspace:FindFirstChild("Milk")
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Milk" then
            firetouchinterest(v.Handle, Player.Character.HumanoidRootPart, 0)
            return true
        end
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "🌸 Sakura System:";
        Text = "No milk found.";
        Duration = 2;
    })
    return false
end

function getIce()
    fireclickdetector(game.Workspace["empty ice place"].clickable.ClickDetector, 0)
end

function getPepsi()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "pepsi machine" and v.pepsibutton.SurfaceGui.TextLabel.Text == "Pepsi" then
            fireclickdetector(v.pepsibutton.ClickDetector, 0)

            --Collect Result
            local a
            a = game.Workspace.ChildAdded:connect(function(drink)
                if drink.Name == "Pepsi" then
                    repeat task.wait() until game.Workspace:FindFirstChild("Pepsi")
                    firetouchinterest(drink.Handle, Player.Character.HumanoidRootPart, 0)
                    a:Disconnect()
                    a = nil
                end
            end)
            return true
        end
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "🌸 Sakura System:";
        Text = "No pepsi available in vending machine.";
        Duration = 2;
    })
    return false
end

function getAppleJuice()
    if game.Workspace["apple juice machine"].applebutton.SurfaceGui.TextLabel.Text == "Apple juice" then
        fireclickdetector(game.Workspace["apple juice machine"].applebutton.ClickDetector, 0)

        --Collect Result
        local a
        a = game.Workspace.ChildAdded:connect(function(drink)
            if drink.Name == "Apple juice" then
                repeat task.wait() until game.Workspace:FindFirstChild("Apple juice")
                firetouchinterest(drink.Handle, Player.Character.HumanoidRootPart, 0)
                a:Disconnect()
                a = nil
            end
        end)
        return true
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "No apple juice available in juice machine.";
            Duration = 2;
        })
        return false
    end
end

function combineDrink(drink1, drink2, drinkResult)
    --Constructors
    if drink1 == "Pepsi" or drink2 == "Pepsi" then
        if getPepsi() then
            repeat task.wait() until Player.Character:FindFirstChild("Pepsi")
            Player.Character.Humanoid:UnequipTools()
        else
            return
        end
    end
    if drink1 == "Milk" or drink2 == "Milk" then
        if getMilk() then
            repeat task.wait() until Player.Character:FindFirstChild("Milk")
            Player.Character.Humanoid:UnequipTools()
        else
            return
        end
    end
    if drink1 == "Apple juice" or drink2 == "Apple juice" then
        if getAppleJuice() then
            repeat task.wait() until Player.Character:FindFirstChild("Apple juice")
            Player.Character.Humanoid:UnequipTools()
        else
            return
        end
    end
    if drink1 == "Medical juice" or drink2 == "Medical juice" then
        if Player.Character:FindFirstChild("Medical juice") then
            Player.Character.Humanoid:UnequipTools()
        elseif Player.Backpack:FindFirstChild("Medical juice") then
        elseif getMedicalJuice() then
            repeat task.wait() until Player.Character:FindFirstChild("Medical juice")
            Player.Character.Humanoid:UnequipTools()
        else
            return
        end
    end
    if drink1 == "Sparkling water" or drink2 == "Sparkling water" then
        if Player.Character:FindFirstChild("Sparkling water") then
            Player.Character.Humanoid:UnequipTools()
        elseif Player.Backpack:FindFirstChild("Sparkling water") then
        else
            return
        end
    end
    if drink1 == "Ice cube" or drink2 == "Ice cube" then
        getIce()
        repeat task.wait() until Player.Backpack:FindFirstChild("Ice cube")
    end
    if drink1 == "Tea" or drink2 == "Tea" then
        makeDrink("Tea")
        repeat task.wait() until Player.Character:FindFirstChild("Tea")
        Player.Character.Humanoid:UnequipTools()
    end
    if drink1 == "Coffee" or drink2 == "Coffee" then
        makeDrink("Coffee")
        repeat task.wait() until Player.Character:FindFirstChild("Coffee")
        Player.Character.Humanoid:UnequipTools()
    end
    if drink1 == "Espresso" or drink2 == "Espresso" then
        makeDrink("Espresso")
        repeat task.wait() until Player.Character:FindFirstChild("Espresso")
        Player.Character.Humanoid:UnequipTools()
    end
    if drink1 == "Decaf coffee" or drink2 == "Decaf coffee" then
        makeDrink("Decaf coffee")
        repeat task.wait() until Player.Character:FindFirstChild("Decaf coffee")
        Player.Character.Humanoid:UnequipTools()
    end
    if drink1 == "Water" or drink2 == "Water" then
        makeDrink("Water")
        repeat task.wait() until Player.Character:FindFirstChild("Water")
        Player.Character.Humanoid:UnequipTools()
    end
 
    wait(.2)
    --Clear combinator
    fireclickdetector(game.Workspace.combinator.cancel.ClickDetector, 0)
    wait(.2)
 
    --Input drink1
    Player.Character.Humanoid:EquipTool(Player.Backpack[drink1])
    repeat task.wait() until Player.Character:FindFirstChild(drink1)
    firetouchinterest(Player.Character[drink1].Handle, game.Workspace.combinator.slotA, 0)
    wait(.3)
 
    --Input drink2
    Player.Character.Humanoid:EquipTool(Player.Backpack[drink2])
    repeat task.wait() until Player.Character:FindFirstChild(drink2)
    firetouchinterest(Player.Character[drink2].Handle, game.Workspace.combinator.slotB, 0)
    wait(.3)
 
    --Combine
    fireclickdetector(game.Workspace.combinator.combine.ClickDetector, 0)
 
    --Collect Result
    local a
    a = game.Workspace.ChildAdded:connect(function(drink)
        if drink.Name == drinkResult then
            repeat task.wait() until game.Workspace:FindFirstChild(drinkResult)
            firetouchinterest(drink.Handle, Player.Character.HumanoidRootPart, 0)
            a:Disconnect()
            a = nil
        end
    end)
end

foodSector:AddDropdown("Make drink", drinkFoodList, "", false, function(drinkFood)
    if not makingDrink and not makingsDrink and not gettingDrink then
        makingDrink = true
        delay(16, function()
            makingDrink = false
        end)
        if drinkFood == "Coffee" then
            makeDrink("Coffee")
        elseif drinkFood == "Espresso" then
            makeDrink("Espresso")
        elseif drinkFood == "Tea" then
            makeDrink("Tea")
        elseif drinkFood == "Decaf coffee" then
            makeDrink("Decaf coffee")
        elseif drinkFood == "Water" then
            makeDrink("Water")
        end
        wait(.2)
        makingDrink = false
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Already making a drink.";
            Duration = 2;
        })
    end
end)

foodSector:AddDropdown("Make special drink", drinkSList, "", false, function(drinkS)
    if drinkS ~= "nil" then
        if not makingSDrink and not makingDrink and not gettingDrink then
            makingSDrink = true
            delay(16, function()
                makingSDrink = false
            end)
            if drinkS == "Milk Tea" then
                combineDrink("Milk", "Tea", "Milk tea")
            elseif drinkS == "Latte" then
                combineDrink("Milk", "Espresso", "Latte")
            elseif drinkS == "Coffee (milk)" then
                combineDrink("Milk", "Coffee", "Coffee (milk)")
            elseif drinkS == "Americano" then
                combineDrink("Water", "Coffee", "Americano")
            elseif drinkS == "Decaf coffee (milk)" then
                combineDrink("Milk", "Decaf coffee", "Decaf coffee (milk)")
            elseif drinkS == "Iced coffee" then
                combineDrink("Ice cube", "Coffee", "Iced coffee")
            elseif drinkS == "Iced tea" then
                combineDrink("Ice cube", "Tea", "Iced tea")
            elseif drinkS == "Ice water" then
                combineDrink("Ice cube", "Water", "Ice water")
            elseif drinkS == "Double" then --Double and Triple Kinda weird. Didn't compensate for it as I didn't know all the reciple before.
                makeDrink("Espresso")
                repeat wait() until Player.Character:FindFirstChild("Espresso")
                combineDrink("Espresso", "Espresso", "Double")
            elseif drinkS == "Triple" then
                makeDrink("Espresso")
                repeat wait() until Player.Character:FindFirstChild("Espresso")
                combineDrink("Espresso", "Espresso", "Double")
                repeat wait() until Player.Character:FindFirstChild("Double")
                combineDrink("Espresso", "Double", "Triple")
            elseif drinkS == "Skim milk" then
                combineDrink("Milk", "Water", "Skim milk")
            elseif drinkS == "Pilk" then
                combineDrink("Pepsi", "Milk", "Pilk")
            elseif drinkS == "Pepsi Coffee" then
                combineDrink("Pepsi", "Coffee", "Pepsi Coffee")
            elseif drinkS == "Crystal Pepsi" then
                combineDrink("Medical juice", "Pepsi", "Crystal Pepsi")
            elseif drinkS == "Sparkling water" then
                combineDrink("Medical juice", "Coffee", "Sparkling water")
            elseif drinkS == "Apple cider" then
                if not Player.Character:FindFirstChild("Sparkling water") or Player.Backpack:FindFirstChild("Sparkling water") then
                    combineDrink("Medical juice", "Coffee", "Sparkling water")
                    repeat wait() until Player.Character:FindFirstChild("Sparkling water")
                end
                combineDrink("Sparkling water", "Apple juice", "Apple cider")
            end
            wait(.2)
            makingSDrink = false
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "Already making a drink.";
                Duration = 2;
            })
        end
    end
end)

foodSector:AddDropdown("Get other food", otherFoodList, "", false, function(food)
    if not gettingDrink and not makingSDrink and not makingDrink then
        gettingDrink = true
        delay(16, function()
            gettingDrink = false
        end)
        if food == "Milk" then
            getMilk()
        elseif food == "Pepsi" then
            getPepsi()
        elseif food == "Ice cube" then
            getIce()
        elseif food == "Croissant" then
            makeDrink("Croissant")
        elseif food == "Apple juice" then
            getAppleJuice()
        end
        wait(.2)
        gettingDrink = false
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Already making a drink.";
            Duration = 2;
        })
    end
end)

local turningOnPumps = false
local savedPosForPump
foodSector:AddButton("Turn on pumps", function()
    if not turningOnPumps then
        turningOnPumps = true
        savedPosForPump = Player.Character.HumanoidRootPart.CFrame
        if game.Workspace.PumpA.button.BrickColor == BrickColor.new("Really red") then
            repeat
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-5, -121, -131))
                fireproximityprompt(game.Workspace.PumpA.button.ProximityPrompt, 0)
                if math.random(1,100) == 100 then
                    task.wait()
                end
            until game.Workspace.PumpA.button.BrickColor == BrickColor.new("Lime green")
        end
        if game.Workspace.PumpB.button.BrickColor == BrickColor.new("Really red") then
            repeat
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-79, -121, 154))
                fireproximityprompt(game.Workspace.PumpB.button.ProximityPrompt, 0)
                if math.random(1,100) == 100 then
                    task.wait()
                end
            until game.Workspace.PumpB.button.BrickColor == BrickColor.new("Lime green")
        end
        Player.Character.HumanoidRootPart.CFrame = savedPosForPump
        turningOnPumps = false
    end
end)

others:AddButton("Unlock all doors", function()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "normaldoor" then
            v.lockpick:FireServer()
        end
    end
end)

local alwaysDownload = false
others:AddToggle("Always enable file button", false, function(State)
    alwaysDownload = State
end)

spawn(function()
    while task.wait() do
        if alwaysDownload then
            game.Workspace.compooter.SurfaceGui.ScrollingFrame.Stealing.Visible = true
        end
    end
end)

local turrettriggered = false
others:AddButton("Trigger manager room turret", function()
    if not turrettriggered then
        turrettriggered = true
        firetouchinterest(game.Workspace.groundturretsetup.laser, Player.Character.HumanoidRootPart, 0)
        wait()
        firetouchinterest(game.Workspace.groundturretsetup.laser, Player.Character.HumanoidRootPart, 1)
        turrettriggered = false
    end
end)

local autoTurretTrigger = false
others:AddToggle("Auto trigger turret", false, function(State)
    autoTurretTrigger = State
end)

spawn(function()
    while wait(1) do
        if autoTurretTrigger then
            firetouchinterest(game:GetService("Workspace").groundturretsetup.laser, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            wait()
            firetouchinterest(game:GetService("Workspace").groundturretsetup.laser, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
        end
    end
end)

others:AddButton("Become manager", function()
    Player.PlayerGui.clicke:FireServer(game.Teams.Manager)
    Player.PlayerGui.teamjoin.Enabled = false
end)

local jpCD = false
antiSector:AddToggle("No jump cooldown", false, function(State)
    jpCD = State
end)

spawn(function()
    while wait() do
        if Player.Character and Player.Character:FindFirstChild("jumpcooldown") then
            if jpCD then
                Player.Character.jumpcooldown.Disabled = true
            else
                Player.Character.jumpcooldown.Disabled = false
            end
        end
    end
end)

local antimemetric = false
antiSector:AddToggle("Anti-memetic agent", false, function(State)
    antimemetric = State
end)

spawn(function()
    while task.wait() do
        if antimemetric then
            pcall(function()
                if Player.Character:FindFirstChild("memetickilledagented") then
                    Player.Character["memetickilledagented"]:Destroy()
                end
                if Player.Character:FindFirstChild("agentapplied") then
                    Player.Character["agentapplied"]:Destroy()
                end
                if Player.Character:FindFirstChild("agentappliednum") then
                    Player.Character["agentappliednum"]:Destroy()
                end
            end)
        end
    end
end)

local antiChipFry = false
antiSector:AddToggle("Anti-Brain detonator", false, function(State)
    antiChipFry = State
end)

spawn(function()
    while task.wait() do
        if antiChipFry then
            pcall(function()
                if Player.Character:FindFirstChild("chipfried") then
                    Player.Character["chipfried"]:Destroy()
                end
            end)
        end
    end
end)

--Visuals
local Visuals = visual:CreateSector("Visuals", "left")
local Cameras = visual:CreateSector("Cameras", "right")

Visuals:AddToggle('Players', false, function(State)
    Esp.Players = State
end)

Visuals:AddToggle('Tools', false, function(State)
    Esp.Tools = State
end)

Visuals:AddToggle('Enable Esp', false, function(State)
    Esp.Enabled = State
end)

Visuals:AddToggle('Boxes', false, function(State)
    Esp.Boxes = State
end)

Visuals:AddToggle('Tracers', false, function(State)
    Esp.Tracers = State
end)

Visuals:AddToggle('Distance', false, function(State)
    Esp.Distance = State
end)

Esp:AddObjectListener(game.Workspace, {
    Color = Color3.fromRGB(0, 255, 255),
    Type = "Tool",
    PrimaryPart = function(obj)
        local handle = obj:FindFirstChild('Handle')
        while not handle do
            wait()
            handle = obj:FindFirstChild('Handle')
        end
        return handle
    end,
    Validator = function(obj)
        return not game.Workspace:FindFirstChild(obj)
    end,
    CustomName = function(obj)
        return obj.Name
    end,
    IsEnabled = "Tools",
})

Esp:AddObjectListener(game.Players, {
    Type = "Model",
    PrimaryPart = function(obj)
        local hrp = obj:FindFirstChild('HRP')
        while not hrp do
            wait()
            hrp = obj:FindFirstChild('HRP')
        end
        return hrp
    end,
    Validator = function(obj)
        return not game.Players:GetPlayerFromCharacter(obj)
    end,
    CustomName = function(obj)
        return obj.Name
    end,
    IsEnabled = "Players",
})

local camera = game.Workspace.CurrentCamera
function createCamera(pos)
    local artificalCam = Instance.new("Part", game.Workspace)
    artificalCam.Name = "artificalCam"
    artificalCam.Size = Vector3.new(1,1,1)
    artificalCam.Anchored = true
    artificalCam.CanCollide = false
    artificalCam.Transparency = 1
    artificalCam.CFrame = pos
end
loadstring(game:HttpGet("https://raw.githubusercontent.com/IBryanL666/beepboopbapdoggo/main/Protected.lua"))() --Package loader;
Cameras:AddDropdown("Locations", {"Manager office", "Manager hallway", "Freezer", "Kitchen", "Counter"}, "", false, function(location)
    if camera.CameraSubject.Name == "artificalCam" then
        for i,v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "artificalCam" then
                v:Destroy()
            end
        end
    end
    if location == "Manager office" then
        createCamera(CFrame.new(-253.287445, -47.7826004, 33.2634392, 0.664096117, -0.428352147, 0.612773061, 0, 0.819601834, 0.572933495, -0.747647226, -0.380482912, 0.54429441))
        camera.CameraSubject = game.Workspace.artificalCam
        camera.CFrame = CFrame.new(-253.287445, -47.7826004, 33.2634392, 0.664096117, -0.428352147, 0.612773061, 0, 0.819601834, 0.572933495, -0.747647226, -0.380482912, 0.54429441)
    elseif location == "Manager hallway" then
        createCamera(CFrame.new(-381.380463, -47.2450981, 14.2127304, 0.67435503, 0.297506988, -0.675821722, 0, 0.915242434, 0.402903616, 0.738407314, -0.271700084, 0.617198348))
        camera.CameraSubject = game.Workspace.artificalCam
        camera.CFrame = CFrame.new(-381.380463, -47.2450981, 14.2127304, 0.67435503, 0.297506988, -0.675821722, 0, 0.915242434, 0.402903616, 0.738407314, -0.271700084, 0.617198348)
    elseif location == "Freezer" then
        createCamera(CFrame.new(-324.362671, 22.5015774, 113.238037, 0.74952668, 0.304682851, -0.587688804, 0, 0.887782097, 0.460263968, 0.661974132, -0.344980121, 0.66541))
        camera.CameraSubject = game.Workspace.artificalCam
        camera.CFrame = CFrame.new(-324.362671, 22.5015774, 113.238037, 0.74952668, 0.304682851, -0.587688804, 0, 0.887782097, 0.460263968, 0.661974132, -0.344980121, 0.66541)
    elseif location == "Kitchen" then
        createCamera(CFrame.new(-330.096893, 22.5373363, -0.529886127, -0.811369359, 0.264804244, -0.52111274, 0, 0.891501427, 0.453017861, 0.584533811, 0.367564797, -0.723336935))
        camera.CameraSubject = game.Workspace.artificalCam
        camera.CFrame = CFrame.new(-330.096893, 22.5373363, -0.529886127, -0.811369359, 0.264804244, -0.52111274, 0, 0.891501427, 0.453017861, 0.584533811, 0.367564797, -0.723336935)
    elseif location == "Counter" then
        createCamera(CFrame.new(-199.908081, 22.2108421, 50.8061218, 0.7510342, 0.355555296, -0.556352437, 0, 0.842622101, 0.538505316, 0.6602633, -0.404435903, 0.632838011))
        camera.CameraSubject = game.Workspace.artificalCam
        camera.CFrame = CFrame.new(-199.908081, 22.2108421, 50.8061218, 0.7510342, 0.355555296, -0.556352437, 0, 0.842622101, 0.538505316, 0.6602633, -0.404435903, 0.632838011)
    end
end)

Cameras:AddButton("Stop Cameras", function()
    camera.CameraSubject = Player.Character.Humanoid
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "artificalCam" then
            v:Destroy()
        end
    end
end)

--frjuans
local farm = frjuans:CreateSector("Generator", "left")
local burner = frjuans:CreateSector("Incinerator", "right")
local info1 = frjuans:CreateSector("Info", "left")
info1:AddLabel("Timer = Frjuans flows in")
local info2 = frjuans:CreateSector("Info", "right")
info2:AddLabel("Estimated Time = Approximate")
local frjuansTextBox
local timerLabel
local estTime
local statusLabel

local incinerating = false
local removeFrjuanTextBox
local estIncinTime
local statusIncinLabel

local addFrjuans = 0
farm:AddTextbox("Amount of frjuans (1-1M)", "", function(num)
    if type(tonumber(num)) == "number" and tonumber(num) >= 1 and tonumber(num) <= 1000000 then
        addFrjuans = tonumber(num)
    else
        frjuansTextBox.Text = ""
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Invalid amount/input.";
            Duration = 2;
        })
    end
end)

for i,v in pairs(game.CoreGui:GetChildren()) do
    if string.find(v.name, "Sakura") then
        for i2,v2 in pairs(v.main:GetDescendants()) do
            if v2:IsA("TextBox") and v2.PlaceholderText == "Amount of frjuans (1-10k)" then
                frjuansTextBox = v2
                v2.ClearTextOnFocus = true
                break
            end
        end
    end
end

function deletePunch()
    pcall(function()
        for i,v in pairs(Player.Backpack:GetChildren()) do
            if v.Name == "punch" then
                v:Destroy()
            end
        end
    end)
end

farm:AddButton("Start generating", function()
    if addFrjuans > 0 then
        if not generatingFrjuans then
            generatingFrjuans = true
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "Respawn to stop generator.";
                Duration = 2;
            })
            statusLabel.Text = "Status: Generating"
            local originalAmtOfFrjuans = Player.leaderstats.frjuans.Value
            if Player.Team ~= game.Teams.Choosing then
                Player.Character:BreakJoints()
                repeat wait() until Player.Team == game.Teams.Choosing and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0
            end
            local timer = 80
            if addFrjuans <= 10000 then
                estTime.Text = "Estimated time: "..(math.floor((((addFrjuans * 0.003) + 80)/60) * 100 + 0.5)/100).." min"
            else
                estTime.Text = "Estimated time: "..(math.floor((((addFrjuans * 0.03) + 80)/60) * 100 + 0.5)/100).." min" 
            end
            spawn(function()
                for i = 1,addFrjuans do
                    if Player.Character:FindFirstChild("Humanoid").Health > 0 then
                        Player.PlayerGui.clicke:FireServer(game.Teams.Choosing)
                        Player.PlayerGui.teamjoin.Enabled = false
                        if addFrjuans <= 10000 then
                            if math.random(1,5) == 5 then
                                task.wait()
                            end
                        else
                            if math.random(1,3) == 3 then
                                wait()
                            end
                       end
                    end
                end
                Player.PlayerGui.clicke:FireServer(game.Teams.Customers)
                Player.PlayerGui.teamjoin.Enabled = false
            end)
            spawn(function()
                repeat
                    Player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0,10000,0))
                    deletePunch()
                    if math.random(1,1000) == 1000 then
                        task.wait()
                    end
                until Player.leaderstats.frjuans.Value >= originalAmtOfFrjuans + addFrjuans or Player.Character:FindFirstChild("Humanoid").Health <= 0
            end)
            repeat
                timer = timer - 1
                timerLabel.Text = "Timer: "..timer
                wait(1)
            until timer == 0 or Player.Character:FindFirstChild("Humanoid").Health <= 0
            repeat wait() until Player.leaderstats.frjuans.Value >= originalAmtOfFrjuans + addFrjuans or Player.Character:FindFirstChild("Humanoid").Health <= 0
            deletePunch()
            Player.Character:BreakJoints()
            generatingFrjuans = false
            timerLabel.Text = "Timer: nil"
            estTime.Text = "Estimated time: nil"
            statusLabel.Text = "Status: Ready"
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "Already generating Frjuans.";
                Duration = 2;
            })
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Please input amount.";
            Duration = 2;
        })
    end
end)

farm:AddLabel("      Progress report")
farm:AddLabel("Timer: nil")
farm:AddLabel("Estimated time: nil")
farm:AddLabel("Status: nil")

for i,v in pairs(game.CoreGui:GetChildren()) do
    if string.find(v.name, "Sakura") then
        for i2,v2 in pairs(v.main:GetDescendants()) do
            if v2:IsA("TextLabel") and v2.Text == "Timer: nil" and v2.Parent.Parent.Name == "GeneratorSector" then
                timerLabel = v2
                break
            end
        end
        for i2,v2 in pairs(v.main:GetDescendants()) do
            if v2:IsA("TextLabel") and v2.Text == "Status: nil" and v2.Parent.Parent.Name == "GeneratorSector" then
                statusLabel = v2
                break
            end
        end
        for i2,v2 in pairs(v.main:GetDescendants()) do
            if v2:IsA("TextLabel") and v2.Text == "Estimated time: nil" and v2.Parent.Parent.Name == "GeneratorSector" then
                estTime = v2
                break
            end
        end
    end
end

local removeFrjuans = 0
burner:AddTextbox("Amount of frjuans", "", function(num)
    if type(tonumber(num)) == "number" and tonumber(num) >= 1 then
        removeFrjuans = tonumber(num)
    else
        removeFrjuanTextBox.Text = ""
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Invalid amount/input.";
            Duration = 2;
        })
    end
end)

for i,v in pairs(game.CoreGui:GetChildren()) do
    if string.find(v.name, "Sakura") then
        for i2,v2 in pairs(v.main:GetDescendants()) do
            if v2:IsA("TextBox") and v2.PlaceholderText == "Amount of frjuans" then
                removeFrjuanTextBox = v2
                v2.ClearTextOnFocus = true
                break
            end
        end
    end
end

function deleteRareComp()
    pcall(function()
        for i,v in pairs(Player.Backpack:GetChildren()) do
            if v.Name == "Rare component" then
                v:Destroy()
            end
        end
    end)
end

burner:AddButton("Start incinerating", function()
    if removeFrjuans > 0 then
        if not incinerating then
            incinerating = true
            statusIncinLabel.Text = "Status: Incinerating"
            local originalAmtOfFrjuans = Player.leaderstats.frjuans.Value
            estIncinTime.Text = "Estimated time: "..(math.floor(((((removeFrjuans / 6) * 0.03))/60) * 100 + 0.5)/100).." min"
            spawn(function()
                repeat
                    deleteRareComp()
                    if math.random(1,10) == 10 then
                        task.wait()
                    end
                until Player.leaderstats.frjuans.Value <= originalAmtOfFrjuans - removeFrjuans or Player.Character:FindFirstChild("Humanoid").Health <= 0
            end)
            spawn(function()
                repeat
                    Player.PlayerGui.buysomething:FireServer(10)
                    wait()
                until Player.leaderstats.frjuans.Value <= originalAmtOfFrjuans - removeFrjuans or Player.Character:FindFirstChild("Humanoid").Health <= 0
            end)
            repeat wait() until Player.leaderstats.frjuans.Value <= originalAmtOfFrjuans - removeFrjuans or Player.Character:FindFirstChild("Humanoid").Health <= 0
            estIncinTime.Text = "Estimated time: nil"
            statusIncinLabel.Text = "Status: Ready"
            deleteRareComp()
            delay(0.5, function()
                deleteRareComp()
            end)
            incinerating = false
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "Already incinerating Frjuans.";
                Duration = 2;
            })
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "Please input amount.";
            Duration = 2;
        })
    end
end)

burner:AddLabel("      Progress report")
burner:AddLabel("")
burner:AddLabel("Estimated time: nil")
burner:AddLabel("Status: nil")

for i,v in pairs(game.CoreGui:GetChildren()) do
    if string.find(v.name, "Sakura") then
        for i2,v2 in pairs(v.main:GetDescendants()) do
            if v2:IsA("TextLabel") and v2.Text == "Status: nil" and v2.Parent.Parent.Name == "IncineratorSector" then
                statusIncinLabel = v2
                break
            end
        end
        for i2,v2 in pairs(v.main:GetDescendants()) do
            if v2:IsA("TextLabel") and v2.Text == "Estimated time: nil" and v2.Parent.Parent.Name == "IncineratorSector" then
                estIncinTime = v2
                break
            end
        end
    end
end

--Credits:
local cre = credit:CreateSector("Credits", "left")
local disclaimer = credit:CreateSector("Disclaimer", "right")

cre:AddLabel("Created by: Doggo")
cre:AddLabel("Bug tester: chessburger")
cre:AddLabel("Jan UI Library")
cre:AddLabel("Kirito's Esp")
disclaimer:AddLabel("Script was made in 2 days.\nThere will be rarely any\nfuture updates due to my\nbusy schedule. Feel free to\nuse my open source code,\nbut please provide credit.\nThanks. 🌸")

--Infinite Yield Anti afk
local GC = getconnections or get_signal_cons
if GC then
    for i,v in pairs(GC(Player.Idled)) do
        if v["Disable"] then
            v["Disable"](v)
        elseif v["Disconnect"] then
            v["Disconnect"](v)
        end
    end
else
    Player.Idled:Connect(function()
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end
