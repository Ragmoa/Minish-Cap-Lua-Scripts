mrb = memory.readbyte
mwb = memory.writebyte

local kbt = 0x30
local kbd = 3
local hN = mrb(0x02002AEA)
local x = 0
local timer = 0

while true do
local hC = mrb(0x02002AEA)
local rd = math.random(0,0x1F)
	timer = timer + 1

	if hC ~= hN then
		if hC < hN then memory.writebyte(0x030011A2, kbt) end
		hN = hC
	end

    if timer > kbt/kbd then  x = rd timer = 0  end

    mwb(0x0300119E, x)

emu.frameadvance()
end