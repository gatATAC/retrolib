# RETROLIBS += $(COMPPATH)/targets/$(TARGET)/lib/conio.rel 
# El target se crea por concatenación de un header con el binario de la aplicación
TARGETTOOL = cat
TARGETARG1 = $(COMPPATH)/targets/rom/util/rom_header.bin
TARGETARG2 = >
# Rellenar con ceros para la memoria del cartucho
HEX2BINFLAGS += -p 00 
# Que SDCC utilice el ubicador de registros antiguo (si no no funciona 03_holaROM)
CFLAGS += --oldralloc
