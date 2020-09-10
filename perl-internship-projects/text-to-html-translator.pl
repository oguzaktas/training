#!/usr/bin/perl

# Translate a simple langauge into HTML.
# Blank lines become <p>
# _stuff_ becomes <u>stuff</u>
# @stuff@ becomes <tt>stuff</tt>
# {stuff} becomes <i>stuff</i>
# [stuff] becomes <b>stuff</b>
# [[stuff]] becomes <h1> header
# [:stuff:] becomes <h1> header and centered
# A line of 3 or more --- becomes an <hr>
# A >>> at the start of a line becomes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
# Other stuff is retained with & < > " being translated into
# approprite stuff. The \ escapes substitutions
# Generally \ is removed. Use \\ to add a single one

use strict;
use warnings;

my @plain = ( '\&', '&amp;', # set of plain replacements, order is important
              '^\s*\>\>\>\s*', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
              '\<', '&lt;', '\>', '&gt;', '\"', '&quot;',
              '\[\[', '<h1>', '\]\]', '</h1>',
              '\[\:', '<center><h1>', '\:\]', '</h1></center>',
              '\{', '<i>', '\}', '</i>',
              '\[', '<b>', '\]', '</b>',
              '^\s*$', '<p>',
              '^\-\-\-+$', '<hr>' );

# Set of replacements which toggle.  Replacement will be the open or closing version of the tag.
my @toggle = ( '\_', 'u', '\@', 'tt' );
my %toggle_status = ( '\_' => '', '\@' => '' );

print '<html><body bgcolor="white">', "\n"; # prefix

while(defined(my $line = <STDIN>)) { # read the input
    chomp $line;

    my @rs = @plain; # do the simple replacements
    while(my $r = shift @rs) {
        my $rt = shift @rs;

        $line =~ s/(^|[^\\])$r/$1$rt/g;
    }

    @rs = @toggle; # work with toggles
    while(my $r = shift @rs) {
        my $rt = shift @rs;

        my $newline = ''; # accumulate the new line here

        # Take each left-most match for $r.  The *? construct is a * that matches as few as possible.
        while($line =~ /^(.*?(^|[^\\]))$r(.*)$/) {
            $newline .= "$1<$toggle_status{$r}$rt>";
            $line = $3;

            $toggle_status{$r} = $toggle_status{$r} ? '' : '/';
        }
        $line = $newline . $line;
    }

    $line =~ s/\\(.)/$1/g; # reduce escapes

    print "$line\n";
}

print "</body></html>\n";
