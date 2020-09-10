#!/usr/bin/perl
 
print "\n";

# Binary to Decimal conversion
$decimal_number = 0b10010110;
print "Binary number 10010110 is " .$decimal_number. " in decimal.\n";

# Decimal to Binary conversion
$decimal_number = 23451;
$binary_number = unpack("B32", pack("N", $decimal_number));
print "Decimal number " .$decimal_number. " is " .$binary_number. " in binary.\n\n";

# Octal to Decimal conversion
$octal_number = 224;
$decimal_number =  oct($octal_number);
print "Octal number " .$octal_number. " is " .$decimal_number. " in decimal.\n";

# Decimal to Octal conversion
$decimal_number = 8;
$octal_number = sprintf("%o", $decimal_number);
print "Decimal number " .$decimal_number. " is " .$octal_number. " in octal.\n\n";

# Hexadecimal to Decimal conversion
$hexadecimal_number = "F1";
$decimal_number =  hex($hexadecimal_number);
print "Hexadecimal number " .$hexadecimal_number. " is " .$decimal_number. " in decimal.\n";
 
# Decimal to Hexadecimal conversion
$decimal_number = 333;
$hexadecimal_number = sprintf("%x", $decimal_number);
print "Decimal number " .$decimal_number. " is " .$hexadecimal_number. " in hexadecimal.\n\n";
