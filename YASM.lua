--frame init
local yasm = CreateFrame("Frame")
yasm:SetScript('OnEvent', function(self, event, ...) self[event](self, ...) end)
yasm:RegisterEvent("PLAYER_LOGIN")
yasm:RegisterEvent("CALENDAR_UPDATE_PENDING_INVITES")

--minimap voodoo
Minimap:ClearAllPoints()
Minimap:SetPoint("CENTER", UIParent, "CENTER", 15, 15)
MinimapCluster:EnableMouse(false)
Minimap:SetClampedToScreen()
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
MinimapBorder:Hide()
MinimapBorderTop:Hide()
MinimapNorthTag:SetAlpha(0)
MiniMapWorldMapButton:Hide()
GameTimeFrame:Hide()
MiniMapLFGFrameBorder:Hide()
MiniMapBattlefieldBorder:Hide()
MiniMapMailBorder:Hide()
Minimap:SetMaskTexture([=[Interface\ChatFrame\ChatFrameBackground]=])

--borders
Minimap:SetBackdrop({
	bgFile = [=[Interface\ChatFrame\ChatFrameBackground]=], 
	insets = {left = -2, right = -2, top = -2, bottom = -2}
})
Minimap:SetBackdropColor(0, 0, 0)

--title
MinimapZoneTextButton:SetParent(Minimap)
MinimapZoneTextButton:SetPoint('TOP', Minimap, 0, 16)
MinimapZoneTextButton:SetFrameStrata("LOW")
MinimapZoneText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
MinimapZoneText:SetAllPoints(MinimapZoneTextButton)

--tracking
MiniMapTracking:ClearAllPoints()
MiniMapTracking:SetParent(Minimap)
MiniMapTracking:SetPoint("TOPLEFT", 2, -2)
MiniMapTrackingBackground:Hide()
MiniMapTrackingButtonBorder:SetTexture(nil)
MiniMapTrackingButton:SetHighlightTexture(nil)
MiniMapTrackingIconOverlay:SetTexture(nil)
MiniMapTrackingIcon:SetTexCoord(0.065, 0.935, 0.065, 0.935)

--lfg
MiniMapLFGFrame:ClearAllPoints()
MiniMapLFGFrame:SetParent(Minimap)
MiniMapLFGFrame:SetPoint('TOPRIGHT', 2, -2)
LFDSearchStatus:SetClampedToScreen(true)

--bg
MiniMapBattlefieldFrame:ClearAllPoints()
MiniMapBattlefieldFrame:SetParent(Minimap)
MiniMapBattlefieldFrame:SetPoint('TOPRIGHT', 2, -2)

--clock
TimeManager_LoadUI()
TimeManagerClockButton:GetRegions():Hide()
TimeManagerClockButton:ClearAllPoints()
TimeManagerClockButton:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, -5)
TimeManagerClockTicker:SetPoint('CENTER', TimeManagerClockButton)
TimeManagerClockTicker:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
TimeManagerClockButton:SetScript('OnClick', function(self, button)
	if(button == 'RightButton') then
		ToggleCalendar()
	else
		if(self.alarmFiring) then
			PlaySound('igMainMenuQuit')
			TimeManager_TurnOffAlarm()
		else
			ToggleTimeManager()
		end
	end
end)

--mail
MiniMapMailFrame:ClearAllPoints()
MiniMapMailFrame:SetParent(Minimap)
MiniMapMailFrame:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 4, -4)
MiniMapMailIcon:SetTexture([=[Interface\Minimap\Tracking\Mailbox]=])

function yasm:PLAYER_LOGIN()
	yasm.CALENDAR_UPDATE_PENDING_INVITES()
end

function yasm:CALENDAR_UPDATE_PENDING_INVITES()
	if(CalendarGetNumPendingInvites() ~= 0) then
		TimeManagerClockTicker:SetTextColor(0, 1, 0)
	else
		TimeManagerClockTicker:SetTextColor(1, 1, 1)
	end
end

function GetMinimapShape()
	return 'SQUARE'
end
