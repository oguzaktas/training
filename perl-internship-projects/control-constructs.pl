#!/usr/bin/perl

use warnings;
use strict;

print "How many lines? "; # read the number
my $num = <STDIN>;
$num > 0 or die "Num must be positive, you entered $num";

# read in the strings
my $accum = "";
my $sep = "";
while(my $line = <STDIN>) {
    chomp $line;
    if($line eq "Stop!") { last; }
    $accum = "$accum$sep$line";
    if(--$num == 0) { last; }
    $sep = " ";
}

print "$accum\n";
