# RETROLIBS += $(COMPPATH)/targets/$(TARGET)/lib/xxxx.rel 
VARIANTFLAGS += --no-std-crt0 --code-loc 0x4010 --data-loc 0xC000
HEX2BINFLAGS += -l 8000
