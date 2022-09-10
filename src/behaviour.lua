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
        -- enemy.y += 10
        -- stay up
    elseif enemy.mission == "attack" then
        -- attack the player
    end
end