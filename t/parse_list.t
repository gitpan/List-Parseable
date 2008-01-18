#!/usr/bin/perl -w

require 5.001;
use Data::Dumper;
use IO::File;
use List::Parseable;

$runtests=shift(@ARGV);
if ( -f "t/test.pl" ) {
  require "t/test.pl";
  $dir="t";
} elsif ( -f "test.pl" ) {
  require "test.pl";
  $dir=".";
} else {
  die "ERROR: cannot find test.pl\n";
}

unshift(@INC,$dir);

$tests = 
[
  [
    [ qw(scalar a b) ],
    [ qw(a b) ]
  ],

  [
    [ [ "a" ], [ "b" ] ],
    [ qw(a b) ]
  ],

  [
    [ qw(count a b) ],
    [ qw(2) ]
  ],

  [
    [ "count", [ "list", "a", "b" ], "c" ],
    [ qw(2) ]
  ],

  [
    [ "compact", "a", "_blank_", [ "c" ], [ "a", "0" ] ],
    [ qw(a c a 0) ]
  ],

  [
    [ "true", "a", "_blank_", [ "c" ], [ "a", "0" ] ],
    [ qw(a c a) ]
  ],
];

sub test {
  (@test)=@_;
  my $obj = new List::Parseable;
  $obj->list("a",@test);
  return $obj->eval("a");
}

print "List...\n";
&test_Func(\&test,$tests,$runtests);

1;

# Local Variables:
# mode: cperl
# indent-tabs-mode: nil
# cperl-indent-level: 3
# cperl-continued-statement-offset: 2
# cperl-continued-brace-offset: 0
# cperl-brace-offset: 0
# cperl-brace-imaginary-offset: 0
# cperl-label-offset: -2
# End:

