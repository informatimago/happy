#FORTRAN=f77
FORTRAN=gfortran

all: happy which

happy:happy-c happy-f happy-sh happy-csh
	@  printf '(C)            '
	-@ ./happy-c || true
	@  printf '(FORTRAN)      '
	-@ ./happy-f
	@  printf '(Bourne Shell) '
	-@ sh ./happy-sh
	@  printf '(C Shell)      '
	-@ csh ./happy-csh

happy-c:happy.source Makefile
	@ cp happy.source happy-c.c
	@ $(CC) --no-warning -o happy-c happy-c.c

happy-f:happy.source Makefile
	@ cp happy.source happy-f.f
	@ $(FORTRAN) -o happy-f  happy-f.f 2> /dev/null

happy-sh:happy.source Makefile
	@ cp happy.source happy-sh
	@ chmod 755 happy-sh

happy-csh:happy.source Makefile
	@ cp happy.source happy-csh
	@ chmod 755 happy-csh

clean:
	-rm -f *.o *~ happy-csh happy-sh happy-f happy-f.f happy-c happy-c.c

which:
	@printf "\n"
	-bash   ./which-interpreter
	@printf "\n"
	-expect ./which-interpreter
	@printf "\n"
	-perl   ./which-interpreter
	@printf "\n"
	-python ./which-interpreter
	@printf "\n"
	-ruby   ./which-interpreter
	@printf "\n"
	-sh     ./which-interpreter
	@printf "\n"
	-tcsh   ./which-interpreter
	@printf "\n"
	-wish   ./which-interpreter
	@printf "\n"
	-TERM=dumb wine cmd.exe  ./which-interpreter < /dev/null
	@printf "\n"
