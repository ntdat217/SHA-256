SETUP_SCRIPT = /home/eda/snps_setup
RTL_SRC = ../../src/rtl/sha256_core.v
TB_SRC = ../../src/tb/tb_sha256_core.v
FILELIST = ../../src/rtl/filelist.f
SIMV = simv
all: clean 

clean:
	rm -r csrc
	rm -r simv.daidir
	rm simv
	rm ucli.key
	rm -r DVEfiles
	rm inter.vpd
compile: 
	. $(SETUP_SCRIPT) && vcs -kdb -full64 -debug_all -f $(FILELIST) -R $(RTL_SRC) $(TB_SRC)

simulate: $(SIMV)
	./$(SIMV) -gui -ucli
run: compile simulate

help: 
	@echo "********************************************************"
	@echo "******      make all: to clean and run            ******"
	@echo "******      make clean: to clean simulate files   ******"
	@echo "******      make run: to compile & simulate       ******"
	@echo "***********Use run if every already cleaned*************"
