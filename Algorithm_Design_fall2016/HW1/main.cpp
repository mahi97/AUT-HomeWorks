#include <iostream>

long long **table;

long long divideAndConquer(int n, int k) {
//	std::cout << "tik" << std::endl;
	if (n == k || k == 0) {
		return 1;
	}
	return divideAndConquer(n -1, k - 1) + divideAndConquer(n -1, k);
}

void show(int n, int k) {
	std::cout << "---------->>" << std::endl;
	for (int i{0};i <= k;i++) {
		for (int j{0};j <= n;j++) {
			std::cout << table[i][j] << "  ";
		}
		std::cout << std::endl;
	}
	std::cout << "<<-----------" << std::endl;
}

long long dynamicProgramming(int n, int k) {
	for (int i {1};i <= k;i++) {
		for (int j{i + 1}; j <= n;j++) {
			table[i][j] = table[i - 1][j - 1] + table[i][j - 1];
		}
	}
	return table[k][n];
}

long long memozation(int n, int k) {
	
	if (n == k || k == 0) {
		return 1;
	}
	if (table[k][n] != 0) return table[k][n];
	table[k][n] = memozation(n - 1, k - 1) + memozation(n - 1, k);
	return table[k][n];
}

int main(int argc, char* argv[]) {
	int n,k;

	n = atoi(argv[1]);
	k = atoi(argv[2]);
	
	table = new long long* [k + 1];
	
	for (int i{0};i <= k;i++){
		table[i] = new long long[n + 1];
	}
	
	if (k >= n || k <= 0) {
		std::cout << "K is invalid";
		return 0;
	}

	for (int i{0};i <= k;i++) {
		for (int j{0};j <= n; j++) {
			if(i == 0 || i == j) table[i][j] = 1;
			else table[i][j] = 0;
		}
	}

//	std::cout << divideAndConquer(n, k) << "<--- divide" << std::endl;
	std::cout << dynamicProgramming(n, k) << "  <--- dynamic" << std::endl;
//	show(n, k);
//	std::cout << memozation(n, k) << "  <--- memo" << std::endl;

	return 0;
}
