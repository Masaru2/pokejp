roms := \
pokered.gbc \
pokeblue.gbc \
pokegreen.gbc

# Create debug roms if `make` is run with `DEBUG=1`
ifeq ($(DEBUG),1)
roms += \
pokered_debug.gbc \
pokeblue_debug.gbc \
pokegreen_debug.gbc
endif


rom_obj := \
audio.o \
home.o \
main.o \
maps.o \
text.o \
wram.o \
gfx/pics.o \
gfx/sprites.o \
gfx/tilesets.o

pokered_obj        := $(rom_obj:.o=_red.o)
pokeblue_obj       := $(rom_obj:.o=_blue.o)
pokegreen_obj 	   := $(rom_obj:.o=_green.o)

ifeq ($(DEBUG),1)
pokered_debug_obj  := $(rom_obj:.o=_red_debug.o)
pokeblue_debug_obj := $(rom_obj:.o=_blue_debug.o)
pokegreen_debug_obj := $(rom_obj:.o=_green_debug.o)
endif


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:
.PHONY: all red blue green clean tidy compare tools

all: $(roms)
red:        pokered.gbc
blue:       pokeblue.gbc
green: 		pokegreen.gbc

ifeq ($(DEBUG),1)
red_debug:	 pokered_debug.gbc
blue_debug:  pokeblue_debug.gbc
green_debug: pokegreen_debug.gbc
endif

clean: tidy
	find gfx \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' \) -delete

tidy:
ifeq ($(DEBUG),1)
	rm -f $(roms) $(pokered_obj) $(pokeblue_obj) $(pokegreen_obj) $(pokeblue_debug_obj) $(pokered_debug_obj) $(pokegreen_debug_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
else
	rm -f $(roms) $(pokered_obj) $(pokeblue_obj) $(pokegreen_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
endif
	$(MAKE) clean -C tools/

compare: $(roms)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -h -L -Weverything
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(pokered_obj):        RGBASMFLAGS += -D _RED
$(pokeblue_obj):       RGBASMFLAGS += -D _BLUE
$(pokegreen_obj): 	   RGBASMFLAGS += -D _GREEN
$(pokered_debug_obj):  RGBASMFLAGS += -D _RED -D _DEBUG
$(pokeblue_debug_obj): RGBASMFLAGS += -D _BLUE -D _DEBUG
$(pokegreen_debug_obj): RGBASMFLAGS += -D _GREEN -D _DEBUG

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# Dependencies for objects (drop _red and _blue from asm file basenames)
$(foreach obj, $(pokered_obj), $(eval $(call DEP,$(obj),$(obj:_red.o=.asm))))
$(foreach obj, $(pokeblue_obj), $(eval $(call DEP,$(obj),$(obj:_blue.o=.asm))))
$(foreach obj, $(pokegreen_obj), $(eval $(call DEP,$(obj),$(obj:_green.o=.asm))))
ifeq ($(DEBUG),1)
$(foreach obj, $(pokered_debug_obj), $(eval $(call DEP,$(obj),$(obj:_red_debug.o=.asm))))
$(foreach obj, $(pokeblue_debug_obj), $(eval $(call DEP,$(obj),$(obj:_blue_debug.o=.asm))))
$(foreach obj, $(pokegreen_debug_obj), $(eval $(call DEP,$(obj),$(obj:_green_debug.o=.asm))))
endif
endif


%.asm: ;


pokered_pad        = 0x00
pokeblue_pad       = 0x00
pokegreen_pad 	   = 0x00
ifeq ($(DEBUG),1)
pokered_debug_pad  = 0xff
pokeblue_debug_pad = 0xff
pokegreen_debug_pad = 0xff
endif

pokered_opt        = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON RED"
pokeblue_opt       = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
pokegreen_opt 	   = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON GREEN"
ifeq ($(DEBUG),1)
pokered_debug_opt  = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON RED"
pokeblue_debug_opt = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
pokegreen_debug_opt = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON GREEN"
endif


%.gbc: $$(%_obj) layout.link
	$(RGBLINK) -p $($*_pad) -d -m $*.map -n $*.sym -l layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) -p $($*_pad) $($*_opt) $@


### Misc file-specific graphics rules

gfx/battle/attack_anim_1.2bpp: tools/gfx += --trim-whitespace
gfx/battle/attack_anim_2.2bpp: tools/gfx += --trim-whitespace

gfx/intro/blue_jigglypuff_1.2bpp: rgbgfx += -h
gfx/intro/blue_jigglypuff_2.2bpp: rgbgfx += -h
gfx/intro/blue_jigglypuff_3.2bpp: rgbgfx += -h
gfx/intro/red_nidorino_1.2bpp: rgbgfx += -h
gfx/intro/red_nidorino_2.2bpp: rgbgfx += -h
gfx/intro/red_nidorino_3.2bpp: rgbgfx += -h
gfx/intro/gengar.2bpp: rgbgfx += -h
gfx/intro/gengar.2bpp: tools/gfx += --remove-duplicates --preserve=0x19,0x76

gfx/credits/the_end.2bpp: tools/gfx += --interleave --png=$<

gfx/slots/red_slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/blue_slots_1.2bpp: tools/gfx += --trim-whitespace

gfx/tilesets/%.2bpp: tools/gfx += --trim-whitespace
gfx/tilesets/reds_house.2bpp: tools/gfx += --preserve=0x48

gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates


### Catch-all graphics rules

%.png: ;

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.pic: %.2bpp
	tools/pkmncompress $< $@
