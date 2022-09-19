function boss1(enemy)
    debug = "boss1"
    if enemy.phasebegin + 8 * 30 < gametime then
        enemy.mission = "boss2"
        enemy.phasebegin = gametime
    end 
end

function boss2(enemy)
    debug = "boss2"

    if enemy.phasebegin + 8 * 30 < gametime then
        enemy.mission = "boss3"
        enemy.phasebegin = gametime
    end 
end

function boss3(enemy)
    debug = "boss3"

    if enemy.phasebegin + 8 * 30 < gametime then
        enemy.mission = "boss4"
        enemy.phasebegin = gametime
    end 
end

function boss4(enemy)
    debug = "boss4"

    if enemy.phasebegin + 8 * 30 < gametime then
        enemy.mission = "boss1"
        enemy.phasebegin = gametime
    end 
end

function boss5()

end
