require("lib/memories")
require("lib/RetroModeLib")
assert(require("config"),"You have an error in your config! Please make sure each line of a table except the last one ends with a ';'")

mr16 = memory.read_u16_le
local last_arrow=mrb(arrow_adress)
local last_bomb=mrb(bomb_adress)
while true do
	disableArrowAndBombCount()
	rupees=mr16(rupees_adress)
	wallet=mrb(wallet_adress)
	wallet_size=wallets[wallet+1]
	local ap=getArrowPrice()
	local bp=getBombPrice()
	if (mrb(arrow_adress)<last_arrow and rupees >= ap)
	then
		mw16(rupees_adress,rupees-ap)
	end
	if (mrb(bomb_adress)<last_bomb and rupees >= bp )
	then
		mw16(rupees_adress,rupees-bp)
	end
	if (arrow_pack > 0 and mrb(arrow_adress) == last_arrow+5 )
	then
		rupees= rupees + arrow_pack
		if rupees > wallet_size then
			rupees=wallet_size
		end
		mw16(rupees_adress,rupees)
	end
	if (bomb_pack > 0 and mrb(bomb_adress) == last_bomb+5 )
	then
		rupees= rupees+ bomb_pack
		if rupees > wallet_size then
			rupees=wallet_size
		end
		mw16(rupees_adress,rupees)
	end
	updateArrow()
	updateBomb()
	last_arrow=mrb(arrow_adress)
	last_bomb=mrb(bomb_adress)
	emu.frameadvance()
end