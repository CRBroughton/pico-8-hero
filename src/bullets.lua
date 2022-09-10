function fire(enemy)
    local bullet = makesprite()
    bullet.x = enemy.x + 3
    bullet.y = enemy.y + 6
    bullet.sprite = 32
    bullet.animation = {32, 33, 34, 33}
    bullet.animationspeed = 0.5
    bullet.sy = 2
    bullet.collisionwidth = 2
    bullet.collisionheight = 2
    bullet.bulletmode = true
    enemy.flash = 4
    add(enemybullets, bullet)
    sfx(29)
end

