[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/olmjo/tigress-scripts/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

# ASPC-scripts (Copied from Jonathan Olmsted's TIGRESS-scripts github, and revised accordingly)
Setup and Example scripts (mostly) for R-based HPC at Princeton University

Contact Hubert Jin (hubertj@princeton.edu) with questions or issues.

## What?

This project comprises a set of multiple example scripts and a setup script to
help prepare your HPC environment for R-based HPC. These scripts work *out of
the box* on Tukey, Della, and Adroit. There are some additional examples of using
Python and Matlab, but these are not the focus.  More information on these
scripts is below.

## Where?

These scripts have been tested on:
- Adroit
- Tukey
- Della

If you are using one of these systems and something isn't working, please email
for support.

## How?

### Getting a Copy

You can create a full copy of this git repository by cloning it. To do this, run
the following at the shell prompt from one of these systems:

```
git clone https://github.com/HJ08003/ASPC-scripts
```

On the Princeton TIGRESS systems, `git` will be installed so this "just
works". The same `git` command will work on your local machine if you have `git`
installed.

### Using

Start by navigating into the repository directory:

```
cd tigress-scripts
```

#### Setup and Test Scripts
For all of the example scripts to work, the shell environment needs to be set up
correctly and particular R packages need to be installed. The helper setup
script is located in `./setup/setup.sh`. To set up your environment, simply run
the script:
```
cd setup
./setup.sh
```

**Warning:** If you have never used R on these machines before, you start first
  start R, install any package at all, and then quit R before
  proceeding. Without having installed any R package in this way, the subsequent
  setup scripts won't work.

You will be prompted by several questions like

```
@ Do you want to set up your account to use an updated compiler version?
    Note 1: may be necessary for some R packages
    Note 2: only needs to be done once per system
    Note 3: may have no effect on certain machines
[y/n]

@ Do you need to DL Rmpi?
[y/n]


@ Do you need to add OpenMPI support?
    Note: needs to only be added once
[y/n]


@ Do you need to install Rmpi?
[y/n]


@ Do you need to install misc. HPC R packages?
[y/n]

```

If you've never run this before, answer "y" to each question.

To test the openmpi setup run the following:
```
cd ../test/
./test_mpi.sh
```

You should see output like:
```
Process 1 on tukey out of 3
Process 2 on tukey out of 3
Process 0 on tukey out of 3
```

#### Examples

There are a series of example scripts in this project. Each example can be used
to submit a perfectly valid job on the above listed systems. They are located in
the `./examples/` subdirectory. The shell scripts with a `.slurm` suffix are SLURM scripts. 

##### Example 1: Bare Bones

This is a bare bones example. It requests 1 task with 1 processor. It allows the
scheduler to kill the job after 10 minutes. The script simply generates 1,000
random numbers using the Rscript interface to R.

To run under SLURM:
```
cd ./examples/ex0/
sbatch ex0.slurm
```

##### Example 2: A Reasonable Default

This script represents a reasonable starting point for simple jobs. It is
more explicit about how the job should be managed than Example 0. It still
requests 1 task with 1 processor. It requests only 10 minutes of time. It uses a
custom name in the queue and has both the error log and the output log merged
into one file which begins with log.* and has a suffix determined by the job
ID. It requests emails when it begins, ends, and aborts (the email address can
be specified manually, but works by default on TIGRESS systems).

Every line beginning with # is just a scheduler directive. The remainder
comprises an actual shell script. The script is verbose about where it is, when
it starts, and what resources were given to it by the scheduler.

The script ultimately generates 1,000 random numbers using the Rscript interface
to R.

To run under SLURM:
```
cd ./examples/ex1/
sbatch ex1.slurm
```

##### Example 3: Example 2 + an external R script

This script includes all the reasonable defaults from Example 1. The only
change is that it uses Rscript to run an external R script, which is how the job
would usually be programmed.

The computational task in R is a copy of the example usage of `ideal()` from the R
package **pscl**.

To run under SLURM:
```
cd ./examples/ex2/
sbatch ex2.slurm
```

##### Example 4: Example 3 + parallel execution + passing arguments to R

This job script uses the sample reasonable defaults from above, but it requests
3 tasks with 1 processor each. These tasks may land on the same physical
node, or not.

The R script uses an MPI backend to parallelize an R foreach loop across
multiple nodes. A total of 3 * 1 = 3 processors will be used for this job (but 1
task is kept for the "master" process). When running the R script, we pass the
value "10" as an unnamed argument. The R script then uses this value to
determine how many iterations of the foreach loop to run.

Each iteration of the foreach loop simply pauses for 1 second and then returns
some contextual information in a dataframe. This information includes where that
MPI process is running and what it's "id" is.

To run under SLURM:
```
cd ./examples/ex3/
sbatch ex3.slurm
```

##### Example 5: Example 3 + job arrays + passing arguments to R

This script now requests an array of jobs based on the template. For jobs in
this array (indexed from 1 to 3), the shell script will run given the requested
resources. Because the log file depends on the job ID, each of the three jobs
will generated different log.* output. Because R can read environmental
variables we are able to use the index on an object of interest to us in R
(e.g., a vector of names of files in a directory to be processed).

With this setup, each sub-job is requesting the same resources.

To run under SLURM:
```
cd ./examples/ex4/
sbatch ex4.slurm
```

##### Example 6: "Substantive" Example Supporting Cross-Node Execution

This example is less a demonstration of features available (e.g., there is no
use of job arrays or command line arguments) and, instead, shows a computational
job that provides a good template for many other embarrassingly parallel
computational tasks. Here, the goal is use the non-parametric bootstrap to
approximate the sampling distribution of correlation coefficients based on
samples of size 25. The correlation of interest is between average undergraduate
GPA and average LSAT scores among students at 82 different law schools.

The output generated from the R script is just the deciles from this
distribution (without acceleration or bias-correction).

To run under SLURM:
```
cd ./examples/ex6/
sbatch ex6.slurm
```

##### Example 7: "Substantive" Example with Multiple Cores on a Single Node

This example mirrors Example 6. However, it demonstrates use of a single task,
where that task uses multiple processes.

To run under SLURM:
```
cd ./examples/ex7/
sbatch ex7.slurm
```

##### Example 8: single-node non-parallel R job with Rcpp

To be developed ...

To run under SLURM:
```
cd ./examples/ex8/
sbatch ex8.slurm
```


#### Index of Topics 
- common scheduler directives: Example 2
- sequential execution of scripts: Examples 3, 8 (TBD)
- misc. shell commands in job scripts: Example 2
- job arrays: Example 5
- passing command line arguments: Example 5
- reading shell environmental variables: Examples 4, 6, 7
- dynamic parallelization (i.e., not hard coding processors): Examples 4, 6
- single-node, multiple-core parallelization: Example 7
- multiple-node parallelization
  - with openmpi: Examples 4, 6
  - with job arrays: Example 5
