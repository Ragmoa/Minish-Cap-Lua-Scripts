substitutes={
	["bottle_locked"]={};
	["item_locked"]={"water","mountain_dew"};
	["mountain_dew"]={"water"}
}
butter={
	["id"]=0x21;
	["name"]="butter";
	["logic"]=substitutes["item_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
milk_full={
	["id"]=0x22;
	["name"]="milk_full";
	["logic"]=substitutes["item_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
milk_half={
	["id"]=0x23;
	["name"]="milk_half";
	["logic"]=substitutes["item_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
red_potion={
	["id"]=0x24;
	["name"]="red_potion";
	["logic"]=substitutes["item_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
blue_potion={
	["id"]=0x25;
	["name"]="blue_potion";
	["logic"]=substitutes["item_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
water={
	["id"]=0x26;
	["name"]="water";
	["logic"]=substitutes["bottle_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
mountain_dew={
	["id"]=0x27;
	["name"]="mountain_dew";
	["logic"]=substitutes["mountain_dew"];
	["placed"]=false;
	["replaced_by"]=nil
}
fairy={
	["id"]=0x28;
	["name"]="fairy";
	["logic"]=substitutes["bottle_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
red_picolyte={
	["id"]=0x29;
	["name"]="red_picolyte";
	["logic"]=substitutes["item_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
orange_picolyte={
	["id"]=0x2A;
	["name"]="orange_picolyte";
	["logic"]=substitutes["item_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
yellow_picolyte={
	["id"]=0x2B;
	["name"]="yellow_picolyte";
	["logic"]=substitutes["item_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
green_picolyte={
	["id"]=0x2C;
	["name"]="green_picolyte";
	["logic"]=substitutes["item_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
blue_picolyte={
	["id"]=0x2D;
	["name"]="blue_picolyte";
	["logic"]=substitutes["item_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
white_picolyte={
	["id"]=0x2E;
	["name"]="white_picolyte";
	["logic"]=substitutes["item_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
nayru_charm={
	["id"]=0x2F;
	["name"]="nayru_charm";
	["logic"]=substitutes["bottle_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
farore_charm={
	["id"]=0x30;
	["name"]="farore_charm";
	["logic"]=substitutes["bottle_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
din_charm={
	["id"]=0x31;
	["name"]="din_charm";
	["logic"]=substitutes["bottle_locked"];
	["placed"]=false;
	["replaced_by"]=nil
}
contents = {
	milk_full;
	water;
	mountain_dew;
	milk_half;
	fairy;
	farore_charm;
	din_charm;
	butter;
	red_potion;
	blue_potion;
	red_picolyte;
	orange_picolyte;
	yellow_picolyte;
	green_picolyte;
	blue_picolyte;
	white_picolyte
}
full_contents ={
	milk_full;
	water;
	mountain_dew;
	milk_half;
	fairy;
	nayru_charm;
	farore_charm;
	din_charm;
	butter;
	red_potion;
	blue_potion;
	red_picolyte;
	orange_picolyte;
	yellow_picolyte;
	green_picolyte;
	blue_picolyte;
	white_picolyte
}
bottle1={
	["adress"]=0x02002AF6;
	["content"]=mrb(0x02002AF6);
	["randomized"]=false
}
bottle2={
	["adress"]=0x02002AF7;
	["content"]=mrb(0x02002AF7);
	["randomized"]=false
}
bottle3={
	["adress"]=0x02002AF8;
	["content"]=mrb(0x02002AF8);
	["randomized"]=false
}
bottle4={
	["adress"]=0x02002AF9;
	["content"]=mrb(0x02002AF9);
	["randomized"]=false
}
bottles={
	bottle1;
	bottle2;
	bottle3;
	bottle4;
}
totalItems=#contents
tradTable={}
charmsFixed=false

function hashSeed()
	local s='0x'
	local start=0x0811DBD5
	local a=0
	for a=0,4
	do
		s=s .. string.format('%x',mrb(start+a))
	end
	return tonumber(s)
	

end

function init()
	local hash=memory.readbyterange(0x0811DBD5,7)

	local seed=hashSeed()
	print('[Randomized Bottles Contents]: Start generating using seed '.. seed)
	math.randomseed(seed)
	-- lua random impentation sucks, if i don't "throw away number" ,the firsts one are alaways the same, no matter the seed...
	for p=0,10
	do
		math.random()
	end
	local placed=1;

	local item_placing
	while placed ~= totalItems+1
	do
		item_placing=contents[placed]
		placeItem(item_placing)
		placed=placed+1
		if placed == 2 -- If you can get full_milk without any item,you may get water or mountain dew by drinking it!
		then
			if contents[2]['replaced_by'] and contents[2]['replaced_by']==contents[1] then
				contents[4]["logic"]=substitutes["bottle_locked"]
			end
			if contents[5]['replaced_by'] and contents[5]['replaced_by']==contents[1] then
				contents[4]["logic"]=substitutes["bottle_locked"]
			end
			if contents[6]['replaced_by'] and contents[6]['replaced_by']==contents[1] then
				contents[4]["logic"]=substitutes["bottle_locked"]
			end
			if contents[7]['replaced_by'] and contents[7]['replaced_by']==contents[1] then
				contents[4]["logic"]=substitutes["bottle_locked"]
			end
		end
		-- print ("Placed items ".. placed-1 .. "/"..totalItems .. "")
		
	end
	
	for l=1,totalItems
	do
		tradTable[contents[l]["id"]]=contents[l]["replaced_by"]["id"]
-- Uncommment this section to get spoiler in Bizhawk's lua console		
		-- if l~=8
		-- then
			-- print (contents[l]["name"] .. " is replaced by " .. contents[l]["replaced_by"]["name"])
		-- else
			-- print (contents[l]["replaced_by"]["name"] .. " doesn't replace anything.")
		-- end
	end
	print("[Randomized Bottles Contents]: Successful Init!")
end

function getRandomContent()
	local rd=math.random(1,#full_contents)
	return full_contents[rd]
end

function placeItem(item)
	--print("---- Placing Item " .. item["name"] .. "----")
	local rd=math.random(1,totalItems)
	while not canReplace(item,contents[rd])
	do 
		rd=math.random(1,totalItems)
	end
		contents[rd]["replaced_by"]=item
		item["placed"]=true
end

function canReplace(item_to_place, item_replaced)
	--print ("Trying to replace " .. item_replaced["name"] .. " with " .. item_to_place["name"])
	if item_replaced["replaced_by"] ~=nil
	then
		--print ("Current item is replaced by ".. item_replaced["replaced_by"]["name"])
		return false
	else 
		for i = 1,#item_replaced["logic"]
		do
		--print("Is this ".. item_replaced["logic"][i] .. " ?")
		if item_replaced["logic"][i] == item_to_place["name"]
		then 
			--print('Not possible!')
			return false
		else
			--print('No!')
			end
		end
		return true
	end
end

function bottleSanity()
	for b=1,#bottles
	do
		new_content=mrb(bottles[b]["adress"])
		if new_content ~= 0x00 then -- only track bottles that the player have
			if new_content == 0x20 and bottles[b]["randomized"]-- empty bottle means we have to randomize it's contents
			then
				bottles[b]["randomized"]=false
			end
			if new_content == 0x23 and bottles[b]["content"] == 0x22 and bottles[b]["randomized"] -- transition from full milk to half milk mean we have to randomize again
			then
			bottles[b]["randomized"]=false
			end
			bottles[b]['content']=new_content
		end
		if not bottles[b]["randomized"] and new_content <0x32 and new_content > 0x20 --ignore Orange/Yellow/Blue picolyte + Naryu's charm and all the stuff that shouldn't be in bottles
		then
			mwb(bottles[b]["adress"],tradTable[new_content])
			bottles[b]["randomized"]=true
		end
	end	
end

function randomBottles()
for b=1,#bottles
	do
		new_content=mrb(bottles[b]["adress"])
		if new_content ~= 0x00 then -- only track bottles that the player have
			if new_content == 0x20 and bottles[b]["content"]==0x00
			then
				mwb(bottles[b]["adress"],getRandomContent()["id"])
				bottles[b]["randomized"]=true
			end
			bottles[b]['content']=new_content
		end
	end	
end

-- make sure that no matter which oracle get a house, the two objects that were randomized to a charm are avilable.
function charmFix()
	local house1=mrb(0x02002CA1)
	if  house1 == 0x10 
	then
		tradTable[0x2F]=tradTable[0x30]
		tradTable[0x30]=tradTable[0x31]
	end
	if house1 == 0x08
	then
		tradTable[0x2F]=tradTable[0x30]
	end
	if house1 == 0x20
	then
		tradTable[0x2F]=tradTable[0x31]
	end
	charmsFixed=true
end