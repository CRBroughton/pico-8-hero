function boss1(enemy)
    -- movement
    local speed = 2

    if enemy.sx == 0 or enemy.x >= 93 then
        enemy.sx -= speed
    end

    if enemy.x <= 3 then
        enemy.sx = speed
    end
    -- shooting
    -- gaps
    if gametime % 30 > 3 then
        if gametime % 3 == 0 then 
            fire(enemy, 0, 2)
        end
    end
    

    -- transition
    debug = "boss1"
    if enemy.phasebegin + 8 * 30 < gametime then
        enemy.mission = "boss2"
        enemy.phasebegin = gametime
        enemy.subphase = 1
    end
    move(enemy)
end

function boss2(enemy)
    -- movement
    local speed = 2
    if enemy.subphase == 1 then
        enemy.sx =- speed
        if enemy.x <= 4 then
            enemy.subphase = 2
        end
    elseif enemy.subphase == 2 then
        enemy.sx = 0
        enemy.sy = speed

        if enemy.y >= 100 then
            enemy.subphase = 3
        end

    elseif enemy.subphase == 3 then
        enemy.sx = speed
        enemy.sy = 0

        if enemy.x >= 91 then
            enemy.subphase = 4
        end
    elseif enemy.subphase == 4 then
        enemy.sx = 0
        enemy.sy = - speed

        if enemy.y <= 25 then
            -- transition
            enemy.mission = "boss3"
            enemy.phasebegin = gametime
        end
    end
    -- shooting
    debug = "boss2"
    move(enemy)
end

function boss3(enemy)
    debug = "boss3"

    if enemy.phasebegin + 8 * 30 < gametime then
        enemy.mission = "boss4"
        enemy.phasebegin = gametime
    end 
    -- move(enemy)

end

function boss4(enemy)
    debug = "boss4"

    if enemy.phasebegin + 8 * 30 < gametime then
        enemy.mission = "boss1"
        enemy.phasebegin = gametime
    end 
    move(enemy)

end

function boss5()

end
