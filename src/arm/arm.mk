CONFIG := ../config/build_arm.cfg
include $(CONFIG)

# Include debug symbols during build
ifeq ($(DEBUG),yes)
  CFLAGS     += -g
  ASFLAGS    += -g
endif

OPTS_LIST  := $(shell grep -v "^\#" ../config/kernel.cfg)
OPTS       += $(foreach opt, $(OPTS_LIST), -D$(opt))
CFLAGS     += $(OPTS)

BOOT       := $(patsubst %.s, %.o,          $(wildcard arm/*.s)) \
              $(patsubst %.c, %.o,          $(wildcard arm/*.c))

OBJECTS    += $(BOOT)

OBJDEPS    := $(patsubst %.o, %.d, $(OBJECTS))

.PHONY: clean distclean tags

odyssey: $(OBJECTS)
ifeq (, $(shell which $(LD)))
	$(error $(LD) not found)
endif
	$(LD) $(OBJECTS) -o odyssey $(LDFLAGS)

%.o: %.c
ifeq (, $(shell which $(CC)))
	$(error $(CC) not found)
endif
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.s
ifeq (, $(shell which $(AS)))
	$(error $(AS) not found)
endif
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	-rm -f $(OBJECTS) $(OBJDEPS) odyssey

distclean: clean
	-rm -f tags

-include $(OBJECTS:.o=.d)