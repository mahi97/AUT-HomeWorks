CXX = g++
CXXFLAGS = -std=c++14 -Wall -c
LXXFLAGS = -std=c++14
OBJECTS 	= main.o 		\
			  sort.o 		\
			  bubble.o 		\
			  heap.o 		\
			  insertion.o 	\
			  merge.o 		\
			  quick.o 		\
			  selection.o 	\
			  shell.o 		 
TARGET = main


$(TARGET): $(OBJECTS)
	$(CXX) $(LXXFLAGS) $(OBJECTS) -o $(TARGET)
main.o: main.cpp
	$(CXX) $(CXXFLAGS) main.cpp
sort.o: sort.cpp
	$(CXX) $(CXXFLAGS) sort.cpp
bubble.o: bubble.cpp
	$(CXX) $(CXXFLAGS) bubble.cpp
heap.o: heap.cpp
	$(CXX) $(CXXFLAGS) heap.cpp
insertion.o: insertion.cpp
	$(CXX) $(CXXFLAGS) insertion.cpp
merge.o: merge.cpp
	$(CXX) $(CXXFLAGS) merge.cpp
quick.o: quick.cpp
	$(CXX) $(CXXFLAGS) quick.cpp
selection.o: selection.cpp
	$(CXX) $(CXXFLAGS) selection.cpp	
shell.o: shell.cpp
	$(CXX) $(CXXFLAGS) shell.cpp

clean:
	rm -f $(TARGET) $(OBJECTS)
