#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run here
use Exerciser;

Exerciser->to_app;

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use Exerciser;
use Plack::Builder;

builder {
    enable 'Deflater';
    Exerciser->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to mount several applications on different path

use Exerciser;
use Exerciser_admin;

use Plack::Builder;

builder {
    mount '/'      => Exerciser->to_app;
    mount '/admin'      => Exerciser_admin->to_app;
}

=end comment

=cut

