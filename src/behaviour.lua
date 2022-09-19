function performenemymission(enemy)
    if enemy.wait > 0 then
        enemy.wait -= 1
        return
    end
    if enemy.mission == "flyin" then
        -- fly into the scene

        local directionx = (enemy.posx - enemy.x) / 7
        local directiony = (enemy.posy - enemy.y) / 7

        if enemy.boss then
            directiony = min(directiony, 1)
        end
        enemy.x += directionx
        enemy.y += directiony

        if abs(enemy.y - enemy.posy) < 0.7 then
            enemy.y = enemy.posy
            enemy.x = enemy.posx

            if enemy.boss then
                enemy.mission = "boss1"
            else
                enemy.mission = "protect"
            end
        end
    elseif enemy.mission == "protect" then
        -- stay up

    elseif enemy.mission == "boss1" then
        -- boss mission 1
    elseif enemy.mission == "boss2" then
        -- boss mission 2
    elseif enemy.mission == "boss3" then
        -- boss mission 3
    elseif enemy.mission == "boss4" then
        -- boss mission 4
    elseif enemy.mission == "attack" then
        -- attack the player
        if enemy.type == 1 then
            -- green
            enemy.sy = 1.7
            enemy.sx = sin(gametime / 45)

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
            enemy.sx = sin(gametime / 20)

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
            else 
                if gametime % 25 == 0 then
                    firespread(enemy, 8, 1, rnd())
                end
            end
        end
        move(enemy)
    end
end

function picktimer()
    if mode != "game" then
        return
    end

    if gametime > nextfire then
        pickfire()
        nextfire = gametime + 20 + rnd(20)
    end

    -- every 2 seconds
    if gametime % attackfreq == 0 then
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
    end
end

function pickfire()
    local max = min(10, #enemies)
    local index = flr(rnd(max))

    for enemy in all(enemies) do
        if enemy.type == 4 and enemy.mission == "protect" then
            if rnd() < 0.5 then
                firespread(enemy, 12, 1.3, rnd())
                return
            end
        end
    end

    index = #enemies - index

    local enemy = enemies[index]

    if enemy and enemy.mission == "protect" then
        if enemy.type == 4 then
            firespread(enemy, 12, 1.3, rnd())
        elseif enemy.type == 2 then
            aimfire(enemy, 2)
        else
            fire(enemy, 0, 2)
        end
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
    local cherrychance = 0.1
    createparticle(enemy.x + 4, enemy.y + 4)

    if enemy.mission == "attack" then
        -- randomly picks another enemy to attack, enrage
        if rnd() < 0.5 then
            pickattack()
        end
        cherrychance = 0.2
        popfloat("100", enemy.x + 4, enemy.y + 4)
    end
    if rnd() < 0.1 then
        droppickup(enemy.x, enemy.y)
    end
end

function droppickup(pickx, picky)
    local pickup = makesprite()
    pickup.x = pickx
    pickup.y = picky
    pickup.sy = 0.75
    pickup.sprite = 48
    add(pickups, pickup)
end

function pickuplogic(pickup)
    cherries += 1
    small_wave(pickup.x + 4, pickup.y + 4, 14)

    if cherries >= 10 then
        if ship.lives < 4 then
            ship.lives += 1
            sfx(31)
            cherries = 0
            popfloat("1up!", pickup.x + 4, pickup.y + 4)
        else
            score += 10
            cherries = 0
        end
    else
        sfx(30)
    end
end

function animate(enemy)
    enemy.frame += enemy.animationspeed
    if flr(enemy.frame) > #enemy.animation then
        enemy.frame = 1
    end
    enemy.sprite = enemy.animation[flr(enemy.frame)]
end

