set ::env(DESIGN_NAME) cpu_top

set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_PERIOD) "10.0"

set ::env(PL_TARGET_DENSITY) 0.5
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 1000 1000"

set ::env(FP_PDN_CORE_RING) 1
set ::env(FP_PDN_CORE_RING_VWIDTH) 3.1
set ::env(FP_PDN_CORE_RING_HWIDTH) 3.1
set ::env(FP_PDN_CORE_RING_VOFFSET) 12.45
set ::env(FP_PDN_CORE_RING_HOFFSET) 12.45

set ::env(GLB_RT_ADJUSTMENT) 0.1
set ::env(SYNTH_STRATEGY) "AREA 0"
set ::env(FP_CORE_UTIL) 30

set ::env(PL_RANDOM_GLB_PLACEMENT) 1 