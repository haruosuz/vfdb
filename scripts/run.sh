#!/bin/bash
set -euo pipefail

# Creating directories
mkdir -p ./{data/$(date +%F),analysis/$(date +%F)}

# Downloading scripts
wget -P scripts/ http://kirill-kryukov.com/study/tools/blast-parser/blast_parser_1.1.5.zip
unzip scripts/blast_parser_1.1.5.zip -d scripts

# Downloading data
#wget -nv -P data/ http://www.mgc.ac.cn/VFs/Down/VFDB_setA_nt.fas.gz http://www.mgc.ac.cn/VFs/Down/VFDB_setA_pro.fas.gz
curl http://www.mgc.ac.cn/VFs/Down/VFDB_setA_nt.fas.gz > data/VFDB_setA_nt.fas.gz
curl http://www.mgc.ac.cn/VFs/Down/VFDB_setA_pro.fas.gz > data/VFDB_setA_pro.fas.gz

gunzip -c data/VFDB_setA_nt.fas.gz > data/VFDB_setA_nt.fas
gunzip -c data/VFDB_setA_pro.fas.gz > data/VFDB_setA_pro.fas

# Running R scripts
Rscript --vanilla scripts/my_faa.R
Rscript --vanilla scripts/my_ffn.R

# Running BLAST script
bash scripts/run_blast.sh

# Print operating system characteristics
uname -a

echo "[$(date)] $0 has been successfully completed."
