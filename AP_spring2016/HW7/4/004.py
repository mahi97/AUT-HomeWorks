import os

if os.path.exists('Shahrzad_Series'):
    os.chdir(os.path.join(os.getcwd(), 'Shahrzad_Series'))
    for folderIndex in range(len(os.listdir(os.getcwd()))):
        if os.path.isdir(os.listdir(os.getcwd())[folderIndex]):
            print("Folder Detected")
            os.chdir(os.listdir(os.getcwd())[folderIndex])
            for fileIndex in range(len(os.listdir(os.getcwd()))):
                os.renames('sh' + str(folderIndex + 1) + str(fileIndex + 1) + '.mp4',
                           'Shahrzad-S' + str(folderIndex + 1) + '-E' + str(fileIndex + 1) + '.mp4')
            os.chdir(os.path.dirname(os.getcwd()))
        else:
            print("A File Detected")
else:
    print("Shahrzad Folder Didn't Found!")
