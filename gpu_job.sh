#!/bin/bash
#SBATCH --time=00:20:00
#SBATCH --nodes=1 --ntasks-per-node=14  --gpus-per-node=1
#SBATCH --job-name=partialGPUjob
#SBATCH --account=PZS1010
#SBATCH -e gpu.batch-%j.err ###%j will be replaced by the SLURM_JOB_ID
#SBATCH -o gpu.batch-%j.out

cd $SLURM_SUBMIT_DIR

#Load cuda module for Nvidia libraries
module load cuda/11.6.1
module load R/4.2.1-gnu11.2

#output goes to the slurm job output file
echo -e "This is a partial node GPU job:"
scontrol show node $SLURMD_NODENAME


#Run an R script for matrix multiplication
Rscript  gpuCode.R

sleep 300
