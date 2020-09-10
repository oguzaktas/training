#!/usr/bin/perl

use warnings;
use strict;

sub insertionSort;
sub quickSort;
sub mergeSort;

print "Enter a sequence of numbers (comma separated) to be sorted: ";
my $nums = <STDIN>; chomp $nums;
$nums =~ s/\s+//g;
my @numbers = split(",", $nums);
print "Insertion sort:\t", join(", ", insertionSort @numbers), "\n";
print "Quick sort:\t", join(", ", quickSort @numbers), "\n";
print "Merge sort:\t", join(", ", mergeSort @numbers), "\n";

sub insertionSort {
	my @sorted = @_;
	foreach my $i (1 .. $#sorted) {
		my $curr = $sorted[$i];
		my $j;
		for ($j = $i; $j > 0 && $curr < $sorted[$j - 1]; $j--) {
			$sorted[$j] = $sorted[$j - 1];
		}
		$sorted[$j] = $curr;
	} @sorted;
}

sub quickSort {
	return @_ if (@_ < 2);
	my $pivot = $_[0]; shift;
	quickSort(grep $_ < $pivot, @_), $pivot, quickSort(grep $_ >= $pivot, @_);
}

sub mergeSort {
	return @_ if @_ < 2;
	my $k = @_/2;
	my @left = mergeSort @_[0 .. $k - 1];
	my @right = mergeSort @_[$k .. $#_];
	my @result;
	push @result, ($left[0] < $right[0] ? shift @left : shift @right)
		while (@left > 0 && @right > 0);
	push @result, @left if (@left > 0);
	push @result, @right if (@right > 0);
	@result;
}
