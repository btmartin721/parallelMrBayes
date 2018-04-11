# parallelMrBayes
*Written by B.T. Martin and T.K. Chafin*

**Runs MrBayes on multiple loci in parallel. Also automatically writes a MrBayes block into each nexus file**

Usage:  
`./parallelMB.pl -i /path/to/dir/*.nex -p <#processors> [options]...`

Each locus must be a separate nexus file  
MrBayes (mb) and mbsum (BUCKy - Bayesian Concordance Analysis) must be in your path  

The script takes nexus files as input, but can also convert .fasta to .nex format  
If you want the script to convert .fasta files to .nex, use the [-e, --nex] option  

Here's a conversion script to go from .loci (outfile from pyRAD) to .fasta: [file_converters repository](https://github.com/btmartin721/file_converters/blob/master/loci2fasta.py)  

