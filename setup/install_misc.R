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
		   "ggplot2",
##		   "MASS",
		   "reshape",
##		   "plyr",
		   "microbenchmark",
		   "Zelig",
		   "knitr",
		   "bootstrap",
		   "coda"
                   )
                 )

