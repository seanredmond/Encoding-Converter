package Unicode::Encoding::Font;

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

require Exporter;
@ISA = qw( Exporter );

$Unicode::Encoding::VERSION='0.00';

=head1 NAME

Unicode::Encoding::Font - Base Class for font encodings used by Unicode::Converter

=head1 SYNOPSIS

    use Unicode::Encoding::Font;
    @ISA=qw( Unicode::Encoding::Font );

=head1 DESCRIPTION

C<Unicode::Encoding::Font> is intended as the base of objects to handle the conversion
of particular fonts to Unicode or to other particular fonts. Given the necessary database (
the C<UNICODE>, C<DECODE>, and C<COMBO> hashes) is provides methods to convert the characters 
in a font to their Unicode values and vice-versa.

Classes may also be created from C<Unicode::Encoding::Font> that convert other 
encodings, such as schemes for representing non-Roman alphabets in ASCII, into and
out of Unicode.

See L<USING AS A BASE CLASS> for details

=head1 PUBLIC METHODS

=cut

use Carp;
#use strict;
use vars qw( $AUTOLOAD );

=head2 $font = new Unicode::Font;

Constructor for the Font.  Returns a reference to a
Unicode::Font object.

=cut

sub new {
    my $proto = shift;
    my $class = ref($proto) || $proto;
    my $self = {};
  
    $self->{UNICODE}   = undef;
    $self->{DECODE}    = undef;
    $self->{COMBOS}    = undef;
    $self->{NOCONVERT} = undef;
    $self->{LANGUAGE}  = undef;
    $self->{NAME}      = undef;

    bless $self, $class;
    $self->_initialize;
    return $self;
}


sub Name {
    my $self = shift;
    return $self->{NAME};
}

sub Html_Enc {
    my $self =shift;
    return $self->{HTML_ENC};
}

=head2 $font->Convert( $text [, $font ] );

This method converts C<$text> into another encoding and returns 
a list of integers corresponding to the codes of the converted
characters.

C<$text> may be either a string or a reference to list of integers
corresponding to the codes of the characters to be converted. What encoding
the text is converted to depends on the optional parameter C<$font>. If no
C<$font> is passed, the conversion is by default to Unicode. If a C<$font>
is passed, the characters are still converted internally to Unicode, but the
result is then passed to the C<Font::Decode()> method of C<$font>, which may be
passed either as a reference to an object that is also a subclass of 
C<Unicode::Encoding::Font>, or a the name of another such subclass. The three
possibilities are illustrated here (assuming that C<Font1>, C<Font2> and C<Font3>
are subclasses of C<Unicode::Encoding::Font>):

    use Unicode::Encoding::Font1;
    use Unicode::Encoding::Font2;

    $a = new Unicode::Encoding::Font1;  
    $b = new Unicode::Encoding::Font2;

    $a->Convert( "ABCDEFG" );
    $a->Convert( "ABCDEFG", $b );
    $a->Convert( "ABCDEFG", "Font3" );

The first call converts the string to Unicode. The second call converts internally
to Unicode, then passes the result to C<$b-E<gt>Decode()> and returns the result of that. The
third call creates a temporary C<Unicode::Encoding::Font3> object, and calls that object's
C<Decode()> method. Note that there is no C<use> statement for C<Unicode::Encoding::Font3>.
C<Convert()> will return C<undef> if a C<Font3> object can't be created.

=cut

sub Convert {
    my ( $self, $text, $font ) = @_;
    my ( $char, @conv );
    
    # See if $font is reference to an object, if not create the object
    if ( $font && !ref( $font ) ) {
        if ( eval( "require Unicode::Encoding::$font;" ) ) {
            unless ( eval( "\$font = new Unicode::Encoding::$font;" ) ) {
                croak "$@Can't create new Unicode::Encoding::$font, ";
            }
        }
        else {
            croak "$@\nCan't require new Unicode::Encoding::$font";
        }
    }

    my @chars;
    if ( ref( $text ) eq 'REF' ) {  
        @chars = @$text;
    }
    else {
        @chars = $self->_get_chars( $text );
    }

    my $uni = $self->{UNICODE};

    while ( $char = shift( @chars ) ) {
        if ( exists( $$uni{$char} ) ) {
            if( ref( $$uni{$char} ) eq 'ARRAY' ) {
                if ( ref( ${$$uni{$char}}[1] ) eq 'ARRAY' ) {   # That means element 1 in the anonymous array referenced by $uni{$char}
                    push( @conv, $self->_combo( $char, \@chars ) );
                }
                else {
                    push( @conv, @{$$uni{$char}} );
                }
            }
            else {
                push( @conv, $$uni{$char} );
            }
        }
        else {
            push( @conv, $char )
        }
    }
    
    @conv = $font->Decode( \@conv ) if $font;

    return @conv;
}

=head2 $font->String( $text [, $font ] );

This method does the same thing as L<$font->Convert( $text [, $font ] );>, but
returns a string rather than an array of integers. B<N.B.>, this function works
only for non-Unicode to non-Unicode conversions. Characters with values above
255 (0xFF) will be mangled!

=cut

sub String {
    my ( $self, $text, $font ) = @_;
    my @string;
    foreach ( $self->Convert( $text, $font ) ) {
        push ( @string, chr( $_ ) );
    }
    return join( '', @string );
}

=head2 $font->Html( $text [, $font ] );

This method does the same thing as L<$font->Convert( $text [, $font ] );>, but
returns a string rather than an array of integers. Non-ASCII characters are
HTML-escaped

=cut

sub Html {
    my ( $self, $text, $font ) = @_;
    my @string;
    foreach ( $self->Convert( $text, $font ) ) {
        if ( $_ >= 128 ) {
            push ( @string, join( '', ( '&#',$_, ';' ) ) );
        }
        else {
            push ( @string, chr( $_ ) );
        }
    }
    return join( '', @string );
}

=head2 $font->Decode( @array );

This methods converts from Unicode.

=cut

sub Decode {
    my( $self, @array ) = @_;
   
    return () unless $self->{DECODE};

    my $decode = $self->{DECODE};
    my $uni    = $self->{UNICODE};
    my ( $char, $chars, $combo, @conv );

    # Decide if parameter is passed by value or reference
    # if by value, convert to reference
    if ( ref( $array[0] ) ) {
        $chars = shift( @array );
    }
    else {
        $chars = \@array;
    }
    
    foreach $char ( @$chars ) {
        if ( exists( $$decode{$char} ) ) {
            if( ref( $$decode{$char} ) eq 'ARRAY' ) {
                $combo = $$decode{$char};
                push( @conv, @$combo );
            }
            else {
                push( @conv, $$decode{$char} );
            }
        }
        elsif ( $char <= 255 ) {
            # Filter out low ascii overlaps
            if ( exists( $$uni{$char} ) && $char != $$uni{$char} ) {
                push( @conv, undef );
            }
            else {
                push( @conv, $char );
            }
        }
        else {
            push( @conv, undef );
#            push( @conv, $self->_get_chars( "(U+$char)" ) )
        }
    }
    
    return @conv;
}
        
=head2 $font->Conversions

Returns a list of Unicode characters into which this font may be converted

=cut    

sub Conversions {
    my $self = shift;
    my $conv = $self->{UNICODE};
    my @conversions;
    my $combos = $self->{COMBOS};
    my $uni    = $self->{UNICODE};
    my ( $base, $comblist, $cb );

    if ( $self->{COMBOS} ) {
        foreach ( values( %$uni ) ) {
            push( @conversions, $_ ) if ( ref( $_ ) ne 'ARRAY' );
        }
                
        foreach $base ( sort( keys( %$combos ) ) ) {
            $comblist =  $$combos{$base};
            print "!", values( %$comblist ), "\n";
            push( @conversions, values( %$comblist ) );
        }
        return sort _numerically @conversions;
    }
    else {
        return sort _numerically values( %$conv );
    }
}

=head2 $font->Convertable

Returns a list of characters that can be turned into Unicode

=cut

sub Convertable {
    my $self = shift;
    my $conv = $self->{UNICODE};
    return sort( keys( %$conv ) );
}


=head1 PRIVATE METHODS

Documentation of these methods is provided only for those who want to subclass 
C<Unicode::Encoding::Font>. These methods are all to be treated as private methods.
See L<USING AS A BASE CLASS>.

=head2 $font->_get_chars( $string )

Converts a string to an array of CHAR values. For internal use only. 
See L<USING AS A BASE CLASS>.

=cut

sub _get_chars {
    my ( $self, $text ) = @_;
    return unpack( "C" x length( $text ), $text );
}

=head2 $font->_combo( $char, $list )

Composes Unicode letters. B<$char> is the character which may have to be combined with one of the
charaters in B<$list>, which must be a reference to an array. If the next character is one of those
in B<$list>, C<_combo> returns the equivalent of the two characters according to the definitions
in C<COMBOS>. Otherwise it returns the value of C<$char> by itself. See L<A More Complex Case> on 
defining such combinations.

=cut

sub _combo {
    my ( $self, $char, $chars ) = @_;
    
    my $uni = $self->{UNICODE};
    my $combos = $self->{COMBOS};

#    my @choices = @{$$uni{$char}};      # get list of possible combinations
#    my $base = shift( @choices );       # get base character from bottom of list

    my $base = ${$$uni{$char}}[0];       # get base character from bottom of list
    my $choices = ${$$uni{$char}}[1];      # get list of possible combinations


    my $next;
    if ( $next = shift( @$chars ) ) {   # get next character off of stack
        my %nexts;
        for ( @$choices ) {              # construct a possible next characters for combination
            $nexts{$_}++;
        }

        if ( $nexts{$next}++ ) {            # if next character is on the list
            my $picks = $$combos{$char};    # get combination of $char+$next
            return $$picks{$next} if $$picks{$next};    
        }
    }

    unshift( @$chars, $next );  # Put character back on stack if no combination was made and
    return $base;               # return the original uncombined character
}

sub _numerically { $a <=> $b; }

=head1 AUTOLOADED METHODS

Any of the member variables of this class may be gotten through an autoloaded method:

=over 4

=item *

$self->UNICODE:  See L<The Simplest Case>

=item *

$self->DECODE:   See L<The Simplest Case>

=item *

$self->COMBOS:   See L<A More Complex Case>

=item *

$self->LANGUAGE: Language of the font or encoding

=item *

$self->NAME:     Name of the font or encoding

=back

=cut

sub AUTOLOAD {
    my $self = shift;
    my $type = ref( $self ) || croak "$self is not an object";

    my $name = $AUTOLOAD;
    $name =~ s/.*://;   # strip fully-qualified portion

    return $self->{$name};

    if (@_) {
        print "Reset Language\n";
        return $self->{$name} = shift;
    } else {
        return $self->{$name};
    }
}

return 1;

__END__

=head1 USING AS A BASE CLASS

=head2 The basics

The essential elements of this class are the hashes C<UNICODE> and C<DECODE>, and the
methods C<Convert()> and C<Decode()>. The hashes must be supplied by your class, and
the methods may need to be overriden depending on the complexity of your font or 
encoding. The inherited C<Convert()> and C<Decode()> methods can handle cases were 
multiple characters need to be composed into a single Unicode character and vice versa. 

The default constructor calls the C<_initialize()> method, which in the base class 
does nothing. Therefore, I<every> subclass of this class should override 
C<_initialize()>.

=head2 The Simplest Case

In the simplest case, each character in the font or encoding is mapped to exactly one
Unicode character. If, for instance you had Turkish fonts in ISO-8859-9 encoding,
the following code creates a class to convert them (This is the entire implimentation of F<Unicode::Encoding::ISO_8859_9>):

    package Unicode::Encoding::ISO_8859_9;
    
    use Unicode::Encoding::Font;
    @ISA=qw( Unicode::Encoding::Font );
    
    my %uni = (   
        0xD0 => 0x011E,  LATIN CAPITAL LETTER G WITH BREVE
        0xDD => 0x0130,  LATIN CAPITAL LETTER I WITH DOT ABOVE
        0xDE => 0x015E,  LATIN CAPITAL LETTER S WITH CEDILLA
        0xF0 => 0x011F,  LATIN SMALL LETTER G WITH BREVE
        0xFD => 0x0131,  LATIN SMALL LETTER DOTLESS I
        0xFE => 0x015F,  LATIN SMALL LETTER S WITH CEDILLA
    );
    
    my %decode = reverse %uni;

    sub _initialize {
        my $self = shift;
        $self->{NAME}     = 'ISO-8859-9/Latin-5/ECMA-128';
        $self->{UNICODE}  = \%uni;
        $self->{LANGUAGE} = 'Turkish';
    }
    
    return 1;
    __END__

C<%uni> provides the data to convert from ISO-8859-9 to Unicode in the form of a hash 
where the keys are the codes for the characters in the font, the values their Unicode 
equivalents. Both keys and values must be integers, though they do not have to be in 
hexadecimal. Note that only the characters whose values differ in Unicode need to be 
defined. Except for the six characters defined all others have their same values in 
Unicode. This will often be the case, especially with more universal characters such 
as "space" (almost always 32) and numbers. C<%decode> is simply the reverse.

The overriden C<_initialize> only needs to store a reference to C<%uni> in C<UNICODE>,
and to define the other, informative member variables C<NAME> and C<LANGUAGE>. C<NAME> 
will usually, but does not need to correspond exactly to the name of the class.

Sometimes a character may need to be decomposed into more than one Unicode character.
In this case the key in C<%uni> will point to an anonymous array, as in this example
taken from the Macintosh Romanian code page

	0xAF => [ 0x0053, 0x0326 ], # LATIN CAPITAL LETTER S + COMBINING COMMA BELOW
	0xBF => [ 0x0073, 0x0326 ], # LATIN SMALL LETTER S + COMBINING COMMA BELOW
	0xDE => [ 0x0054, 0x0326 ], # LATIN CAPITAL LETTER T + COMBINING COMMA BELOW
	0xDF => [ 0x0074, 0x0326 ], # LATIN SMALL LETTER T + COMBINING COMMA BELOW


=head2 A More Complex Case

In a more complex case. Some combinations of characters can or need to be composed into
single Unicode characters. This is the case, for instance, in Greek, where diacritical marks
are often written before, instead of above, capital letters, like so: I<'A>. In some Greek
fonts these are two separate characters, but in Unicode they are composed into a single character.
This is handled first by mapping "combinable" characters to anonymous arrays consisting of
two element: 1) the Unicode value of the character by itself, 2) another anonymous array
containing the font values of the characters with which it may be combined.

    0x80 => [ 0x1FFD, [ 0x41, 0x45, 0x48, 0x49, 0x4f, 0x55, 0x56 ] ], greek oxia
    0x81 => [ 0x1FEF, [ 0x41, 0x45, 0x48, 0x49, 0x4f, 0x55, 0x56 ] ], greek varia
    0x83 => [ 0x1FBF, [ 0x41, 0x45, 0x48, 0x49, 0x4f, 0x56 ] ],       greek psili
    0x84 => [ 0x1FFE, [ 0x41, 0x45, 0x48, 0x49, 0x4f, 0x55, 0x56 ] ], greek dasia
    0x85 => [ 0x1FCE, [ 0x41, 0x45, 0x48, 0x49, 0x4f, 0x56 ] ],       greek psili and oxia
    0x86 => [ 0x1FDE, [ 0x41, 0x45, 0x48, 0x49, 0x4f, 0x55, 0x56 ] ], greek dasia and oxia
    0x87 => [ 0x1FCD, [ 0x41, 0x45, 0x48, 0x49, 0x4f, 0x56 ] ],       greek psili and varia
    0x88 => [ 0x1FDD, [ 0x41, 0x45, 0x48, 0x49, 0x4f, 0x55, 0x56 ] ], greek dasia and varia
    0x89 => [ 0x1FCF, [ 0x41, 0x48, 0x49, 0x56 ] ],                   greek psili and perispomeni
    0x8a => [ 0x1FDF, [ 0x41, 0x48, 0x49, 0x56 ] ],                   greek dasia and perispomeni

For this font, the Greek acute accent 
(I<oxia>) is 0x80 which corresponds to Unicode 0x1FFD. The elements of the second array are the
characters of the font being converted with which the first character may be combined. So, here, an 
acute accent (0x80) can be combined with the capital letters alpha (0x41), epsilon (0x45), eta (0x48),
iota (0x49), omicron (0x4f), upsilon (0x55), or omega (0x56). Put a different way, this says that
0x80 by itself is Unicode 0x1FFD but if it is followed by 0x41, 0x45, 0x48, 0x49, 0x4f, 0x55, or 0x56
the two may be combined as a different single Unicode character.

The next step is to define a hash whose keys are those of the combinable characters (in the above 
example, 0x80, 0x81, etc.) and whose values are anonymous hashes. The keys of the anonymous hash 
are the codes of the characters with which the first character may be combined, the values are the
Unicode equivalents of the combination.

    my %combo = (
        0x80     => {       
            0x41     => 0x1FBB  ,  greek capital letter alpha with oxia
            0x45     => 0x1FC9  ,  greek capital letter epsilon with oxia
            0x48     => 0x1FCB  ,  greek capital letter eta with oxia
            0x49     => 0x1FDB  ,  greek capital letter iota with oxia
            0x4f     => 0x1FF9  ,  greek capital letter omicron with oxia
            0x55     => 0x1FEB  ,  greek capital letter upsilon with oxia
            0x56     => 0x1FFB     greek capital letter omega with oxia
        },              
        0x81     => {       
            0x41     => 0x1FBA  ,  greek capital letter alpha with varia
            0x45     => 0x1FC8  ,  greek capital letter epsilon with varia
            0x48     => 0x1FCA  ,  greek capital letter eta with varia
            0x49     => 0x1FDA  ,  greek capital letter iota with varia
            0x4f     => 0x1FF8  ,  greek capital letter omicron with varia
            0x55     => 0x1FEA  ,  greek capital letter upsilon with varia
            0x56     => 0x1FFA     greek capital letter omega with varia
        },              
        ...
        
I.e., 0x80 + 0x41 = 0x1FBB, 0x80 + 0x45 = 0x1FC9.

When C<Convert> encounters a character that corresponds to an array rather than to an integer,
it first checks to see if the second element of the array is an array. If it the second
element is not an array it simply converts each element of the array (see L<The Simplest Case>).
If the second element I<is> also an array, it passes the character and the array off
to C<_combo>. C<_combo> looks up the possible combinations in B<COMBOS> and 
returns the composes character if there is a match. Otherwise it returns the
first element of the array which is the Unicode equivalent of the first character
by itself.

The reverse is simpler. Unicode characters that must be decomposed into multiple characters are mapped in
B<DECODE> to arrays:

    0x1FBA => [ 0x81, 0x41 ], greek capital letter alpha with varia
    0x1FBB => [ 0x80, 0x41 ], greek capital letter alpha with oxia
    
This simply means that 0x1FBA must be decomposed into the two characters 0x81 and 0x41, 0x1FBB into 0x80
and 0x41.

References to these three hashes must be stored in the overriden C<_initialize>.

    $self->{UNICODE}   = \%uni;
    $self->{COMBOS}    = \%combo;
    $self->{DECODE}    = \%decode;

=head2 The Most Complex Case

There are any number of schemes for representing various alphabets and symbols using, for instance, only
ASCII characters (such as Beta Code for Greek and ITRANS for Indian languages). These schemes can be
supported by overriding C<Convert> and C<Decode>. See BetaCode.pm for an example.

=head1 COPYRIGHT

Copyright (c) 1998 Sean Redmond. All rights reserved. 

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself. 

=head1 AUTHOR

Sean Redmond