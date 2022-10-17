-- Welcome! --

SLASH_LOCKOUTTRACKER1 = "/lt"
SLASH_LOCKOUTTRACKERLOCK1 = "/ltl"
SLASH_LOCKOUTTRACKERUNLOCK1 = "/ltu"

print("LOCKOUT Tracker V-0.0.1")
print("Author: Yew")
print("/lt for help")

--strings--

local theNexus = "The Nexus"
local theOculus = "The Oculus"
local azjolNerub = "Azjol-Nerub"
local ahnkahetTheOldKingdom = "Ahn'Kahet: The Old Kingdom"
local hallsOfLightning = "Halls of Lightning"
local hallsOfStone = "Halls of Stone"
local draktharonKeep = "Drak'Tharon Keep"
local gundrak = "Gundrak"
local utgardePinnacle = "Utgarde Pinnacle"
local utgardeKeep = "Utgarde Keep"
local violetHold = "Violet Hold"
local theCullingofStratholme = "The Culling of Stratholme"

--booleans-
local theNexusLocked = false
local theOculusLocked = false
local azjolNerubLocked = false
local ahnkahetTheOldKingdomLocked = false
local hallsOfLightningLocked = false
local hallsOfStoneLocked = false
local draktharonKeepLocked = false
local undrakLocked = false
local utgardePinnacleLocked = false
local utgardeKeepLocked = false
local violetHoldLocked = false
local theCullingofStratholmeLocked = false

--emblems/badges #--
local availableEmblems = 49
local maxTotalEmblems = 0

local theNexusBadges = 5
local theOculusBadges = 4
local azjolNerubBadges = 3
local ahnkahetTheOldKingdomBadges = 5
local hallsOfLightningBadges = 4
local hallsOfStoneBadges = 4
local draktharonKeepBadges = 4
local gundrakBadges = 5
local utgardePinnacleBadges = 4
local utgardeKeepBadges = 3
local violetHoldBadges = 3
local theCullingofStratholmeBadges = 5
local emblemOfHeroism
local emblemOfValor 

--converting number to string--
local showAvailableEmblems = "Available EoH: "..(tostring(availableEmblems))

--frames--

local msgFrame = CreateFrame("FRAME", "LockoutTracker", UIParent)
msgFrame:SetSize(150, 210); --width, height
msgFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 185, -265); -- point, relativeFrame, relativePoint, xOffset, yOffset)
msgFrame:SetMovable(true)
msgFrame:EnableMouse(true)

msgFrame:RegisterForDrag("LeftButton")

msgFrame:SetScript("OnDragStart", function(self)
    msgFrame:StartMoving()
end)
msgFrame:SetScript("OnDragStop", function(self)
    msgFrame:StopMovingOrSizing()
    point, relativeTo, relativePoint, xOfs, yOfs = msgFrame:GetPoint()
    DEFAULT_CHAT_FRAME:AddMessage(xOfs)
    DEFAULT_CHAT_FRAME:AddMessage(yOfs)
end)

msgFrame:SetUserPlaced(true)

msgFrame.header = msgFrame:CreateFontString("DungeonList", "OVERLAY", "GameFontHighlight")
msgFrame.header:SetPoint("TOPLEFT")
msgFrame.header:SetFont("Interface\\AddOns\\LockoutTracker\\Fonts\\FRIZQT__.TTF", 13,"THICKOUTLINE")
msgFrame.header:SetText("Dungeon List:")
msgFrame.header:SetTextColor(0.96,1,0.46,1)
msgFrame.header:SetShadowColor(0, 0, 0, 1)
msgFrame.header:SetShadowOffset(-1, -1)
msgFrame.header:SetJustifyH("LEFT")
msgFrame.header:SetJustifyV("TOP")

msgFrame.text = msgFrame:CreateFontString("ActualDungeonList", "OVERLAY", "GameFontHighlight")
msgFrame.text:SetPoint("LEFT", 0, 20.5)
msgFrame.text:SetFont("Interface\\AddOns\\LockoutTracker\\Fonts\\FRIZQT__.TTF", 12,"OUTLINE")
msgFrame.text:SetText(theNexus.."\n"..theOculus.."\n"..azjolNerub.."\n"..ahnkahetTheOldKingdom.."\n"..hallsOfLightning.."\n"..hallsOfStone.."\n"..draktharonKeep.."\n"..gundrak.."\n"..utgardePinnacle.."\n"..utgardeKeep.."\n"..violetHold.."\n"..theCullingofStratholme)
msgFrame.text:SetTextColor(0,1,1,1)
msgFrame.text:SetShadowColor(0, 0, 0, 1)
msgFrame.text:SetShadowOffset(-1, -1)
msgFrame.text:SetJustifyH("LEFT")
msgFrame.text:SetJustifyV("TOP")

msgFrame.emblemText = msgFrame:CreateFontString("CurrencyList", "OVERLAY", "GameFontHighlight")
msgFrame.emblemText:SetPoint("BOTTOMLEFT")
msgFrame.emblemText:SetFont("Interface\\AddOns\\LockoutTracker\\Fonts\\FRIZQT__.TTF", 12,"OUTLINE")
msgFrame.emblemText:SetText(showAvailableEmblems)
msgFrame.emblemText:SetTextColor(1, .1, .76,1)
msgFrame.emblemText:SetShadowColor(0, 0, 0, 1)
msgFrame.emblemText:SetShadowOffset(-1, -1)
msgFrame.emblemText:SetJustifyH("LEFT")
msgFrame.emblemText:SetJustifyV("LEFT")

msgFrame:RegisterEvent("ADDON_LOADED");
msgFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
msgFrame:RegisterEvent("GUILD_ROSTER_UPDATE");
msgFrame:RegisterEvent("UNIT_POWER_UPDATE");
msgFrame:RegisterEvent("PLAYER_REGEN_ENABLED");
msgFrame:RegisterEvent("PLAYER_LOGOUT")


local function updateTracker(self, event, arg1)

    if event == "PLAYER_ENTERING_WORLD" or event == "UNIT_POWER_UPDATE" or event == "GUILD_ROSTER_UPDATE" or event == "PLAYER_REGEN_ENABLED" then

        --get Lockout Info--

        for i=1, 25 do
            local name, _, _, _, locked, _, _, raid, num = GetSavedInstanceInfo(i);    
            
            if(name == "The Nexus" and locked == true) then
                theNexus = "The Nexus (Locked)"
                theNexusLocked = true
            end
    
            if(name == "The Oculus" and locked == true) then
                theOculus = "The Oculus (Locked)"
                theOculusLocked = true
            end
    
            if(name == "Azjol-Nerub" and locked == true) then
                azjolNerub = "Azjol-Nerub (Locked)"
                azjolNerubLocked = true
            end
    
            if(name == "Ahn'Kahet: The Old Kingdom" and locked == true) then
                ahnkahetTheOldKingdom = "Ahn'Kahet: The Old Kingdom (Locked)"
                ahnkahetTheOldKingdomLocked = true
            end
            
            if(name == "Halls of Lightning" and locked == true) then
                hallsOfLightning = "Halls of Lightning (Locked)"
                hallsOfLightningLocked = true
            end
            
            if(name == "Halls of Stone" and locked == true) then
                hallsOfStone = "Halls of Stone (Locked)"
                hallsOfStoneLocked = true
            end 
            
            if(name == "Drak'Tharon Keep" and locked == true) then
                draktharonKeep = "Drak'Tharon Keep (Locked)"
                draktharonKeepLocked = true
            end 

            if(name == "Gundrak" and locked == true) then
                gundrak = "Gundrak (Locked)"
                gundrakLocked = true
            end

            if(name == "Utgarde Pinnacle" and locked == true) then
                utgardePinnacle = "Utgarde Pinnacle (Locked)"
                utgardePinnacleLocked = true
            end

            if(name == "Utgarde Keep" and locked == true) then
                utgardeKeep = "Utgarde Keep (Locked)"
                utgardeKeepLocked = true
            end

            if(name == "Violet Hold" and locked == true) then
                violetHold = "Violet Hold (Locked)"
                violetHoldLocked = true
            end

            if(name == "The Culling of Stratholme" and locked == true) then
                theCullingofStratholme = "The Culling of Stratholme (Locked)"
                theCullingofStratholmeLocked = true;
            end

        end

        --set Boolean--

        if theNexusLocked == true then
            theNexusBadges = 0
        end

        if theOculusLocked == true then
            theOculusBadges = 0
        end

        if azjolNerubLocked == true then
            azjolNerubBadges = 0
        end

        if ahnkahetTheOldKingdomLocked == true then
            ahnkahetTheOldKingdomBadges = 0
        end

        if hallsOfLightningLocked == true then
            hallsOfLightningBadges = 0
        end

        if hallsOfStoneLocked == true then
            hallsOfStoneBadges = 0
        end

        if draktharonKeepLocked == true then
            draktharonKeepBadges = 0
        end

        if gundrakLocked == true then
            gundrakBadges = 0
        end

        if utgardePinnacleLocked == true then
            utgardePinnacleBadges = 0
        end

        if utgardeKeepLocked == true then
        utgardeKeepBadges = 0
        end

        if violetHoldLocked == true then
            violetHoldBadges = 0
        end

        if theCullingofStratholmeLocked == true then
            theCullingofStratholmeBadges = 0
        end

        --update Available Emblems--

        availableEmblems = maxTotalEmblems + (theNexusBadges + theOculusBadges + azjolNerubBadges + ahnkahetTheOldKingdomBadges + hallsOfLightningBadges + hallsOfStoneBadges + draktharonKeepBadges + gundrakBadges + utgardePinnacleBadges + utgardeKeepBadges + violetHoldBadges +  theCullingofStratholmeBadges)

        showAvailableEmblems = "Available EoH: "..(tostring(availableEmblems))
        
        local name, CurrentAmount = GetCurrencyInfo(101)
        
        emblemOfHeroism = "Emblem of Heroism: "..(tostring(CurrentAmount))

        local name, CurrentAmount = GetCurrencyInfo(102)
        
        emblemOfValor = "Emblem of Valor: "..(tostring(CurrentAmount))

        local name, CurrentAmount = GetCurrencyInfo(102)
        
        emblemOfValor = "Emblem of Valor: "..(tostring(CurrentAmount))

        local name, CurrentAmount = GetCurrencyInfo(161)
        
        stoneKeepersShards = "Stone Keeper's Shards: "..(tostring(CurrentAmount))

        --update text--

        msgFrame.text:SetText(theNexus.."\n"..theOculus.."\n"..azjolNerub.."\n"..ahnkahetTheOldKingdom.."\n"..hallsOfLightning.."\n"..hallsOfStone.."\n"..draktharonKeep.."\n"..gundrak.."\n"..utgardePinnacle.."\n"..utgardeKeep.."\n"..violetHold.."\n"..theCullingofStratholme)

        msgFrame.emblemText:SetText(showAvailableEmblems.."\n"..emblemOfHeroism.."\n"..emblemOfValor.."\n"..stoneKeepersShards)

    end
end

msgFrame:SetScript("OnEvent", updateTracker);

    --Slash command functions

    local function LockoutTrackerHandler(name)
        print("Lockout Tracker / commands")
        print("/ltl Unlocks frame")
        print("/ltu Locks frame")

    end
    
    local function LockoutTrackerLockHandler(name)
        print("LockoutTracker Locked")
        msgFrame:SetMovable(false)
    end
    
    local function LockoutTrackerUnLockHandler(name)
        print("LockoutTracker Unlocked")
        msgFrame:SetMovable(true)
    end

SlashCmdList["LOCKOUTTRACKER"] = LockoutTrackerHandler
SlashCmdList["LOCKOUTTRACKERLOCK"] = LockoutTrackerLockHandler
SlashCmdList["LOCKOUTTRACKERUNLOCK"] = LockoutTrackerUnLockHandler

local panel = CreateFrame("Frame", "LockoutTrackerPanel")
panel.name = "Lockout Tracker"               -- see panel fields
InterfaceOptions_AddCategory(panel)  -- see InterfaceOptions API


-- add widgets to the panel as desired
local title = panel:CreateFontString("ARTWORK", "InterfaceTitle", "GameFontNormalLarge")
title:SetPoint("TOP", 0, -8)
title:SetText("Lockout Tracker")
point, relativeTo, relativePoint, xOfs, yOfs = msgFrame:GetPoint()

local title = panel:CreateFontString("ARTWORK", "InterfaceText", "GameFontNormalLarge")
title:SetPoint("TOP", 0, -34)
title:SetText(--[["xOfs:".."\n"..xOfs.."\n".."yOfs: ".."\n"..yOfs.."\n"..--]]"This section is still a work in progress".."\n".."Type /ltl to lock, /ltu to unlock. type /lt for a reminder of this")

--[[local EditBox = CreateFrame("EditBox", "LockoutTrackerxOfsEditBox", LockoutTrackerPanel, "InputBoxTemplate")
EditBox:SetAutoFocus(false)
EditBox:SetNumeric(true)
EditBox:SetFont("Interface\\AddOns\\LockoutTracker\\Fonts\\FRIZQT__.TTF", 13,"THICKOUTLINE")
EditBox:SetSize(55,55)
EditBox:SetPoint("TOP", -144, -13)
EditBox:SetMaxLetters(5)

EditBox:SetScript("OnEscapePressed", function( self )
	-- Do any cancel stuff here.

	self:ClearFocus()
end )]]


