#!/bin/bash
set -euo pipefail

# Variables
DB=data/VFDB_setA_pro.fas; DBTYPE=prot; PROGRAM=blastp
#DB=data/VFDB_setA_nt.fas; DBTYPE=nucl; PROGRAM=blastn

# Building a BLAST database with local sequences
makeblastdb -in $DB -dbtype $DBTYPE -hash_index -parse_seqids

# Extracting data from BLAST databases with blastdbcmd
NAME="Helicobacter.pylori.J99"
NAME="33593244" # (gi:33593244) bscN - putative ATP synthase in type III secretion system [Bordetella pertussis Tohama I]
QUERY=data/$NAME.fasta

blastdbcmd -db $DB -entry all -outfmt "%i %t" | grep "$NAME" | awk '{print $1}' | \
 blastdbcmd -db $DB -entry_batch - > $QUERY

# Running BLAST
EVALUE=1e-05
OUTPUT=analysis/${PROGRAM}-$(basename $QUERY)-$(basename $DB).out

$PROGRAM -db $DB -query $QUERY -evalue $EVALUE \
 -max_target_seqs $(grep -c '^>' $DB) -outfmt 0 > $OUTPUT

# Parsing BLAST output
perl scripts/blast_parser.pl < $OUTPUT > $OUTPUT.parsed
cat $OUTPUT.parsed

