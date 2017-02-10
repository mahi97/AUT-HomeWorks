CXX = g++
CXXFLAGS = -std=c++14 -Wall -c
LXXFLAGS = -std=c++14
OBJECTS 	= main.o 		   \
			  newton-raphson.o 	 
TARGET = main


$(TARGET): $(OBJECTS)
	$(CXX) $(LXXFLAGS) $(OBJECTS) -o $(TARGET)
main.o: main.cpp
	$(CXX) $(CXXFLAGS) main.cpp
newton-raphson.o: newton-raphson.cpp
	$(CXX) $(CXXFLAGS) newton-raphson.cpp

clean:
	rm -f $(TARGET) $(OBJECTS)
