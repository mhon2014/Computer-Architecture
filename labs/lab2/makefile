lab2a: lab2a.o
	ld -o lab2a lab2a.o
lab2a.o: lab2a.s
	as -o lab2a.o lab2a.s

lab2b: lab2b.o
	ld -o lab2b lab2b.o
lab2b.o: lab2b.s
	as -o lab2b.o lab2b.s

lab2c: lab2c.o
	ld -o lab2c lab2c.o
lab2c.o: lab2c.s
	as -o lab2c.o lab2c.s

debug: 
	as -g -o lab2a.o lab2a.s
	ld -o as lab2a lab2a.o
	gdb lab2a

clean:
	rm *.o lab2a lab2b lab2c