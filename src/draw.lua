function draw_game()
    cls(0)
    starfield()
    --invul state for player
    if ship.invul <= 0 then
        drawsprite(ship)
        spr(ship.flame, ship.x, ship.y + 8)
    else 
        -- Flashes the playes ship if collision
        if sin(time / 10) < 0 then
            drawsprite(ship)
            spr(ship.flame, ship.x, ship.y + 8)
        end
    end

    -- draw enemies
    for enemy in all(enemies) do
        if enemy.flash > 0 then
            enemy.flash -= 1
            -- flashes the enemy white
            for i = 1, 15 do
                pal(i, 7)
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
    end
    print("score: " .. score, 40, 1, 12)

    for i = 1, ship.max_lives do
        if ship.lives >= i then
            spr(13, i * 9 - 8, 1)
        else
            spr(14, i * 9 - 8, 1)
        end
    end
end

function draw_start()
    cls(1)
    print("my awesome shmup", 32, 40, 12)
    print("press either z or x key to start", 0, 80, blink())
end

function draw_over()
    cls(8)
    print("game over", 50, 40, 2)
    print("press either z or x key", 20, 80, blink())
    print("to continue", 45, 90, 7)

end