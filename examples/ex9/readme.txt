The R code runs under the command line, but will fail if submitted as a slurm job.

The reason is that only the head node has the cpp compiler. Others don't have it, and thus will fail.

Solution: (1) Create a R package and have it compiled for rcpp ahead of time.
          (2) In the R code, the package will be imported and functions used.

Create a module in R:
library("Rcpp")
Rcpp.package.skeleton(name = "mymodule")

Install the module in UNIX/LINUX shell:
R CMD INSTALL mymodule

