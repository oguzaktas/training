#!/usr/bin/perl

use warnings; # for enabling compiler warnings, as they may highlight potential trouble
use strict; # for asking the compiler to be more strict, make sure we declare our variables etc.

print "What file would you like to read from?\n"; # filename (with extension)

chomp(my $filename = <STDIN>);

open my $file, "<", $filename or die "Can't open '$filename' for reading: $^E\n";

my %chars;
while (<$file>) {
	$_ = lc($_); # convert everything to lowercase
	my @characters = split (//, $_); # store list of characters in an array
	
	foreach (@characters) {
		if (/\w/) { # ignore all characters except letters and numbers
			$chars{$_}++;
		}
	}
}

close $file;

# This loop goes through each letter in the %chars hash and prints a report informing the user of how many times each letter occurred.

foreach my $key (sort keys %chars) {
	if ($chars{$key} == 1) {
		print "$key appeared once.\n";
	} else {
		print "$key appeared $chars{$key} times.\n";
	}
}
