CXX = iverilog
VVP = vvp
OBJECT = out_tb.vvp
SOURCE = tb.v
TARGET = main.vcd

$(TARGET) : $(OBJECT)
	$(VVP) $(OBJECT)
$(OBJECT) :
	$(CXX) -o $(OBJECT) $(SOURCE)

open : 
	open -a Scansion $(TARGET)

clean : 
	rm $(TARGET) $(OBJECT)