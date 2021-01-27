TARGET 		= farmerboi64
CODEFILES = main.c graphic.c stage00.c
CODESEGMENT = codesegment.o

include $(ROOT)/usr/include/make/PRdefs

SYMBOL   = $(TARGET).out
ROM      = $(TARGET).n64

N64KITDIR = c:/nintendo/n64kit
NUSYSDIR  = $(N64KITDIR)/nusys
NUSYSINC  = $(NUSYSDIR)/include
NUSYSLIB  = $(NUSYSDIR)/lib
NUOBJ     = $(NUSYSLIB)/nusys.o

CODEOBJECTS	= $(CODEFILES:.c=.o) $(NUOBJ)
OBJECTS 		= $(CODESEGMENT)

default: $(ROM)
$(ROM) :  $(OBJECTS)

DEBUGSYM	= -g
OPTIMIZER	= -O0

CUSTFLAGS	= 
# Custom flags for us to use later

LCINCS	= -I$(NUSYSINC)
LCOPTS	= -G 0 $(DEBUGSYM) $(CUSTFLAGS)
LDFLAGS	= -L$(ROOT)/usr/lib -L$(ROOT)/usr/lib/PR -L$(NUSYSLIB) -lnusys_d -lgultra_d -L$(GCCDIR)/mipse/lib -lkmc
# Include a bunch of N64 related files and flags for the linker

    $(LD) -o $(CODESEGMENT) -r $(CODEOBJECTS) $(LDFLAGS)

$(CREATEROM) :  $(OBJECTS)
    	$(MAKEROM) spec -I$(NUSYSINC) -r $(ROM) -e $(SYMBOL)
			makemask $(TARGETS)
 
include $(ROOT)/usr/include/make/commonrules
