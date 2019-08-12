#! /usr/bin/perl -w
# take B73 methylation data and subset into RdDm (CHH), heterochromatin (CG and CHG), gene body (CG), and remaining
# B73_methyl_class.pl
# 8_Feb_2017
# Jaclyn_Noshay

use warnings;
use strict;
use Getopt::Std;

#set soft coded files
my $usage = "\n0 -i in -o out\n";
our ($opt_i, $opt_o, $opt_h);
getopts("i:o:h") || die "$usage";

#check that all files are defined
if ( (!(defined $opt_i)) || (!(defined $opt_o)) || (defined $opt_h) ) {
  print "$usage";
}

#read in files 
open (my $in_fh, '<', $opt_i) || die;
open (my $out_fh, '>', $opt_o) || die;

print $out_fh "Chr\tStart\tEnd\tCG_ratio\t-\tCG_C\tCG_CT\tCHG_ratio\t-\tCHG_C\tCHG_CT\tCHH_ratio\t-\tCHH_C\tCHH_CT\tClass\n";

my $class;
my $header = <$in_fh>;
while (my $line = <$in_fh>) {
  chomp $line;
  my ($chr, $start, $end, $cg, undef, undef, undef, $chg, undef, undef, undef, $chh, undef, undef, undef) = split ("\t", $line);

  if ($chh > 0.15) {
    $class = "RdDM";
  }
  elsif ($cg > 0.40 && $chg > 0.40) {
    $class = "heterochromatin";
  }
  elsif ($chg > 0.40) {
    $class = "gene_body";
  }
  else {
    $class = "remaining";
  }

  print $out_fh "$line\t$class\n";
}

close $in_fh;
close $out_fh;
exit;
