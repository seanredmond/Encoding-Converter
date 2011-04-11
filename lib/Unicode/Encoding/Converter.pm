package Unicode::Encoding::Converter;

# Copyright 2011 Sean Redmond <sean@litot.es>
#
# This file is part of Greek Unicode Converter.
#
# Greek Unicode Converter is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation; either version 3 of the License, or (at your option) any later
# version.
#
# Greek Unicode Converter is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# Greek Unicode Converter; If not, see <http://www.gnu.org/licenses/>.

use Carp;

$UNICODE::ENCODING::VERSION = '1.0';

sub new {
    my $proto = shift;
    my $class = ref($proto) || $proto;
    my $self = {};

    my ( $from, $to ) = @_;
    $to = 'Unicode' unless $to;

    $self->{FROM} = [ 'GreekKeys', 'BetaCode', 'WinGreek', 'SuperGreek' ];
    $self->{TO}   = [ 'Unicode', 'SuperGreek' ];
    $self->{CONV_FROM} = undef;
    $self->{CONV_TO} = undef;
    $self->{WARNING} = undef;
    
    bless $self, $class;

    my $success;
    if ( $from && $to ) {
        $success = $self->SetConversion( $from, $to );
    }
    else {
        $success = 1;
    }

    if ( $success ) {
        return $self;
    }

    return $self;
}


sub SetConversion {
    my ( $self, $from, $to ) = @_;
    
    $from = "Unicode::Encoding::$from";
    $to   = "Unicode::Encoding::$to";
   
    if ( eval( "require $from;" ) ) {
        eval( qq{ \$self->{CONV_FROM} = new $from; } ); # Unicode::Encoding::$from
    }
    
    if ( lc( $to ) ne 'unicode' ) {
        if ( eval( "require $to;" ) ) {
            eval( qq{ \$self->{CONV_TO} = new $to; } ); # Unicode::Encoding::$from
        }
    }

    return 1;
}

sub CurrentConversion {
    my ( $self ) = @_;
    my ( $from, $to );

    if ( $self->{CONV_FROM} ) {
        $from = $self->{CONV_FROM}->Name();

        if ( $self->{CONV_TO} ) {
            $to = $self->{CONV_TO}->Name();
        }
        else {
            $to = 'Unicode';
        }

        return "$from to $to";
    }

    return undef;
}
        
    
sub Convert {
    my ( $self, $text ) = @_;

    my @conv;
    
    if ( $self->{CONV_TO} ) {
        @conv = $self->{CONV_FROM}->Convert( $text, $self->{CONV_TO} );
    }
    else {
        @conv = $self->{CONV_FROM}->Convert( $text );
    }
    return $self->Escape( \@conv );
}


sub Escape {
    my( $self, $codes ) = @_;
    my @text;

    foreach ( @$codes ) {
        if ( $_ <= 127 ) {
                push( @text, chr( $_ ) );
        }
        else {
            push( @text, ( '&#', $_, ';') );
        }
    }

    return join( '', @text );
}
        

sub From {
    my $self = shift;
    return @{$self->{FROM}};
}

sub To {
    my $self = shift;
    return @{$self->{TO}};
}

sub FromFont {
    my $self = shift;
    return $self->{CONV_FROM};
}

sub ToFont {
    my $self = shift;
    return $self->{CONV_TO};
}

return 1;
