use strict;
use Test;
use Date::DayOfWeek;

BEGIN { plan tests => 12 }

# test 1

# Today - Wednesday
ok( dayofweek( 30, 5, 2001 ), 3 );

# Pearl Habor - Sunday
ok( dayofweek( 7, 12, 1941 ), 0 );

# My Birthday - Monday
ok( dayofweek( 25, 10, 1971 ), 1 );

# Declaration of independence - Thursday
ok( dayofweek( 4, 7, 1776 ), 4 );

# Martin Luther King - Tuesday
ok( dayofweek( 9, 4, 1968 ), 2 );

# Marin Mersenne born - Thursday
ok( dayofweek( 8, 9, 1588 ), 4 );

# Jean Le Febre born - Tuesday
ok( dayofweek( 9, 4, 1652 ), 2 );

# Leonhard Euler born - Friday
ok( dayofweek( 15, 4, 1707 ), 5 );

# Johann Carl Friedrich Gauss born - Wednesday
ok( dayofweek( 30, 4, 1777 ), 3 );

# Nikolai Ivanovich Lobachevsky born - Saturday
ok( dayofweek( 1, 12, 1792 ), 6 );

# Pony Express opens for business - Tuesday
ok( dayofweek( 3, 4, 1860 ), 2 );

# Initial public release of Linux - Saturday
ok( dayofweek( 5, 10, 1991 ), 6 );
