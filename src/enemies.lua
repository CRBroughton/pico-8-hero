function spawnwave()
    attackfreq = 10
    sfx(28)
    if wave == 1 then
        -- space invaders
        placeenemies({
            { 0, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
            { 0, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
            { 0, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
            { 0, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
        })
    elseif wave == 2 then
        -- red tutorial
        attackfreq = 60
        placeenemies({
            { 1, 1, 2, 2, 1, 1, 2, 2, 1, 1 },
            { 1, 1, 2, 2, 1, 1, 2, 2, 1, 1 },
            { 1, 1, 2, 2, 1, 1, 2, 2, 1, 1 },
            { 1, 1, 2, 2, 2, 2, 2, 2, 1, 1 },
        })
    elseif wave == 3 then
        -- wall of red
        attackfreq = 60
        placeenemies({
            { 1, 1, 2, 2, 1, 1, 2, 2, 1, 1 },
            { 1, 1, 2, 2, 2, 2, 2, 2, 1, 1 },
            { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 },
            { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 },
        })
    elseif wave == 4 then
        -- spin tutorial
        attackfreq = 60
        placeenemies({
            { 3, 3, 0, 1, 1, 1, 1, 0, 3, 3 },
            { 3, 3, 0, 1, 1, 1, 1, 0, 3, 3 },
            { 3, 3, 0, 1, 1, 1, 1, 0, 3, 3 },
            { 3, 3, 0, 1, 1, 1, 1, 0, 3, 3 },
        })
    elseif wave == 5 then
        -- chess
        attackfreq = 60
        placeenemies({
            { 3, 1, 3, 1, 2, 2, 1, 3, 1, 3 },
            { 1, 3, 1, 2, 1, 1, 3, 1, 3, 1 },
            { 3, 1, 3, 1, 2, 2, 1, 3, 1, 3 },
            { 1, 3, 1, 2, 1, 1, 2, 1, 3, 1 }
        })
    elseif wave == 6 then
        -- yellow
        attackfreq = 60
        placeenemies({
            { 1, 1, 1, 0, 4, 0, 0, 1, 1, 1 },
            { 1, 1, 0, 0, 0, 0, 0, 0, 1, 1 },
            { 1, 1, 0, 1, 1, 1, 1, 0, 1, 1 },
            { 1, 1, 0, 1, 1, 1, 1, 0, 1, 1 },
        })
    elseif wave == 7 then
        -- double yellow
        attackfreq = 60
        placeenemies({
            { 3, 3, 0, 1, 1, 1, 1, 0, 3, 3 },
            { 4, 0, 0, 2, 2, 2, 2, 0, 4, 0 },
            { 0, 0, 0, 2, 1, 1, 2, 0, 0, 0 },
            { 1, 1, 0, 1, 1, 1, 1, 0, 1, 1 }
 
        })
    elseif wave == 8 then
        -- hell
        attackfreq = 60
        placeenemies({
            { 0, 0, 1, 1, 1, 1, 1, 1, 0, 0 },
            { 3, 3, 1, 1, 1, 1, 1, 1, 3, 3 },
            { 3, 3, 2, 2, 2, 2, 2, 2, 3, 3 },
            { 3, 3, 2, 2, 2, 2, 2, 2, 3, 3 }
 
        })
    elseif wave == 9 then
        -- boss
        attackfreq = 60
        placeenemies({
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 4, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
        })  
    end 
end

function placeenemies(level)
    for y = 1, 4 do
        local lineofenemies = level[y]
        for x = 1, 10 do
            if lineofenemies[x] != 0 then
                spawnenemy(lineofenemies[x], x * 12 - 6, 4 + y * 12, x * 3)
            end
        end
    end
end

function nextwave()
    wave += 1

    if wave > lastwave then
        mode = "win"
        lockout = gametime + 30
        music(4)
    else
        if wave == 1 then
            music(0)
        else 
            music(3)
        end
        mode = "wavetext"
        wavetime = 80
    end
end

function spawnenemy(enemytype, enemyx, enemyy, enemywait)
    local enemy = makesprite()
    enemy.x = enemyx * 1.25 - 16
    enemy.y = enemyy - 66

    enemy.posx = enemyx
    enemy.posy = enemyy
    
    enemy.type = enemytype

    enemy.wait = enemywait

    enemy.animationspeed = 0.4
    enemy.mission = "flyin"

    if enemytype == nil or enemytype == 1 then
        -- green enemy
        enemy.sprite = 21
        enemy.hp = 3
        enemy.animation = {21, 22, 23, 24}
    elseif enemytype == 2 then
        -- red enemy
        enemy.sprite = 148
        enemy.hp = 2
        enemy.animation = {148, 149}
    elseif enemytype == 3 then
        -- spinning enemy
        enemy.sprite = 184
        enemy.hp = 4
        enemy.animation = {184, 185, 186, 187}
    elseif enemytype == 4 then
        -- yellow
        enemy.sprite = 208
        enemy.hp = 20
        enemy.animation = {208, 210}
        enemy.width = 2
        enemy.height = 2
        enemy.collisionwidth = 16
        enemy.collisionheight = 16
    end

    add(enemies, enemy)
end