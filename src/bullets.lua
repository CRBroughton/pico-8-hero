function fire(enemy)
    local bullet = makesprite()
    bullet.x = enemy.x
    bullet.y = enemy.y
    bullet.sprite = 32
    bullet.animation = {32, 33, 34, 33}
    bullet.animationspeed = 0.5
    bullet.sy = 1
    bullet.collisionwidth = 2
    bullet.collisionheight = 2
    add(enemybullets, bullet)
end