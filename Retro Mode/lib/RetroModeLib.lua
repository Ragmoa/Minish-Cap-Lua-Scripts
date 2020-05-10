require("../config")
arrow_adress=   0x02002AED
bomb_adress=    0x02002AEC
quiver_adress=  0x02002AEF
bomb_bag_adress=0x02002AEE
rupees_adress=  0x02002B00
wallet_adress=  0x02002AE8

wallets={
	100;
	300;
	500;
	999;
}
function disableArrowAndBombCount()
	mwb(0x0200AF13,0x00)
	mwb(0x0200AF14,0x00)
end

function updateArrow()
	if (mr16(rupees_adress)>=getArrowPrice())
	then
		mwb(arrow_adress,0x01)
	else
		mwb(arrow_adress,0x00)
	end
end

function updateBomb()
	if (mr16(rupees_adress)>=getBombPrice())
	then
		mwb(bomb_adress,0x01)
	else
		mwb(bomb_adress,0x00)
	end
end

function getArrowPrice()
	size=tonumber(mrb(quiver_adress),16)
	return(arrow_price[size+1])-- need to add one to size bc lua arrays strarts at 1...
end

function getBombPrice()
	size=tonumber(mrb(bomb_bag_adress),16)
	if size == 0 then
		return 0
	end
	return(bomb_price[size])-- wierd but bomb bags actually range from 1 to 4... while quivers are from 0 to 3...
end
