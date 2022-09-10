function performenemymission(enemy)
    if enemy.wait > 0 then
        enemy.wait -= 1
        return
    end
    if enemy.mission == "flyin" then
        -- fly into the scene
        enemy.x += (enemy.posx - enemy.x) / 7
        enemy.y += (enemy.posy - enemy.y) / 7

        if abs(enemy.y - enemy.posy) < 0.7 then
            enemy.y = enemy.posy
            enemy.mission = "protect"
        end
    elseif enemy.mission == "protect" then
        -- stay up
    elseif enemy.mission == "attack" then
        -- attack the player
        enemy.y += 1.7
    end
end

function pickenemy()
    if mode != "game" then
        return
    end

    -- every 2 seconds
    if time % 60 == 0 then
        local enemy = rnd(enemies)

        if enemy.mission == "protect" then
            enemy.mission = "attack"
        end
    end
end