function blink() 
    local blink_animation = {
        5,
        6,
        7,
        6,
        5,
    }
    if blinkt > #blink_animation then
        blinkt = 1
    end
    return blink_animation[blinkt]
end