from scipy.sparse import random
from scipy.io import mmwrite,mmread
import argparse
import cv2
parser = argparse.ArgumentParser(description = "Usage for the creating of sparse matrices.")
parser.add_argument("--create", type=str, help="Create a matrix")
parser.add_argument("--m", type=int, default=16, help="size of matrix to create")
parser.add_argument("--show", type=str)
parser.add_argument("--viz", type=str)
    
def create_matrix():
    S = random(args.m, args.m, density=0.25, format='csr')
    with open(args.create, 'w') as f:
        mmwrite(f,S)

def print_matrix():
    with open(args.show, 'r') as f:
        S = mmread(f)
        print (S.todense())

def visualize_matrix():
    print("""
    Zoom In-Out demo
    ------------------
    * [i] -> Zoom [i]n
    * [o] -> Zoom [o]ut
    * [ESC] -> Close program
    This uses image pyramids to visualize the matrix
    """)
    # with open(args.viz, 'r') as f:
    f = args.viz
    S = mmread(f)
    src = S.todense()
    print (src.shape)
    src = cv2.resize(src, dsize=(1024,1024), interpolation=cv2.INTER_CUBIC)
    cv2.imwrite("tmp.png", src)
    # while 1:
        # rows, cols = map(int, src.shape)
        # cv2.imshow('Pyramids Demo', src)
        # k = cv2.waitKey(0)
        # if k == 27:
            # break
        # elif chr(k) == 'o':
            # src = cv2.pyrDown(src, dstsize=(cols // 2, rows // 2))
            # print ('** Zoom Out: Image / 2')
            
    cv2.destroyAllWindows()

if __name__ == '__main__':
    global args
    args = parser.parse_args()
    if (args.create is not None):
        create_matrix()
    elif (args.show is not None):
        print_matrix()
    elif (args.viz is not None):
        visualize_matrix()
