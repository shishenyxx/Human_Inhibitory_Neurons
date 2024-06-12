# Identifying Brian Cell Types from Single Nuclei Collected from Methanol-Fixed FANS Sorting and Methylome Analyses

-----------------------------

## Setup
### tools (recomended version)
#### [bismark](https://www.bioinformatics.babraham.ac.uk/projects/bismark/) (0.23.1)
Also download prereqs as specified on bismark's website
#### [snakemake](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html) (6.12.3)
#### [bedtools](https://anaconda.org/bioconda/bedtools) (2.30.0)
#### [python](https://anaconda.org/conda-forge/python) (3.10)
packages: argparse, textwrap, numpy
#### [R](https://anaconda.org/conda-forge/r-base) (4.1.3)
libraries: lsa, pheatmap, ggfortify
#### [TrimGalore](https://github.com/FelixKrueger/TrimGalore) (0.6.10)

### Prepare genome
Put your fasta in the `resources` folder.
Run the following (it might take some time).

```bismark_genome_preparation ./resources```

----------------------------

## Inputs
Input samples are paired fastq files and have the following format 

`{sample}_R1.fastq.gz` and `{sample}_R2.fastq.gz`

All input files should be placed in the input folder

---------------------------

## Running

Change directories to the `workflow` folder and run the `Snakefile`

Refer to the [snakemake documentation](https://snakemake.readthedocs.io/en/stable/) for more info on how to run Snakefiles.

----------------------------

## Output
Important outputs will be found in output folder.
Intermediate files will be found in scratch folder.

----------------------------

## Verification of Cell types

Human single-cell methylation data from published literature [PMID: 28798132](https://www.science.org/doi/10.1126/science.aan3351) was downloaded, and reads from excitatory neurons and inhibitory neuros were pooled separately and used as positive controls. 

[Codes](https://github.com/shishenyxx/Human_Interneuron/blob/main/Methylome/plots/Human_Interneuron_Methylome_Plots.ipynb) for plotting the cosine similarity and hierarchical clustering of methylation patterns of gold-standard inhibitory neurons, sorted DLX1 positive cells, excitatory neurons, sorted TBR1 positive cells. And control samples from heart, cortical microglia, and cortical oligodendrocytes.


