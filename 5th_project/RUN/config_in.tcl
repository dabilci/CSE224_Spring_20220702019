set ::env(DESIGN_NAME) "top_module"
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_PERIOD) "10"
set ::env(FP_PDN_MULTILAYER) 1
set ::env(FP_CORE_UTIL) 40
set ::env(PL_TARGET_DENSITY) 0.4
set ::env(FP_ASPECT_RATIO) 1
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 400 400"
set ::env(PLACE_DENSITY) 0.4
set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"
