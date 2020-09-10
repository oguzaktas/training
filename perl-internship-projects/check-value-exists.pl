#!/usr/bin/perl

use warnings;
use strict;

sub is_value_exists_in_array {
    $value = $_[0]; # first argument (string value to be searched in array)
    $arrayref = $_[1]; # second argument (reference to array to be searched in)
    @my_array = @$arrayref; # create the array by dereferencing

    $result = "does not exist in";
    foreach $element (@my_array) {
        if ($element eq $value) {
            $result = "exists in";
            last;
        }
    }

    print "Value $value $result array [ @my_array ]\n"; # print result
}

@foo = ('we', 'are', 5, 'happy', 'perl', 'programmers');
$foo_arrayref = \@foo;
print "We are calling the subroutine is_value_exists_in_array() now\n";
is_value_exists_in_array('hello', $foo_arrayref);
print "We are calling the subroutine is_value_exists_in_array() again\n";
is_value_exists_in_array('happy', $foo_arrayref);
