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