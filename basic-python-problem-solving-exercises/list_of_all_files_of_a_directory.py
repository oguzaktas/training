from os import listdir
from os.path import isfile, join

files_list = [f for f in listdir('/Users') if isfile(join('/Users', f))]
print(files_list)
