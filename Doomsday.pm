package Date::Doomsday;

require 5.005_62;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT = qw( doomsday );
our $VERSION = ( qw'$Revision: 1.9 $' )[1];

=head1 NAME

Date::Doomsday - Determine doomsday for a given year

=head1 SYNOPSIS

  use Date::Doomsday;
  $doomsday = doomsday(1945);

=head1 DESCRIPTION

Doomsday is a concept invented by John Horton Conway to make it easier to
figure out what day of the week particular events occur in a given year.

=head1 doomsday

    $doomsday = doomsday( 1945 );

Returns the day of the week (in the range 0..6) of doomsday in the particular
year given. If no year is specified, the current year is assumed.

=cut

sub doomsday {#{{{
    my $year = shift;

    $year = ( localtime(time) )[5] unless $year;

    if ($year < 1583) {
        warn "The Gregorian calendar did not come into use until 
1583. Your date predates the usefulness of this algorithm."
    }

    my $century = $year - ( $year % 100 );

    my $base = ( 3, 2, 0, 5 )[ ( ($century - 1500)/100 )%4 ];

    my $twelves = int ( ( $year - $century )/12);
    my $rem = ( $year - $century ) % 12;
    my $fours = int ($rem/4);

    my $doomsday = $base + ($twelves + $rem + $fours)%7;

    return $doomsday % 7;
}#}}}

1;

#{{{ CVS History
=head1 HISTORY

    $Log: Doomsday.pm,v $
    Revision 1.9  2001/06/10 18:46:03  rbowen
    Moved isleap functionality into Date::Leapyear. Added Birthday.pm and
    Nails.pm as examples of the strange things that people believe - or
    believed a few hundred years ago, with regard to days of the week.

    Revision 1.8  2001/06/06 02:29:14  rbowen
    Added some more doomsday tests. Removed dayofweek tests that referred
    to years before the Gregorian calendar. Extended the range of
    Doomsday.pm indefinately into the future. And a small bug fix in
    DayOfWeek.pm

    Revision 1.7  2001/05/31 02:07:37  rbowen
    Added test suite. Updated documentation to tell more about Doomsday.

    Revision 1.6  2001/05/27 03:48:27  rbowen
    Changed package to DayOfWeek rather than Doomsday, since that's the most
    useful feature here. Updated documenation, manifest, and makefile to reflect
    this.

    Revision 1.5  2001/05/27 03:02:08  rbowen
    Corrected documentation. Added Readme

    Revision 1.4  2001/05/27 02:49:20  rbowen
    Documentation.

    Revision 1.3  2001/05/27 02:46:02  rbowen
    And now it works from 1500 through 2699.

    Revision 1.2  2001/05/27 02:37:05  rbowen
    Got it working for dates in the 1900's

    Revision 1.1.1.1  2001/05/27 02:21:27  rbowen
    Start date-doomsday cvs repository

=cut
#}}}

=head1 AUTHOR

Rich Bowen (rbowen@rcbowen.com)

=head1 Doomsday

Doomsday is a simple way to find out what day of the week any event occurs, in
any year. It was invented by Dr John Horton Conway.

In conjunction with Date::DayOfWeek, it can calculate the day of the
week for any date since the beginning of the Gregorian calendar.

The concept of doomsday is simple: If you know this special day
(called "doomsday") for a given year, you can figure out the day of
the week for any other day that year by a few simple calculations that
you can do in your head, thus:

The last day of February is doomsday. That's the 28th most years, and
the 29th in leap years.

The Nth day of the Nth month is doomsday, for even values of N. That
is, 4/4 (April 4), 6/6, 8/8, 10/10, and 12/12, are all doomsdays.
(That is, if doomsday is Wednesday, as it is in 2001, then October 10
will also be a Wednesday.)

For odd months, after March, the following mnemonic will help you
remember: "I work from 9-5 at the 7-11." (For those of you not living
in the USA, you might like to know that 7-11 is the name of a chain of
stores.) What this means is that 9/5 (September 5) and 5/9 (May 9) are
both doomsday. Likewise, 7/11 and 11/7 are doomsday.

The 0th day of march is always doomsday.

The last day of January is doomsday in most years, and the day after
tha last day of January (think January 32nd) is doomsday in leap
years.

So, if you know the above, and you want to figure out what day of the
week a particular day is, you do something like the following:

When is Christmas in 2001? Doomsday in 2001 is Wednesday. So December
12 is Wednesday. Count forward 2 week, and find that December 26 is a
Wednesday. So Christmas (December 25) is a Tuesday.

For more information about the origins and mathematics surrounding
doomsday, see the following web sites:

http://www.interlog.com/~r937/doomsday.html

http://quasar.as.utexas.edu/BillInfo/doomsday.html

http://www.cst.cmich.edu/users/graha1sw/Pub/Doomsday/Doomsday.html

=cut

