# parallelMrBayes
Runs MrBayes on multiple loci in parallel

Usage: ./parallelMB.pl -i /path/to/dir/*.nex -p <#processors> [options]...

MrBayes (mb) and mbsum (BUCKy - Bayesian Concordance Analysis) must be in your path

The script takes nexus files as input, but can also convert .fasta to .nex format
If you want parallelMB.pl to convert .fasta files to .nex, use the [-e, --nex] option

A conversion script to go from .loci (outfile from pyRAD) to .fasta is located on my GitHub (btmartin721/file_converters/loci2fasta.py)
