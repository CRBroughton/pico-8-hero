function fire(enemy, angle, speed)
    local bullet = makesprite()
    bullet.x = enemy.x + 3
    bullet.y = enemy.y + 6

    if enemy.type == 4 then
        bullet.x = enemy.x + 7
        bullet.y = enemy.y + 13
    end

    bullet.sprite = 32
    bullet.animation = {32, 33, 34, 33}
    bullet.animationspeed = 0.5
    bullet.sy = cos(angle) * speed
    bullet.sx = sin(angle) * speed
    bullet.collisionwidth = 2
    bullet.collisionheight = 2
    bullet.bulletmode = true
    enemy.flash = 4
    add(enemybullets, bullet)
    sfx(29)
end

function firespread(enemy, number, speed, base)
    if base == nil then
        base = 0
    end
    for i = 1, number do
        fire(enemy, 1 / number * i + base, speed)
    end
end
