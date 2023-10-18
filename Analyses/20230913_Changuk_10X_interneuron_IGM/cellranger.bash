#!/bin/bash
#PBS -q home-jogleeson
#PBS -N cr_count
#PBS -l nodes=1:ppn=12
#PBS -M chchung@health.ucsd.edu
#PBS -l walltime=48:00:00
#PBS -o /projects/ps-gleesonlab8/Uniformly_processed_data/20230913_Changuk_10X_interneuron_IGM/logs/ # standard output
#PBS -e /projects/ps-gleesonlab8/Uniformly_processed_data/20230913_Changuk_10X_interneuron_IGM/logs/
#PBS -V
#PBS -m abe


cd /projects/ps-gleesonlab8/Uniformly_processed_data/20230913_Changuk_10X_interneuron_IGM

cellranger count \
		--id=CC05 \
		--transcriptome=/projects/ps-gleesonlab7/Public_data_resources_references/10x_genome/ref-genome/refdata-cellranger-hg19-3.0.0 \
		--fastqs=/projects/ps-gleesonlab8/Incoming_raw_data/20230913_Changuk_10X_interneuron_IGM \
		--sample=CC05 \
		--expect-cells=10000 \
		--include-introns \
		--nosecondary

cellranger count \
		--id=CC06 \
		--transcriptome=/projects/ps-gleesonlab7/Public_data_resources_references/10x_genome/ref-genome/refdata-cellranger-hg19-3.0.0 \
		--fastqs=/projects/ps-gleesonlab8/Incoming_raw_data/20230913_Changuk_10X_interneuron_IGM \
		--sample=CC06 \
		--expect-cells=10000 \
		--include-introns \
		--nosecondary
