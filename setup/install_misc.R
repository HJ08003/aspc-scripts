local({r <- getOption("repos");
       r["CRAN"] <- "http://cran.r-project.org";
       options(repos=r)
   }
      )

install.packages(c("doMPI",
                   "foreach",
                   "snow",
                   "doSNOW",
                   "doParallel",
                   "doRNG",
                   "doMC",
                   "Rcpp",
                   "RcppArmadillo",
		   "pscl",
		   "coda"
                   )
                 )

library(doMPI)
library(foreach)
library(snow)
library(doSNOW)
library(doParallel)
library(doRNG)
library(doMC)
library(Rcpp)
library(RcppArmadillo)
library(pscl)
library(coda)

