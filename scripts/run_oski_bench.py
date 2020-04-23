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
import subprocess
parser = argparse.ArgumentParser("Script to run the OSKI bench suite")
parser.add_argument('--matmul', action='store_true',  default=False, 
        help="Download files")
parser.add_argument('--debug', action='store_true',  default=False, 
        help="Debug mode")
# parser.add_argument('--download_images', action='store_true', default=False ,
        # help="Download images")
# parser.add_argument('--extract_files', action='store_true', default=False ,
        # help="Extract tar files")
# Command to run :
#   env OSKI_DEBUG_LEVEL=10 ./bench/oskibench_autotune_Tid --tune aggressive <rb #   #   file> --op
DATA_DIR = os.path.join(os.getcwd(), "data")
os.environ["OSKI_DEBUG_LEVEL"] = "1"
filepaths = []
import io
def parse_stderr(stderr):
    for l in stderr:
        if ("Creating matrix handle" in l):
            dims = [int(s) for s in str.split() if s.isdigit()]
            print (dims)
def parse_stdout(stdout):
    stdout_split = stdout.split(" ")
    mflops_ref = float(stdout_split[0])
    mflops_tuned = float(stdout_split[1])
    time = float(stdout_split[2])
    name = stdout_split[-1].split("/")[-1]
    name = name.strip().rstrip()
    print("name {} , {} , {}, {} ".format(name , mflops_ref, mflops_tuned, time))


def main():
    for (dirpath, dirnames, filenames) in os.walk(DATA_DIR):
        dir_name = (os.path.basename(dirpath))
        # filepaths[dir_name] = []
        for filename in filenames:
            if (filename.endswith('.rb')):
                filepaths.append(os.path.join(dirpath, filename))
    if (args.debug):
        print (filepaths)
    with open("tmp_autotune.txt", 'w') as fout:
        for f in filepaths[:2]:
            sub_args = ["./poski/oski/build_oski/bench/.libs/lt-oskibench_autotune_Tid",
                    "--tune",  "aggressive", f, "MatMult", "--op", "normal"]
            if (args.debug):
                print (sub_args)
            # process = subprocess.Popen(sub_args,  stderr=fout, stdout=fout,
                    # universal_newlines=True)
            process = subprocess.Popen(sub_args,  stderr=subprocess.PIPE,
                    stdout=subprocess.PIPE, universal_newlines=True)
            stdout, stderr = process.communicate()
            # tmp = os.popen(" ".join(sub_args))
            # tmp_out = tmp.read()
            parse_stdout(stdout)
            parse_stderr(stderr)
            fout.write(stdout)
            fout.write("\n")
            fout.write(stderr)
            # print (tmp)

if __name__ == '__main__':
    global args
    args = parser.parse_args()
    main()
