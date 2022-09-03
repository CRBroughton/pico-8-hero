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
    starspeed = {}

    -- Add stars into the empty arrays
    for i = 1, 100 do
        add(starx, flr(rnd(128)))
        add(stary, flr(rnd(128)))
        add(starspeed, rnd(1.5) + 0.5)
    end

    -- state machine for game mode
    mode="game"

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
    update_game()
end

