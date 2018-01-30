#!/usr/bin/env bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH -t 10:00
#SBATCH -J loop
#SBATCH -o log-loop.%j
#SBATCH --mail-type=begin
#SBATCH --mail-type=end

#SBATCH --reservation=ASPC2018

Rscript ./loop.R
