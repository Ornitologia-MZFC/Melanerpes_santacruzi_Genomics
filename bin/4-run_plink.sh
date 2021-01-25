## create a directory for plink outputs
mkdir ../data/res_plink

## convert vcf files to plink format (.bim, .bam, .fam), needed for R analyses
plink --vcf ../data/res_vcftools/santacruzi3030.recode.vcf --make-bed --allow-extra-chr --out ../data/res_plink/santacruzi3030




