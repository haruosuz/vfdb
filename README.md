----------

Haruo Suzuki  
Last Update: 2016-10-25

----------

# Virulence Factors Database (VFDB) Project
Project started 2015-11-16.  

DNA and protein sequences of bacterial virulence factors were retrieved from the Virulence Factors Database (VFDB). 
Analyses of the DNA and protein sequences were performed using the R SeqinR package.
Homologous sequences were identified by the BLAST (Basic Local Alignment Search Tool) program.

## Project directories

    vfdb/
     README.md: project documentation
     data/: contains sequence data in FASTA or BLAST database format
     scripts/: contains Perl, R and Shell scripts
     analysis/: contains results of data analyses

## Data

DNA (`VFDB_setA_nt.fas`) and Protein (`VFDB_setA_pro.fas`) sequences of core dataset were downloaded on 2015-11-16 from <http://www.mgc.ac.cn/VFs/download.htm> into `data/`.

## Scripts

The perl script `blast_parser.pl` was downloaded on 2015-11-16 from <http://kirill-kryukov.com/study/tools/blast-parser/> into `scripts/`.

The shell script `scripts/run.sh` automatically carries out the entire steps: creating directories, downloading data and scripts, 
running the R scripts for FASTA amino acid and nucleotide of coding regions (`scripts/my_faa.R` and `scripts/my_ffn.R`), and 
running the shell script `scripts/run_blast.sh` for BLAST analysis.

Let's run the driver script in the project's main directory `vfdb/` with:

    bash scripts/run.sh > log.txt 2>&1 &

----------

## Inspecting Data

Inspecting and Manipulating Text Data with Unix Tools

    cd data/

    # `ls -lh` reports human-readable file sizes
    ls -lh *.fas

    # Inspecting Data with Head and Tail
    head -n 2 *.fas
    tail -n 2 *.fas

    # use `grep` to extract lines of a file that match a pattern
    grep '^>' *.fas
    # count how many lines match a pattern
    grep -c '^>' *.fas
    # the matching part of a pattern is colored, using:
    grep --color 'shock' *.fas

    # To search text and highlights matches, open a file in `less`, and 
    # then press / and enter text (e.g. 'O157'). To quit `less`, press q.
    less VFDB_setA_pro.fas

----------

## References
- [VFDB: Virulence Factors Database](http://www.mgc.ac.cn/VFs/)
 - [VFDB - Data download](http://www.mgc.ac.cn/VFs/download.htm)
 - [NEW INTERFACE](http://www.mgc.ac.cn/cgi-bin/VFs/jsif/main.cgi)

- [BLAST: eTutorials.org](http://etutorials.org/Misc/blast/)

- [BLAST® Command Line Applications User Manual - NCBI Bookshelf](http://www.ncbi.nlm.nih.gov/books/NBK279690/)
 - [Options for the command-line applications. - BLAST](http://www.ncbi.nlm.nih.gov/books/NBK279675/)
 - [Building a BLAST database with local sequences](http://www.ncbi.nlm.nih.gov/books/NBK279688/)
 - [Extracting data from BLAST databases with blastdbcmd](http://www.ncbi.nlm.nih.gov/books/NBK279689/)

----------
