--frame init
local yasm = CreateFrame("Frame")
yasm:SetScript('OnEvent', function(self, event, ...) self[event](self, ...) end)
yasm:RegisterEvent("PLAYER_LOGIN")

--minimap voodoo
Minimap:ClearAllPoints()
Minimap:SetPoint("CENTER", UIParent, "CENTER", 15, 15)
MinimapCluster:EnableMouse(false)
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
MinimapBorder:Hide()
MinimapBorderTop:Hide()
MinimapNorthTag:SetAlpha(0)
MiniMapWorldMapButton:Hide()
GameTimeFrame:Hide()
Minimap:SetMaskTexture([=[Interface\ChatFrame\ChatFrameBackground]=])

--title
MinimapZoneTextButton:SetParent(Minimap)
MinimapZoneTextButton:SetPoint('TOP', Minimap, 0, 16)
MinimapZoneTextButton:SetFrameStrata("LOW")
MinimapZoneText:SetShadowOffset(0, 0)	
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

--bg

--clock
TimeManager_LoadUI()
TimeManagerClockButton:GetRegions():Hide()

--mail

function yasm:PLAYER_LOGIN()

end
