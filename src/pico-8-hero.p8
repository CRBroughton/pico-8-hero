pico-8 cartridge // http://www.pico-8.com
version 37
__lua__
#include main.lua
#include starfield.lua
#include update.lua
#include draw.lua
#include blink.lua
#include utils.lua
__gfx__
00000000000550000005500000055000000000000000000000000000000000000000000000000000000000000000000000000000088008800880088000000000
000000000018810000188100001881000000000000077000000770000007700000c77c0000077000000000000000000000000000888888888008800800000000
007007000018810000188100001881000000000000c77c000007700000c77c000cccccc000c77c00000000000000000000000000888888888000000800000000
0007700001888e1001e88e1001e888100000000000cccc00000cc00000cccc0000cccc0000cccc00000000000000000000000000888888888000000800000000
00077000017c88505e87c8e505887c1000000000000cc000000cc000000cc00000000000000cc000000000000000000000000000088888800800008000000000
007007000111885058811885058811100000000000000000000cc000000000000000000000000000000000000000000000000000008888000080080000000000
00000000011185101151151101581110000000000000000000000000000000000000000000000000000000000000000000000000000880000008800000000000
00000000005a5500005aa5000055a500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000330033003300330033003300330033000000000000000000000000000000000000000000000000000000000
00099000000000000000000000000000000000003bb33bb33bb33bb33bb33bb33bb33bb300000000000000000000000000000000000000000000000000000000
009aa900000000000000000000000000000000003bbbbbb33bbbbbb33bbbbbb33bbbbbb300000000000000000000000000000000000000000000000000000000
09a77a90000000000000000000000000000000000b7717b30b7717b30b7717b30b7717b300000000000000000000000000000000000000000000000000000000
09a77a90000000000000000000000000000000000071170000711700007117000071170000000000000000000000000000000000000000000000000000000000
009aa900000000000000000000000000000000000037730000377300003773000037730000000000000000000000000000000000000000000000000000000000
00099000000000000000000000000000000000000303303003033030030330300303303000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000300003030000003030000300330033000000000000000000000000000000000000000000000000000000000
__sfx__
0001000035020310202d0202902026020220201e0201b02018020140200d020080200300000000070000600004000020000100000000000000100000000010000000000000000000000000000000000000000000
000100002d65026650216501e6501c6501965017650156501465012650106500e6500d6500b6500a6500865006650056500365003650016500060006600000000560004600036000260001600006000000000000
000100002d6500d6502b5501f6200e620055200462003620036200262002610016500160001600006000160000600006000065000600006500160000650006000060000650006000060000600006000060000600
