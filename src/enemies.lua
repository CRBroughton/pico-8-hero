function spawnwave()
    spawnenemy()
end

function nextwave()
    wave += 1

    if wave > 4 then
        mode = "win"
    else
        mode = "wavetext"
        wavetime = 80
    end
end