SRCS = tlog.c
HDRS = tlog.h
OBJS = $(SRCS:.c=.o)

all : $(OBJS)
	ar rc ../$(LIBNAME) $(OBJS)
	
%.o: %.c %.h
	$(CC) $(CFLAGS) -c $< -o $@
	
install:
	mkdir -p $(PREFIX)/include/tlog
	install -m 644 $(HDRS) $(PREFIX)/include/tlog/
	
clean:
	rm -f *.o *.a