#!/usr/bin/perl -w

$lines = "
ValA = 7

ValA : (default ValA defA)
ValB : (default ValB defB)
";
@lines = split(/\n/,$lines);

use List::Parseable;
$lp     = new List::Parseable;
%CONFIG = ();

foreach $line (@lines) {
  if      ($line =~ /^\s*(\S+)\s*=\s*(.*?)\s*$/) {
     set_value($1,$2);
  } elsif ($line =~ /^\s*(\S+)\s*:\s*(.*?)\s*$/) {
     parse_value($1,$2);
  }
}

foreach $var (sort keys %CONFIG) {
  $val = $CONFIG{$var};
  print "$var  =  $val\n";
}

# This stores a value in a variable. The value is stored in both
# a global config hash and in the List::Parseable object so that
# the config values can be used in setting complex values.
#
sub set_value {
   my($var,$val) = @_;

   $::CONFIG{$var} = $val;
   $lp->vars($var,$val);
}

# Set a complex variable using List::Parseable.
#
sub parse_value {
   my($var,$str) = @_;
   $lp->string("curr",$str);
   my ($val) = $lp->eval("curr");
   set_value($var,$val);
}

