import re

def getNum(s):
    try:
        return float(s)
    except:
        return 0

definePattern = re.compile(r"(\w+)=(\d*).?(\d*)")
sumPattern    = re.compile(r"(\w+)=(\w+)\+(\w+)")

file     = open("sample.txt")
dataList = list(file)

MyDict = {}

for mainLine in dataList:

    mainLine = mainLine.replace("\n", "")
    line     = mainLine.replace(" ", "")

    defineMatch = re.fullmatch(definePattern, line)
    sumMatch    = re.fullmatch(sumPattern, line)

    if defineMatch is not None:
        num = (defineMatch.group(2)) + "." + (defineMatch.group(3))
        num = getNum(num)
        MyDict[defineMatch.group(1)] = num
        print("Processing Line:  "   + mainLine)
    elif sumMatch is not None:
        MyDict[sumMatch.group(1)]    = MyDict[sumMatch.group(2)] + MyDict[sumMatch.group(3)]
        print("Processing Line:  "   + mainLine)
    else:
        print("Processing Line:  "   + mainLine + "  ------> Invalid")

print("\nResualt:  " + str(MyDict))
