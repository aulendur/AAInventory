import "Turbine.Gameplay"
import "Aulendur.AAInventory.Class"
import "Aulendur.AAInventory.AAIWindow"

-- The One InventoryWindow
local IWin = AAIWindow()

--
AAICommand = Turbine.ShellCommand()

function AAICommand:Execute (cmd, args)
	if (args == "show") then
		IWin:SetVisible (true)
	elseif (args == "hide") then
		IWin:SetVisible (false)
	elseif (args == "toggle") then
		IWin:SetVisible (not IWin:IsVisible())
	end
end

function AAICommand:GetHelp()
	return "Aulendur's Advanced Inventory\n\tusage: /aai [show|hide|toggle]\n"
end

function AAICommand:GetShortHelp()
	return "Show/hide/toggle AAInventory"
end

Turbine.Shell.AddCommand ("aai;aainventory", AAICommand)

--
AAIItemList = class()

function AAIItemList:Constructor ()
	local Characters = {}
	self.CurrentChar = nil

	local _player = Turbine.Gameplay.LocalPlayer.GetInstance()
	self.CurrentChar = _player:GetName()

	local bags = _player:GetBackpack()
local bagitems = {}
bagitems.count = 0
for i = 1, bags:GetSize() do
	if bags:GetItem(i) ~= nil then
		bagitems.count = bagitems.count +1
	end
end
Turbine.Shell.WriteLine ("You have "..bagitems.count.." items in your bags")
end

local IList = AAIItemList()
IWin:SetItemList (IList)

-- local wallet = player:GetWallet()
-- Turbine.Shell.WriteLine ("You have "..wallet:GetSize().." items in your wallet")
-- local shared = player:GetSharedStorage()
-- Turbine.Shell.WriteLine ("You have "..shared:GetCount().." items in shared storage")

-- if player:GetAllignment() ~= Turbine.Gameplay.Alignment.FreePeople then
-- 	return
-- end

