
use strict;
use Test;
use Date::Doomsday;

BEGIN { plan tests => 8 }

# 1900 - Wednesday
ok( doomsday(1900), 3 );

# 2001 - Wednesday
ok( doomsday(2001), 3 );

# 1856 - Tuesday
ok( doomsday(1865), 2 );

# 2493 - Saturday
ok( doomsday(2493), 6 );

# 1584 - Wednesday
ok( doomsday(1584), 3 );

# 1600 - Tuesday
ok( doomsday(1600), 2 );

# 1700 - Sunday
ok( doomsday(1700), 0 );

# 1800 - Friday
ok( doomsday(1800), 5 );

