function _init()
    -- Clears the screen
    cls(0)
    ship = {
        x = 60,
        y = 60,
        vspeed = 1,
        hspeed = 1,
        sprite = 2,
    }

    bullet = {
        x = -64,
        y = -40,
    }

end

function _draw()
    cls(0)
    spr(ship.sprite, ship.x, ship.y)
    spr(16, bullet.x, bullet.y)
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
    end

    -- Moves the ship
    ship.x = ship.x + ship.hspeed
    ship.y = ship.y + ship.vspeed
    bullet.y = bullet.y - 2

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