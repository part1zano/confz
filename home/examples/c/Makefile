all: libmylib.so main

main: main.c libmylib.so
	$(CC) $(CFLAGS) -L. -lmylib -lm main.c -o main

libmylib.so: mylib.c
	$(CC) -fPIC -shared -Wl,-soname,libmylib.so -o libmylib.so mylib.c

clean:
	rm -f main libmylib.so
