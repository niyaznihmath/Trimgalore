#!/bin/bash


#SBATCH -A b2014097
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 200:00:00
#SBATCH -J trim-galore-check
#SBATCH -o /proj/b2014097/nobackup/Niyaz/logs/trim-galore-check.out
#SBATCH -e /proj/b2014097/nobackup/Niyaz/logs/trim-galore-check.err

module load bioinfo-tools
module load TrimGalore/0.4.1
module load FastQC/0.11.5
module load cutadapt/1.13

for read1 in *R1_001.fastq.gz; do read2=$(echo $read1| sed 's/R1_001.fastq.gz/R2_001.fastq.gz/'); trim_galore --paired --phred33 --fastqc --length 25 --illumina $read1 $read2 ; done