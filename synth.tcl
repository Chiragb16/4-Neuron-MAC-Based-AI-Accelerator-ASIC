yosys -import

read_verilog ../accelerator.v
read_verilog ../mac.v
read_verilog ../mac_unit.v

hierarchy -top accelerator

synth -top accelerator

dfflibmap -liberty /home/chrix/OpenROAD-flow-scripts/flow/platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

abc -liberty /home/chrix/OpenROAD-flow-scripts/flow/platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib -D 8000

clean

hilomap \
    -hicell sky130_fd_sc_hd__conb_1 HI \
    -locell sky130_fd_sc_hd__conb_1 LO

clean

write_verilog netlist/accelerator_netlist.v

stat
