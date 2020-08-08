#!/bin/sh
#$ -cwd    ## use current working directory
#$ -j no  ## merge stdout and stderr
#$ -pe smp 1
#$ -l scratch=8G
#$ -l h_rt=00:20:00
#$ -N extractCounts

set -e           # <-- abort if ANY command returns non-zero value
set -u           # <-- abort on undefined variables
set -o pipefail  # <-- show failed exit codes properly

module load CBI
module load fastqc

#Directory for all analyses.
dir_output=/wynton/group/gladstone/biocore/projects/ppg-srivastava-bruneau-black-oct-2019/bruneau/multiomic_rnaseq_hic_chip_atac/30.HiCcounts
dir_input=/wynton/group/gladstone/biocore/projects/ppg-srivastava-bruneau-black-oct-2019/bruneau/swetansu-hota-brm-hic-dec-2019/CoolerFiles
dir_bind=/wynton/group/gladstone/biocore/projects/ppg-srivastava-bruneau-black-oct-2019/bruneau/
container=/wynton/group/gladstone/biocore/containers/rb-HiCTools.sif

Region1=chr14:63456526-63575723
Region2=chr14:68880280-68880787

singularity exec --bind $dir_bind $container cooler dump $dir_input/D4_WT.mm9.mapq_30.1000.mcool::resolutions/1000 --range $Region1 --range2 $Region2 -b --join -o $dir_output/test.txt

#for file in $dir_data/*_R1_001.fastq.gz
#do
#	f=$(basename $file)
#	echo $f
#	$fastqMcfDir/fastq-mcf -o $dir_top/20.trimmed/${f/.fastq.gz/.trimmed.fastq.gz} \
#		-o $dir_top/20.trimmed/${f/_R1_001.fastq.gz/_R2_001.trimmed.fastq.gz} \
#		/wynton/group/gladstone/biocore/projects/bc-ct-1149/contaminants.fa \
#		$file \
#		${file/_R1_001.fastq.gz/_R2_001.fastq.gz}
#done


## End-of-job summary, if running as a job
[[ -n "$JOB_ID" ]] && qstat -j "$JOB_ID"

