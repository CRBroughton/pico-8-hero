function draw_game()
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
    print("press any key to start", 20, 80, 7)
end