function drawsprite(sprite)
    spr(sprite.sprite, sprite.x, sprite.y)
end

function iscolliding(spritea, spriteb)
    local a_left = spritea.x
    local a_top = spritea.y
    local a_right = spritea.x + 7
    local a_bottom = spritea.y + 7

    local b_left = spriteb.x
    local b_top = spriteb.y
    local b_right = spriteb.x + 7
    local b_bottom = spriteb.y + 7

    if a_top > b_bottom then return false end
    if b_top > a_bottom then return false end
    if a_left > b_right then return false end
    if b_left > a_right then return false end

    return true
end

function spawnenemy()
    local enemy = {
        x = rnd(120),
        y = -8,
        sprite = 21,
        hp = 5,
        flash = 0
    }

    add(enemies, enemy)
end

function createparticle(posx, posy)
    local particle = {
        x = posx,
        y = posy,
        speedx = 0,
        speedy = 0,
        age = 0,
        maxage = 0,
        size = 8,
    }
    add(particles, particle)

    for i = 1, 30 do
        local particle = {
            x = posx,
            y = posy,
            speedx = (rnd() - 0.5) * 6,
            speedy = (rnd() - 0.5) * 6,
            age = rnd(2),
            maxage = 10 + rnd(10),
            size = 1 + rnd(4),
        }
        add(particles, particle)
    end
end