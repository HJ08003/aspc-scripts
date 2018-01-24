#!/usr/bin/env bash

#SBATCH -N 2
#SBATCH --ntasks-per-node=2
##SBATCH -n <number>
#SBATCH -t 10:00
#SBATCH -J Ex4
#SBATCH -o log.%j
#SBATCH --mail-type=begin
#SBATCH --mail-type=end


#SBATCH --reservation=ASPC2018

echo '-------------------------------'
cd ${SLURM_SUBMIT_DIR}
echo ${SLURM_SUBMIT_DIR}
echo Running on host $(hostname)
echo Time is $(date)
echo SLURM_NODES are $(echo ${SLURM_NODELIST})
echo '-------------------------------'
echo -e '\n\n'

module load openmpi/gcc/2.1.0/64

srun Rscript ./ex4.R 15
