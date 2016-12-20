CXX = g++
CXXFLAGS = -std=c++14 -Wall -c
CXXLFLAGS = -std=c++14
OBJECTS = main.o
TARGET = main

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXLFLAGS) $(OBJECTS) -o $(TARGET)

main.o: main.cpp
	$(CXX) $(CXXFLAGS) main.cpp

clean:
	rm -f $(TARGET) $(OBJECTS)