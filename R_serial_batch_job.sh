#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --time=00:10:00
#SBATCH --account=PZS1010
#SBATCH --job-name=Rserial
#SBATCH -e Rserial.batch-%j.err ###%j will be replaced by the $SLURM_JOB_ID
#SBATCH -o Rserial.batch-%j.out


cd $SLURM_SUBMIT_DIR

module load gnu/9.1.0
module load openmpi/1.10.7
module load  mkl/2019.0.5
module load  R/4.0.2

#download data
curl -L https://figshare.com/ndownloader/files/30850678 \
        --output university_ht_wt

#copy data and R script to $TMPDIR
cp university_ht_wt Rserial.R $TMPDIR

#move to $TMPDIR
cd $TMPDIR

#Run R script
R CMD BATCH Rserial.R Rserial.Rout

#copy output back to $SLURM_SUBMIT_DIR
cp Rserial.Rout regression-output.txt  $SLURM_SUBMIT_DIR

sleep 300
