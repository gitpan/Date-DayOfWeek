# $Header: /home/cvs/date-doomsday/Date/DayOfWeek/Sneeze.pm,v 1.2 2001/06/11 00:03:39 rbowen Exp $

package Date::DayOfWeek::Sneeze;
use Date::DayOfWeek qw();

require 5.005_62;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT = qw( sneeze );
our $VERSION = ( qw'$Revision: 1.2 $' )[1];

=head1 NAME

Date::DayOfWeek::Sneeze - Sneezing on Sunday is bad luck!

=head1 SYNOPSIS

    use Date::DayOfWeek::Sneeze
    $omen = sneeze( 25, 10, 1971 ); # day month year

=head1 DESCRIPTION

 If you sneeze on a Monday, you sneeze for danger.
 Sneeze on a Tuesday, kiss a stranger.
 Sneeze on a Wednesday, sneeze for a letter.
 Sneeze on a Thursday something better.
 Sneeze on a Friday, sneeze for sorrow.
 Sneeze on a Saturday, see your sweetheart tomorrow.
 Sneeze on a Sunday, your safety seek:
 The devil will have you the whole of the week.

Bet you didn't know that sneezing on Sunday is bad luck. This
week-rhyme explains the hazards of sneezing on various days of the
week.

=head1 sneeze 

    $omen = sneeze( 25, 10, 1971 ); # day month year

=cut    

sub sneeze {
    my ($day, $month, $year) = @_;

    unless ( $day && $month && $year ) {
        ( $day, $month, $year ) = ( localtime(time) )[ 3, 4, 5 ];
        $month++;
        $year += 1900;
    }
    my $dayofweek = Date::DayOfWeek::dayofweek( $day, $month, $year );
   
    my @days = (
 "Sneeze on a Sunday, your safety seek:\nThe devil will have you the whole of the week.",
 "If you sneeze on a Monday, you sneeze for danger.",
 "Sneeze on a Tuesday, kiss a stranger.",
 "Sneeze on a Wednesday, sneeze for a letter.",
 "Sneeze on a Thursday something better.",
 "Sneeze on a Friday, sneeze for sorrow.",
 "Sneeze on a Saturday, see your sweetheart tomorrow.",
    );

    return $days[$dayofweek];
}

1;

=head1 AUTHOR

Rich Bowen ( rbowen@rcbowen.com )

=head1 See Also

Date::Doomsday

Date::DayOfWeek

The Oxford Companion to the Year (Bonnie Blackburn and Leofranc
Holford-Strevens. Oxford Press.)

=cut


