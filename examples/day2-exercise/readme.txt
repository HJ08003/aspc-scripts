loop-vs-parallel.R is the code used in day1 slides.

From there, the code is spilted into to separate programs: loop.R is the 1 loop solution, and parallel.R is the dopar solution. parallel.R now take an input number for the number of workersi (nProcs).

Corresponding slurm files are created so that them can be cut-and-paste in RStudio (nProcs need a value), and also be executed on TIGRESS clusters.

