# $Header: /home/cvs/date-doomsday/DayOfWeek.pm,v 1.12 2001/05/27 03:44:03 rbowen Exp $

package Date::DayOfWeek;
use Date::Doomsday qw();

require 5.005_62;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT = qw( dayofweek );
our $VERSION = ( qw'$Revision: 1.12 $' )[1];

=head1 NAME

Date::DayOfWeek - Determine the day of the week for any date.

=head1 SYNOPSIS

  use Date::DayOfWeek;
  $dow = dayofweek( 1971, 10, 25 ); # yyyy, mm, dd

=head1 DESCRIPTION

Based on the Doomsday algorithm of John Conway.

=head1 dayofweek

    $dow = dayofweek( 1971, 10, 25);
    $dow = dayofweek( 1776, 7, 4);

Returns the day of the week for any date between 1500 and 2699.

Month should be in the range 1..12

The day of week that is returned is an integer in the range 0..6, with 0 =
sunday, 1 = monday, etc.

=cut

sub dayofweek {
    my ($year, $month, $day) = @_;

    # When is doomsday this year?
    my $doomsday = Date::Doomsday::doomsday( $year );

    # And when is doomsday this month?
   
    my $baseday;

    if ( $month == 2 ) {
        $baseday = isleap($year) ? 29 : 28;

    # For even months, the Nth day of the Nth month is doomsday
    } elsif ( $month % 2 == 0 ) {
        $baseday = $month;

    # I work from 9-5 at the 7-11
    } elsif ( $month == 5 ) {
        $baseday = 9;
    } elsif ( $month == 9 ) {
        $baseday = 5;
    } elsif ( $month == 7 ) {
        $baseday = 11;
    } elsif ( $month == 11 ) {
        $baseday = 7;

    # march
    } elsif ( $month == 3 ) {
        $baseday = 7;

    # January
    } elsif ( $month == 1 ) {
        $baseday = isleap($year) ? 32 : 31;
    }

    # And how far after that are we?
    my $on = $day - $baseday;
    $on = $on % 7;
    # And, just to make sure it's positive ...
    $on = ($on + 7) % 7;
    
    # So, the day of the week should be doomsday, plus however far on we are
    return ($doomsday + $on) % 7;
}


sub isleap  {
    my ($year) = @_;
    return 1 if ( ($year % 4 == 0) &&
        ( ($year % 100) || ($year % 400 == 0) ) );
    return 0;
}

1;

=head1 HISTORY

    $Log: DayOfWeek.pm,v $
    Revision 1.12  2001/05/27 03:44:03  rbowen
    Need to mod return value by 7.

    Revision 1.11  2001/05/27 03:41:31  rbowen
    This seems to work on all the dates that I've tested it for. More testing is
    needed.

    Revision 1.10  2001/05/27 03:13:57  rbowen
    Add DayOfWeek to repository.

=head1 AUTHOR

Rich Bowen (rbowen@rcbowen.com)

=head1 See Also

Date::Doomsday

=cut

