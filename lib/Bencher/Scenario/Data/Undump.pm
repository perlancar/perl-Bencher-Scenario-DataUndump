package Bencher::Scenario::Data::Undump;

use 5.010001;
use strict;
use warnings;

use Data::Dumper;

# AUTHORITY
# DATE
# DIST
# VERSION

my $array10mixed = [
    undef,
    1,
    1.1,
    "",
    "string",

    "string with some control characters: \n, \b",
    [],
    [1,2,3],
    {},
    {a=>1,b=>2,c=>3},
];

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
            summary => 'Array of 100 integers',
            args => {dump=> Data::Dumper->new([[1..100]])->Terse(1)->Dump },
            result => [1..100],
        },
        {
            name => 'array1000i',
            summary => 'Array of 1000 integers',
            args => {dump=> Data::Dumper->new([[1..1000]])->Terse(1)->Dump },
            result => [1..1000],
        },
        {
            name => 'array10mixed',
            summary => 'A 10-element array containing a mix of various Perl data items',
            args => {dump=> Data::Dumper->new([$array10mixed])->Terse(1)->Dump },
            result => $array10mixed,
        },
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO

L<https://www.reddit.com/r/perl/comments/czhwe6/syntax_differences_from_data_dumper_to_json/ez95r7c?utm_source=share&utm_medium=web2x>
