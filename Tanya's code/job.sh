#!/bin/bash
#SBATCH --time=00:59:00
#SBATCH --account=def-emodata
#SBATCH --mem=320000M

source /home/tmozgach/virtualenvironment/bin/activate

python2 ./mat.py $1
echo 'I finished'
