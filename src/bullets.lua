function fire(enemy, angle, speed)
    local bullet = makesprite()
    bullet.x = enemy.x + 3
    bullet.y = enemy.y + 6

    if enemy.type == 4 then
        bullet.x = enemy.x + 7
        bullet.y = enemy.y + 13
    elseif enemy.boss then
        bullet.x = enemy.x + 15
        bullet.y = enemy.y + 23
    end

    bullet.sprite = 32
    bullet.animation = {32, 33, 34, 33}
    bullet.animationspeed = 0.5
    bullet.sy = cos(angle) * speed
    bullet.sx = sin(angle) * speed
    bullet.collisionwidth = 2
    bullet.collisionheight = 2
    bullet.bulletmode = true

    if enemy.boss != true then
        enemy.flash = 4
        sfx(29)
    else
        sfx(34)
    end

    add(enemybullets, bullet)
    return bullet
end

function firespread(enemy, number, speed, base)
    if base == nil then
        base = 0
    end
    for i = 1, number do
        fire(enemy, 1 / number * i + base, speed)
    end
end

function aimfire(enemy, speed)
    local bullet = fire(enemy, 0, speed)
    local angle = atan2((ship.y + 4)  - bullet.y, (ship.x + 4) - bullet.x)

    bullet.sy = cos(angle) * speed
    bullet.sx = sin(angle) * speed
end

function cherrybomb()
    local spacing = 0.25 / (cherries * 2)
    for i = 1, cherries * 2 do
        local angle = 0.375 + spacing * i
        local bullet = makesprite()
        bullet.x = ship.x
        bullet.y = ship.y - 3
        bullet.sprite = 17
        bullet.dmg = 3
        bullet.sy = cos(angle) * 4
        bullet.sx = sin(angle) * 4

        add(bullets, bullet)
    end
    big_wave(ship.x + 3, ship.y + 3)
    shake = 5
    muzzle = 5
    flash = 3
    ship.invul = 60
    sfx(33)
end