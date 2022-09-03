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
    mode = "game"

    bullet = {
        x = -64,
        y = -40,
    }

end

function _draw()
    if mode == "game" then
        draw_game()
    elseif mode == "start" then
        -- start screen
    end
end

function _update()
    if mode == "game" then
        update_game()
    elseif mode == "start" then
        -- start screen
    end
end

