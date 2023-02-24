#!/bin/bash
#SBATCH --job-name=Rmpi
#SBATCH --time=00:20:00
#SBATCH --nodes=2
#SBATCH	--ntasks-per-node=28
#SBATCH -A PZS1010
#SBATCH -e Rmpi.batch-%j.err ###%j will be replaced by the $SLURM_JOB_ID
#SBATCH -o Rmpi.batch-%j.out

set echo

#
cd $SLURM_SUBMIT_DIR

module load gnu/9.1.0
module load openmpi/1.10.7
module load  mkl/2019.0.5
module load  R/4.0.2


# parallel R: submit job with one MPI parent process
mpirun -np 1 R --slave < Rmpi.R

sleep 300
