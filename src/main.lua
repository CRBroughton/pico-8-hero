function _init()
    -- Clears the screen
    cls(0)
    -- state machine for game mode
    mode = "start"
    startscreen()
    blinkt = 1
    gametime = 0
    shake = 0
end

function _draw()
    shakescreen()
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
    gametime += 1
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
    gametime = 0
    lockout = 0
    wave = 1
    nextwave()
    ship = makesprite()
    ship.lives = 4
    ship.invul = 0
    ship.max_lives = 4
    ship.x = 60
    ship.y = 60
    ship.vspeed = 1
    ship.hspeed = 1
    ship.sprite = 2
    ship.flame = 5
    ship.muzzle = 0

    score = 0

    attackfreq = 60
    nextfire = 0

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
    enemybullets = {}

    enemies = {}

    explosions = {}

    particles = {}

    waves = {}

end