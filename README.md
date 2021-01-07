## Population genomics of _Centurus santacruzi_ Complex

**This repository includes the following directories and files:**  
**_bin_**: contains four scripts and a parameter configuration file to run ipyrad;    
**_data_**: contains the directory *res_ipyrad*, which includes the ipyrad run (specified with the parameter configuration file and the script from bin) outputs, which constitute the input file for the subsequent analyses;      
**_meta_**: contains metadata of sequenced individuals (needed to run the filtering individuals option of vcftools).  
  
The _scripts_ contained in *bin* allow to complete the workflow represented in the following figure:  
  
![](workflow.png) 
  

**[_2-run_trimmomatic.sh_](/bin/2-run_trimmomatic.sh)** runs a loop for executing trimmomatic on raw samples, specifically the function slidingwindow. Slidingwindow starts scanning at the 5´ end and clips the readonce the average quality within the window (4 bp) falls below a quality threshold (20). **(Raw data is not included in the repository, so this script cannot be executed)**   
**[_3-run_ipyrad.sh_](/bin/3-run_ipyrad.sh)**
runs ipyrad, an interactive assembly and analysis toolkit for restriction-site associated DNA (RAD-seq) and related data types. Configuration parameters are specified in *params-run_w_refgen.txt*. **(Clean data is not included in the repository, so this script cannot be executed.)**   
**[_4-run_vcftools.sh_](/bin/4-run_vcftools.sh)** for filtering individuals and SNPs sites containing a maximun of 30% of missing data and write in a new vcf file; as well as calculating allele frequency, HWE statistics and inbreeding coefficient.**(run first)**    
**[_5-run_plink.sh_](/bin/5-run_plink.sh)** runs a basic command for converting .vcf format to .plink. **(run once vcftools instructions are completed)**    
**[_PCA-Structure.R_](/bin/PCA-Structure.R)** contains a script for performing Principal Components and Structure-like Analyses, as well as a test of outlier loci in the sample.**(run when plink and vcftools outputs have been obtained)**  
