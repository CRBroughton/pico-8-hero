function _init()
    -- Clears the screen
    cls(0)
    -- state machine for game mode
    mode = "start"
    startscreen()
    blinkt = 1
    time = 0

end

function _draw()
    if mode == "game" then
        draw_game()
    elseif mode == "start" then
        draw_start()
    elseif mode == "wavetext" then
        draw_wavetext()
    elseif mode == "over" then
        draw_over()
    elseif mode == "win" then
        draw_win()
    end
end

function _update()
    time += 1
    blinkt += 1
    if mode == "game" then
        update_game()
    elseif mode == "start" then
        update_start()
    elseif mode == "wavetext" then
        update_wavetext()
    elseif mode == "over" then
        update_over()
    elseif mode == "win" then
        update_win()
    end
end

function startscreen()
    mode = "start"
    music(7)
end

function startgame() 
    music(0)
    time = 0
    wave = 0
    nextwave()
    ship = {
        lives = 4,
        invul = 0,
        max_lives = 4,
        x = 60,
        y = 60,
        vspeed = 1,
        hspeed = 1,
        sprite = 2,
        flame = 5,
        muzzle = 0,
        width = 1,
        height = 1,
    }

    score = 0

    stars = {}

    -- Add stars into the stars arrays
    for i = 1, 100 do
        local newstar = {}
        newstar.x = flr(rnd(128))
        newstar.y = flr(rnd(128))
        newstar.speed =  rnd(1.5) + 0.5
        add(stars, newstar)
    end

    bullettime = 0
    bullets = {}

    enemies = {}

    explosions = {}

    particles = {}

    waves = {}

end