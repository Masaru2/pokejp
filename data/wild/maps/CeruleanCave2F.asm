DungeonMons2:
	db 15 ; grass encounter rate
	db 51, DODRIO
	db 51, VENOMOTH
	db 51, KADABRA
	db 52, RHYDON
IF DEF(_BLUE)
	db 52, RATICATE
ELSE
	db 52, MAROWAK
ENDC
	db 52, ELECTRODE
	db 56, CHANSEY
	db 54, WIGGLYTUFF
	db 55, DITTO
	db 60, DITTO

	db 0 ; water encounter rate
