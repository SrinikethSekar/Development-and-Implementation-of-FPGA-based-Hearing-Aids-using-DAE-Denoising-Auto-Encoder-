## Clock and Reset
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN B5 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## Noisy Signal Output (LED or DAC)
set_property PACKAGE_PIN T14 [get_ports noisy_signal]
set_property IOSTANDARD LVCMOS33 [get_ports noisy_signal]

## Clean Signal Output (LEDs)
set_property PACKAGE_PIN U16 [get_ports clean_signal0]
set_property PACKAGE_PIN V16 [get_ports clean_signal1]
set_property PACKAGE_PIN W16 [get_ports clean_signal2]
set_property PACKAGE_PIN Y16 [get_ports clean_signal3]

## UART for Debug (Optional)
#set_property PACKAGE_PIN D10 [get_ports uart_tx]
#set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]
