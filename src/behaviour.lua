function performenemymission(enemy)
    if enemy.wait > 0 then
        enemy.wait -= 1
        return
    end
    if enemy.mission == "flyin" then
        -- fly into the scene
        enemy.y += (enemy.posy - enemy.y) / 7
        if enemy.y  >= enemy.posy then
            enemy.mission = "protect"
        end
    elseif enemy.mission == "protect" then
        -- stay up
    elseif enemy.mission == "attack" then
        -- attack the player
    end
end