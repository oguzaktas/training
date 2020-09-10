#!/usr/bin/perl

use strict;
use warnings;

my $wasquit = 0;
print "ctl2> ";
while(my $line = <STDIN>) {
    chomp $line;
    print "Oguz\n" if $line eq 'aktas';

    if($line eq 'stop') { # quitting is here
        print "That's better\n" if $wasquit;
        last;
    }
    if($line eq 'quit') {
        $wasquit = 1;
        print "You must say stop if you want to quit\n";
    } else {
        $wasquit = 0;
    }

    print "$line to you!\n" if $line;

    print "ctl2> " unless $line eq 'sssh';
}
