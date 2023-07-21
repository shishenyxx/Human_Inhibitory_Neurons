import argparse
import math
from textwrap import wrap

parser = argparse.ArgumentParser(description='split reads in fastq file')
parser.add_argument('-n', type=int, required=True, help='size of chunks')
parser.add_argument('-d', type=int, required=True, help='discard chunks shorter than a value')
parser.add_argument('-i', required=True, help='input fastq file')
parser.add_argument('-o', help='name of output file. default <i>_split_<n>.fastq')
args=parser.parse_args()

if args.o:
    out = open(args.o,'w')
else:
    out = open(args.i.split('.')[0] + '_split_' + str(args.n) + '.fastq', 'w')
with open(args.i,'r') as file:
    cont = True
    while cont:
        try:
            head = file.readline()[:-1]
            if not head:
                break
            read = file.readline()[:-1]
            file.readline()
            qual = file.readline()
            if qual[-1] != '\n':
                cont = False
            else:
                qual = qual[:-1]
            reads = wrap(read,args.n,drop_whitespace=False, break_on_hyphens=False)
            quals = wrap(qual,args.n,drop_whitespace=False, break_on_hyphens=False)
            n_split = len(reads)
            for i in range(n_split-1):
                out.write(head + ' ' + str(i + 1) + '\n')
                out.write(reads[i] + '\n')
                out.write('+\n')
                out.write(quals[i] + '\n')
            if len(reads[-1]) >= args.d:
                out.write(head + ' ' + str(n_split) + '\n')
                out.write(reads[-1] + '\n')
                out.write('+\n')
                out.write(quals[-1] + '\n')
        except Exception as e:
            print(e)
            print(args)
            print("head: " + head)
            print("read: " + read)
            print("qual: " + qual)
            print("reads: " + str(reads))
            print("quals: " + str(quals))
