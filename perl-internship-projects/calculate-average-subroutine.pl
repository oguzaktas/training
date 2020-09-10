 #!/usr/bin/perl
 
 sub calc_average { # subroutine definition
    $total_args = scalar(@_); # get total number of arguments passed
    $sum = 0;
    foreach $arg (@_){
       $sum += $arg;
    }
    $average = $sum / $total_args;
    print "Average of list [ @_ ] is: $average\n"; # print average
 }

 # subroutine call
 print "We are calling the subroutine calc_average() now\n";
 calc_average(10, 20, 30);
 print "We are calling the subroutine calc_average() again\n";
 calc_average(10, 15, 2, 8, 90);
 
