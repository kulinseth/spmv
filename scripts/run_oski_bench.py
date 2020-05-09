from pathlib import Path
import os
import requests
import wget
import json
import pandas as pd
from ast import literal_eval
import argparse
import requests
import tarfile
import shutil
import subprocess
import psutil
import platform
from datetime import datetime
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
import random
SEED = 448
metric_dict = {}
def parse_stderr(stderr, name):
    stderr = io.StringIO(stderr)
    for l in stderr:
        if ("Creating matrix handle" in l):
            dims = [int(s) for s in l.split() if s.isdigit()]
            metric_dict[name] +=  dims
            print (dims)
        if ("Did tune:" in l):
            dims = [int(s) for s in l if s.isdigit()]
            metric_dict[name] +=  dims
            print ("block size: ",dims)

def parse_stdout(stdout):
    stdout_split = stdout.split(" ")
    mflops_ref = 0.0
    mflops_tuned = 0.0
    time = 0.0
    try:
        mflops_ref = float(stdout_split[0])
        mflops_tuned = float(stdout_split[1])
        time = float(stdout_split[2])
    except ValueError:
        print (stdout_split)
    name = stdout_split[-1].split("/")[-1]
    name = name.strip().rstrip()
    metric_dict[name] = [mflops_ref, mflops_tuned, time]
    print("name {} , {} , {}, {} ".format(name , mflops_ref, mflops_tuned, time))
    return name

import json
def main():
    for (dirpath, dirnames, filenames) in os.walk(DATA_DIR):
        dir_name = (os.path.basename(dirpath))
        # filepaths[dir_name] = []
        for filename in filenames:
            if (filename.endswith('.rb')):
                filepaths.append(os.path.join(dirpath, filename))
    if (args.debug):
        print (filepaths)
    random.seed(SEED)
    random.shuffle(filepaths)
    uname = platform.uname()
    proc = uname.processor
    cpu_count = psutil.cpu_count()
    proc_name = "_" + str(proc) + "_" + str(cpu_count)
    with open("autotune_detailed" + proc_name + ".log", 'w') as fout:
        for f in filepaths:
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
            name = parse_stdout(stdout)
            parse_stderr(stderr, name)
            fout.write(stdout)
            fout.write("\n")
            fout.write(stderr)
            # print (tmp)

    with open("autotune_results" + proc_name + ".txt", 'w') as fout:
        fout.write(json.dumps(metric_dict))
        df = pd.DataFrame.from_dict(metric_dict, orient='index')
        df.transpose()
        df = df.fillna(0)
        df = df.reset_index()
        df.columns = ["Name", "MFLOPS_observed", "MFLOPS_tuned", "Time", "Row", "Col", "BlockRow", "BlockCol"]
        df["BlockRow"] = df["BlockRow"].astype(int)
        df["BlockCol"] = df["BlockCol"].astype(int)
        with pd.option_context('display.max_rows', None, 'display.max_columns', None):
            print(df)
            df.to_csv("autotune_results" + proc_name + ".csv", index=None)


if __name__ == '__main__':
    global args
    args = parser.parse_args()
    main()
