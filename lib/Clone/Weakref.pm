package Clone::Weakref;

use 5.006;

use strict;
use warnings;

require Exporter;
require DynaLoader;

our @ISA = qw(Exporter DynaLoader);

our @EXPORT_OK = qw(clone);

our $VERSION = '0.01';

bootstrap Clone::Weakref $VERSION;

1;

__END__

=head1 NAME

Clone::Weakref - recursively copy Perl datatypes (including weak references)

=head1 SYNOPSIS

    use Clone::Weakref qw(clone);

    $a = Foo->new();
    $b = { alpha => 'beta', gamma => 'vlissides' };

    tie %c, 'Foo::Bar';

    $d = clone($a);
    $e = clone($b);
    $f = clone(\%c);

    # or

    my $node2 = {
        name	    => 'node2',
        children    => [ $node3, $node4 ],
        parent	    => weaken ($node1)	    # weaken() to avoid memory leak
    };

    my $clone = clone($node2);

=head1 DESCRIPTION

This module exports a C<clone> function which combines the performance of Clone's C<clone> with the support for weak references
provided by Storable's C<dclone>.

C<clone> returns a recursive copy of its argument, which can be an arbitrary (scalar) type including nested HASH, ARRAY
and reference types (including weak references), tied variables and objects.

To duplicate non-scalar types (e.g. lists, ARRAYs and HASHes), pass them to C<clone> by reference. e.g.
    
    my $copy = clone (\@array);

    # or

    my %copy = %{ clone (\%hash) };

For a slower, but more flexible solution see Storable's C<dclone>.

=cut

=head1 BUGS

C<clone> currently segfaults if it encounters a Regex object

=head1 SEE ALSO

L<Clone>, L<Storable>

=head1 AUTHOR

chocolateboy: <chocolate.boy@email.com>

=head1 COPYRIGHT

Copyright (c) 2001-2005, chocolateboy.

Based on a fork of Clone 0.10 written by Ray Finch.

This module is free software. It may be used, redistributed
and/or modified under the same terms as Perl itself.

=cut
