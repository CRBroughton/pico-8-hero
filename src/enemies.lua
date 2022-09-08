function spawnwave()
    if wave == 1 then
        spawnenemy(1)
    elseif wave == 2 then
        spawnenemy(2)
    elseif wave == 3 then
        spawnenemy(3)
    elseif wave == 4 then
        spawnenemy(4)
    end
end

function nextwave()
    wave += 1

    if wave > 4 then
        mode = "win"
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

function spawnenemy(enemytype)
    local enemy = {
        x = rnd(120),
        y = -8,
        flash = 0,
        frame = 1,
        width = 1,
        height = 1
    }

    if enemytype == nil or enemytype == 1 then
        -- green enemy
        enemy.sprite = 21
        enemy.hp = 5
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
    end

    add(enemies, enemy)
end