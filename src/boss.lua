function boss1()
    if boss.phasebegin + 8 * 30 < gametime then
        boss.mission = "boss2"
        boss.phasebegin = gametime
    end 
end

function boss2()
    if boss.phasebegin + 8 * 30 < gametime then
        boss.mission = "boss3"
        boss.phasebegin = gametime
    end 
end

function boss3()
    if boss.phasebegin + 8 * 30 < gametime then
        boss.mission = "boss4"
        boss.phasebegin = gametime
    end 
end

function boss4()
    if boss.phasebegin + 8 * 30 < gametime then
        boss.mission = "boss1"
        boss.phasebegin = gametime
    end 
end

function boss5()

end
