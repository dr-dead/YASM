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
MiniMapLFGFrameBorder:Hide()
MiniMapBattlefieldBorder:Hide()
Minimap:SetMaskTexture([=[Interface\ChatFrame\ChatFrameBackground]=])

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

--mail

function yasm:PLAYER_LOGIN()

end
