# Human_Interneuron
This repository contains codes and pipelines for the analysis of human interneuron migration study and clonal distribution project.

-----------------------------------

### 1. Pipelines for the process of whole-genome sequencing data

#### 1.1 Pipelines for WGS data process

WGS data processing is following [this pipeline](https://github.com/shishenyxx/Human_Interneuron/tree/main/Pipelines/Alignment).

Germline heterozygous variants are called with HaplotypeCaller following [this pipeline](https://github.com/shishenyxx/Sperm_control_cohort_mosaicism/tree/master/Pipelines/Preprocessing/Haplocaller).

#### 1.2 Pipelines for mosaic SNV/indel calling and variant annotations

Sample-unique variant calling with Mutect2 and Strelka paired mode is carried out following [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/WGS_SNV_indel_calling_pipeline/Mutect2_PM_Strelka2).

Sample-specific variant calling is first carried with [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/WGS_SNV_indel_calling_pipeline/Mutect2_single_mode) using Mutect2 single mode (full panel of normal). Followed with DeepMosaic is carried out following the [official guidelines](https://github.com/Virginiaxu/DeepMosaic) and MosaicForecast using [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/WGS_SNV_indel_calling_pipeline/MosaicForecast_pipeline).

Sample-unique and sample-specific variants are further called without control using MosaicHunter following [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/WGS_SNV_indel_calling_pipeline/MosaicHunter_single_mode_pipeline) and the 300x properties file.

Variants were further combined and annotations were performed using [this pipeline](https://github.com/shishenyxx/PASM/tree/master/Snakemake_pipeline). 
     
-----------------------------------

### 2. Pipelines for the process of Massive Parallel Amplicon Sequencing (MPAS) and single-nuclei Massive Parallel Amplicon Sequencing (snMPAS)

#### 2.1 Pipelines for MPAS and snMPAS data alignment and processing

Alignment and processing of MPAS and snMPAS were carried out following [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/MPAS_and_snMPAS_processing_pipeline)

#### 2.2 Pipelines for AF quantification and variant annotations

After alignment, candidate variants were further combined and genotyped using [this pipeline](https://github.com/shishenyxx/PASM/tree/master/Snakemake_pipeline) in every sample detected with MPAS and snMPAS. 

-----------------------------------

### 3. Identification the cell types by using whole-genome bisulfite sequencing analysis

#### 3.1 [Pipelines](https://github.com/shishenyxx/Human_Interneuron/tree/main/Methylome) for methylome analysis using BisMark

#### 3.2 [Statical analysis](https://github.com/shishenyxx/Human_Interneuron/blob/main/Methylome/plots/Human_Interneuron_Methylome_Plots.ipynb) combining published standards to identify the cell types

-----------------------------------

### 4. Computational and statistical analyses for interneuron clonal distribution patterns

#### 4.1 Pipelines for mosaic variant determination, annotations, and plotting

#### 4.2 Pipelines for statistically analysis, and the related plotting

-----------------------------------

### 5. Contact:

:email: Changuk Chung: [chchung@health.ucsd.edu](mailto:chchung@health.ucsd.edu)

:email: Xiaoxu Yang: [xiy010@health.ucsd.edu](mailto:xiy010@health.ucsd.edu), [yangxiaoxu-shishen@hotmail.com](mailto:yangxiaoxu-shishen@hotmail.com)

:email: Joseph Gleeson: [jogleeson@health.ucsd.edu](mailto:jogleeson@health.ucsd.edu), or the Gleeson lab [gleesonlab@health.ucsd.edu](gleesonlab@health.ucsd.edu)

-----------------------------------

### 6. Cite the data and codes:
