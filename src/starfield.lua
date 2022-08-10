-- Draws the starfield to the screen
function starfield()
    for i = 1, #starx do
        pset(starx[i], stary[i], 7)
    end
end

function animatestars()
    for i = 1, #stary do -- # - shortcut to length
        local sy = stary[i] -- local scope variable

        sy = sy + starspeed[i]

        if sy > 128 then
            sy = sy - 128
        end
        stary[i] = sy -- sets global variable value to local
    end
end