from scipy.sparse import random
from scipy.io import mmwrite,mmread
import argparse
parser = argparse.ArgumentParser(description = "Usage for the creating of sparse matrices.")
parser.add_argument("--create", type=str, help="Create a matrix")
parser.add_argument("--m", type=int, default=16, help="size of matrix to create")
parser.add_argument("--show", type=str, default="data/tmp.mtx")

def create_matrix():
    S = random(args.m, args.m, density=0.25, format='csr')
    with open(args.create, 'w') as f:
        mmwrite(f,S)

def print_matrix():
    with open(args.show, 'r') as f:
        S = mmread(f)
        print (S.todense())

if __name__ == '__main__':
    global args
    args = parser.parse_args()
    if (args.create is not None):
        create_matrix()
    elif (args.show is not None):
        print_matrix()
