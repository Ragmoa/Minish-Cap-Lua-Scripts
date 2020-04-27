mrb = memory.readbyte
mwb = memory.writebyte


local ab = mrb(0x02002AF4)
local bb = mrb(0x02002AF5)
local hN = mrb(0x02002AEA)
local timer = 0
local timerlimit= 300 -- In frames (60/s)

while true do
local hC = mrb(0x02002AEA)
	ab = mrb(0x02002AF4)
	bb = mrb(0x02002AF5)
	if hC < hN then
		ai=ab
		mwb(0x02002AF4,bb)
		mwb(0x02002AF5,ai)
	end
	if mrb (0x03001004) ~= 0x07 then
		timer = timer+1
		if (timer >= timerlimit)
		then
			ai = ab
			mwb(0x02002AF4,bb)
			mwb(0x02002AF5,ai)
			timer = 0
		end
	end
	hN=hC
	emu.frameadvance()
end