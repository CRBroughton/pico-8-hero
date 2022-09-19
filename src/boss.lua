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

    -- shooting
    if gametime % 12 == 0 then
        if enemy.subphase == 1 then
            fire(enemy, 0, 2)
        elseif enemy.subphase == 2 then
            fire(enemy, 0.25, 2)
        elseif enemy.subphase == 3 then
            fire(enemy, 0.5, 2)
        elseif enemy.subphase == 4 then
            fire(enemy, 0.75, 2)
        end
    end

    move(enemy)

end

function boss5(enemy)
    enemy.shake = 10
    enemy.flash = 10

    if gametime % 8 == 0 then
        createparticle(enemy.x + rnd(32), enemy.y + rnd(24))
        sfx(2)
        shake = 2
    end
    if enemy.phasebegin + 3 * 30 < gametime then
        if gametime % 4 == 2 then
            createparticle(enemy.x + rnd(32), enemy.y + rnd(24))
            sfx(2)
            shake = 2
        end
    end
    -- transition
    if enemy.phasebegin + 6 * 30 < gametime then
        score += 100
        popfloat(makescore(100), enemy.x + 16, enemy.y + 6)
        createbigparticle(enemy.x + 16, enemy.y + 12)
        shake = 15
        enemies = {}
        sfx(35)
    end
end
