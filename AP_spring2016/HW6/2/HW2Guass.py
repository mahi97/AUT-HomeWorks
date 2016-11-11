import numpy as np

def func(x: float) -> float:
    return x ** 3 * np.cos(x ** 2) / (x + 1)


class GuassSolver:
    def __init__(self, _start, _step, _end):
        self.start = _start
        self.end = _end
        self.step = _step
        self.result = 0.0

    def exec(self):
        integral = 0

        for i in range(1, self.step):
            legandre_zero = self.__legendre_zeroes__(self.step, i)
            integral += func(legandre_zero) * self.__weight__(self.step, legandre_zero)
            self.result = ((self.end - self.start) / 2.0) * integral

    def __legandre__(self, num: int, x: float) -> float:
        if num == 0:
            return 1
        elif num == 1:
            return x
        else:
            legandre1 = self.__legandre__(num - 1, x)
            legandre2 = self.__legandre__(num - 2, x)
            return ((2.0 * num - 1) / num) * x * legandre1 - ((1.0 * num - 1) / num) * legandre2

    def __d_legandre__(self, num: int, x: float) -> float:
        legandre0 = self.__legandre__(num, x)
        legandre1 = self.__legandre__(num - 1, x)
        return (num / (x * x - 1)) * (x * legandre0) - legandre1

    def __legendre_zeroes__(self, num: int, i: int) -> float:
        pi = np.pi
        xnew1 = 0
        xold1 = np.cos(pi * (i - 1 / 4.0) / (num + 1 / 2.0))
        iteration = 1

        while True:
            if iteration != 1:
                xold1 = xnew1
            xnew1 = xold1 - self.__legandre__(num, xold1) / self.__d_legandre__(num, xold1)
            iteration += 1
            if 1 + np.fabs(xnew1 - xold1) <= 1.:
                break
        return xnew1

    def __weight__(self, num: int, x: float) -> float:
        d_legandre = self.__d_legandre__(num, x)
        return 2 / (1 - x ** 2) * d_legandre ** 2
