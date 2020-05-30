## path to vcf input
path_to_input=../data/res_ipyrad/run_w_refgen

## make a new directory for saving outputs from vcftools
mkdir -p ../data/res_vcftools

## path to vcf output
path_to_output=../data/res_vcftools

## show number of samples and sites
vcftools --vcf $path_to_input/*.vcf

## filtering SNPs sites containing a maximun of 30% of missing data and write in a new vcf file
vcftools --vcf $path_to_input/*.vcf --max-missing 0.70 --recode --out $path_to_output/santacruzi_miss30

## ver el porcentaje de datos perdidos en cada individuo luego del filtrado
vcftools --vcf $path_to_output/santacruzi_miss30.recode.vcf --missing-indv --out $path_to_output/santas_missind

## remove individual with more of 30% of missing data
vcftools --vcf $path_to_output/santacruzi_miss30.recode.vcf --max-missing 0.70 --remove ../meta/mylist.txt --recode --out $path_to_output/santacruzi3030

## Outputs the allele frequency for each site
vcftools --vcf $path_to_output/santacruzi3030.recode.vcf --het --out $path_to_output/santas3030_freq

## Calculate heterozygosity of individuals. The inbreeding coefficient, F, is estimated for each individual using a method of moments.  
vcftools --vcf $path_to_output/santacruzi3030.recode.vcf --het --out $path_to_output/santas3030_het

## Reports a p-value for each site from a Hardy-Weinberg Equilibrium
vcftools --vcf $path_to_output/santacruzi3030.recode.vcf --hardy --out $path_to_output/santas3030_hardy




