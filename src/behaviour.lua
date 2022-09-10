function performenemymission(enemy)
    if enemy.mission == "flyin" then
        -- fly into the scene
        enemy.y += 1
        if enemy.y  >= enemy.posy then
            enemy.mission = "protect"
        end
    elseif enemy.mission == "protect" then
        -- stay up
    elseif enemy.mission == "attack" then
        -- attack the player
    end
end