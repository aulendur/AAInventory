import "Turbine.Gameplay"
import "Aulendur.AAInventory.Class"
import "Aulendur.AAInventory.AAIWindow"

local win1 = AAIWindow (300, 100)

AAICommand = Turbine.ShellCommand()

function AAICommand:Execute (cmd, args)
	if (args == "show") then
		win1:SetVisible (true)
	elseif (args == "hide") then
		win1:SetVisible (false)
	elseif (args == "toggle") then
		win1:SetVisible (not win1:IsVisible())
	end
end

function AAICommand:GetHelp()
	return "Aulendur's Advanced Inventory\n\tusage: /aai [show|hide|toggle]\n"
end

function AAICommand:GetShortHelp()
	return "Show/hide/toggle AAInventory"
end

Turbine.Shell.AddCommand ("aai;aainventory", AAICommand)

AAIItemlist = class()

local player = Turbine.Gameplay.LocalPlayer.GetInstance()
local toon = player:GetName()

local bags = player:GetBackpack()
local bagitems = {}
bagitems.count = 0
for i = 1, bags:GetSize() do
	if bags:GetItem(i) ~= nil then
		bagitems.count = bagitems.count +1
	end
end
Turbine.Shell.WriteLine ("You have "..bagitems.count.." items in your bags")

-- local wallet = player:GetWallet()
-- Turbine.Shell.WriteLine ("You have "..wallet:GetSize().." items in your wallet")
-- local shared = player:GetSharedStorage()
-- Turbine.Shell.WriteLine ("You have "..shared:GetCount().." items in shared storage")

-- if player:GetAllignment() ~= Turbine.Gameplay.Alignment.FreePeople then
-- 	return
-- end

function AAIItemlist:Constructor ()
	local Characters = {}
end

