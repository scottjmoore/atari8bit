helloworld.prg:	helloworld.asm
	vasm6502_oldstyle helloworld.asm -chklabels -nocase -L helloworld.lst -Fbin -o helloworld.bin

clean:
	-@rm -f *.bin
	-@rm -f *.lst

run-retroarch:
	make
	retroarch -D -L /usr/lib64/libretro/atari800_libretro.so ./helloworld.bin

clean-run-retroarch:
	make clean
	retroarch -D -L /usr/lib64/libretro/atari800_libretro.so ./helloworld.bin