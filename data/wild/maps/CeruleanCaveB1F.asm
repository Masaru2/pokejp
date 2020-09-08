DungeonMonsB1:
	db 25 ; grass encounter rate
	db 55, RHYDON
	db 55, MAROWAK
	db 55, ELECTRODE
IF DEF(_BLUE)
	db 64, CLEFAIRY
ELSE
	db 64, CHANSEY
ENDC
	db 64, PARASECT
	db 64, RAICHU
IF DEF(_RED)
	db 57, ARBOK
ELSE
	db 57, SANDSLASH
ENDC
	db 65, DITTO
	db 63, DITTO
	db 67, DITTO

	db 0 ; water encounter rate
