function update_game()
    ship.hspeed = 0
    ship.vspeed = 0
    ship.sprite = 2

    -- Controls
    if btn(0) then
        ship.hspeed = -2
        ship.sprite = 1
    end

    if btn(1) then
         ship.hspeed = 2
         ship.sprite = 3
    end

    if btn(3) then
         ship.vspeed = 2
    end

    if btn(2) then
         ship.vspeed = -2
    end

    if btn(5) then
        if bullettime <= 0 then
            local bullet = makesprite()
            bullet.x = ship.x + 1
            bullet.y = ship.y - 3
            bullet.sprite = 16
            bullet.collisionwidth = 6
            bullet.sy = -4

            add(bullets, bullet)

            sfx(0)
            ship.muzzle = 5
            bullettime = 5
        end
    end
    bullettime -= 1

    -- Animates the bullets
    for bullet in all(bullets) do
        move(bullet)

        if bullet.y < -8 then
            del(bullets, bullet)
        end
    end

    -- Animates the enemy bullets
    for bullet in all(enemybullets) do
        move(bullet)
        animate(bullet)
        if bullet.y > 128 or bullet.x < -8 or bullet.x > 128 or bullet.y < -8 then
            del(enemybullets, bullet)
        end
    end

    -- Animates the pickups
    for pickup in all(pickups) do
        move(pickup)
        if pickup.y > 128 then
            del(pickups, pickup)
        end
    end

    -- bullet collision
    for enemy in all(enemies) do
        for bullet in all(bullets) do
            if iscolliding(enemy, bullet) then
                del (bullets, bullet)
                small_wave(bullet.x + 4, bullet.y + 4)
                small_spark(enemy.x + 4, enemy.y + 4)
                enemy.hp -= 1
                sfx(3)
                enemy.flash = 2
                if enemy.hp <= 0 then
                    killed(enemy)

                end
            end
        end
    end

    -- Animates the enemies
    for enemy in all(enemies) do
        -- enemy mission
        performenemymission(enemy)
        -- Iterates over the animation array
        animate(enemy)
        -- enemy cleanup
        if enemy.mission != "flyin" then
            if enemy.y > 128 or enemy.x < -8 or enemy.x > 128 then
                del(enemies, enemy)
            end
        end
    end

    -- Moves the ship
    ship.x += ship.hspeed
    ship.y += ship.vspeed

    -- Edge of screen checking
    if ship.x > 120 then
        ship.x = 0
    end

    if ship.x < 0 then
        ship.x = 120
    end

    if ship.y < 0 then
        ship.y = 0
    end

    if ship.y > 120 then
        ship.y = 120
    end

    -- checks if an enemy is colliding with player
    if ship.invul <= 0 then
        for enemy in all(enemies) do
            if iscolliding(enemy, ship) then
                createparticle(ship.x + 4, ship.y + 4, true)
                ship.lives -= 1
                shake = 12
                sfx(1)
                ship.invul = 30
            end
        end
    else 
        ship.invul -= 1
    end

    -- checks if an bullet is colliding with player
    if ship.invul <= 0 then
        for bullet in all(enemybullets) do
            if iscolliding(bullet, ship) then
                createparticle(ship.x + 4, ship.y + 4, true)
                ship.lives -= 1
                shake = 12
                sfx(1)
                ship.invul = 30
            end
        end
    end

    -- Collision for the pickups
    for pickup in all(pickups) do
        if iscolliding(pickup, ship) then
            del(pickups, pickup)
            cherries += 1
        end
    end

    -- checks if the player is out of lives
    if ship.lives <= 0 then
        mode = "over"
        -- stops the player from spamming fire button if dead
        lockout = gametime + 30
        music(6)
        return
    end

    -- picking enemy to attack player
    picktimer()

    -- Animates the ships flame
    ship.flame = ship.flame + 1
    if ship.flame > 9 then
        ship.flame = 5
    end

    -- Animates the muzzle flash
    if ship.muzzle > 0 then
        ship.muzzle -= 1
    end

    animatestars()

    -- checks for wave finished
    if mode == "game" and #enemies == 0 then
        nextwave()
    end
end

function update_start()
    if btn(4) == false and btn(5) == false then
        buttonreleased = true
    end
    if buttonreleased then
        if btnp(4) or btnp(5) then
            startgame()
            buttonreleased = false
        end
    end

    if btnp(4) or btnp(5) then
        startgame()
    end
end

function update_over() 
    -- stops the player from spamming fire button if dead
    if gametime < lockout then
        return
    end
    if btn(4) == false and btn(5) == false then
        buttonreleased = true
    end
    if buttonreleased then
        if btnp(4) or btnp(5) then
            startscreen()
            buttonreleased = false
        end
    end
end

function update_win()
    -- stops the player from spamming fire button if dead
    if gametime < lockout then
        return
    end
    if btn(4) == false and btn(5) == false then
        buttonreleased = true
    end
    if buttonreleased then
        if btnp(4) or btnp(5) then
            startscreen()
            buttonreleased = false
        end
    end
end

function update_wavetext()
    update_game()
    wavetime -= 1

    if wavetime <= 0 then
        mode = "game"
        spawnwave()
    end
end