
# Main file to compile (with (relative) path)
MAIN := $(SRCPATH)/$(MAINNAME).c

## COMPILER SETTINGS ###################################################

CPUPATH := $(LIBPATH)/cpus/$(CPU)
COMPPATH := $(LIBPATH)/computers/$(COMPSYSTEM)

# we also have to look into the Particle tree to find our sources
vpath %.c ..:$(COMPPATH)
vpath %.mk ..:$(COMPPATH)
vpath %

# special dependencies for all source files
SPECIAL_DEPEND := Makefile
# All sources should be dependent from the Makefile to propagate all
# board and compile flag changes. Only remove this if you know what
# you are doing!

CC := sdcc
HEX2BINTOOL=hex2bin
GPLIB := gplib
SDCC_INC := /usr/share/sdcc

# Include paths
INCLUDE = -I ..
INCLUDE+= -I $(COMPPATH)/system/include -I $(COMPPATH)/targets/$(TARGET)/include -I $(COMPPATH)/versions/$(COMPVERSION)/include -I $(CPUPATH)/include
INCLUDE+= -I $(SDCC_INC)/include 

# lib paths
RETROLIBS = 
HEX2BINFLAGS = 

## FLAGS ##############################################################

CPPFLAGS = -D_MSX_CROSS_COMPILER
CFLAGS = -m$(CPU) 
VARIANTFLAGS = 

## INCLUDES MK FILES ################

include $(COMPPATH)/targets/$(TARGET)/$(TARGET).mk
include $(COMPPATH)/targets/$(TARGET)/variants/$(VARIANT)/$(VARIANT).mk


## RULES ###############################################################

# rule to build the main program

# rule to build the main program
../dist/$(MAINNAME).$(TARGET): $(MAINNAME).bin
	$(TARGETTOOL) $(TARGETARG1) $(MAINNAME).bin $(TARGETARG2) $(MAINNAME).$(TARGET)
	mv $(MAINNAME).$(TARGET) ../dist

$(MAINNAME).bin: $(MAINNAME).ihx
	$(HEX2BINTOOL) $(HEX2BINFLAGS) $<

$(MAINNAME).ihx: $(MAIN) $(MY_SRC:.c=.rel)
	$(CC) $(CPPFLAGS) $(CFLAGS) $(VARIANTFLAGS)  $(RETROLIBS) $(INCLUDE) $(notdir $(MY_SRC:.c=.rel)) -o $(notdir $(MAIN:.c=.ihx)) $<

%.rel: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $<

# rule to tidy up the build directory
clean:
	-find . -name '*.asm' -o -name '*.ihx' -o -name '*.lk' -o -name '*.lst' -o -name '*.map' -o -name '*.noi' -o -name '*.rel' -o -name '*.sym' -o -name '*.com' -o -name '*.bin' -o -name '*.lnk' | xargs rm
