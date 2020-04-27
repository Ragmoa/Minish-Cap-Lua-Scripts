# HYRULE DRIFT
## By Straylite and Rylux

### Description

This script will produce two effects:
- You will recieve increased knockback from ennemies or when taking damage
- Knockback direction might not be the one you expect, and will change during knockback.

*(Good luck with Gyorg.)*

### Notes

- You can edit the knockback duration using the **kbt** variable. Max is 0x7F(127). (It's actually a signed number, but the game will count upwards properly if you set a negative value.)
- You can edit the number of times you'll change direction during your knockback using the **kbd** variable. (Please set it to a value > 0, otherwise the script/Bizhawk might crash.)
