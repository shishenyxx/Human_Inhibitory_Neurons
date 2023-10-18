# Human Inhibitory Neuron
This repository contains codes and pipelines, as well as data used in the analysis of human inhibitory and excitatory neuronal clonal dynamics and lineage relationships, with cell-type-specific mosaic variant barcoding analysis (cMVBA). 

-----------------------------------

### 1. Pipelines for the process of whole-genome sequencing data

#### 1.1 Pipelines for WGS data process

WGS data processing is following [this pipeline](https://github.com/shishenyxx/Human_Inhibitory_Neurons/tree/main/Pipelines/Alignment).

Germline heterozygous variants are called with HaplotypeCaller following [this pipeline](https://github.com/shishenyxx/Sperm_control_cohort_mosaicism/tree/master/Pipelines/Preprocessing/Haplocaller).

#### 1.2 Pipelines for mosaic SNV/indel calling and variant annotations

Sample-unique variant calling with Mutect2 and Strelka paired mode is carried out following [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/WGS_SNV_indel_calling_pipeline/Mutect2_PM_Strelka2).

Sample-specific variant calling is first carried with [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/WGS_SNV_indel_calling_pipeline/Mutect2_single_mode) using Mutect2 single mode (full panel of normal). Followed with DeepMosaic is carried out following the [official guidelines](https://github.com/Virginiaxu/DeepMosaic) and MosaicForecast using [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/WGS_SNV_indel_calling_pipeline/MosaicForecast_pipeline).

Sample-unique and sample-specific variants are further called without control using MosaicHunter following [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/WGS_SNV_indel_calling_pipeline/MosaicHunter_single_mode_pipeline) and the 300x properties file.

Variants were further combined and annotations were performed using [this pipeline](https://github.com/shishenyxx/PASM/tree/master/Snakemake_pipeline). 

#### 1.3 Pipelines for single nucleus transcriptome sequencing analysis

Single nucleus transcriptome sequencing analysis with ResolveOME RNA seq pipeline is provided [here](https://github.com/shishenyxx/Human_Inhibitory_Neurons/tree/main/Pipelines/scRNAseq/ResolveOME).

Single nucleus transcriptome sequencing analysis with a 10x Genomics RNA seq pipeline is provided [here](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/Bioskryb/Bioskryb_celltype_identificationV2_with_ref-Copy1.ipynb).

Cell identity was determined as described [here](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/Bioskryb/Bioskryb_celltype_identificationV2.ipynb).
     
-----------------------------------

### 2. Pipelines for the process of Massive Parallel Amplicon Sequencing (MPAS) and single-nuclei Massive Parallel Amplicon Sequencing (snMPAS)

#### 2.1 Pipelines for MPAS and snMPAS data alignment and processing

Alignment and processing of MPAS and snMPAS were carried out following [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/MPAS_and_snMPAS_processing_pipeline)

#### 2.2 Pipelines for AF quantification and variant annotations

After alignment, candidate variants were further combined and genotyped using [this pipeline](https://github.com/shishenyxx/PASM/tree/master/Snakemake_pipeline) in every sample detected with MPAS and snMPAS. 

Quality control were carried out for WGS and MPAS MAFs measured in [ID01](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20230114_7614_Ampliseq_QC/7614_interneuron_Ampliseq_QC_Rscript-Copy1.ipynb) and [ID05](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/20230101_QC/7669_interneuron_Ampliseq_QC_Rscript.ipynb).


-----------------------------------

### 3. Identification the cell types by using whole-genome bisulfite sequencing analysis

#### 3.1 [Pipelines](https://github.com/shishenyxx/Human_Inhibitory_Neurons/tree/main/Pipelines/Methylome) for methylome analysis using BisMark

#### 3.2 [Statical analysis](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Methylome/plots/Human_Interneuron_Methylome_Plots.ipynb) combining published standards to identify the cell types

-----------------------------------

### 4. Computational and statistical analyses for human neuronal clonal distribution patterns

#### 4.1 Pipelines for mosaic variant determination, annotations, and plotting

Variant annotation for [ID01](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20230114_7614_Ampliseq_QC/annotation/7614_Ampliseq_Annotation.ipynb) and [ID05](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/20230105_annotation/7669_Ampliseq_Annotation.ipynb) are provided separately.

UpSet plot for [ID01](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20230114_7614_Ampliseq_QC/variant_annotation/7614_Upset_plot.ipynb) and [ID05](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/variant_annotation/7669_upset_plot.ipynb) variants.

#### 4.2 Pipelines for statistical analysis, and the related plotting

Single-nucleus RNA sequencing results for [cell type identification of sorted nuclei](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20230913_Changuk_10X_interneuron_IGM/Cell_type_identification_for_sorted_nuclei.ipynb)

Number of MVs categorized by location detected in each donor [ID01](Analyses/20230114_7614_Ampliseq_QC/variant_annotation/7614_variant_annotation.ipynb) or [ID05](Analyses/20221223_7669_Ampliseq_QC/variant_annotation/7669_variant_annotation.ipynb)

Heatmaps, dendrograms, and contour plots with kernel density estimation plots for strong Hippocampal lineage restriction: [ID01](Analyses/20230114_7614_Ampliseq_QC/CTX_BG_HIP/7614_CTX_BG_HIP.ipynb), [ID05](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/CTX_BG_HIP/7669_CTX_BG_HIP.ipynb)

Correlation analysis for [ID01](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20230114_7614_Ampliseq_QC/Basic_correlation/7614_var_by_var_corr_heatmap.ipynb) and [ID05](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/Basic_characteristics_of_variants/7669_var_by_var_corr_umap.ipynb) as well as [here](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/Lobe/7669_R_P_1to17_varxsample_heatmap-Copy1.ipynb).

Bootstrap, and AF heatmap for [ID01](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20230114_7614_Ampliseq_QC/Basic_correlation/7614_variant_by_sample_heatmap.ipynb) and [ID05](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/Basic_characteristics_of_variants/7669_variant_by_sample_heatmap.ipynb).

Lolliplot and geoclones for [ID01](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20230114_7614_Ampliseq_QC/Rolliplot/7614_lolliplot.ipynb); [ID05 lollipolt](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/Lolliplot/7669_lolliplot.ipynb) and [geoclones](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/Basic_characteristics_of_variants/7669_geoclones.ipynb).

UMAP for variant AF for [ID01](umaphttps://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20230114_7614_Ampliseq_QC/Basic_correlation/7614_variant_by_sample_heatmap.ipynb) and [ID05](https://github.com/shishenyxx/Human_Inhibitory_Neurons/blob/main/Analyses/20221223_7669_Ampliseq_QC/UMAP/7669_UMAP-Copy1.ipynb).

-----------------------------------

### 5. Contact:

:email: Changuk Chung: [chchung@health.ucsd.edu](mailto:chchung@health.ucsd.edu)

:email: Xiaoxu Yang: [xiy010@health.ucsd.edu](mailto:xiy010@health.ucsd.edu), [yangxiaoxu-shishen@hotmail.com](mailto:yangxiaoxu-shishen@hotmail.com)

:email: Joseph Gleeson: [jogleeson@health.ucsd.edu](mailto:jogleeson@health.ucsd.edu), or the Gleeson lab [gleesonlab@health.ucsd.edu](gleesonlab@health.ucsd.edu)

-----------------------------------

### 6. Cite the data and codes:
