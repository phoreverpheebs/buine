#!/usr/bin/env perl

use strict;
use warnings;

my $bindir = "./bin/";
mkdir($bindir) or $!{EEXIST} 
    or die "Couldn't create directory $bindir: $!";

my $exe = "buine";
my $out = "$bindir$exe";
my $inp = "$exe.hex";

open(my $in, '<', $inp)
    or die "Couldn't open file $inp: $!";
open(my $ou, '>:raw', $out)
    or die "Couldn't open file $out: $!";

while (<$in>) {
    local $/;
    foreach ($_ =~ /^\s*((?:\s*[A-Fa-f0-9]{2})+)/) {
        foreach (split(/\s/, $_)) {
            print $ou pack('C', hex($_));
        }
    }
}

close($in);
close($ou);

chmod(0755, $out);

print "Successfully built $out";
