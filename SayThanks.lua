local spells = {
    [20484] = true,        -- Rebirth
    [61999] = true,        -- Raise Ally
    [20707] = true,        -- Soulstone
    [50769] = true,        -- Revive
    [2006] = true,        -- Resurrection
    [7328] = true,        -- Redemption
    [2008] = true,        -- Ancestral Spirit
    [115178] = true,    -- Resuscitate
    [29166] = true,        -- Innervate
    [203538] = true,     -- Blessing of Kings
    [203539] = true,    -- Blessing of Wisdom
    [102342] = true,     -- Ironbark
    [116849] = true,     -- Life Cocoon
    [1022] = true,         -- Blessing of Protection
    [633] = true,         -- Lay on Hands
    [47788] = true,     -- Guardian Spirit
    [33206] = true,     -- Pain Suppression
    [1459] = true,      -- Arcane Intellect
    [21562] = true,     -- Power Word: Fortitude
}
-- text template for SayThanks action
ST_THANKS = "Thanks for "

local frame = CreateFrame("Frame")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:SetScript("OnEvent", function()
        local _, subEvent, _, _, buffer, _, _, _, player, _, _, spell = CombatLogGetCurrentEventInfo()
        for key, value in pairs(spells) do
            if spell == key and value == true and player == UnitName("player") and buffer ~= UnitName("player") and subEvent == "SPELL_CAST_SUCCESS" then
                -- to choose action uncomment one of strings below an comment two others
                DoEmote("HUG", buffer)
                -- DoEmote("SPIT", buffer)
                -- SendChatMessage(ST_THANKS..GetSpellLink(spell).." "..buffer:gsub("%-[^|]+", ""), "WHISPER", nil, buffer)
            end
        end
end)

