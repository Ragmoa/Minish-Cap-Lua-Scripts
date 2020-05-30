

mrb=memory.readbyte
mwb=memory.writebyte

dofile("patterns/Vaati_2_patterns.lua")
local current_pattern=nil
local last_timer=mrb(v2_pattern_frame)
local pattern_phase=1
local last_pattern
while true do
	if mrb(0x03000BF4)==0x8C and mrb(0x03000BF5)==0x00 
	then
		dofile("patterns/Vaati_2_patterns.lua")
		local current_timer=mrb(v2_pattern_frame)
		if current_timer~= last_timer-1 and current_timer~=last_timer
		then
			last_pattern=current_pattern
			current_pattern=findPattern()
			if last_pattern and last_pattern==current_pattern and current_pattern~="move" then
				pattern_phase= pattern_phase + 1
			end
			if last_pattern~=current_pattern then
				pattern_phase=1
			end
			if current_pattern~="move" and current_pattern~='down' and pattern_phase==2 then
				v2patterns(current_pattern)
			end
		end
		last_timer=current_timer
	end
	emu.frameadvance()
end