CC = arm-linux-gcc
STRIP = arm-linux-strip
EXEC = hello
SRC = hello.c

all:	$(EXEC)

$(EXEC): $(OBJS)
	$(CC) -o $(EXEC) $(SRC)
	$(STRIP) $(EXEC)

clean:
	rm -f $(EXEC)