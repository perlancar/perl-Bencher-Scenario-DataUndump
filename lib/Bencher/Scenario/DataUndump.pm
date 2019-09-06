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
            name => 'array100i',
            args => {dump=> Data::Dumper->new([[1..100]])->Terse(1)->Dump },
            result => [1..100],
        },
        {
            name => 'array1000i',
            args => {dump=> Data::Dumper->new([[1..1000]])->Terse(1)->Dump },
            result => [1..1000],
        },
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO

L<https://www.reddit.com/r/perl/comments/czhwe6/syntax_differences_from_data_dumper_to_json/ez95r7c?utm_source=share&utm_medium=web2x>
