function drawsprite(sprite)
    local spritex = sprite.x
    local spritey = sprite.y
    if sprite.shake > 0 then
        sprite.shake -= 1
        if time % 4 < 2 then
            spritex += 1
        end
    end
    if sprite.bulletmode then
        spritex -= 2
        spritey -= 2
    end
    spr(sprite.sprite, spritex, spritey, sprite.width, sprite.height)
end

function iscolliding(spritea, spriteb)
    local a_left = spritea.x
    local a_top = spritea.y
    local a_right = spritea.x + spritea.collisionwidth - 1
    local a_bottom = spritea.y + spritea.collisionheight - 1

    local b_left = spriteb.x
    local b_top = spriteb.y
    local b_right = spriteb.x + spriteb.collisionwidth - 1
    local b_bottom = spriteb.y + spriteb.collisionheight - 1

    if a_top > b_bottom then return false end
    if b_top > a_bottom then return false end
    if a_left > b_right then return false end
    if b_left > a_right then return false end

    return true
end

function createparticle(posx, posy, isblue)
    -- central white particle
    local particle = {
        x = posx,
        y = posy,
        speedx = 0,
        speedy = 0,
        age = 0,
        maxage = 0,
        size = 10,
        blue = isblue
    }
    add(particles, particle)

    -- procedural particles around center
    for i = 1, 30 do
        local particle = {
            x = posx,
            y = posy,
            speedx = (rnd() - 0.5) * 6,
            speedy = (rnd() - 0.5) * 6,
            age = rnd(2),
            maxage = 10 + rnd(10),
            size = 1 + rnd(4),
            blue = isblue
        }
        add(particles, particle)
    end

    -- sparks
    for i = 1, 20 do
        local spark = {
            x = posx,
            y = posy,
            speedx = (rnd() - 0.5) * 10,
            speedy = (rnd() - 0.5) * 10,
            age = rnd(2),
            maxage = 10 + rnd(10),
            size = 1 + rnd(4),
            blue = isblue,
            spark = true
        }
        add(particles, spark)
    end

    -- creates the big wave around explosion
    big_wave(posx, posy)

end

function particle_age_red(age)
    local particlecolour = 7
    if age > 5 then
        particlecolour = 10
    end

    if age > 7 then
        particlecolour = 9
    end

    if age > 10 then
        particlecolour = 8
    end

    if age > 12 then
        particlecolour = 2
    end

    if age > 15 then
        particlecolour = 5
    end
    return particlecolour
end

function particle_age_blue(age)
    local particlecolour = 7
    if age > 5 then
        particlecolour = 6
    end

    if age > 7 then
        particlecolour = 12
    end

    if age > 10 then
        particlecolour = 13
    end

    if age > 12 then
        particlecolour = 1
    end

    if age > 15 then
        particlecolour = 1
    end
    return particlecolour
end

function small_wave(wavex, wavey)
    local wave = {
        x = wavex,
        y = wavey,
        r = 3,
        mr = 6,
        colour = 9,
        speed = 1
    }

    add(waves, wave)
end

function big_wave(wavex, wavey)
    local wave = {
        x = wavex,
        y = wavey,
        r = 3,
        mr = 25,
        colour = 7,
        speed = 3.5
    }

    add(waves, wave)
end

function small_spark(sparkx, sparky)
    -- sparks when hit
    local spark = {
        x = sparkx,
        y = sparky,
        speedx = (rnd() - 0.5) * 8,
        speedy = (rnd() - 1) * 3,
        age = rnd(2),
        maxage = 10 + rnd(10),
        size = 1 + rnd(4),
        blue = isblue,
        spark = true
    }
    add(particles, spark)
end

function makesprite()
    local sprite = {
        x = 0,
        y = 0,
        sx = 0,
        sy = 0,
        flash = 0,
        shake = 0,
        frame = 1,
        width = 1,
        height = 1,
        sprite = 0,
        collisionwidth = 8,
        collisionheight = 8
    }
    return sprite
end