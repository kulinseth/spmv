from sparse_matrix_market import download_file
from pathlib import Path
import os
import requests
import wget
import json
import argparse
import requests
import tarfile
import shutil
import glob
import pandas as pd
from scipy.sparse import csr_matrix
from scipy.io import mmread, mminfo
import time
import numpy as np
from datetime import datetime
import platform
import psutil
import subprocess
import io
parser = argparse.ArgumentParser("Script to run experiment")
parser.add_argument('--exp_file', type=str,  default="",
        help="List of mtx files for running experiment")
parser.add_argument('--exp', type=str,  default="features",
        help="Experiment to run")
parser.add_argument('--out_dir', type=str,  default="results",
        help="Download files")
parser.add_argument('--data_dir', type=str,  default="/scratch/seth.k/spmv",
        help="Download files")
parser.add_argument('--iters', type=int,  default=10,
        help="Num of iterations to run experiment")

uname = platform.uname()
proc = uname.processor
cpu_count = psutil.cpu_count()
proc_name = "_" + str(proc) + "_" + str(cpu_count)
print (proc_name)
def run_mkl(files):
   pass

def run_cuda(files):
   pass

def run_baseline(files):
   pass

def run_cusparse(files):
   pass

def isint(x):
   try:
      a = float(x)
      b = int(a)
   except ValueError:
      return False
   else:
      return (a==b)

def isfloat(x):
   try:
      a = float(x)
   except ValueError:
      return False
   else:
      return True

def check_issparse(f) :
   finfo = mminfo(f)
   if (finfo[3] == 'coordinate'):
      return True
   else:
      return False

def run_csr5(files):
   def parse_stdout(std):
       stdout = io.StringIO(std)
       ret = {}
       for l in stdout:
          lst = l.strip()
          if ("sequential time" in lst):
             lsplit = lst.split(" = ")
             if (len(lsplit) > 3):
                #time
                ret["CPU" + lsplit[0].split(" ")[-1]] = float(lsplit[1].split(" ")[0])
                ret["CPU" + lsplit[1].split(" ")[-1]] = float(lsplit[2].split(" ")[0])
                ret["CPU" + lsplit[2].split(" ")[-1]] = float(lsplit[3].split(" ")[0])
          if ("sequential time" in lst):
             lsplit = lst.split(" = ")
             if (len(lsplit) > 3):
                #time
                ret["CSR5" + lsplit[0].split(" ")[-1]] = float(lsplit[1].split(" ")[0])
                ret["CSR5" + lsplit[1].split(" ")[-1]] = float(lsplit[2].split(" ")[0])
                ret["CSR5" + lsplit[2].split(" ")[-1]] = float(lsplit[3].split(" ")[0])
       print ("Results {}".format(ret))
       return ret

   bin_dir = os.path.join(os.getcwd(), 'external', 'csr5','spmv')
   out_features = {}
   for f in files:
      sub_args = [bin_dir, f]
      print ("Running {}".format(f))
      process = subprocess.Popen(sub_args,  stderr=subprocess.PIPE,
                       stdout=subprocess.PIPE, universal_newlines=True)
      stdout, stderr = process.communicate()
      out_features[os.path.basename(f)] = parse_stdout(stdout)
   df = pd.DataFrame.from_dict(out_features, orient="index")
   df.to_csv(os.path.join(args.out_dir, "csr5_features.csv"))

def run_features(files):
   def parse_stdout(std):
       stdout = io.StringIO(std)
       ret = {}
       for l in stdout:
          lst = l.split(",")
          left = lst[0].strip()
          right = lst[1].strip()
          if (isint(right)):
              ret[left] = int(float(right))
          elif (isfloat(right)):
              ret[left] = float(right)
          else:
              assert()
       return ret

   bin_dir = os.path.join(os.getcwd(), 'src', 'sequential','run_features')
   out_features = {}
   for f in files:
      sub_args = [bin_dir, f]
      process = subprocess.Popen(sub_args,  stderr=subprocess.PIPE,
                       stdout=subprocess.PIPE, universal_newlines=True)
      stdout, stderr = process.communicate()
      out_features[os.path.basename(f)] = parse_stdout(stdout)
   df = pd.DataFrame.from_dict(out_features, orient="index")
   df.to_csv(os.path.join(args.out_dir, "features.csv"))

def run_taco(files):
   def parse_stdout(std):
       stdout = io.StringIO(std)
       ret = {}
       for l in stdout:
          lst = l.strip()
          print (l)
          if ("mean:" in lst):
             lsplit = lst.split("   ")
             ret [lsplit[0]] = float(lsplit[1])
       print (ret)
       return ret

   bin_dir = os.path.join(os.getcwd(), 'external', 'taco','build', 'bin', 'taco')
   out_features = {}
   for f in files:
      sub_args = ["\"a(i) = B(i,j) * c(j)\"", "-f=B:ds", "-i=B:"+f,
            "-g=c:d", '-time=10']

      sub_args =" ".join(sub_args)
      sub_f_args = [bin_dir, sub_args]
      print (sub_args)
      print ("Running {}".format(f))
      process = subprocess.Popen(sub_f_args,  stderr=subprocess.PIPE,
                       stdout=subprocess.PIPE, universal_newlines=True)
      stdout, stderr = process.communicate()
      out_features[os.path.basename(f)] = parse_stdout(stdout)
   df = pd.DataFrame.from_dict(out_features, orient="index")
   df.to_csv(os.path.join(args.out_dir, "taco_features.csv"))


def run_scipy(files):
   exp_times = {}
   log_dir = os.path.join(os.getcwd(), args.out_dir, args.exp,
         datetime.now().strftime("%Y%m%d-%H%M%S"))
   for f in files:
      print ("Processing :", f)
      fsparse = mmread(f)
      finfo = mminfo(f)
      print (finfo)
      if (finfo[3] != 'coordinate'):
         continue
      csr = fsparse.tocsr()
      v = np.random.uniform(finfo[0]) #0:rows
      iter_times = []
      for i in range (args.iters):
         start = time.time_ns()
         res = csr.dot(v)
         delta = (time.time_ns() - start)
         iter_times.append(delta/(10 ** 6))
      exp_times[os.path.basename(f)] = iter_times
      df = pd.DataFrame.from_dict(exp_times, orient="index")
      df.to_csv(os.path.join(logdir, "results.csv"))

def extract_file(filename, outdir):
   if (filename.endswith(".tar.gz")):
      print ("Extracting : ", filename)
      tar = tarfile.open(filename, "r:gz")
      tar.extractall(path=outdir)
      tar.close()

def get_all_files():
   data_dir = os.path.join(args.data_dir, 'data', 'MM')
   efiles = [] # files to pass to extract_files

   # Go over all the tar ball files
   for ftar in os.listdir(data_dir):
      if (ftar.endswith(".tar.gz")):
         bname = ftar.split(".")[0]
         dirname = os.path.join(data_dir, bname)
         print ('Checking dir : {}'.format(dirname))
         if (not os.path.isdir(dirname)):
            ftarname = os.path.join(data_dir, ftar)
            extract_file(ftarname, data_dir)
         basename = ftar.split('.')[0]
         outdir = os.path.join(data_dir, basename)
         print ("The directory with mtx {}".format(outdir))
         for fnewtar in os.listdir(outdir):
            if fnewtar.endswith(".mtx"):
               fsparse_name = os.path.join(outdir, fnewtar)
               if (check_issparse(fsparse_name)):
                  efiles.append(fsparse_name)
   print (efiles)
   return efiles

def get_files():
   data_dir = os.path.join(args.data_dir, 'data', 'MM')
   with open(args.exp_file, "r") as f:
      efiles = [] # files to pass to extract_files
      for l in f:
         fname = l.strip()
         dirs = [x[0] for x in os.walk(data_dir) if fname in x[0]]
         for d in dirs:
            for fmtx in os.listdir(d):
               if (fmtx.endswith(".mtx")):
                  fsparse_name = os.path.join(data_dir, d, fmtx)
                  if (check_issparse(fsparse_name)):
                     efiles.append(fsparse_name)
         if (not dirs):
            for ftar in os.listdir(data_dir):
               if (fname in ftar) and (ftar.endswith(".tar.gz")):
                  ftarname = os.path.join(data_dir, ftar)
                  extract_file(ftarname, data_dir)
                  basename = ftar.split('.')[0]
                  outdir = os.path.join(data_dir, basename)
                  print (outdir)
                  for fnewtar in os.listdir(outdir):
                     if fnewtar.endswith(".mtx"):
                        fsparse_name = os.path.join(outdir, fnewtar)
                        if (check_issparse(fsparse_name)):
                           efiles.append(fsparse_name)
      print (efiles)
      return efiles

if __name__ == '__main__':
   global args
   args = parser.parse_args()
   if (os.path.isfile(args.exp_file)):
      files = get_files()
   else:
      files = get_all_files()
   if (args.exp == 'scipy'):
      run_scipy(files)
   # run both CPU and GPU versions
   elif (args.exp == 'baseline'):
      run_baseline(files)
   elif (args.exp == 'taco'):
      run_taco(files)
   elif (args.exp == 'csr5'):
      run_csr5(files)
   elif (args.exp == 'mkl'):
      run_mkl(files)
   elif (args.exp == 'cuda'):
      run_cuda(files)
   elif (args.exp == 'cusparse'):
      run_cusparse(files)
   elif (args.exp == 'features'):
      run_features(files)
