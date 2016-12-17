def promising(i):
    global queens
    for k in range(i):
        if queens[i] == queens[k] or abs(queens[i] - queens[k]) is abs(i - k):
            return False
    return True


def backTrack(i):
    global job_done
    global queens

    if not job_done:
        showTable(queens)
        print("---------------------")
        if promising(i):
            if i is n - 1:
                job_done = True
                print(" Done !")
                showTable(queens)
            else:
                for j in range(n):
                    queens[i + 1] = j
                    backTrack(i + 1)

def showTable(q):
    global n
    t = [[int(i == q[j]) for i in range(n)] for j in range(n)]
    for l in t:
        print(l)


n = int(input("Enter number of queens : "))
queens = [0 for _ in range(n)]
job_done = False

backTrack(-1)
