import re


firstPattern  = re.compile(r'[a-z0-9A-Z.]+@\w+\.[A-Za-z]+')
secondPattern = re.compile(r'[a-z0-9A-Z.]+@\w+\.\w+\.[A-Za-z]+')

email       = str(input('Enter Email:'))
firstMatch  = re.fullmatch(firstPattern, email)
secondMatch = re.fullmatch(secondPattern, email)

if firstMatch is None and secondMatch is None:
    print("Wrong")
else:
    print("Right")

