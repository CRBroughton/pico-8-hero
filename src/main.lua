function _init()
    -- Clears the screen
    cls(0)
    -- state machine for game mode
    mode = "start"
    blinkt = 1

end

function _draw()
    if mode == "game" then
        draw_game()
    elseif mode == "start" then
        draw_start()
    elseif mode == "over" then
        draw_over()
    end
end

function _update()
    blinkt += 1
    if mode == "game" then
        update_game()
    elseif mode == "start" then
        update_start()
    elseif mode == "over" then
        update_over()
    end
end

function startgame() 
    mode = "game"
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

    bullet = {
        x = -64,
        y = -40,
    }

    score = 30000

    stars = {}

    -- Add stars into the stars arrays
    for i = 1, 100 do
        local newstar = {}
        newstar.x = flr(rnd(128))
        newstar.y = flr(rnd(128))
        newstar.speed =  rnd(1.5) + 0.5
        add(stars, newstar)
    end

    bullets = {}

    enemies = {}

    local enemy = {}
    enemy.x = 60
    enemy.y = 5
    enemy.sprite = 21
    add(enemies, enemy)
end