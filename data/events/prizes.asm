PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	db ABRA
IF DEF(_RED)
	db CLEFAIRY
	db NIDORINA
ENDC
IF DEF(_GREEN)
	db CLEFAIRY
	db NIDORINO
ENDC
IF DEF(_BLUE)
	db PIKACHU
	db HORSEA
ENDC
	db "@"

PrizeMenuMon1Cost:
IF DEF(_RED)
	coins 180
	coins 500
	coins 1200
ENDC
IF DEF(_GREEN)
	coins 120
	coins 750
	coins 1200
ENDC
IF DEF(_BLUE)
	coins 150
	coins 620
	coins 1000
ENDC
	db "@"

PrizeMenuMon2Entries:
IF DEF(_RED)
	db DRATINI
	db SCYTHER
ENDC
IF DEF(_GREEN)
	db PINSIR
	db DRATINI
ENDC
IF DEF(_BLUE)
	db CLEFABLE
	db DRAGONAIR
ENDC
	db PORYGON
	db "@"

PrizeMenuMon2Cost:
IF DEF(_RED)
	coins 2800
	coins 5500
	coins 9999
ENDC
IF DEF(_BLUE)
	coins 2500
	coins 4600
	coins 6500
ENDC
IF DEF(_GREEN)
	coins 2880
	coins 5400
	coins 8300
ENDC
	db "@"

PrizeMenuTMsEntries:
	db TM_DRAGON_RAGE
	db TM_HYPER_BEAM
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	coins 3300
	coins 5500
	coins 7700
	db "@"
