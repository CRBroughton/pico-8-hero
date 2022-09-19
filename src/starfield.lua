-- Draws the starfield to the screen
function starfield()
    for star in all(stars) do
        local starcolour = 6

        if star.speed < 1.5 then
            starcolour = 13
        elseif star.speed < 1 then
            starcolour = 1
        end
            pset(star.x, star.y, starcolour)
    end
end

function animatestars(speed)
    if speed == nil then
        speed = 1
    end

    for star in all(stars) do
        star.y += star.speed * speed
        if star.y > 128 then
            star.y = star.y - 128
        end
    end
end