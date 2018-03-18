import "Turbine.UI.Lotro"
import "Aulendur.AAInventory.Class"

AAIWindow = class(Turbine.UI.Lotro.Window())

function AAIWindow:Constructor (x, y)
	self.ItemList = nil
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
	self.Message:SetText ("Hello Middle-Earth")
end

function AAIWindow:SetItemList (ilist)
	self.ItemList = ilist
	self:MyUpdate()
end

function AAIWindow:MyUpdate()
	if self.ItemList ~= nil then
		-- self.Message:SetText ("Hello "..(self.ItemList.CurrentChar))
		self.Message:SetText ("Hello world")
	end
end
