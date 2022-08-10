function _init()
    -- Clears the screen
    cls(0)
    ship = {
        lives = 3,
        max_lives = 4,
        x = 60,
        y = 60,
        vspeed = 1,
        hspeed = 1,
        sprite = 2,
        flame = 5,
        muzzle = 0
    }

    score = 30000

    starx = {}
    stary = {}

    for i = 1, 100 do
        add(starx, flr(rnd(128)))
        add(stary, flr(rnd(128)))
    end

    bullet = {
        x = -64,
        y = -40,
    }

end

function _draw()
    cls(0)
    starfield()
    spr(ship.sprite, ship.x, ship.y)
    spr(ship.flame, ship.x, ship.y + 8)
    spr(16, bullet.x, bullet.y)

    if ship.muzzle > 0 then
        circfill(ship.x + 3, ship.y - 2, ship.muzzle, 7)
    end
    print("score: " .. score, 40, 1, 12)
    
    for i = 1, ship.max_lives do
        if ship.lives >= i  then
            spr(13, i * 9 - 8, 1)
        else
            spr(14, i * 9 - 8, 1)
        end
    end
end

function _update()
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
        bullet.y = ship.y - 3
        bullet.x = ship.x
        sfx(0)
        ship.muzzle = 4
    end

    -- Moves the ship
    ship.x = ship.x + ship.hspeed
    ship.y = ship.y + ship.vspeed

    -- Animates the bullet
    bullet.y = bullet.y - 2

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

end

