library(lsa)
library(pheatmap)
library(ggfortify)

data <- read.table("../output/methylation_per_gene.tsv",header=TRUE, sep="\t")
row_names = make.names(data[,1], unique = TRUE)
ready <- data[-1]
row.names(ready) <- row_names

top_200_diff_exp = c('PTPRD','LDB2','SATB2','IQCJ-SCHIP1','SV2B','PHACTR1','MLIP','FAM19A1','NELL2','RALYL','FSTL4','PRKCB','CABP1','CHN1','SLIT3','NRGN','EPHA4','CNKSR2','CADPS2','NRG1','RFTN1','HECW1','ANO3','PTPRK','RAPGEF5','KIAA1211L','SLC17A7','ARHGAP10','LMO4','EFNA5','CAMK2A','KHDRBS2','ENC1','CPNE4','HOMER1','NREP','PPP3CA','DPYD','MYO1D','PPM1L','LMO3','NGEF','ATP2B1','OLFM1','SLC22A10','SLC8A2','MCHR2','GRIN2A','KCNH7','POU6F2','CACNG3','NDFIP2','MAST3','FBXO32','CACNA2D1','LNX1','SH3GL2','KCNQ5','LINGO1','CA10','ARPP19','PHYHIP','RGS6','CBLN2','BAIAP2','ATP2B2','FAT3','NKAIN2','AGBL4','EGR1','SSBP3','ZBTB18','TESPA1','SMAD3','CUX2','LRFN5','ACTN1','KCNV1','RASGRP1','CDH22','MARCH1','COL24A1','CREG2','GDA','NLK','IPCEF1','SORBS2','MAL2','KCNH1','SYTL2','CNTN3','SYT7','KCTD1','SNCA','CAMK4','HS3ST4','NRN1','PCSK2','EPHA5','FOXP2','SPOCK3','ZNF536','ZNF385D','GAD1','GAD2','GRIP1','SLC6A1','NHS','PTPRM','SLC24A3','VWC2','ERBB4','GRIK1','MAF','IGF1','SNRPN','ANK1','NXPH1','BTBD11','RBMS3','KCNC2','DLX1','KAZN','ANKRD55','DNER','GRIN2D','GRIK2','SYNPR','KCNIP1','TIAM1','PLD5','ARX','MAFB','RPS6KA2','PTCHD4','UBASH3B','KIAA1211','KIF26B','PITPNC1','DGKD','ROBO1','BCL11B','PARD3','MTSS1','TENM3','NXPH2','INPP4B','QKI','ANO4','KCNAB1','ADCYAP1R1','ELAVL2','HUNK','EGFR','DOCK11','ROBO2','SHISA6','MYO5B','ADARB2','KIAA1217','LHX6','MCC','ZNF608','GRIN3A','SLC35F4','ALK','PROX1','NTN4','CNTN5','TOX2','EEPD1','DAB1','GPR149','THSD7A','VAV2','TOX3','KCNS3','GABRG3','ARL4C','RND3','RAB3C','ADRA1A','AMOTL1','NRIP3','SOX6','MYRIP','ADCY8','RERG','SOX1','TAC1','DOCK10','ENTPD3','CMTM8','RNF144B','SDK1','MITF','CNTNAP4','COL25A1','LYPD6','ELFN1')
filtered <- ready[top_200_diff_exp,]

filtered <- filtered[complete.cases(filtered),]
filtered_matrix <- as.matrix(filtered)

setEPS()
postscript("../output/plot.eps")
heatmap(cosine(filtered_matrix),scale="none",Rowv=FALSE, Colv=FALSE,margins=c(20,20))
dev.off()

#pdf(file="../output/plot/pdf")
#heatmap(cosine(filtered_matrix),scale="none",Rowv=FALSE, Colv=FALSE,margins=c(20,20))
#dev.off()