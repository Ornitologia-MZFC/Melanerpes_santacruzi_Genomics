#PCA

#Load packages
library(gdsfmt)
library(SNPRelate)
library(ggplot2)
library(ape)

#Convert plink to gds
snpgdsBED2GDS("../data/res_plink/santacruzi3030.bed", "../data/res_plink/santacruzi3030.fam", "../data/res_plink/santacruzi3030.bim", "../data/res_plink/gds3030.gdsfn", family = FALSE, snpfirstdim = NA, compress.annotation = "LZMA_RA", compress.geno = "", option = NULL, cvt.chr = c("char"),cvt.snpid = c("auto","int"), verbose = TRUE)

#Summary
snpgdsSummary("../data/res_plink/gds3030.gdsfn")

#Load gds file
genfile3030<-snpgdsOpen("../data/res_plink/gds3030.gdsfn")

#SNP IDs
head(read.gdsn(index.gdsn(genfile3030, "snp.id")))
sample.id1<-read.gdsn(index.gdsn(genfile3030, "sample.id"))

#PCA
str(genfile3030)
str

#Run PCA
pca1<-snpgdsPCA(genfile3030,sample.id = NULL, snp.id = NULL, autosome.only = FALSE )


tab1 <- data.frame(sample.id = pca1$sample.id,
                 EV1 = pca1$eigenvect[,1],    # the first eigenvector
                 EV2 = pca1$eigenvect[,2],    # the second eigenvector
                 stringsAsFactors = FALSE)       
 

head(tab1)
pc.percent1 <- pca1$varprop*100
x<-round(pc.percent1, 2)

sum(x[1:4])
sum(x[1:10])
sum(x[1:30])

### para definir el tema del grafico y que no salga por default como todos los de ggplot
theme<-theme(panel.background = element_blank(),panel.border=element_rect(fill=NA),panel.grid.major = element_blank(),panel.grid.minor = element_blank(),strip.background=element_blank(),axis.text.x=element_text(colour="black"),axis.text.y=element_text(colour="black"),axis.ticks=element_line(colour="black"),plot.margin=unit(c(1,1,1,1),"line"))

ggplot(data = tab1, aes(x=EV2, y=EV1)) + geom_point() +
  ylab(paste0("eigenvector 1 explaining ", round(pc.percent1, 2)[1], "%")) +
  xlab(paste0("eigenvector 2 explaining ", round(pc.percent1, 2)[2], "%"))+
    geom_text(label=(sample.id1),size=3.5, hjust = 0, nudge_x = 0.02, check_overlap = TRUE) +ggtitle("PCA") +
  theme


#########################################################################################################################################


## load package
library(LEA)

## convert vcf to geno
vcf2geno("../data/res_vcftools/santacruzi3030.vcf", output.file = "../data/res_vcftools/santacruzi3030.geno", force = TRUE)

## Inference of individual admixture coefficients using snmf
obj.at = snmf("../data/res_vcftools/santacruzi3030.geno", K = 1:8, ploidy = 2, entropy = T, CPU = 2, repetitions = 10, project = "new")

## Choosing the number of clusters
plot(obj.at, col = "blue4", cex = 1.4, pch = 19)    

## Plotting admixure coefficients
my.colors <- c("orange","steelblue","lightgreen")
barchart(obj.at, K = 3, run = 4,
         border = NA, space = 0,
         col = my.colors,
         xlab = "Individuals",
         ylab = "Admixture coefficients",
         main = "") -> bp


###################################################
###### Population differentiation tests
###################################################

p = snmf.pvalues(obj.at,
                 entropy = TRUE,
                 ploidy = 2,
                 K = 3)
pvalues = p$pvalues
par(mfrow = c(2,1))
hist(pvalues, col = "orange")
plot(-log10(pvalues), pch = 19, col = "blue", cex = .7)  
  
  



 
