#!/usr/bin/env bash

##  SBATCH --ntasks=50
##  SBATCH --cpus-per-task=1

#SBATCH -N 2
#SBATCH --ntasks-per-node=10

##  SBATCH -n <number>


#SBATCH -t 10:00
#SBATCH -J mpi
#SBATCH -o log-mpi.%j
#SBATCH --mail-type=begin
#SBATCH --mail-type=end

echo '-------------------------------'
cd ${SLURM_SUBMIT_DIR}
echo ${SLURM_SUBMIT_DIR}
echo Running on host $(hostname)
echo Time is $(date)
echo SLURM_NODES are $(echo ${SLURM_NODELIST})
echo '-------------------------------'
echo -e '\n\n'

srun Rscript ./mpi.R 35
