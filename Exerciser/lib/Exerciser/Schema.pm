use utf8;
package Exerciser::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-07-05 20:22:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cUzvRiWPWjXRUwycYMoCFQ

sub get_schema {
  return __PACKAGE__->connect('dbi:SQLite:./exerciser.db');
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
