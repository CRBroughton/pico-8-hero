function draw_game()
    cls(0)
    starfield()
    spr(ship.sprite, ship.x, ship.y)
    spr(ship.flame, ship.x, ship.y + 8)

    -- draw enemies
    for i = 1, #enemies do
        local enemy = enemies[i]
        spr(enemy.sprite, enemy.x, enemy.y)
    end

    -- Draws bullets
    for i = 1, #bullets do
        local bullet = bullets[i]
        spr(16, bullet.x, bullet.y)
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