#!/bin/bash
#SBATCH --ntasks 1
#SBATCH --time 2:0:0
#SBATCH --qos bbdefault
#SBATCH --mail-type ALL

set -e

module purge; module load bluebear
