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
        if enemy.type == 1 then
            -- green
            enemy.sy = 1.7
            enemy.sx = sin(time / 45)

            -- boost enemy towards the center if
            -- on the edge of the screen
            if enemy.x < 32 then
                enemy.sx += 1 - (enemy.x / 32)
            end
            if enemy.x > 88 then
                enemy.sx -= (enemy.x - 88) /32
            end
        elseif enemy.type == 2 then
            --red
            enemy.sy = 2.5
            enemy.sx = sin(time / 20)

            -- boost enemy towards the center if
            -- on the edge of the screen
            if enemy.x < 32 then
                enemy.sx += 1 - (enemy.x / 32)
            end
            if enemy.x > 88 then
                enemy.sx -= (enemy.x - 88) /32
            end
        elseif enemy.type == 3 then
            -- spinner
            if enemy.sx == 0 then
                --flying down
                enemy.sy = 2
                -- move towards player
                if ship.y <= enemy.y then
                    enemy.sy = 0
                    if ship.x < enemy.x then
                        enemy.sx -= 1
                    else
                        enemy.sx = 1
                    end
                end
            end
        elseif enemy.type == 4 then
            -- yellow
            enemy.sy = 0.35
            if enemy.y > 110 then
                enemy.sy = 1
            end
        end
        move(enemy)
    end
end

function picktimer()
    if mode != "game" then
        return
    end

    if time > nextfire then
        pickfire()
        nextfire = time + 20 + rnd(20)
    end

    -- every 2 seconds
    if time % attackfreq == 0 then
        pickattack()
    end
end

function pickattack()
    local max = min(10, #enemies)
    local index = flr(rnd(max))
    index = #enemies - index

    local enemy = enemies[index]

    if enemy and enemy.mission == "protect" then
        enemy.mission = "attack"
        enemy.animationspeed *= 3
        enemy.wait = 60
        enemy.shake = 60
        fire(enemy)
    end
end

function pickfire()
    local max = min(10, #enemies)
    local index = flr(rnd(max))
    index = #enemies - index

    local enemy = enemies[index]

    if enemy and enemy.mission == "protect" then
        fire(enemy)
    end
end

function move(obj)
    obj.x += obj.sx
    obj.y += obj.sy
end

function killed(enemy)
    del (enemies, enemy)
    sfx(2)
    score += 1
    createparticle(enemy.x + 4, enemy.y + 4)

    if enemy.mission == "attack" then
        -- randomly picks another enemy to attack, enrage
        if rnd() < 0.5 then
            pickattack()
        end
    end
end

function animate(enemy)
    enemy.frame += enemy.animationspeed
    if flr(enemy.frame) > #enemy.animation then
        enemy.frame = 1
    end
    enemy.sprite = enemy.animation[flr(enemy.frame)]
end

