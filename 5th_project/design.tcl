# Design configuration
set ::env(DESIGN_NAME) "top_module"
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_PERIOD) "10"

# Design constraints
set ::env(DESIGN_IS_CORE) 1
set ::env(FP_CORE_UTIL) 40
set ::env(PL_TARGET_DENSITY) 0.4
set ::env(FP_ASPECT_RATIO) 1
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 400 400"
set ::env(PLACE_DENSITY) 0.4
set ::env(FP_PDN_MULTILAYER) 1

# Technology settings
set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# Optimization settings
set ::env(SYNTH_STRATEGY) 2
set ::env(SYNTH_BUFFERING) 1
set ::env(SYNTH_SIZING) 1
set ::env(CLOCK_TREE_SYNTH) 1
set ::env(PL_ROUTABILITY_DRIVEN) 1
set ::env(PL_TIME_DRIVEN) 1
set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 1
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 1
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 1
set ::env(ROUTING_STRATEGY) 2
set ::env(ROUTING_OPT_ITERS) 100 