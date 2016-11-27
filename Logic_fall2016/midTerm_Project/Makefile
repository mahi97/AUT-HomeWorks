CXX = iverilog
VVP = vvp
OBJECT = adder.tb.vvp
SOURCE = adder.tb.v
TARGET = main.vcd

$(TARGET) : $(OBJECT)
	$(VVP) $(OBJECT)
$(OBJECT) :
	$(CXX) -o $(OBJECT) $(SOURCE)

open : 
	open -a Scansion $(TARGET)

clean : 
	rm $(TARGET) $(OBJECT)