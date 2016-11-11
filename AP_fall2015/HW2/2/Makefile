CXX = g++
CXXFLAGS = -std=c++14 -Wall -c
LXXFLAGS = -std=c++14
OBJECTS = main.o decoder.o
TARGET = main


$(TARGET): $(OBJECTS)
	$(CXX) $(LXXFLAGS) $(OBJECTS) -o $(TARGET)
main.o: main.cpp
	$(CXX) $(CXXFLAGS) main.cpp
decoder.o: decoder.cpp
	$(CXX) $(CXXFLAGS) decoder.cpp
clean:
	rm -f $(TARGET) $(OBJECTS)
