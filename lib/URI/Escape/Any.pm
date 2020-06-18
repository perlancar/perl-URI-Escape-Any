package URI::Escape::Any;

# AUTHORITY
# DATE
# DIST
# VERSION

# IFUNBUILT
use strict 'subs', 'vars';
#use warnings;
# END IFUNBUILT

use Exporter qw(import);

our @EXPORT = qw(uri_escape uri_escape_utf8 uri_unescape);
#our @EXPORT_OK = qw(%escapes);

if (eval { require URI::XSEscape; 1 }) {
    *uri_escape        = \&URI::XSEscape::uri_escape;
    *uri_escape_utf8   = \&URI::XSEscape::uri_escape_utf8;
    *uri_unescape      = \&URI::XSEscape::uri_unescape;
} elsif (eval { require URI::Escape::XS; 1 }) {
    *uri_escape        = \&URI::Escape::XS::uri_escape;
    *uri_escape_utf8   = \&URI::Escape::XS::uri_escape_utf8;
    *uri_unescape      = \&URI::Escape::XS::uri_unescape;
} else {
    require URI::Escape;
    *uri_escape        = \&URI::Escape::uri_escape;
    *uri_escape_utf8   = \&URI::Escape::uri_escape_utf8;
    *uri_unescape      = \&URI::Escape::uri_unescape;
}

1;
# ABSTRACT: Use XS-based URI escape module, fallback to URI::Escape

=head1 SYNOPSIS

 use URI::Escape::Any;

 my $escaped = uri_escape('/foo');


=head1 DESCRIPTION

This module tries to load L<URI::XSEscape>, then L<URI::Escape::XS>, then falls
back to L<URI::Escape>.

The export '%escapes' from URI::Escape is currently not provided.


=head1 FUNCTIONS

=head2 uri_escape

=head2 uri_escape_utf8

=head2 uri_unescape


=head1 SEE ALSO

L<URI::XSEscape>

L<URI::Escape::XS>

L<URI::Escape>
