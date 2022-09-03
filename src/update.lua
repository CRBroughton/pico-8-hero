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

    if btnp(5) then
        local bullet = {}
        bullet.x = ship.x
        bullet.y = ship.y - 3

        add(bullets, bullet)

        sfx(0)
        ship.muzzle = 4
    end

    -- Animates the bullet
    for i = #bullets, 1, -1 do
        local bullet = bullets[i]
        bullet.y = bullet.y - 2

        if bullet.y < -8 then
            del(bullets, bullet)
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
        end
    end

    -- Moves the ship
    ship.x = ship.x + ship.hspeed
    ship.y = ship.y + ship.vspeed

    -- Animates the ships flame
    ship.flame = ship.flame + 1
    if ship.flame > 9 then
        ship.flame = 5
    end

    -- Animates the muzzle flash
    if ship.muzzle > 0 then
        ship.muzzle = ship.muzzle - 1
    end

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