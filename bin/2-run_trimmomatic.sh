## loop for executing trimmomatic on raw samples(not included in this repository)
## SLIDINGWINDOW: Performs a sliding window trimming approach. It starts scanning at the 5‟ end and clips the readonce the average quality within the window (4) falls below a threshold (20)

for i in ../data/raw/*.fastq.gz; 
    do java -jar trimmomatic-0.38.jar SE -phred33 $i ../data/clean/clean_$i SLIDINGWINDOW:4:20; 
    done
