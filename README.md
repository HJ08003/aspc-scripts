# Example Tigress Script

Jonathan Olmsted (jpolmsted@gmail.com)

## Disclaimer

These scripts are intended as an example of how to use HPC resources (TIGRESS)
at Princeton University. The various examples comprise different use cases and
can be customized to anyone's liking. Nothing is a substitute for reading the
man page: just run `man qsub` for a starting point.

## Access and Use

Anyone is free to use these scripts as they choose. You can not only view them
through gh, but you can download a copy locally and run them (Note: they don't
have many dependencies, but I can only guarantee them to work on TIGRESS
systems.)

The easiest way to get a copy is:
```
git clone https://github.com/olmjo/tigress-scripts.git
```

Then, you can
```
cd ./tigress-scripts/examples/ex0/
qsub ex0.pbs

```
to submit your first job.


## Contents

There are a total of five sets of scripts in this project. Each set can be used
to submit a perfectly legal job on Della (and elsewhere, usually). They are
located in `./examples/`. The shell scripts with a `.pbs` suffix are PBS scripts
for the resource manager to submit. The scripts with a `.R` suffix are R scripts
that represent our computational jobs. The concepts covered here
should cover most usage.

### ex0 -- bare bones

This is a bare bones example. It requests 1 node with 1 processor on the
node. It allows the scheduler to kill the job after 10 minutes. The script
simply generates 1,000 random numbers using the `Rscript` interface to `R`.

See `./examples/ex0/`.

### ex1 -- a reasonable default

This PBS script represents a reasonable starting point for simple jobs. It is
more explicit about how the job should be managed than Example 0. It still
requests 1 node with 1 processor. It requests only 10 minutes of time. It uses a
custom name in the queue and has both the error log and the output log merged
into one file which begins with `log.*` and has a suffix determined by the job
ID. It requests emails when it begins, ends, and aborts (the email address can
be specified manually, but works by default on TIGRESS systems).

Every line beginning with `#` is just a PBS directive. The remainder comprises
an actual shell script. The script is verbose about where it is, when it starts,
and what resources were given to it by the scheduler.

The script ultimately generates 1,000 random numbers using the `Rscript`
interface to `R`.

See `./examples/ex1/`.

### ex2 -- ex 1 + an R script

### ex3 -- ex 2 + parallel execution + passing arguments to R

### ex4 -- ex 2 + multiple simultaneous submissions + passing arguments to R

