# $Header: /home/cvs/date-doomsday/DayOfWeek/Birthday.pm,v 1.1 2001/06/10 18:46:08 rbowen Exp $

package Date::DayOfWeek::Birthday;
use Date::DayOfWeek qw();

require 5.005_62;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT = qw( birthday );
our $VERSION = ( qw'$Revision: 1.1 $' )[1];

=head1 NAME

Date::DayOfWeek::Birthday - Monday's child is fair of face ...

=head1 SYNOPSIS

    use Date::DayOfWeek::Birthday;
    $personality = birthday( 25, 10, 1971 ); # day month year

=head1 DESCRIPTION

    Monday's child is fair of face.
    Tuesday's child is full of grace.
    Wednesday's child is full of woe.
    Thursday's child has far to go.
    Friday's child is loving and giving.
    Saturday's child works hard for his living.
    The child that is born on the Sabbath day
     is great, and good, and fair, and gay.

Although our Jewish friends would disagree with the designation of
Sunday as "the Sabbath day," the above poem puepoerts to describe the
character of an individual based on the day of their birth.

I'm not certain as to the origins of this poem. I'm trying to track
that down.

Note also that there are various other versions of this poem,
depending on which part of the world you come from. Another version,
for example, says that ...

    The child that is born on the Sabbath day
     is bonny and blithe and good and gay.

And yet another says that ...

    The child that is born on the Sabbath day
     is witty and wise and good and gay.

=head1 birthday

    $personality = birthday( 25, 10, 1971 ); # day month year

=cut    

sub birthday {
    my ($day, $month, $year) = @_;

    unless ( $day && $month && $year ) {
        ( $day, $month, $year ) = ( localtime(time) )[ 3, 4, 5 ];
        $month++;
        $year += 1900;
    }
    my $dayofweek = Date::DayOfWeek::dayofweek( $day, $month, $year );
   
    my @days = (
    "The child that is born on the Sabbath day\nis great, and good, and fair, and gay.",
    "Monday's child is fair of face.",
    "Tuesday's child is full of grace.",
    "Wednesday's child is full of woe.",
    "Thursday's child has far to go.",
    "Friday's child is loving and giving.",
    "Saturday's child works hard for his living.",
    );

    return $days[$dayofweek];
}

1;

=head1 AUTHOR

Rich Bowen ( rbowen@rcbowen.com )

=head1 See Also

Date::Doomsday

Date::DayOfWeek

=cut


