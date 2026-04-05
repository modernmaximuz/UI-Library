-- ══════════════════════════════════════════
--   HADES GUI SCRIPT  |  HadesScript.lua
--   Put your tabs, buttons, toggles here.
--   Load the library first, then build.
-- ══════════════════════════════════════════

local HadesLib = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/modernmaximuz/UI-Library/refs/heads/main/Hades/Main"
))()

local Hades = HadesLib.CreateWindow("Hades", 6105620301)

-- ═══════════════════
--  AUTO-FARM TAB
-- ═══════════════════

local farmTab = Hades:Tab("Auto-Farm")
local farmSec = farmTab:Section("Farming")

farmSec:Toggle("Auto Farm Mobs", function(enabled)
    -- your farm logic here
    print("Auto Farm:", enabled)
end)

farmSec:Toggle("Auto Collect Drops", function(enabled)
    print("Auto Collect:", enabled)
end)

farmSec:Toggle("Auto Use Potions", function(enabled)
    print("Auto Potions:", enabled)
end)

farmSec:Slider("Farm Radius", 10, 200, function(value)
    print("Radius:", value)
end)

-- ═══════════════════
--  TELEPORTS TAB
-- ═══════════════════

local tpTab = Hades:Tab("Teleports")
local tpSec = tpTab:Section("Locations")

local locations = {
    Spawn          = Vector3.new(0, 5, 0),
    ["Boss Arena"] = Vector3.new(100, 5, 100),
    Shop           = Vector3.new(-50, 5, 30),
    ["Sky Island"] = Vector3.new(0, 500, 0),
}

for name, pos in pairs(locations) do
    tpSec:Button(name, function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = CFrame.new(pos)
        end
    end)
end

-- ═══════════════════
--  AUTO-QUEST TAB
-- ═══════════════════

local questTab = Hades:Tab("Auto-Quest")
local questSec = questTab:Section("Quest Automation")

questSec:Toggle("Auto Accept Quest", function(enabled)
    print("Auto Accept:", enabled)
end)

questSec:Toggle("Auto Turn In", function(enabled)
    print("Auto Turn In:", enabled)
end)

questSec:Toggle("Skip Dialogue", function(enabled)
    print("Skip Dialogue:", enabled)
end)

local filterSec = questTab:Section("Quest Filter")

filterSec:DropDown("Quest Type", {"All Quests", "Daily Only", "Story Only", "Side Quests"}, function(choice)
    print("Filter:", choice)
end)

-- ═══════════════════
--  COMBAT TAB
-- ═══════════════════

local combatTab = Hades:Tab("Combat")
local combatSec = combatTab:Section("Auto Combat")

combatSec:Toggle("Auto Attack", function(enabled)
    print("Auto Attack:", enabled)
end)

combatSec:Toggle("Auto Block", function(enabled)
    print("Auto Block:", enabled)
end)

combatSec:Toggle("Auto Dodge", function(enabled)
    print("Auto Dodge:", enabled)
end)

local bindSec = combatTab:Section("Keybinds")

bindSec:KeyBind("Burst Skill", Enum.KeyCode.Q, function()
    print("Burst!")
end)

bindSec:KeyBind("Ultimate", Enum.KeyCode.E, function()
    print("Ultimate!")
end)

-- ═══════════════════
--  EXAMPLES TAB
-- ═══════════════════

local exTab = Hades:Tab("Examples")
local exSec = exTab:Section("All Examples")

exSec:Label("Welcome to Hades GUI")

exSec:Button("TextButton Text", function()
    print("Clicked!")
end)

exSec:Toggle("Toggle Me!", function(isToggled)
    print(isToggled)
end)

exSec:KeyBind("Print Hey on bind", Enum.KeyCode.R, function()
    print("Hey")
end)

exSec:Slider("WalkSpeed", 16, 503, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

exSec:DropDown("Favorite Food?", {"Pizza", "Burger", "Sandwiches"}, function(food)
    print(food)
end)

-- ═══════════════════
--  CREDITS TAB
-- ═══════════════════

local credTab  = Hades:Tab("Credits")
local ownerSec = credTab:Section("Owners")

ownerSec:Credit("Maxim — Owner")
