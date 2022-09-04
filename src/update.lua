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
            local bullet = {
                x = ship.x,
                y = ship.y - 3,
                sprite = 16,
            }

            add(bullets, bullet)

            sfx(0)
            ship.muzzle = 6
            bullettime = 5
        end
    end
    bullettime -= 1

    -- Animates the bullet
    for bullet in all(bullets) do
        bullet.y -= 2

        if bullet.y < -8 then
            del(bullets, bullet)
        end
    end

    -- bullet collision
    for enemy in all(enemies) do
        for bullet in all(bullets) do
            if iscolliding(enemy, bullet) then
                del (bullets, bullet)
                small_wave(bullet.x + 4, bullet.y + 4)
                enemy.hp -= 1
                sfx(3)
                enemy.flash = 2
                if enemy.hp <= 0 then
                    del (enemies, enemy)
                    sfx(2)
                    score += 1
                    spawnenemy()
                    createparticle(enemy.x + 4, enemy.y + 4)
                end
            end
        end
    end

    -- Animates the enemies
    for enemy in all(enemies) do
        enemy.y += 1
        enemy.sprite += 0.5
        if enemy.sprite >= 25 then
            enemy.sprite = 21
        end

        if enemy.y > 128 then
            del(enemies, enemy)
            spawnenemy()
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
                sfx(1)
                ship.invul = 30
            end
        end
    else 
        ship.invul -= 1
    end

    -- checks if the player is out of lives
    if ship.lives <= 0 then
        mode = "over"
        return
    end

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
end

function update_start()
    if btnp(4) or btnp(5) then
        startgame()
    end
end

function update_over() 
    if btnp(4) or btnp(5) then
        mode = "start"
    end
end