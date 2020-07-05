use utf8;
package Exerciser::Schema::Result::Exercise;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Exerciser::Schema::Result::Exercise

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<exercise>

=cut

__PACKAGE__->table("exercise");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 type

  data_type: 'char'
  is_nullable: 1
  size: 12

=head2 description

  data_type: 'char'
  is_nullable: 1
  size: 30

=head2 done_on

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "type",
  { data_type => "char", is_nullable => 1, size => 12 },
  "description",
  { data_type => "char", is_nullable => 1, size => 30 },
  "done_on",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-07-05 20:22:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QQYY4e80yc3jC+xaPv9TCQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
