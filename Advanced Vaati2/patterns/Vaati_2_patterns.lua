v2_pattern_address=0x030016BC
v2_pattern_frame=0x030016BE

old_patterns={
	{
		["name"]="slam";
		["pattern"]=0x04;
	};
	{
		["name"]="move";
		["pattern"]=0x01;
	};
	{
		["name"]="down";
		["pattern"]=0x03;
	};
	{
		["name"]="shock";
		["pattern"]=0x05;
	};
	{
		["name"]="shock_target";
		["pattern"]=0x06;
	};
}


function findPattern()
	local frame=mrb(v2_pattern_frame)
	local pattern=mrb(v2_pattern_address)
	local l
	
	for l=1,#old_patterns
	do
		if old_patterns[l]["pattern"]==pattern
		then
			return old_patterns[l]["name"]
		end
	end
end

function v2ShockPattern()
	local t
	local u
	for t=1,10 do
		mwb(v2_pattern_frame,0x11)
		emu.frameadvance()
	end
	for t=1,30 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	for u=1,20 do
		mwb(v2_pattern_frame,0x11)
		emu.frameadvance()
		for t=1,7 do
			mwb(v2_pattern_frame,0x10)
			emu.frameadvance()
		end
	end
	for t=1,40 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	for t=1,10 do
		mwb(v2_pattern_frame,0x11)
		emu.frameadvance()
	end
	for t=1,30 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	for t=1,10 do
		mwb(v2_pattern_frame,0x11)
		emu.frameadvance()
	end
	for t=1,30 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	for t=1,10 do
		mwb(v2_pattern_frame,0x11)
		emu.frameadvance()
	end
	for t=1,30 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	mwb(v2_pattern_frame,0x01)
end


function v2ShockTargetPattern()
	local t
	local u
	mwb(v2_pattern_frame,0x41)
	emu.frameadvance()
	for t=1,29 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	mwb(v2_pattern_frame,0x41)
	emu.frameadvance()
	for t=1,28 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	mwb(v2_pattern_frame,0x41)
	emu.frameadvance()
	for t=1,27 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	mwb(v2_pattern_frame,0x41)
	emu.frameadvance()
	for t=1,25 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	mwb(v2_pattern_frame,0x41)
	emu.frameadvance()
	for t=1,22 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	mwb(v2_pattern_frame,0x41)
	emu.frameadvance()
	for t=1,17 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	mwb(v2_pattern_frame,0x41)
	emu.frameadvance()
	for t=1,49 do
		mwb(v2_pattern_frame,0x10)
		emu.frameadvance()
	end
	for u=1,20 do
		mwb(v2_pattern_frame,0x41)
		emu.frameadvance()
		for t=1,5 do
			mwb(v2_pattern_frame,0x10)
			emu.frameadvance()
		end
	end
	mwb(v2_pattern_frame,0x01)
end

function v2Slam()
	local t
	local u
	for t=1,60 do
		mwb(v2_pattern_frame,0x21)
		emu.frameadvance()
	end
	for u=1,60 do
		mwb(v2_pattern_frame,0x21)
		emu.frameadvance()
		for t=1,3 do
			mwb(v2_pattern_frame,0x10)
			emu.frameadvance()
		end
	end
	for u=1,60 do
		mwb(v2_pattern_frame,0x21)
		emu.frameadvance()
		for t=1,2 do
			mwb(v2_pattern_frame,0x10)
			emu.frameadvance()
		end
	end
	for t=1,30 do
		mwb(v2_pattern_frame,0x20)
		emu.frameadvance()
	end
	for t=1,60 do
		mwb(v2_pattern_frame,0x21)
		emu.frameadvance()
	end
	for t=1,30 do
		mwb(v2_pattern_frame,0x20)
		emu.frameadvance()
	end
	for t=1,60 do
		mwb(v2_pattern_frame,0x21)
		emu.frameadvance()
	end

end

function v2patterns(pattern)

	if pattern=="shock" then
		v2ShockPattern()
	end
	if pattern=="shock_target" then
		v2ShockTargetPattern()
	end
	if pattern=="slam" then
		v2Slam()
	end
	return
end

