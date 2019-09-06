package Bencher::Scenario::DataUndump;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Data::Dumper;

our $scenario = {
    summary => 'Benchmark Data::Undump against eval() for loading a Data::Dumper output',
    participants => [
        {
            fcall_template=>'Data::Undump::undump(<dump>)',
        },
        {
            name=>'eval',
            code_template=>'eval(<dump>)',
        },
    ],
    datasets => [
        {
            name => 'array1000i',
            args => {dump=> Data::Dumper->new([[1..1000]])->Terse(1)->Dump },
            result => [1..1000],
        },
    ],
};

1;
# ABSTRACT:
