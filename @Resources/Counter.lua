local time
local levelRequirement
local level
local rgb

function Initialize()
    time = tonumber(SKIN:GetVariable('Time')) or 0
    levelRequirement = tonumber(SKIN:GetVariable('LevelRequirement')) or 3600
    level = tonumber(SKIN:GetVariable('Level')) or 0
    rgb = tonumber(SKIN:GetVariable('RGB')) or "144,238,144"
    SKIN:Bang('!SetOption MeterCounter Text "' .. time .. '\n/\n' .. levelRequirement .. '"')
    SKIN:Bang('!SetOption MeterLevel Text "' .. level .. '" "Personal\\Level"')
end

function Update()
    -- Updates time required to get to the next level
    time = time + 1
    -- Updates to the next level
    if time >= levelRequirement then
        time = 0
        level = level + 1
        levelRequirement = math.floor((math.sqrt(level) + level * 0.5) * 3600)
        if level < 5 then
            rgb = "144,238,144"
        elseif level < 10 then
            rgb = "122, 202, 122"
        elseif level < 15 then
            rgb = "156, 212, 128"
        elseif level < 20 then
            rgb = "133, 180, 108"
        elseif level < 25 then
            rgb = "168, 186, 112"
        elseif level < 30 then
            rgb = "143, 158, 95"
        elseif level < 35 then
            rgb = "180, 160, 96"
        elseif level < 40 then
            rgb = "153, 136, 82"
        elseif level < 45 then
            rgb = "192, 134, 80"
        elseif level < 50 then
            rgb = "163, 114, 68"
        elseif level < 55 then
            rgb = "204, 108, 64"
        elseif level < 60 then
            rgb = "173, 92, 54"
        elseif level < 65 then
            rgb = "216, 82, 48"
        elseif level < 70 then
            rgb = "183, 69, 41"
        elseif level < 75 then
            rgb = "228, 56, 32"
        elseif level < 80 then
            rgb = "194, 47, 27"
        elseif level < 85 then
            rgb = "240, 30, 16"
        elseif level < 90 then
            rgb = "204, 26, 13"
        elseif level < 95 then
            rgb = "252, 4, 0"
        elseif level < 100 then
            rgb = "214, 3, 0"
        elseif level >= 100 then
            rgb = "180, 3, 0"
        end
        -- Update rgb variable in Variables.inc here to prevent overwriting rgb with basic color on stoping timer
        SKIN:Bang('!WriteKeyValue', 'Variables', 'RGB', rgb, '#@#Variables.inc')
        -- Updates and refreshes Level.ini for changes to be visible
        SKIN:Bang('!SetVariable RGB "'.. rgb ..'" "Personal\\Level"')
        SKIN:Bang('!SetOption MeterLevel Text "' .. level .. '" "Personal\\Level"')
        SKIN:Bang('!Update "Personal\\Level"')
        SKIN:Bang('!Redraw "Personal\\Level"')
    end
    return time .. '\n/\n' .. levelRequirement
end

-- Saves variables to Variables.inc
function SaveValue()
    SKIN:Bang('!WriteKeyValue', 'Variables', 'Time', time, '#@#Variables.inc')
    SKIN:Bang('!WriteKeyValue', 'Variables', 'LevelRequirement', levelRequirement, '#@#Variables.inc')
    SKIN:Bang('!WriteKeyValue', 'Variables', 'Level', level, '#@#Variables.inc')
end