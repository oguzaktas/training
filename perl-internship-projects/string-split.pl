# Perl program to demonstrate the splitting on character

#!/usr/bin/perl
use strict;
use warnings;

# Split character is space and
my $str = 'Lorem ipsum dolor sit amet, at perpetua efficiantur vix, usu libris lucilius complectitur ad, dicit ornatus constituto ei vix. 
No eam  i, sale nonumes, ut probo dicat , percipitur per. Libris aeterno      epicuri ea per, eum at,   reque     feugait.';

# using split() function
my @spl = split(' ', $str);

# displaying result using foreach loop
foreach my $i (@spl)
{
    #$i = (s/\"\,/\"/g, $_); # for removing all commas in fields
    $i =~ s/,$//g;
    print "$i\n";
}
