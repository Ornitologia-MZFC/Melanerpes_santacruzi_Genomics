## Population genomics of _Centurus santacruzi_ Complex

**Three directories are included in this repository:**  
**_bin_**: contains four scripts and a parameter configuration file to run ipyrad  
**_data_**: contains the directories *raw* (with "raw" sequence data of each sample), *clean* (with "clean" sequence data after trimming with Trimmomatic), *refgen* (containing the reference genome of _Centurus aurifrons_, the sister species), and *ipyrad_runs* (containing ipyrad run outputs, which constitute the input file fon the subsequent analyses)  
**_meta_**: contains metadata of sequenced individuals 
  
The _scripts_ contained in *bin* allow to complete the workflow represented in the following figure:  
  
![](workflow.png) 
  
**_run_trimmomatic.sh_** runs a loop for executing trimmomatic on raw samples, specifically the function slidingwindow. Slidingwindow starts scanning at the 5‟ end and clips the readonce the average quality within the window (4) falls below a quality threshold (20)    
**_run_ipyrad.sh_** runs ipyrad, an interactive assembly and analysis toolkit for restriction-site associated DNA (RAD-seq) and related data types. Configuration parameters are specified in *params-run_w_refgen.txt*   
**_run_vcftools.sh_** for filtering individuals and SNPs sites containing a maximun of 30% of missing data and write in a new vcf file; as well as calculating allele frequency, HWE statistics and inbreeding coefficient.  
**_run_plink.sh_** runs a basic command for converting .vcf format to .plink
