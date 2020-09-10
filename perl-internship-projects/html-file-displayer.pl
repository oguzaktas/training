#!/usr/bin/perl

use strict;
use warnings;

sub expand { # expand tabs at 8 stops per tab
    my ($line) = @_;
    my ($left, $right);   # Parens needed so my applies to both.

    while($line =~ /\t/) {
        ($left, $right) = split (/\t/, $line, 2);

        my($tabamt) = 8 - length($left) % 8;
        $line = $left . (" " x $tabamt) . $right;
    }

    return $line;
}

print "<pre>\n";

while(my $line = <STDIN>) { # copy with changes
    chomp $line;

    $line = expand($line);

    $line =~ s/&/&amp;/g;
    $line =~ s/</&lt;/g;
    $line =~ s/>/&gt;/g;
    $line =~ s/"/&quot;/g;

    print "$line\n";
}
