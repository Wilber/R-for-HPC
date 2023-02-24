#List all software modules
module avail

#load R
module load R/version

#for example,
#get possible R versions
module spider R
module load R/4.2.1-gnu11.2

#Running R interactively on terminal:
#Request access to a compute node
sinteractive -A PZS1010 -N 1 -n 4 -t 01:00:00 #one hour max

#exit
exit


#interactively, for more than an hour
##sinteractive
salloc --help
#Request 2 nodes, 3 ppn
salloc -A PZS1010 -t 02:10:00  -N 1 -n 3 #NOTE: still on the login node

#check job status
squeue -u <userName>
#use srun to run a shell (/bin/bash command) on an allocated node, and connect your terminal to its input and output.
srun --jobid=$SLURM_JOB_ID --pty /bin/bash #NOTE: srun syntax: srun --options command

#run your job commands:
module load R/4.2.1-gnu11.2
R


exit
#NOTE: allocation still available even after exiting! Unlike sinteractive
squeue -u  <userName>
##REMEMBER TO REMOVE ALLOCATION!
scancel $SLURM_JOB_ID #allocation revoked

#Batch jobs:
#Example Batch script:
