#! /bin/bash
echo "1"
ghdl -a Q2.vhd
echo "2"
ghdl -e Memory
echo "3"
ghdl -r Memory
echo "4"
ghdl -a Q2_tb.vhd
echo "5"
ghdl -e Memory_tb
echo "6"
ghdl -r Memory_tb --vcd=n.vcd
echo "7"
killall Scansion
echo "8"
open -a Scansion n.vcd
echo "9"

