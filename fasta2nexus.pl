#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;
use File::Path;
use File::Basename;

# Declare variables

our $input;     

parseArgs(); 

my $line; 
my $taxa;
my $nchar;
my @data;
my @names;
my @loci;
my @fasta;
my $name;
    
my ( $filepath, $dirpath ) = fileparse($input);    
#print $filepath, "\n";
#Iterate through files
#print $dirpath, "\n";

#opendir(DIR, "$dirpath") or die "Couldn't open the directory $dirpath\n";
#my @files = readdir(DIR);
#closedir(DIR);

#my @files = glob "$input";
#print $files[0], "\n";

my @files = <$dirpath/*.fasta>;
#print @files, "\n";

foreach my $file ( @files ){ 

	#next if ($file =~ /^\.$/);
	#next if ($file =~ /^\.\.$/);
	
#print $file, "\n";
undef @data;
undef @names;
$taxa = 0;
 
    open ( FILE, "$file" ) || die "Do I need to call the short bus?\nCan't open $file: $!\n";
	while ( <FILE> ){
			chomp;
			 
			if( $_ =~ /^\>/ ){
				$taxa++; 
				$_ =~ /^\>(\S+)/;
				$name = "$1";
				push @names, "$name";
			}elsif( $_ =~ /^\s*$/ ){
				next;
			}elsif( $_ =~ /^\s*#/ ){
				next;
			}else{
				push @data, $_ ;
				$nchar = length;
			}
    }
    close FILE;

    #Capture taxa name to use as identifier
	my $filepath = fileparse("$file");
	$filepath =~ /(\w+)\.\w/;
	my $ID = $1;

    open( OUT, '>', "$dirpath$ID.nex" ) || die "Do I need to call the short bus?\nCan't write to $ID.nex\n";		
         print OUT "#NEXUS\n\n";    
         print OUT "BEGIN DATA;
DIMENSIONS NTAX=$taxa NCHAR=$nchar;
FORMAT DATATYPE=DNA MISSING=? GAP=- ;

MATRIX\n";

	for ( my $i = 0; $i<scalar @names; $i++ ){	
		print OUT "$names[$i]\t$data[$i]\n";
	}
    print OUT ";\n";

    print OUT "END;\n\n";
	
}
close OUT;	
exit;
###########################SUBROUTINES###################################

sub parseArgs{ 
	#Message to print if mandatory variables not declared
	my $usage ="\nUsage: $0 --i /path/to/input/directory/*.fasta
Mandatory 
	--i   -  path to the input files in fasta format 
\n";

	my $options = GetOptions 
		( 
		'input|i=s'		=>	\$input,
		);
		
	$input or die "\n\nDo I need to call the short bus?: Input not specified!\n\n$usage\n"; 
}

#########################################################################
