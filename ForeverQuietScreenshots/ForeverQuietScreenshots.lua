-- The game's ActionStatus frame shows "Screen Captured" in the middle of the
-- screen when a screenshot is taken; without that event it stays hidden. A
-- screenshot that fails still shows its message.
local function Quiet()
	if not ActionStatus then return false end
	ActionStatus:UnregisterEvent("SCREENSHOT_SUCCEEDED")
	return true
end

-- The frame comes with Blizzard_ActionStatus, loaded before addons; if it
-- isn't there yet, wait for it.
if not Quiet() then
	local frame = CreateFrame("Frame")
	frame:RegisterEvent("ADDON_LOADED")
	frame:SetScript("OnEvent", function(self)
		if Quiet() then self:UnregisterAllEvents() end
	end)
end
