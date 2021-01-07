## Population genomics of _Centurus santacruzi_ Complex

![](mela.jpeg) 

**This repository includes the data and scripts generated for the manuscript "The tangled evolutionary history of the Mesoamerican Velazquez Woodpecker complex (Centurus santacruzi, Aves: Picidae) revealed by using Next Generation Sequencing data" (in prep.). The repository is structured in three directories: _bin_, _data_ and _meta_. The content of each directory is delailed below.**
  
**[_bin_](/bin)**: contains the parameter configuration file to run ipyrad and four scripts for analyses illustrated in the figure below;    
  
![](workflow.png) 
  

**[_2-run_trimmomatic.sh_](/bin/2-run_trimmomatic.sh)** runs a loop for executing trimmomatic on raw samples, specifically the function slidingwindow. Slidingwindow starts scanning at the 5´ end and clips the readonce the average quality within the window (4 bp) falls below a quality threshold (20) **(Raw data is not included in the repository, so this script cannot be executed).**   
**[_3-run_ipyrad.sh_](/bin/3-run_ipyrad.sh)**
runs ipyrad, an interactive assembly and analysis toolkit for restriction-site associated DNA (RAD-seq) and related data types. Configuration parameters are specified in *params-run_w_refgen.txt* **(Clean data is not included in the repository, so this script cannot be executed).**   
**[_4-run_vcftools.sh_](/bin/4-run_vcftools.sh)** for filtering individuals and SNPs sites containing a maximun of 30% of missing data and write in a new vcf file; as well as calculating allele frequency, HWE statistics and inbreeding coefficient **(run first).**    
**[_5-run_plink.sh_](/bin/5-run_plink.sh)** runs a basic command for converting .vcf format to .plink **(run once vcftools instructions are completed).**    
**[_PCA-Structure.R_](/bin/PCA-Structure.R)** contains a script for performing Principal Components and Structure-like Analyses, as well as a test of outlier loci in the sample **(run when plink and vcftools outputs have been obtained).**   



**[_data_](/data)**: contains three directories *1.raw*, *2.ipyrad_outputs* and *3.clean_matrix*.  

1. raw contains the raw data as obtained by sequencing service
2. ipyrad_outputs includes the main output formats generated by ipyrad with parameters specified in 
3. clean matrix contains the final matrix obtained by filtering process with [vcftools](https://vcftools.github.io/), which constitute the input file for the subsequent population genomic analyses;  

**[_meta_](/meta)**: contains metadata of sequenced individuals (needed to run the filtering individuals option of vcftools).  The info contained in the metadata file include the Scientific name according to the [American Ornithological Union](https://americanornithology.org/publications/north-and-middle-american-checklist/), State of collection (in Mexico), Specimen Code, Latitude and Longitude.





 
