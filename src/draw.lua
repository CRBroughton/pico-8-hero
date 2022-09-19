function draw_game()
    cls(0)
    starfield()
    if ship.lives > 0 then
        --invul state for player
        if ship.invul <= 0 then
            drawsprite(ship)
            spr(ship.flame, ship.x, ship.y + 8)
        else 
            -- Flashes the playes ship if collision
            if sin(gametime / 10) < 0 then
                drawsprite(ship)
                spr(ship.flame, ship.x, ship.y + 8)
            end
        end
    end

    -- Draws floats
    for float in all(floats) do
        local colour = 7
        if gametime % 4 < 2 then
            colour = 8
        end
        cprint(float.text, float.x, float.y, colour)
        float.y -= 0.5
        float.age += 1

        if float.age > 60 then
            del(floats, float)
        end
    end

    -- draw pickups
    for pickup in all(pickups) do
        -- flashes the sprite outline white
        local colour = 7
        if gametime % 4 < 2 then
            colour = 14
        end
        for i = 1, 15 do
            pal(i, colour)
        end
        drawoutline(pickup)
        pal()
        drawsprite(pickup)
    end

    -- draw enemies
    for enemy in all(enemies) do
        if enemy.flash > 0 then
            if gametime % 4 < 2 then
                pal(3, 8)
                pal(11, 14)
            end
            enemy.flash -= 1
            if enemy.boss then
                enemy.sprite = 64
            else
                -- flashes the enemy white
                for i = 1, 15 do
                    pal(i, 7)
                end
            end
        end
        drawsprite(enemy)
        -- resets the enemy colour after flash
        pal()
    end

    -- Draws bullets
    for bullet in all(bullets) do
        drawsprite(bullet)
    end

    if ship.muzzle > 0 then
        circfill(ship.x + 3, ship.y - 2, ship.muzzle, 7)
        circfill(ship.x + 4, ship.y - 2, ship.muzzle, 7)
    end

    -- draw waves
    for wave in all(waves) do
        circ(wave.x, wave.y, wave.r, wave.colour)
        wave.r += wave.speed

        if wave.r > wave.mr then
            del(waves, wave)
        end
    end

    --draw particles
    for particle in all(particles) do
        local particlecolour = 7

        if particle.blue then        
            particlecolour = particle_age_blue(particle.age)
        else
            particlecolour = particle_age_red(particle.age)
        end
        
        -- draws the particles
        if particle.spark then
            pset(particle.x, particle.y, 7)
        else
            circfill(particle.x, particle.y, particle.size, particlecolour)
        end

        particle.x += particle.speedx
        particle.y += particle.speedy
        particle.speedx = particle.speedx * 0.9
        particle.speedy = particle.speedy * 0.9

        particle.age += 1

        if particle.age > particle.maxage then
            particle.size -= 0.5
            if particle.size < 0 then
                del(particles, particle)
            end
        end
    end

    -- drawing enemy bullets
    for bullet in all(enemybullets) do
        drawsprite(bullet)
    end

    -- draws the scoreboard
    print("score: " .. score, 40, 1, 12)

    -- draws the health hearts
    for i = 1, ship.max_lives do
        if ship.lives >= i then
            spr(13, i * 9 - 8, 1)
        else
            spr(14, i * 9 - 8, 1)
        end
    end

    spr(48, 108, 0)
    print(cherries, 118, 1, 14)
end

function draw_start()
    cls(1)
    cprint("my awesome shmup", 64, 40, 12)
    cprint("press either z or x key to start", 64, 80, blink())
end

function draw_over()
    draw_game()
    cprint("game over", 64, 40, 2)
    cprint("press either z or x key", 64, 80, blink())
    cprint("to continue", 64, 90, 7)

end

function draw_wavetext()
    draw_game()
    cprint("wave " .. wave, 64, 40, blink())
end

function draw_win()
    draw_game()
    cprint("congratulations", 64, 40, 2)
    cprint("press either z or x key", 64, 80, blink())
    cprint("to continue", 64, 90, 7)
end