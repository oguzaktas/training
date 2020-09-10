#!/usr/bin/perl

# current date and time
@months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
@days = qw(Sun Mon Tue Wed Thu Fri Sat Sun);
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
print "$days[$wday] $mday $months[$mon]\n";
$datestring = localtime();
print "Local date and time $datestring\n";
$datestring = gmtime();
print "GMT date and time $datestring\n\n";

# time(), localtime() and gmtime() functions
$epoc = time();
print "Number of seconds since Jan 1, 1970 - $epoc\n";
$datestring = localtime();
print "Current date and time $datestring\n";
$epoc = time();
$epoc = $epoc - 24 * 60 * 60; # one day before of current date.
$datestring = localtime($epoc);
print "Yesterday's date and time $datestring\n\n";

# posix
use POSIX qw(strftime);
$datestring = strftime "%a %b %e %H:%M:%S %Y", localtime;
printf("Local date and time $datestring\n");
$datestring = strftime "%a %b %e %H:%M:%S %Y", gmtime;
printf("GMT date and time $datestring\n\n");
