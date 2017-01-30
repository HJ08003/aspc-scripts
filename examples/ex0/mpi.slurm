#!/usr/bin/env bash

#SBATCH --nodes 2               # << number of compute nodes
#SBATCH --ntasks-per-node=19    # << number of processors per compute node

#SBATCH -t 10:00
#SBATCH -J mpi
#SBATCH -o log-mpi.%j
#SBATCH --mail-type=begin
#SBATCH --mail-type=end

#SBATCH --reservation=advstats2017

echo '-------------------------------'
cd ${SLURM_SUBMIT_DIR}
echo ${SLURM_SUBMIT_DIR}
echo Running on host $(hostname)
echo Time is $(date)
echo SLURM_NODES are $(echo ${SLURM_NODELIST})
echo '-------------------------------'
echo -e '\n\n'

srun Rscript ./mpi.R 35
