PROJECT:=sample
BUILD_DIR:=$(shell dirname PWD)
all: map fit asm prog
map:
	quartus_map $(BUILD_DIR)/$(PROJECT).qpf
fit: map
	quartus_fit $(BUILD_DIR)/$(PROJECT).qpf 
asm: fit
	quartus_asm $(BUILD_DIR)/$(PROJECT).qpf
prog: asm
	quartus_pgm -c 1 $(BUILD_DIR)/$(PROJECT).cdf
test-gui: 
	vsim -do test/simulation.do
test-cli: 
	vsim -c -keepstdout -do test/simulation.do
clean: # удаление временных файлов сборки 
	rm -rf db incremental_db rtl_work hc_output
	rm -f $(PROJECT).done
	rm -f $(PROJECT).qws
	rm -f $(PROJECT).flow.rpt
	rm -f $(PROJECT).map.rpt
	rm -f $(PROJECT).sim.rpt
	rm -f $(PROJECT).fit.rpt
	rm -f $(PROJECT).asm.rpt
	rm -f $(PROJECT).map.summary
	rm -f $(PROJECT).fit.summary
	rm -f $(PROJECT).fit.smsg
	rm -f $(PROJECT).pin
	rm -f $(PROJECT).tis_db_list.ddb
	rm -f $(PROJECT)_nativelink_simulation.rpt
	rm -f cio_dump_disallowed_lists.echo
	rm -f vsim.wlf
	rm -f transcript
.PHONY: map fit asm prog test-gui test-cli