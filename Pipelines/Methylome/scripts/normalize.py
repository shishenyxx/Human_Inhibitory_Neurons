import argparse
import numpy as np

parser = argparse.ArgumentParser(description='normalizes, cleans, and names genes')
parser.add_argument('--gl', action='store_true', help='normalize by gene length')
parser.add_argument('--tm', action='store_true', help='normalize by total methylation')
parser.add_argument('--rg', action='store_true', help='remove genes that have 0 methylation across all smaples')
parser.add_argument('--rn', action='store_true', help='rename positions with gene names')
parser.add_argument('-i', required=True, help='merged bedgraph file')
parser.add_argument('-g', required=True, help='gene file')
parser.add_argument('-o', required=True, help='output file')
args=parser.parse_args()

print(args)
genes_file=open(args.g)

genes={}
if args.rn:
    for line in genes_file:
        info = line[:-1].split('\t')
        chrom = info[0]
        start = info[1]
        end = info[2]
        gene = info[3]
        genes[chrom + '\t' + start + '\t' + end] = gene

genes_file.close()

bedgraph=open(args.i)

header = bedgraph.readline().strip()

counts = []
if args.tm:
    counts = [0]*len(header.split('\t')[3:])
    for line in bedgraph:
        counts = np.add(counts,[float(i) for i in line[:-1].split('\t')[3:]])
        
bedgraph.close()
bedgraph=open(args.i)

header = bedgraph.readline().strip()

out_file=open(args.o,'w')
if args.rn:
    header = 'gene\t' + header.split('\tend\t')[1]
    out_file.write(header + '\n')
else:
    out_file.write(header[1:] + '\n')

for line in bedgraph:
    info = line[:-1].split('\t')
    chrom = info[0]
    start = info[1]
    end = info[2]
    methylation = [float(i) for i in info[3:]]
    if args.rg and sum(methylation) == 0:
        continue
    normalized_row = []
    for i in range(0,len(methylation)):
        normalized = methylation[i]
        if args.tm:
            normalized = normalized / counts[i]
        if args.gl:
            length = int(end) - int(start)
            normalized = normalized / length
        normalized_row.append(normalized)
    out = ""
    position = chrom + '\t' + start + '\t' + end
    if args.rn:
        out += genes[position]
    else:
        out += position
    for i in normalized_row:
        out += '\t' + str(i)
    out_file.write(out + '\n')

out_file.close()
bedgraph.close()