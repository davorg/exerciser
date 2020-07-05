package Exerciser;
use Dancer2;
use List::Util 'shuffle';
use Time::Piece;

use Exerciser::Schema;

our $VERSION = '0.1';

get '/' => sub {
  my $sch = Exerciser::Schema->get_schema;

  # day_of_week returns 0 (Sun) to 6 (Sat)
  # This gives 1 (Mon) to 7 (Sun)
  my $day = localtime->day_of_week || 7;

  my @exercises = $sch->resultset('Exercise')->search({}, {
    order_by => 'done_on',
  })->all;

  my (@done, @today, @todo);

  for (@exercises) {
    if ($_->done_on) {
      if ($_->done_on == $day) {
        push @today, $_;
      } else {
        push @done, $_;
      }
    } else {
      push @todo, $_;
    }
  }

  @todo = shuffle @todo;

  my $options = @todo > 2;

  $#todo = 1 if @todo > 2;

  if (@today) {
    @todo = ();
    $options = 0;
  }

  template 'index' => {
    done    => \@done,
    todo    => \@todo,
    today   => \@today,
    options => $options,
    int2day => \&int2day,
  };
};

get '/do' => sub {
  my @ids = query_parameters->get_all('exercise');

  my $day = localtime->day_of_week || 7;

  my $sch = Exerciser::Schema->get_schema;
  $sch->resultset('Exercise')->search({
    id => \@ids,
  })->update({
    done_on => $day,
  });

  redirect '/';
};

get '/redo' => sub {
  redirect '/';
};

true;

my @days = qw[xxx Mon Tue Wed Thu Fri Sat Sun];
my $i = 0;
my %days = map { $_ => ++$i } @days;

sub int2day {
  return unless $days[$_[0]];
  return $days[$_[0]];
}

sub day2int {
  return unless $days{$_[0]};
  return $days{$_[0]};
}
