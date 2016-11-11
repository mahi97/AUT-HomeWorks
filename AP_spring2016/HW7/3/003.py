import os
import re
import shutil
import zipfile
import rarfile

# Regular Expression Pattern
pattern = re.compile(r'(.*)\.(\w+)')

# Define Ext Lists
movie_ext_list = ['mpg', 'mpeg', 'avi', 'mov', 'wmv', 'asx', 'wma', 'asf', 'm4v', 'mkv', 'asf', 'mp2', 'mp4']
audio_ext_list = ['mp3', 'm3u', 'm3u8', 'pls', 'cda', 'flac', 'mid', 'midi', 'acc', 'm4a', 'wav', 'acc', 'ogg', 'wpl']
image_ext_list = ['jpg', 'jpeg', 'png', 'bmp', 'tif', 'tiff', 'gif', 'psd', 'raw', 'ico', 'JPG']
docs_ext_list  = ['docx', 'doc', 'pdf', 'txt', 'rtf', 'docm', 'wps', 'xls', 'xlsx', 'xlsm', 'ppt', 'csv', 'htm',
                  'html', 'xml', 'mht', 'mhtml', 'xps']

# Define Type List
types = ['Video', 'Audio', 'Image', 'Doc', 'Other']


def find_type(file):
    """ Return the type of a File """
    match = re.fullmatch(pattern, str(file))
    if match is not None:
        file_ext = match.group(2)
        if file_ext in movie_ext_list:
            return types[0]
        elif file_ext in audio_ext_list:
            return types[1]
        elif file_ext in image_ext_list:
            return types[2]
        elif file_ext in docs_ext_list:
            return types[3]
        else:
            return types[4]
    else:
        return file


def find_ext(file):
    """ Return the extension of a File """
    match = re.fullmatch(pattern, str(file))
    return match.group(2)


def move_file(file, _type, _sub_folder):
    """ Move a File To Right Place and get Back to Where it Was """
    startdir = os.getcwd()
    print(_sub_folder)
    if _sub_folder == 'zip':
        temp_zip = zipfile.ZipFile(os.path.join(startdir, file))
        if len(temp_zip.namelist()) is 0:
            return
    if _sub_folder == 'rar':
        temp_rar = rarfile.RarFile(os.path.join(startdir, file))
        if len(temp_rar.namelist()) is 0:
            return
    if _type in types:
        os.chdir(mainPath)
        os.chdir(os.path.join(os.getcwd(), 'Categorized_Files'))
        os.chdir(os.path.join(os.getcwd(), _type))
        if not os.path.exists(os.path.join(os.getcwd(), _sub_folder)):
            os.mkdir(_sub_folder)
        os.chdir(os.path.join(os.getcwd(), _sub_folder))
        shutil.copy(os.path.join(startdir, file), os.getcwd())
        os.chdir(startdir)


def search_folder(_dir):
    """ Check a Directory and moves files to right place """
    try:
        os.chdir(_dir)
        for file in os.listdir(_dir):
            print(file)
            file_type = find_type(file)
            if file_type in types:
                file_ext = find_ext(file)
                move_file(file, file_type, file_ext)
            else:
                search_folder(os.path.join(_dir, file))
        os.chdir(os.path.dirname(os.getcwd()))
    except NotADirectoryError:
        move_file(_dir, types[4], 'NoType')


# The App is Started From Here! #
mainPath = os.getcwd()

# Check there was a folder with same name or not and delete them if exist!
if os.path.exists(os.path.join(os.getcwd(), 'Categorized_Files')):
    shutil.rmtree(os.path.join(os.getcwd(), 'Categorized_Files'))

# Making Main Folder
os.mkdir('Categorized_Files')
os.chdir(os.path.join(os.getcwd(), 'Categorized_Files'))

# Making subfolders
os.mkdir('Audio')
os.mkdir('Video')
os.mkdir('Image')
os.mkdir('Doc')
os.mkdir('Other')

# Go Back To Up Folder
os.chdir(os.path.dirname(os.getcwd()))

# Start Categorizing!
search_folder(os.path.join(os.getcwd(), 'Down'))
