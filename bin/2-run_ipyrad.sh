
## run ipyrad with parameters specified in params-run_w_refgen.txt
ipyrad -p params-run_w_refgen.txt -s 1234567


## check statistics from each step
ipyrad -p params-run_w_refgen.txt -s 6


## Check out the .loci output (the ipyrad native internal format)
less ../data/res_ipyrad/run_w_refgen/*.loci
