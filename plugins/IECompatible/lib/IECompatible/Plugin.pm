package IECompatible::Plugin;

use strict;
use warnings;

my $plugin = MT->component( 'IECompatible' );

sub _insert_header {
    my ( $cb, $app, $tmpl ) = @_;
    my $point = quotemeta(q{<head>});
    my $plugin_tmpl = File::Spec->catdir( $plugin->path, 'tmpl', 'insert_top_header.tmpl' );
    my $insert = qq{<mt:include name="$plugin_tmpl" component="IECompatible">\n};
    $$tmpl =~ s/($point)/$1$insert/;
}

1;