CC = gcc
CFLAGS = -g -Wall -std=c99
LDFLAGS =

# Control the build verbosity
ifeq ("$(VERBOSE)","1")
    Q :=
    VECHO = @true
else
    Q := @
    VECHO = @printf
endif

TARGET = clox
OBJS := main.o chunk.o memory.o debug.o

$(TARGET): $(OBJS)
	$(VECHO) "  LD\t$@\n"
	$(Q)$(CC) $(LDFLAGS) -o $@ $^
%.o: %.c
	$(VECHO) "  CC\t$@\n"
	$(Q)$(CC) -o $@ $(CFLAGS) -c $<

clean:
	-rm -r $(TARGET) $(OBJS)

.PNOHY: clean
