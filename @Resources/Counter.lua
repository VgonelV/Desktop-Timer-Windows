local time = 0
local levelRequirement = 3600
local level = 0

function Initialize()
    time = tonumber(SKIN:GetVariable('Time')) or 0
    levelRequirement = tonumber(SKIN:GetVariable('LevelRequirement')) or 3600
    level = tonumber(SKIN:GetVariable('Level')) or 0
    SKIN:Bang('!SetOption MeterCounter Text "' .. time .. '\n/\n' .. levelRequirement .. '"')
    SKIN:Bang('!SetOption MeterLevel Text "' .. level .. '" "Personal\\Level"')
end

function Update()
    time = time + 1
    if time >= levelRequirement then
        time = 0
        level = level + 1
        levelRequirement = math.floor((math.sqrt(level) + level * 0.5) * 3600)
        SKIN:Bang('!SetOption MeterLevel Text "' .. level .. '" "Personal\\Level"')
        SKIN:Bang('!UpdateMeter MeterLevel "Personal\\Level"')
        SKIN:Bang('!Redraw "Personal\\Level"')
    end
    return time .. '\n/\n' .. levelRequirement
end

function SaveValue()
    SKIN:Bang('!WriteKeyValue', 'Variables', 'Time', time, '#@#Variables.inc')
    SKIN:Bang('!WriteKeyValue', 'Variables', 'LevelRequirement', levelRequirement, '#@#Variables.inc')
    SKIN:Bang('!WriteKeyValue', 'Variables', 'Level', level, '#@#Variables.inc')
end