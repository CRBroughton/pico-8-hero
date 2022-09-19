function boss1(enemy)
    -- movement
    local speed = 2

    if enemy.sx == 0 or enemy.x >= 93 then
        enemy.sx = - speed
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
    local speed = 1.5
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
            enemy.sy = 0
        end
    end
    -- shooting

    if gametime % 15 == 0 then
        aimfire(enemy, speed)
    end
    debug = "boss2"
    move(enemy)
end

function boss3(enemy)
    -- movement
    local speed = 0.5

    if enemy.sx == 0 or enemy.x >= 93 then
        enemy.sx = -speed
    end

    if enemy.x <= 3 then
        enemy.sx = speed
    end
    debug = "boss3"

    -- shooting
    if gametime % 10 == 0 then
        firespread(enemy, 8, 2, time() / 2)
    end

    -- transition
    if enemy.phasebegin + 8 * 30 < gametime then
        enemy.mission = "boss4"
        enemy.subphase = 1
        enemy.sx = 0
        enemy.phasebegin = gametime
    end 
    move(enemy)
end

function boss4(enemy)
    debug = "boss4"

    -- movement
    local speed = 1.5
    if enemy.subphase == 1 then
        enemy.sx = speed
        if enemy.x >= 91 then
            enemy.subphase = 2
        end
    elseif enemy.subphase == 2 then
        enemy.sx = 0
        enemy.sy = speed

        if enemy.y >= 100 then
            enemy.subphase = 3
        end

    elseif enemy.subphase == 3 then
        enemy.sx = -speed
        enemy.sy = 0

        if enemy.x <= 4 then
            enemy.subphase = 4
        end
    elseif enemy.subphase == 4 then
        enemy.sx = 0
        enemy.sy = - speed

        if enemy.y <= 25 then
            -- transition
            enemy.mission = "boss1"
            enemy.phasebegin = gametime
            enemy.sy = 0
        end
    end
    move(enemy)

end

function boss5()

end
