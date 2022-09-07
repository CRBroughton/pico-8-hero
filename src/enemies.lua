function spawnwave()
    spawnenemy()
end

function nextwave()
    wave += 1

    if wave > 4 then
        mode = "win"
    else
        mode = "wavetext"
        wavetime = 80
    end
end

function spawnenemy(enemytype)
    local enemy = {
        x = rnd(120),
        y = -8,
        flash = 0,
    }

    if enemytype == nil or enemytype == 1 then
        -- green enemy
        enemy.sprite = 21
        enemy.hp = 5
    elseif enemytype == 2 then
        -- red enemy
        enemy.sprite = 148
        enemy.hp = 5
    elseif enemytype == 3 then
        -- spinning enemy
        enemy.sprite = 184
        enemy.hp = 5
    elseif enemytype == 4 then
        -- boss
        enemy.sprite = 208
        enemy.hp = 5
    end

    add(enemies, enemy)
end