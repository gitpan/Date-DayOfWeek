# $Header: /home/cvs/date-doomsday/DayOfWeek.pm,v 1.15 2001/06/06 02:29:14 rbowen Exp $

package Date::DayOfWeek;
use Date::Doomsday qw();

require 5.005_62;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT = qw( dayofweek );
our $VERSION = ( qw'$Revision: 1.15 $' )[1];

=head1 NAME

Date::DayOfWeek - Determine the day of the week for any date.

=head1 SYNOPSIS

  use Date::DayOfWeek;
  $dow = dayofweek( 25, 10, 1971 ); # dd, mm, yyyy

=head1 DESCRIPTION

Based on the Doomsday algorithm of John Conway.

=head1 dayofweek

    $dow = dayofweek( 25, 10, 1971 );
    $dow = dayofweek( 4, 7, 1776 );

Returns the day of the week for any date between 1500 and 2699.

Month should be in the range 1..12

The day of week that is returned is an integer in the range 0..6, with 0 =
sunday, 1 = monday, etc.

=cut

sub dayofweek {
    my ($day, $month, $year) = @_;

    # When is doomsday this year?
    my $doomsday = Date::Doomsday::doomsday( $year );

    # And when is doomsday this month?

    my @base = ( 0, 0, 7, 4, 9, 6, 11, 8, 5, 10, 7, 12 );
    @base[1,2] = isleap($year) ? (32,29) : (31,28);

    # And how far after that are we?
    my $on = $day - $base[$month - 1];
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
    Revision 1.15  2001/06/06 02:29:14  rbowen
    Added some more doomsday tests. Removed dayofweek tests that referred
    to years before the Gregorian calendar. Extended the range of
    Doomsday.pm indefinately into the future. And a small bug fix in
    DayOfWeek.pm

    Revision 1.14  2001/06/06 01:41:45  rbowen
    Made the calculation a little more elegant, if somewhat less
    informative. Thanks for patch from Jerrad Pierce.

    Revision 1.13  2001/05/27 19:34:46  rbowen
    Rearranged argument order. day month year makes more sense.

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

