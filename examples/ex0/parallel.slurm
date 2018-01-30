#!/usr/bin/env bash

##   SBATCH -N 1

#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH -t 10:00
#SBATCH -J parallel
#SBATCH -o log-parallel.%j
#SBATCH --mail-type=begin
#SBATCH --mail-type=end

#SBATCH --reservation=ASPC2018

Rscript ./parallel.R 8
