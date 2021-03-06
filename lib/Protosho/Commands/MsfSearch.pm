#
#===============================================================================
#
#         FILE: MsfSearch.pm
#
#  DESCRIPTION: Search Metasploit by fullname.
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), peter.ezetta@zonarsystems.com
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 10/12/2012 00:24:42
#     REVISION: ---
#===============================================================================

package Protosho::Commands::MsfSearch;
use Modern::Perl;
use base qw( CLI::Framework::Command );
use Data::Printer colored => 1;

#===  FUNCTION  ================================================================
#         NAME: run
#      PURPOSE: Main run loop of MsfSearch object.
#   PARAMETERS: ????
#      RETURNS: ????
#  DESCRIPTION: ????
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub run {
    my ( $self, $opts, @args ) = @_;

	my $api = $self->cache->get( 'api' );

#-------------------------------------------------------------------------------
#  Search Metasploit by fullname
#-------------------------------------------------------------------------------
    my $result = $api->msf_search( $opts->{'search'} );

#-------------------------------------------------------------------------------
#  Basic Error Checking
#-------------------------------------------------------------------------------
    if ( $result->{'error'} ) {
        print "Error: " . $result->{'error'} . "\n";
    }
    else {
		p $result;
    }
    return;
}

#===  FUNCTION  ================================================================
#         NAME: option_spec
#      PURPOSE: Option specifications
#   PARAMETERS: ????
#      RETURNS: ????
#  DESCRIPTION: ????
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub option_spec {
    ( 
        [ "search|s=s" => 'Search Term' ],
    ) 
}

#===  FUNCTION  ================================================================
#         NAME: validate
#      PURPOSE: Validation of user-provided options.
#   PARAMETERS: ????
#      RETURNS: ????
#  DESCRIPTION: ????
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub validate {
    my ( $self, $opts, @args ) = @_;
    die "Search Term Required" unless $opts->{'search'};
}

1;
