import "Turbine.Gameplay"
import "Turbine.UI"
import "Turbine.UI.Lotro"
import "Aulendur.AAInventory.Class"

AAIItemlist = class()
AAIWindow = class(Turbine.UI.Lotro.Window())

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

function AAIWindow:Constructor (x, y)
	local size = 200
	local border = 10
	local textw = size - (2*border)
	local texth = 20
	if x==nil or y==nil then
		x = Turbine.UI.Display:GetWidth() / 2 - (size/2)
		y = Turbine.UI.Display:GetHeight() / 2 - (size/2)
	end

	Turbine.UI.Lotro.Window.Constructor (self)

	self:SetSize (size, size)
	-- center the window
	self:SetPosition (x, y)
	-- assign TITLE bar text
	self:SetText ("Hello World Window")

	self.Message = Turbine.UI.Label()
	self.Message:SetParent (self)
	self.Message:SetSize (textw, texth)
	-- place the message in the vertical middle of the window with a 10 pixel left and right border
	self.Message:SetPosition (border, (size - texth)/2)
	-- centers the text inside the label both horizontally and vertically
	self.Message:SetTextAlignment (Turbine.UI.ContentAlignment.MiddleCenter)
	self.Message:SetText ("Hello "..toon)

	self:SetVisible(true)
end

-- win1 = AAIWindow (300, 100)
