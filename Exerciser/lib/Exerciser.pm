package Exerciser;
use Dancer2;
use List::Util 'shuffle';

use Exerciser::Schema;

our $VERSION = '0.1';

get '/' => sub {
  my $sch = Exerciser::Schema->get_schema;

  my @exercises = $sch->resultset('Exercise')->search_rs({}, {
    order_by => 'done_on',
  })->all;

warn '@exercises is an array with ', scalar @exercises, " elements\n";

  my @done = grep {   $_->done_on } @exercises;
warn '@done is an array with ', scalar @done, " elements\n";
  my @todo = grep { ! $_->done_on } @exercises;
warn '@todo is an array with ', scalar @todo, " elements\n";

  my $options = @todo > 2;

  $#todo = 1 if $#todo > 1;
warn '@done is an array with ', scalar @done, " elements\n";
warn '@todo is an array with ', scalar @todo, " elements\n";

  template 'index' => {
    done    => \@done,
    todo    => \@todo,
    options => $options,
  };
};

true;
