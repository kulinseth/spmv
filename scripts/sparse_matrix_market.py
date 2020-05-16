from pathlib import Path
import os
import requests
import wget
import json
from ast import literal_eval
import argparse
import requests
import tarfile
import shutil
parser = argparse.ArgumentParser("Script to parse the TAMU sparse suite")
parser.add_argument('--download_files', action='store_true',  default=False, 
        help="Download files")
parser.add_argument('--file_format', type=str,  default="MM", 
        help="Download files of format")
parser.add_argument('--download_images', action='store_true', default=False ,
        help="Download images")
parser.add_argument('--extract_files', action='store_true', default=False ,
        help="Extract tar files")

URL = "https://sparse.tamu.edu/"
DIR = os.path.join(os.getcwd(),"external",
        "suite-sparse", "db", "collection_data",
        "matrices")
files = {}
filepaths = {}
for (dirpath, dirnames, filenames) in os.walk(DIR):
    dir_name = (os.path.basename(dirpath))
    files[dir_name] = []
    filepaths[dir_name] = []
    for filename in filenames:
        if (filename.endswith('.rb')):
            files[dir_name].append(filename)
            filepaths[dir_name].append(os.path.join(dirpath, filename))

rb_format = {}
def parse_rbfile(fpath):
    print ("parsing ", fpath)
    with open (fpath, "r") as f:
        fread = (f.read())
        fread = fread.replace('\n', '').replace('\r', '')
        for l in fread:
            val  = l.split(':')
            print (val)

def parse_file(input_file):
    with open (input_file, "r") as fin:
        Lines = fin.readlines()
        Lines = [i.strip() for i in Lines if i not in ['\n']]
        s = "".join(Lines)
        s = s.replace("\'", "\"")
        s = s.replace(',",', '"')
        d = literal_eval(json.dumps(s))

def download_file(fname, url_download) :
   if (not os.path.isfile(fname)):
       try:
           print (url_download)
           # wget.download(url_download,fname)
           rurl = requests.get(url_download, timeout=60)
           open(fname, 'wb').write(rurl.content)
       except :
           pass

def download_files():
    data_dir = os.path.join(os.getcwd(), 'data', args.file_format)
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    for k, paths in files.items():
        for path in paths:
            pname = os.path.splitext(path)[0]
            fname = os.path.join(data_dir, pname+".tar.gz")
            if (not os.path.isfile(fname)):
                url_download = os.path.join(URL, args.file_format, k, pname+ ".tar.gz")
                try:
                    print (url_download)
                    # wget.download(url_download,fname)
                    rurl = requests.get(url_download, timeout=60)
                    open(fname, 'wb').write(rurl.content)
                except :
                    pass

def file_to_dict(input_file):
    dict_input = {}
    with open (input_file, "r") as fin:
        Line = fin.readline()
        while Line:
            if Line.strip() not in ["{", "}", "\n"]:
                Line = Line.strip()[:-1]
                Line = Line.replace("'", "")
                if(Line.endswith(",")):
                    Line = Line[:-1]
                elements = Line.strip().split(':')
                elements = [i.replace('"', '') for i in elements]
                elements = [i.strip() for i in elements]
                if(len(elements)>1):
                    dict_input[elements[0]] = elements[1]
                #
            Line = fin.readline()
    return dict_input

def parse_file(input_file):
    dict_input = file_to_dict(input_file)
    df_input = pd.DataFrame.from_dict(dict_input, orient = 'index')
    folder_name = input_file.split("/")[-2]
    filename = input_file.split("/")[-1][:-3]
    df_input['filename'] = filename
    df_input['folder_name'] = folder_name
    return df_input

def download_pngs():
    data_dir = os.path.join(os.getcwd(), 'data')
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    for k, paths in files.items():
        for path in paths:
            pname = os.path.splitext(path)[0]
            fname = os.path.join(data_dir, pname+".png")
            if (not os.path.isfile(fname)):
                url_download = os.path.join(URL, args.file_format, 'files',k, pname+ ".png")
                print (url_download)
                try:
                    wget.download(url_download,fname)
                except:
                    pass
    # for k, paths in filepaths.items():
        # for path in paths:
            # path_base = (os.path.basename(path))
            # path_base = os.path.splitext(path_base)
            # dict_input = file_to_dict(path)
            # if ('image_files' in  dict_input and path_base in dict_input['image_files']):
                # print (dict_input['image_files'])
            # break

def extract_files(files, data_dir):
    if (not files):
       for (dirpath, dirnames, filenames) in os.walk(data_dir):
           for filename in filenames:
               basename = filename.split('.')[0]
               if (filename.endswith('.tar.gz')):
                   print ("Extracting : ", filename)
                   outdir = os.path.join(dirpath, basename)
                   tar = tarfile.open(os.path.join(dirpath,filename), "r:gz")
                   if os.path.exists(outdir):
                       shutil.rmtree(outdir)
                   tar.extractall(path=dirpath)
                   tar.close()
    else:
       for (dirpath, dirnames, filenames) in os.walk(data_dir):
           for filename in filenames:
               basename = filename.split('.')[0]
               if (filename.endswith('.tar.gz')):
                   print ("Extracting : ", filename)
                   outdir = os.path.join(dirpath, basename)
                   tar = tarfile.open(os.path.join(dirpath,filename), "r:gz")
                   if os.path.exists(outdir):
                       shutil.rmtree(outdir)
                   tar.extractall(path=dirpath)
                   tar.close()



if __name__ == '__main__':
    global args
    args = parser.parse_args()
    if (args.download_files):
        download_files()
    if (args.download_images):
        download_pngs()
    data_dir = os.path.join(os.getcwd(), 'data', 'MM')
    if (args.extract_files):
        extract_files([], data_dir)
