local time = 0

function Initialize()
    time = tonumber(SKIN:GetVariable('Time')) or 0
    SKIN:Bang('!SetOption MeterCounter Text "Time: ' .. time .. '"')
end

function Update()
    time = time + 1
    return time
end

function SaveValue()
    SKIN:Bang('!WriteKeyValue', 'Variables', 'Time', time, '#@#Variables.inc')
end