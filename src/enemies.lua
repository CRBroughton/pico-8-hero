function spawnwave()
    if wave == 1 then
        -- spawnenemy(1)
        placeenemies()
    elseif wave == 2 then
        -- spawnenemy(2)
    elseif wave == 3 then
        -- spawnenemy(3)
    elseif wave == 4 then
        -- spawnenemy(4)
    end
end

function placeenemies()
    for y = 1, 4 do
        for x = 1, 10 do
            spawnenemy(1, x * 12 - 6, 4 + y * 12)
        end
    end
end

function nextwave()
    wave += 1

    if wave > 4 then
        mode = "win"
        lockout = time + 30
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

function spawnenemy(enemytype, enemyx, enemyy)
    local enemy = makesprite()
    enemy.x = enemyx
    enemy.y = enemyy

    if enemytype == nil or enemytype == 1 then
        -- green enemy
        enemy.sprite = 21
        enemy.hp = 3
        enemy.animation = {21, 22, 23, 24}
    elseif enemytype == 2 then
        -- red enemy
        enemy.sprite = 148
        enemy.hp = 5
        enemy.animation = {148, 149}
    elseif enemytype == 3 then
        -- spinning enemy
        enemy.sprite = 184
        enemy.hp = 5
        enemy.animation = {184, 185, 186, 187}
    elseif enemytype == 4 then
        -- boss
        enemy.sprite = 208
        enemy.hp = 5
        enemy.animation = {208, 210}
        enemy.width = 2
        enemy.height = 2
        enemy.collisionwidth = 16
        enemy.collisionheight = 16
    end

    add(enemies, enemy)
end