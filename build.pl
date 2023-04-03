#!/usr/bin/env perl

use strict;
use warnings;

use File::Path qw(remove_tree);

my $run;
my $bindir = "./bin/";

# has argument
if ($#ARGV == 0) {
    my $target = $ARGV[0];
    my @helpcmds = ["h", "-h", "help", "--help"];
    if ($target eq "clean" || $target eq "c") {
        remove_tree($bindir);
        print "Removed $bindir";
        exit 0;
    } elsif ($target eq "run" || $target eq "r") {
        $run = 1;
    } elsif (grep(/^$target$/, @helpcmds)) {
        print "run - builds and runs buine\n";
        print "clean - removes the output directory\n";
        print "build - builds buine (no argument does the same)\n";
        print "help - prints this help message\n";
    }
}

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
    foreach (/^\s*((?:\s*[A-Fa-f0-9]{2})+)/) {
        foreach (split /\s/) {
            print $ou pack('C', hex);
        }
    }
}

close($in);
close($ou);

chmod(0755, $out);

print "Successfully built $out\n";

if ($run) {
    print "Running...\n\n";
    system("$out");
}
