local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

local Window = redzlib:MakeWindow({
  Title = "Gym ShowDown Simulator Hub [ Frremium ] By Van Nguyen",
  SubTitle = "https://discord.gg/nradqyeA",
  SaveFolder = "testando | dinas.lua"
})

local Tab1 = Window:MakeTab({"Game", "gamepad-2"})

local Section = Tab1:AddSection({"game})

local ReplicatedStorage = main:GetService("ReplicatedStorage")

local DamageEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("DamageIncreaseOnClickEvent")

local AutoFarm = false

local Toggle1 = Tab1:AddToggle({
  Name = "AutoFarm Click",
  Description = "Automatically AutoFarm muscles",
  AutoClicking = false 
})
Toggle1:Callback(function(Value)
    if Value then
        AutoFarm DamageIncreaseOnClickEvent = true
        spawn(function()
            while AutoClick do
                DamageEvent:FireServer()
                wait(0.01)
            end
        end)
    else
        FireServer = false
    end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RaceEvents = ReplicatedStorage:WaitForChild("Events"):WaitForChild("RaceEvents")
local ClickedDuringRace = RaceEvents:WaitForChild("ClickedDuringRace")

local AutoClicking = false

local Toggle1 = Tab1:AddToggle({
  Name = "AutoClick Race",
  Description = "Automatically clicks during the race",
  autoclick_enabled = false 
})

Toggle1:Callback(function(Value)
  if Value then
    autoclick_enabled = true
    spawn(function()
    while autoclick_enabled do
      ClickedDuringRace:FireServer()
      wait(0.05)
    end
        end)
    else
        autoclick_enabled = false
    end
end)

local Toggle1 = Tab1:AddToggle({
  Name = "AutoRebith",
  Description = "Automatically rebith",
  rebirthActive = false 
})

local rebirthActive = false

Toggle1:Callback(function(Value)
    rebirthActive = Value
    if rebirthActive then
        spawn(function()
            while rebirthActive do
                local args = {true}
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RebirthEvent"):FireServer(unpack(args))
                wait(0.1)
            end
        end)
    end
end)

local function CreateButtons(parent, namePrefix, onClick)
  for i = 1, 9 do
    parent:AddButton({
      Name = namePrefix .. " " .. tostring(i),
      Callback = function()
        onClick(i)
      end
    })
  end
end

local Tab2 = Window:MakeTab({"Location", "database"})

local Section = Tab2:AddSection({"AutoBuy Location"})

CreateButtons(Tab2, "Buy Location", function(locationNumber)
  local args = {locationNumber}
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("LevelGUIBuyButtonPressed"):FireServer(unpack(args))
end)

local Tab3 = Window:MakeTab({"Teleport", "fast-forward"})

local Section = Tab3:AddSection({"Buy Teleport for the gems and will work"})

CreateButtons(Tab3, "Teleport Location", function(locationNumber)
  local args = {"Teleport", locationNumber}
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("TeleportEvent"):InvokeServer(unpack(args))
end)