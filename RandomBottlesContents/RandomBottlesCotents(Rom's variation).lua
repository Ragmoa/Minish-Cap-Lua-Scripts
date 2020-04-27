-- TODO: 
--      - add nayru's charm
require("content/memories")
require("content/RandomBottlesLibrari")


init()
while true do
	if not charmsFixed and mrb(0x02002CA1)~=0x00
	then
		charmFix()
	end
	updateRomsBottles()
	emu.frameadvance()
end