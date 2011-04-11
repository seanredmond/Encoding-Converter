package Unicode::Encoding::BetaCode;

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

use Unicode::Encoding::Font;
@ISA=qw( Unicode::Encoding::Font );

use Carp;

=head1 NAME

Unicode::Encoding::Font - Base Class for font encodings used by Unicode::Converter

=head1 SYNOPSIS

    use Unicode::Encoding::Font;
    @ISA=qw( Unicode::Encoding::Font );

=head1 DESCRIPTION

See Unicode::Encoding::Font

=cut


my %decode = (
    0x0020 => ' ',
    0x0342 => '=', # combining greek perispomeni
    0x0344 => '/+', # combining greek dialytika tonos
    0x0345 => '|', # combining greek ypogegrammeni
    0x0374 => '#', # greek numeral sign
    0x037A => '|', # greek ypogegrammeni
    0x037E => ';', # greek question mark
    0x0384 => '%32', # greek tonos
    0x0385 => '%132', # greek dialytika tonos
    0x0386 => '*A/', # greek capital letter alpha with tonos
    0x0387 => ':', # greek ano teleia
    0x0388 => '*E/', # greek capital letter epsilon with tonos
    0x0389 => '*H/', # greek capital letter eta with tonos
    0x038A => '*I/', # greek capital letter iota with tonos
    0x038C => '*O/', # greek capital letter omicron with tonos
    0x038E => '*Y/', # greek capital letter upsilon with tonos
    0x038F => '*W/', # greek capital letter omega with tonos
    0x0390 => 'I/+', # greek small letter iota with dialytika and tonos
    0x0391 => '*A', # greek capital letter alpha
    0x0392 => '*B', # greek capital letter beta
    0x0393 => '*G', # greek capital letter gamma
    0x0394 => '*D', # greek capital letter delta
    0x0395 => '*E', # greek capital letter epsilon
    0x0396 => '*A', # greek capital letter zeta
    0x0397 => '*H', # greek capital letter eta
    0x0398 => '*Z', # greek capital letter theta
    0x0399 => '*I', # greek capital letter iota
    0x039A => '*K', # greek capital letter kappa
    0x039B => '*L', # greek capital letter lamda
    0x039C => '*M', # greek capital letter mu
    0x039D => '*N', # greek capital letter nu
    0x039E => '*C', # greek capital letter xi
    0x039F => '*O', # greek capital letter omicron
    0x03A0 => '*P', # greek capital letter pi
    0x03A1 => '*R', # greek capital letter rho
    0x03A3 => '*S', # greek capital letter sigma
    0x03A4 => '*T', # greek capital letter tau
    0x03A5 => '*Y', # greek capital letter upsilon
    0x03A6 => '*F', # greek capital letter phi
    0x03A7 => '*X', # greek capital letter chi
    0x03A8 => '*Y', # greek capital letter psi
    0x03A9 => '*W', # greek capital letter omega
    0x03AA => '*I+', # greek capital letter iota with dialytika
    0x03AB => '*Y+', # greek capital letter upsilon with dialytika
    0x03AC => 'A/', # greek small letter alpha with tonos
    0x03AD => 'E/', # greek small letter epsilon with tonos
    0x03AE => 'H/', # greek small letter eta with tonos
    0x03AF => 'I/', # greek small letter iota with tonos
    0x03B0 => 'Y/+', # greek small letter upsilon with dialytika and tonos
    0x03B1 => 'A', # greek small letter alpha
    0x03B2 => 'B', # greek small letter beta
    0x03B3 => 'G', # greek small letter gamma
    0x03B4 => 'D', # greek small letter delta
    0x03B5 => 'E', # greek small letter epsilon
    0x03B6 => 'Z', # greek small letter zeta
    0x03B7 => 'H', # greek small letter eta
    0x03B8 => 'Q', # greek small letter theta
    0x03B9 => 'I', # greek small letter iota
    0x03BA => 'K', # greek small letter kappa
    0x03BB => 'L', # greek small letter lamda
    0x03BC => 'M', # greek small letter mu
    0x03BD => 'N', # greek small letter nu
    0x03BE => 'C', # greek small letter xi
    0x03BF => 'O', # greek small letter omicron
    0x03C0 => 'P', # greek small letter pi
    0x03C1 => 'R', # greek small letter rho
    0x03C2 => 'S', # greek small letter final sigma
    0x03C3 => 'S', # greek small letter sigma
    0x03C4 => 'T', # greek small letter tau
    0x03C5 => 'Y', # greek small letter upsilon
    0x03C6 => 'F', # greek small letter phi
    0x03C7 => 'X', # greek small letter chi
    0x03C8 => 'Y', # greek small letter psi
    0x03C9 => 'W', # greek small letter omega
    0x03CA => 'I+', # greek small letter iota with dialytika
    0x03CB => 'Y+', # greek small letter upsilon with dialytika
    0x03CC => 'O/', # greek small letter omicron with tonos
    0x03CD => 'Y/', # greek small letter upsilon with tonos
    0x03CE => 'W/', # greek small letter omega with tonos
    0x03D0 => 'H', # greek beta symbol
    0x03D1 => 'H', # greek theta symbol
    0x03D2 => 'Y', # greek upsilon with hook symbol
    0x03D3 => 'Y', # greek upsilon with acute and hook symbol
    0x03D4 => 'Y', # greek upsilon with diaeresis and hook symbol
    0x03D5 => 'F', # greek phi symbol
    0x03D6 => 'P', # greek pi symbol
    0x03DA => '#2', # greek letter stigma
    0x03DC => 'V', # greek letter digamma
    0x03DE => '#3', # greek letter koppa
    0x03E0 => '#5', # greek letter sampi
    0x03F0 => 'K', # greek kappa symbol
    0x03F1 => 'R', # greek rho symbol
    0x03F2 => 'S3', # greek lunate sigma symbol
    0x1F00 => 'A)', # greek small letter alpha with psili
    0x1F01 => 'A(', # greek small letter alpha with dasia
    0x1F02 => 'A)\\', # greek small letter alpha with psili and varia
    0x1F03 => 'A(\\', # greek small letter alpha with dasia and varia
    0x1F04 => 'A)/', # greek small letter alpha with psili and oxia
    0x1F05 => 'A(/', # greek small letter alpha with dasia and oxia
    0x1F06 => 'A)=', # greek small letter alpha with psili and perispomeni
    0x1F07 => 'A(=', # greek small letter alpha with dasia and perispomeni
    0x1F08 => '*)A', # greek capital letter alpha with psili
    0x1F09 => '*(A', # greek capital letter alpha with dasia
    0x1F0A => '*)A\\', # greek capital letter alpha with psili and varia
    0x1F0B => '*(A\\', # greek capital letter alpha with dasia and varia
    0x1F0C => '*)A/', # greek capital letter alpha with psili and oxia
    0x1F0D => '*(A/', # greek capital letter alpha with dasia and oxia
    0x1F0E => '*)A=', # greek capital letter alpha with psili and perispomeni
    0x1F0F => '*(A=', # greek capital letter alpha with dasia and perispomeni
    0x1F10 => 'E)', # greek small letter epsilon with psili
    0x1F11 => 'E(', # greek small letter epsilon with dasia
    0x1F12 => 'E)\\', # greek small letter epsilon with psili and varia
    0x1F13 => 'E(\\', # greek small letter epsilon with dasia and varia
    0x1F14 => 'E)/', # greek small letter epsilon with psili and oxia
    0x1F15 => 'E(/', # greek small letter epsilon with dasia and oxia
    0x1F18 => '*)E', # greek capital letter epsilon with psili
    0x1F19 => '*(E', # greek capital letter epsilon with dasia
    0x1F1A => '*)E\\', # greek capital letter epsilon with psili and varia
    0x1F1B => '*(E\\', # greek capital letter epsilon with dasia and varia
    0x1F1C => '*)E/', # greek capital letter epsilon with psili and oxia
    0x1F1D => '*(E/', # greek capital letter epsilon with dasia and oxia
    0x1F20 => 'H)', # greek small letter eta with psili
    0x1F21 => 'H(', # greek small letter eta with dasia
    0x1F22 => 'H)\\', # greek small letter eta with psili and varia
    0x1F23 => 'H(\\', # greek small letter eta with dasia and varia
    0x1F24 => 'H)/', # greek small letter eta with psili and oxia
    0x1F25 => 'H(/', # greek small letter eta with dasia and oxia
    0x1F26 => 'H)=', # greek small letter eta with psili and perispomeni
    0x1F27 => 'H(=', # greek small letter eta with dasia and perispomeni
    0x1F28 => '*)H', # greek capital letter eta with psili
    0x1F29 => '*(H', # greek capital letter eta with dasia
    0x1F2A => '*)H\\', # greek capital letter eta with psili and varia
    0x1F2B => '*(H\\', # greek capital letter eta with dasia and varia
    0x1F2C => '*)H/', # greek capital letter eta with psili and oxia
    0x1F2D => '*(H/', # greek capital letter eta with dasia and oxia
    0x1F2E => '*)H=', # greek capital letter eta with psili and perispomeni
    0x1F2F => '*(H=', # greek capital letter eta with dasia and perispomeni
    0x1F30 => 'I)', # greek small letter iota with psili
    0x1F31 => 'I(', # greek small letter iota with dasia
    0x1F32 => 'I)\\', # greek small letter iota with psili and varia
    0x1F33 => 'I(\\', # greek small letter iota with dasia and varia
    0x1F34 => 'I)/', # greek small letter iota with psili and oxia
    0x1F35 => 'I(/', # greek small letter iota with dasia and oxia
    0x1F36 => 'I)=', # greek small letter iota with psili and perispomeni
    0x1F37 => 'I(=', # greek small letter iota with dasia and perispomeni
    0x1F38 => '*)I', # greek capital letter iota with psili
    0x1F39 => '*(I', # greek capital letter iota with dasia
    0x1F3A => '*)I\\', # greek capital letter iota with psili and varia
    0x1F3B => '*(I\\', # greek capital letter iota with dasia and varia
    0x1F3C => '*)I/', # greek capital letter iota with psili and oxia
    0x1F3D => '*(I/', # greek capital letter iota with dasia and oxia
    0x1F3E => '*)I=', # greek capital letter iota with psili and perispomeni
    0x1F3F => '*(I=', # greek capital letter iota with dasia and perispomeni
    0x1F40 => 'O)', # greek small letter omicron with psili
    0x1F41 => 'O(', # greek small letter omicron with dasia
    0x1F42 => 'O)\\', # greek small letter omicron with psili and varia
    0x1F43 => 'O(\\', # greek small letter omicron with dasia and varia
    0x1F44 => 'O)/', # greek small letter omicron with psili and oxia
    0x1F45 => 'O(/', # greek small letter omicron with dasia and oxia
    0x1F48 => '*)O', # greek capital letter omicron with psili
    0x1F49 => '*(O', # greek capital letter omicron with dasia
    0x1F4A => '*)O\\', # greek capital letter omicron with psili and varia
    0x1F4B => '*(O\\', # greek capital letter omicron with dasia and varia
    0x1F4C => '*)O/', # greek capital letter omicron with psili and oxia
    0x1F4D => '*(O/', # greek capital letter omicron with dasia and oxia
    0x1F50 => 'Y)', # greek small letter upsilon with psili
    0x1F51 => 'Y(', # greek small letter upsilon with dasia
    0x1F52 => 'Y)\\', # greek small letter upsilon with psili and varia
    0x1F53 => 'Y(\\', # greek small letter upsilon with dasia and varia
    0x1F54 => 'Y)/', # greek small letter upsilon with psili and oxia
    0x1F55 => 'Y(/', # greek small letter upsilon with dasia and oxia
    0x1F56 => 'Y)=', # greek small letter upsilon with psili and perispomeni
    0x1F57 => 'Y(=', # greek small letter upsilon with dasia and perispomeni
    0x1F59 => '*(Y', # greek capital letter upsilon with dasia
    0x1F5B => '*(Y\\', # greek capital letter upsilon with dasia and varia
    0x1F5D => '*(Y/', # greek capital letter upsilon with dasia and oxia
    0x1F5F => '*(Y=', # greek capital letter upsilon with dasia and perispomeni
    0x1F60 => 'W)', # greek small letter omega with psili
    0x1F61 => 'W(', # greek small letter omega with dasia
    0x1F62 => 'W)\\', # greek small letter omega with psili and varia
    0x1F63 => 'W(\\', # greek small letter omega with dasia and varia
    0x1F64 => 'W)/', # greek small letter omega with psili and oxia
    0x1F65 => 'W(/', # greek small letter omega with dasia and oxia
    0x1F66 => 'W)=', # greek small letter omega with psili and perispomeni
    0x1F67 => 'W(=', # greek small letter omega with dasia and perispomeni
    0x1F68 => '*)W', # greek capital letter omega with psili
    0x1F69 => '*(W', # greek capital letter omega with dasia
    0x1F6A => '*)W\\', # greek capital letter omega with psili and varia
    0x1F6B => '*(W\\', # greek capital letter omega with dasia and varia
    0x1F6C => '*)W/', # greek capital letter omega with psili and oxia
    0x1F6D => '*(W/', # greek capital letter omega with dasia and oxia
    0x1F6E => '*)W=', # greek capital letter omega with psili and perispomeni
    0x1F6F => '*(W=', # greek capital letter omega with dasia and perispomeni
    0x1F70 => 'A\\', # greek small letter alpha with varia
    0x1F71 => 'A/', # greek small letter alpha with oxia
    0x1F72 => 'E\\', # greek small letter epsilon with varia
    0x1F73 => 'E/', # greek small letter epsilon with oxia
    0x1F74 => 'H\\', # greek small letter eta with varia
    0x1F75 => 'H/', # greek small letter eta with oxia
    0x1F76 => 'I\\', # greek small letter iota with varia
    0x1F77 => 'I/', # greek small letter iota with oxia
    0x1F78 => 'O\\', # greek small letter omicron with varia
    0x1F79 => 'O/', # greek small letter omicron with oxia
    0x1F7A => 'Y\\', # greek small letter upsilon with varia
    0x1F7B => 'Y/', # greek small letter upsilon with oxia
    0x1F7C => 'W\\', # greek small letter omega with varia
    0x1F7D => 'W/', # greek small letter omega with oxia
    0x1F80 => 'A)|', # greek small letter alpha with psili and ypogegrammeni
    0x1F81 => 'A(|', # greek small letter alpha with dasia and ypogegrammeni
    0x1F82 => 'A)\\|', # greek small letter alpha with psili and varia and ypogegrammeni
    0x1F83 => 'A(\\|', # greek small letter alpha with dasia and varia and ypogegrammeni
    0x1F84 => 'A)/|', # greek small letter alpha with psili and oxia and ypogegrammeni
    0x1F85 => 'A(/|', # greek small letter alpha with dasia and oxia and ypogegrammeni
    0x1F86 => 'A)=|', # greek small letter alpha with psili and perispomeni and ypogegrammeni
    0x1F87 => 'A(=|', # greek small letter alpha with dasia and perispomeni and ypogegrammeni
    0x1F88 => '*)A*I', # greek capital letter alpha with psili and prosgegrammeni
    0x1F89 => '*(A*I', # greek capital letter alpha with dasia and prosgegrammeni
    0x1F8A => '*)A\\*I', # greek capital letter alpha with psili and varia and prosgegrammeni
    0x1F8B => '*(A\\*I', # greek capital letter alpha with dasia and varia and prosgegrammeni
    0x1F8C => '*)A/*I', # greek capital letter alpha with psili and oxia and prosgegrammeni
    0x1F8D => '*(A/*I', # greek capital letter alpha with dasia and oxia and prosgegrammeni
    0x1F8E => '*)A=*I', # greek capital letter alpha with psili and perispomeni and prosgegrammeni
    0x1F8F => '*(A=*I', # greek capital letter alpha with dasia and perispomeni and prosgegrammeni
    0x1F90 => 'H)|', # greek small letter eta with psili and ypogegrammeni
    0x1F91 => 'H(|', # greek small letter eta with dasia and ypogegrammeni
    0x1F92 => 'H)\\|', # greek small letter eta with psili and varia and ypogegrammeni
    0x1F93 => 'H(\\|', # greek small letter eta with dasia and varia and ypogegrammeni
    0x1F94 => 'H)/|', # greek small letter eta with psili and oxia and ypogegrammeni
    0x1F95 => 'H(/|', # greek small letter eta with dasia and oxia and ypogegrammeni
    0x1F96 => 'H)=|', # greek small letter eta with psili and perispomeni and ypogegrammeni
    0x1F97 => 'H(=|', # greek small letter eta with dasia and perispomeni and ypogegrammeni
    0x1F98 => '*)H*I', # greek capital letter eta with psili and prosgegrammeni
    0x1F99 => '*(H*I', # greek capital letter eta with dasia and prosgegrammeni
    0x1F9A => '*)H\\*I', # greek capital letter eta with psili and varia and prosgegrammeni
    0x1F9B => '*(H\\*I', # greek capital letter eta with dasia and varia and prosgegrammeni
    0x1F9C => '*)H/*I', # greek capital letter eta with psili and oxia and prosgegrammeni
    0x1F9D => '*(H/*I', # greek capital letter eta with dasia and oxia and prosgegrammeni
    0x1F9E => '*)H=*I', # greek capital letter eta with psili and perispomeni and prosgegrammeni
    0x1F9F => '*(H=*I', # greek capital letter eta with dasia and perispomeni and prosgegrammeni
    0x1FA0 => 'W)|', # greek small letter omega with psili and ypogegrammeni
    0x1FA1 => 'W(|', # greek small letter omega with dasia and ypogegrammeni
    0x1FA2 => 'W)\\|', # greek small letter omega with psili and varia and ypogegrammeni
    0x1FA3 => 'W(\\|', # greek small letter omega with dasia and varia and ypogegrammeni
    0x1FA4 => 'W)/|', # greek small letter omega with psili and oxia and ypogegrammeni
    0x1FA5 => 'W(/|', # greek small letter omega with dasia and oxia and ypogegrammeni
    0x1FA6 => 'W)=|', # greek small letter omega with psili and perispomeni and ypogegrammeni
    0x1FA7 => 'W(=|', # greek small letter omega with dasia and perispomeni and ypogegrammeni
    0x1FA8 => '*)W*I', # greek capital letter omega with psili and prosgegrammeni
    0x1FA9 => '*(W*I', # greek capital letter omega with dasia and prosgegrammeni
    0x1FAA => '*)W\\*I', # greek capital letter omega with psili and varia and prosgegrammeni
    0x1FAB => '*(W\\*I', # greek capital letter omega with dasia and varia and prosgegrammeni
    0x1FAC => '*)W/*I', # greek capital letter omega with psili and oxia and prosgegrammeni
    0x1FAD => '*(W/*I', # greek capital letter omega with dasia and oxia and prosgegrammeni
    0x1FAE => '*)W=*I', # greek capital letter omega with psili and perispomeni and prosgegrammeni
    0x1FAF => '*(W=*I', # greek capital letter omega with dasia and perispomeni and prosgegrammeni
    0x1FB0 => 'A', # greek small letter alpha with vrachy
    0x1FB1 => 'A', # greek small letter alpha with macron
    0x1FB2 => 'A\\|', # greek small letter alpha with varia and ypogegrammeni
    0x1FB3 => 'A|', # greek small letter alpha with ypogegrammeni
    0x1FB4 => 'A/|', # greek small letter alpha with oxia and ypogegrammeni
    0x1FB6 => 'A=', # greek small letter alpha with perispomeni
    0x1FB7 => 'A=|', # greek small letter alpha with perispomeni and ypogegrammeni
    0x1FB8 => '*A', # greek capital letter alpha with vrachy
    0x1FB9 => '*A', # greek capital letter alpha with macron
    0x1FBA => '*A\\', # greek capital letter alpha with varia
    0x1FBB => '*A/', # greek capital letter alpha with oxia
    0x1FBC => '*A*I', # greek capital letter alpha with prosgegrammeni
    0x1FBE => '*I', # greek prosgegrammeni
    0x1FBF => '%30', # greek psili
    0x1FC0 => '%34', # greek perispomeni
    0x1FC2 => 'H\\|', # greek small letter eta with varia and ypogegrammeni
    0x1FC3 => 'H|', # greek small letter eta with ypogegrammeni
    0x1FC4 => 'H/|', # greek small letter eta with oxia and ypogegrammeni
    0x1FC6 => 'H=', # greek small letter eta with perispomeni
    0x1FC7 => 'H=|', # greek small letter eta with perispomeni and ypogegrammeni
    0x1FC8 => '*E\\', # greek capital letter epsilon with varia
    0x1FC9 => '*E/', # greek capital letter epsilon with oxia
    0x1FCA => '*H\\', # greek capital letter eta with varia
    0x1FCB => '*H/', # greek capital letter eta with oxia
    0x1FCC => '*H*I', # greek capital letter eta with prosgegrammeni
    0x1FCD => '%133', # greek psili and varia
    0x1FCE => '%35', # greek psili and oxia
    0x1FCF => '%134', # greek psili and perispomeni
    0x1FD0 => 'I', # greek small letter iota with vrachy
    0x1FD1 => 'I', # greek small letter iota with macron
    0x1FD2 => 'I\\+', # greek small letter iota with dialytika and varia
    0x1FD3 => 'I/+', # greek small letter iota with dialytika and oxia
    0x1FD6 => 'I=', # greek small letter iota with perispomeni
    0x1FD7 => 'I=+', # greek small letter iota with dialytika and perispomeni
    0x1FD8 => '*I', # greek capital letter iota with vrachy
    0x1FD9 => '*I', # greek capital letter iota with macron
    0x1FDA => '*I\\', # greek capital letter iota with varia
    0x1FDB => '*I/', # greek capital letter iota with oxia
    0x1FDD => '%37', # greek dasia and varia
    0x1FDE => '%36', # greek dasia and oxia
    0x1FDF => '%38', # greek dasia and perispomeni
    0x1FE0 => 'Y', # greek small letter upsilon with vrachy
    0x1FE1 => 'Y', # greek small letter upsilon with macron
    0x1FE2 => 'Y\\+', # greek small letter upsilon with dialytika and varia
    0x1FE3 => 'Y/+', # greek small letter upsilon with dialytika and oxia
    0x1FE4 => 'R)', # greek small letter rho with psili
    0x1FE5 => 'R(', # greek small letter rho with dasia
    0x1FE6 => 'Y=', # greek small letter upsilon with perispomeni
    0x1FE7 => 'Y=+', # greek small letter upsilon with dialytika and perispomeni
    0x1FE8 => '*Y', # greek capital letter upsilon with vrachy
    0x1FE9 => '*Y', # greek capital letter upsilon with macron
    0x1FEA => '*Y\\', # greek capital letter upsilon with varia
    0x1FEB => '*Y/', # greek capital letter upsilon with oxia
    0x1FEC => '*(R', # greek capital letter rho with dasia
    0x1FEE => '%132', # greek dialytika and oxia
    0x1FEF => '%33', # greek varia
    0x1FF2 => 'W\\|', # greek small letter omega with varia and ypogegrammeni
    0x1FF3 => 'W|', # greek small letter omega with ypogegrammeni
    0x1FF4 => 'W/|', # greek small letter omega with oxia and ypogegrammeni
    0x1FF6 => 'W=', # greek small letter omega with perispomeni
    0x1FF7 => 'W=|', # greek small letter omega with perispomeni and ypogegrammeni
    0x1FF8 => '*O\\', # greek capital letter omicron with varia
    0x1FF9 => '*O/', # greek capital letter omicron with oxia
    0x1FFA => '*W\\', # greek capital letter omega with varia
    0x1FFB => '*W/', # greek capital letter omega with oxia
    0x1FFC => '*W*I', # greek capital letter omega with prosgegrammeni
    0x1FFD => '%32', # greek oxia
    0x1FFE => '%31' # greek dasia
);

sub _initialize {
    my $self = shift;
    $self->{NAME}     = 'BetaCode';
    $self->{LANGUAGE} = 'Greek';
    $self->{DECODE}   = \%decode;
}

# The inherited Decode() can do most of the work, but since the
# values of $self->{DECODE} are strings and not integers, they have
# to be converted to an array of integers (by _get_chars) before
# they are returned
sub Decode {
    my( $self, @array ) = @_;
    my @conv = $self->SUPER::Decode( @array );
    return $self->_get_chars( join( '', @conv ) );
}

sub Convert {
    my ( $self, $text, $font ) = @_;
    my ( @conv, $unicode, $p, $a );

    if ( eval( "require Greek::BetaCodeParser;" ) ) {
        unless ( eval( "\$p = new Greek::BetaCodeParser();" ) ) {
            croak "$@Can't create new Greek::BetaCodeParser";
        }
    }
    else {
        croak "$@\nCan't require Greek::BetaCodeParser";
    }

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

    $p->text( $text );
    my @atoms = $p->getAtoms();

    while ( @atoms  ) {
        my @temp = $self->_Unicode( shift( @atoms ), \@atoms );
        push( @conv, @temp ) if @temp;
    }

    @conv = $font->Decode( \@conv ) if $font;
    return @conv;
}


sub _Escapes {
    my ( $self, $char ) = @_;
    my ( $escape, $number, $code );

    if ( $char =~ /\d+/oi ) {
        $escape = $`;
        $number = $&;
    }
    else {
        $escape = $char;
    }


    ESCAPE: {
        if ( $escape eq '%' ) {
            SWITCH: {
                $code = 8224, last SWITCH unless $number;   # dagger
                $code =   63, last SWITCH if $number ==  1; # ?
                $code =   42, last SWITCH if $number ==  2; # *
                $code =   47, last SWITCH if $number ==  3; # /
                $code =   33, last SWITCH if $number ==  4; # !
                $code =  124, last SWITCH if $number ==  5; # |
                $code =   61, last SWITCH if $number ==  6; # =
                $code =   43, last SWITCH if $number ==  7; # +
                $code =   37, last SWITCH if $number ==  8; # %
                $code =   38, last SWITCH if $number ==  9; # &
                $code =   58, last SWITCH if $number == 10; # ;
                $code = 8225, last SWITCH if $number == 13; # double dagger
                $code =  182, last SWITCH if $number == 14; # Paragraph sign
                $code =  166, last SWITCH if $number == 16; # Broken vertical bar
                $code =   39, last SWITCH if $number == 18; # Apostrophe
                $code =   45, last SWITCH if $number == 19; # Mid-line hyphen
                $code =  771, last SWITCH if $number == 24; # Tilde (over previous letter)
                $code =  807, last SWITCH if $number == 25; # Cedilla (under previous letter)
                $code =  772, last SWITCH if $number == 26; # Long vowel or syllable (over previous letter)
                $code =  774, last SWITCH if $number == 27; # Short vowel or syllable (over previous letter)
                $code =  776, last SWITCH if $number == 28; # Diaeresis in Roman font
                $code =  774, last SWITCH if $number == 29; # Short vowel or syllable (over previous letter)
            }
            last ESCAPE;
        }

        if ( $escape eq '"' ) {
            SWITCH: {
                $code =   34, last SWITCH unless $number;
                $code = 8222,  last SWITCH if $number ==  1; # Low opening double quotation mark
                $code = 8221,  last SWITCH if $number ==  2; # High closing double quotation mark
                $code = 8218,  last SWITCH if $number ==  4; # Low single opening quotation mark
                $code = 8217,  last SWITCH if $number ==  5; # High single closing quotation mark
                $code = 8222,  last SWITCH if $number ==  8; # Low double closing quotation mark
            }
            last ESCAPE;
        }

        if ( $escape eq '@' ) {
            SWITCH: {
                $code = unpack( 'C', "\t" ), last SWITCH unless $number;
                return 0 if $number == 1;
            }
            last ESCAPE;
        }

        if( $escape eq '#' ) {
            SWITCH: {
                $code = 0x0374, last SWITCH unless $number; # GREEK NUMERAL SIGN
                $code = 0x03DA, last SWITCH if $number ==   2;  # GREEK LETTER STIGMA 
                $code = 0x03DE, last SWITCH if $number ==   3;  # GREEK LETTER KOPPA 
                $code = 0x03E0, last SWITCH if $number ==   5;  # GREEK LETTER SAMPI 
                $code = 0x00A8, last SWITCH if $number ==  80;  # DIAERESIS 
                $code = 0x0027, last SWITCH if $number ==  81;  # APOSTROPHE 
                $code = 0x00B4, last SWITCH if $number ==  82;  # ACUTE 
                $code = 0x0060, last SWITCH if $number ==  83;  # GRAVE 
                $code = 0x005E, last SWITCH if $number ==  84;  # CIRCUMFLEX
                $code = 0x1FFE, last SWITCH if $number ==  85;  # GREEK DASIA
                $code = 0x1FBF, last SWITCH if $number ==  86;  # GREEK PSILI
                $code = 0x2627, last SWITCH if $number == 322;  # CHI RHO
            }
            last ESCAPE;
        }


        if( $escape eq '[' ) {
            SWITCH: {
                $code = 0x005b, last SWITCH unless $number; # left square bracket
                $code = 0x0028, last SWITCH if $number ==  1;  # LEFT PARENTHESIS
                $code = 0x2329, last SWITCH if $number ==  2;  # LEFT-POINTING ANGLE BRACKET
                $code = 0x007b, last SWITCH if $number ==  3;  # LEFT CURLY BRACKET
                $code = 0x208D, last SWITCH if $number ==  11; # SUBSCRIPT LEFT PARENTHESIS 
            }
            last ESCAPE;
        }
            
        if( $escape eq ']' ) {
            SWITCH: {
                $code = 0x005d, last SWITCH unless $number; # right square bracket
                $code = 0x0029, last SWITCH if $number ==  1; # RIGHT PARENTHESIS
                $code = 0x232A, last SWITCH if $number ==  2; # RIGHT-POINTING ANGLE BRACKET
                $code = 0x007d, last SWITCH if $number ==  3; # RIGHT CURLY BRACKET
                $code = 0x208e, last SWITCH if $number ==  11; # SUBSCRIPT RIGHT PARENTHESIS 
            }
            last ESCAPE;
        }


        if( $escape eq '{' || $escape eq '}' ) {
            return 0;
            last ESCAPE;
        }
        if( $escape eq '<' || $escape eq '>' ) {
            return 0;
            last ESCAPE;
        }

        $code = 0x2013, last ESCAPE if( $escape eq '_' ); # en dash
        $code = 0x037e, last ESCAPE if( $escape eq ';' ); # Greek question mark
        $code = 0x0387, last ESCAPE if( $escape eq ':' ); # Greek colon
        $code = 0x0323, last ESCAPE if( $escape eq '?' ); # Combining dot below
    }

    if ( $code == -1 ) {
        return '';
    }
    elsif ( $code ) {
        return $code;
    }
    else {
        return unpack( 'C' x length( $escape ), $escape );
    }
}

sub _Unicode {
    my ( $self, $atom, $atoms ) = @_;

    my ( $cap, $lett, $breath, $accent, $diaeresis, $sub, $code );

    if ( substr( $atom, 0 , 1 ) =~ /[\%\@\"\$\[\]\:\;\_\?\!\{\}\<\>\#]/o ) {
        $code = $self->_Escapes( $atom );
        return $code if $code;
        return ();
    }
    else {

        foreach $a ( split( '', $atom ) ) {

            if ( $a =~ /[a-zA-Z]/o ) {
                $lett = lc( $a );
            }

            # Is it a capital letter
            elsif ( $a eq '*' ) {   
                $cap = 1;
            }

            # Is it a breathing mark
            elsif ( $a =~ /[\(\)]/o ) {
               if ( $a eq '(' ) { $breath = 'ROUGH' ; }
                else             { $breath = 'SMOOTH'; }
            }

            # Is it an accent
            elsif ( $a =~ /[\/\\\=]/o ) {
               if ( $a eq '/' ) {
                    $accent = 'ACUTE';
                }
                elsif ( $a eq "\\" ) {
                    $accent = 'GRAVE';
                }
                elsif ( $a eq '=' ) {
                    $accent = 'CIRC';
                }
            }

            # Is it a diaeresis
            elsif ( $a eq '+' ) {
               $diaeresis = 1;
            }

            # Is it a iota subscript
            elsif ( $a eq '|' ) {
               $sub = 1;
            }
        }

        $code = $self->_get_unicode_value( $cap, $lett, $breath, $accent, $diaeresis, $sub, $atoms );
    }


    if ( $code ) {
        $atom = $code;
    }
    else {
        $atom = unpack( 'C' x length( $atom), $atom );
    }
    return $atom;
}

sub _get_unicode_value {
    my ( $self, $cap, $lett, $breath, $accent, $diaeresis, $sub, $atoms ) = @_;
    my $code = 0;

    if ( $lett =~ /[aehiouwr]/oi ) {

        SWITCH: {
            $code = $cap ? 913 : 945, last SWITCH if ( $lett eq 'a' );
            $code = $cap ? 917 : 949, last SWITCH if ( $lett eq 'e' );
            $code = $cap ? 919 : 951, last SWITCH if ( $lett eq 'h' );
            $code = $cap ? 921 : 953, last SWITCH if ( $lett eq 'i' );
            $code = $cap ? 927 : 959, last SWITCH if ( $lett eq 'o' );
            $code = $cap ? 933 : 965, last SWITCH if ( $lett eq 'u' );
            $code = $cap ? 937 : 969, last SWITCH if ( $lett eq 'w' );
            $code = $cap ? 929 : 961, last SWITCH if ( $lett eq 'r' );
        }

        $code = &add_breath(   $code, $breath ) if $breath;
        $code = &add_accent(   $code, $accent ) if $accent;
        $code = &add_diaeresis( $code          ) if $diaeresis;
        $code = &add_iota(     $code          ) if $sub;
    }
    else {
        SWITCH: {
            $code = $cap ? 914 : 946, last SWITCH if ( $lett eq 'b' );
            $code = $cap ? 916 : 948, last SWITCH if ( $lett eq 'd' );
            $code = $cap ? 915 : 947, last SWITCH if ( $lett eq 'g' );
            $code = $cap ? 918 : 950, last SWITCH if ( $lett eq 'z' );
            $code = $cap ? 920 : 952, last SWITCH if ( $lett eq 'q' );
            $code = $cap ? 922 : 954, last SWITCH if ( $lett eq 'k' );
            $code = $cap ? 923 : 955, last SWITCH if ( $lett eq 'l' );
            $code = $cap ? 924 : 956, last SWITCH if ( $lett eq 'm' );
            $code = $cap ? 925 : 957, last SWITCH if ( $lett eq 'n' );
            $code = $cap ? 926 : 958, last SWITCH if ( $lett eq 'c' );
            $code = $cap ? 928 : 960, last SWITCH if ( $lett eq 'p' );
            $code = $cap ? 929 : 961, last SWITCH if ( $lett eq 'r' );
            $code = $cap ? 931 : &sigma( $$atoms[0] ), last SWITCH if ( $lett eq 's' );
            $code = $cap ? 932 : 964, last SWITCH if ( $lett eq 't' );
            $code = $cap ? 934 : 966, last SWITCH if ( $lett eq 'f' );
            $code = $cap ? 935 : 967, last SWITCH if ( $lett eq 'x' );
            $code = $cap ? 936 : 968, last SWITCH if ( $lett eq 'y' );
            $code = $cap ? 988 : 988, last SWITCH if ( $lett eq 'v' );
        }
    }
    return $code;
}



sub sigma {
    my ( $next ) = @_;
    if ( $next =~ /[a-z]/io ) {
        return 963;
    }
    else {
        return 962;
    }
}

sub add_accent {
    my ( $code, $mark ) = @_;
    my $result = $code;

    if ( $mark eq 'ACUTE' ) {
        SWITCH: {
            $result = 8123, last SWITCH if $code ==  913; #  *a /
            $result = 7948, last SWITCH if $code == 7944; #  *a)/
            $result = 7949, last SWITCH if $code == 7945; #  *a(/
            $result = 8049, last SWITCH if $code ==  945; #   a /
            $result = 7940, last SWITCH if $code == 7936; #   a)/
            $result = 7941, last SWITCH if $code == 7937; #   a(/

            $result = 7956, last SWITCH if $code == 7952; #   e)/
            $result = 7957, last SWITCH if $code == 7953; #   e(/
            $result = 7964, last SWITCH if $code == 7960; #  *e)/
            $result = 7965, last SWITCH if $code == 7961; #  *e(/
            $result = 8137, last SWITCH if $code ==  917; #  *e /
            $result = 8051, last SWITCH if $code ==  949; #   e /

            $result = 7972, last SWITCH if $code == 7968; #   h)/
            $result = 7973, last SWITCH if $code == 7969; #   h(/
            $result = 7980, last SWITCH if $code == 7976; #  *h)/
            $result = 7981, last SWITCH if $code == 7977; #  *h(/
            $result = 8139, last SWITCH if $code ==  919; #  *h /
            $result = 8053, last SWITCH if $code ==  951; #   h /

            $result = 7988, last SWITCH if $code == 7984; #   i)/
            $result = 7989, last SWITCH if $code == 7985; #   i(/
            $result = 7996, last SWITCH if $code == 7992; #  *i)/
            $result = 7997, last SWITCH if $code == 7993; #  *i(/
            $result = 8155, last SWITCH if $code ==  921; #  *i /
            $result = 8055, last SWITCH if $code ==  953; #   i /

            $result = 8004, last SWITCH if $code == 8000; #   o)/
            $result = 8005, last SWITCH if $code == 8001; #   o(/
            $result = 8012, last SWITCH if $code == 8008; #  *o)/
            $result = 8013, last SWITCH if $code == 8009; #  *o(/
            $result = 8185, last SWITCH if $code ==  927; #  *o /
            $result = 8057, last SWITCH if $code ==  959; #   o /

            $result = 8020, last SWITCH if $code == 8016; #   u)/
            $result = 8021, last SWITCH if $code == 8017; #   u(/
                          # There is no *u) and therefore no *u)/
            $result = 8029, last SWITCH if $code == 8025; #  *u(/
            $result = 8171, last SWITCH if $code ==  933; #  *u /
            $result = 8059, last SWITCH if $code ==  965; #   u /

            $result = 8036, last SWITCH if $code == 8032; #   w)/
            $result = 8037, last SWITCH if $code == 8033; #   w(/
            $result = 8044, last SWITCH if $code == 8040; #  *w)/
            $result = 8045, last SWITCH if $code == 8041; #  *w(/
            $result = 8187, last SWITCH if $code ==  937; #  *w /
            $result = 8061, last SWITCH if $code ==  969; #   w /

            $result = $code;
        }
    }
    elsif ( $mark eq 'GRAVE' ) {
        SWITCH: {
            $result = 7938, last SWITCH if $code == 7936; #   a)\
            $result = 7939, last SWITCH if $code == 7937; #   a(\
            $result = 7946, last SWITCH if $code == 7944; #  *a)\
            $result = 7947, last SWITCH if $code == 7945; #  *a(\
            $result = 8048, last SWITCH if $code ==  945; #   a \
            $result = 8122, last SWITCH if $code ==  913; #  *a \

            $result = 7954, last SWITCH if $code == 7952; #   e)\
            $result = 7955, last SWITCH if $code == 7953; #   e(\
            $result = 7962, last SWITCH if $code == 7960; #  *e)\
            $result = 7963, last SWITCH if $code == 7961; #  *e(\
            $result = 8050, last SWITCH if $code ==  949; #   e \
            $result = 8136, last SWITCH if $code ==  917; #  *e \

            $result = 7970, last SWITCH if $code == 7968; #   h)\
            $result = 7971, last SWITCH if $code == 7969; #   h(\
            $result = 7978, last SWITCH if $code == 7976; #  *h)\
            $result = 7979, last SWITCH if $code == 7977; #  *h(\
            $result = 8052, last SWITCH if $code ==  951; #   h \
            $result = 8138, last SWITCH if $code ==  919; #  *h \

            $result = 7986, last SWITCH if $code == 7984; #   i)\
            $result = 7987, last SWITCH if $code == 7985; #   i(\
            $result = 7994, last SWITCH if $code == 7992; #  *i)\
            $result = 7995, last SWITCH if $code == 7993; #  *i(\
            $result = 8054, last SWITCH if $code ==  953; #   i \
            $result = 8154, last SWITCH if $code ==  921; #  *i \

            $result = 8002, last SWITCH if $code == 8000; #   o)\
            $result = 8003, last SWITCH if $code == 8001; #   o(\
            $result = 8010, last SWITCH if $code == 8008; #  *o)\
            $result = 8011, last SWITCH if $code == 8009; #  *o(\
            $result = 8056, last SWITCH if $code ==  959; #   o \
            $result = 8184, last SWITCH if $code ==  927; #  *o \

            $result = 8018, last SWITCH if $code == 8016; #   u)\
            $result = 8019, last SWITCH if $code == 8017; #   u(\
                          # There is no *u) and therefore no *u)\
            $result = 8027, last SWITCH if $code == 8025; #  *u(\
            $result = 8058, last SWITCH if $code ==  965; #   u \
            $result = 8170, last SWITCH if $code ==  933; #  *u \

            $result = 8034, last SWITCH if $code == 8032; #   w)\
            $result = 8035, last SWITCH if $code == 8033; #   w(\
            $result = 8042, last SWITCH if $code == 8040; #  *w)\
            $result = 8043, last SWITCH if $code == 8041; #  *w(\
            $result = 8060, last SWITCH if $code ==  969; #   w \
            $result = 8186, last SWITCH if $code ==  937; #  *w \
            $result = $code;
        }
    }
    elsif ( $mark eq 'CIRC' ) {

        SWITCH: {
            $result = 7942, last SWITCH if $code == 7936; #   a)=
            $result = 7943, last SWITCH if $code == 7937; #   a(=
            $result = 7950, last SWITCH if $code == 7944; #  *a)=
            $result = 7951, last SWITCH if $code == 7945; #  *a(=
            $result = 8118, last SWITCH if $code ==  945; #   a =

            $result = 7974, last SWITCH if $code == 7968; #   h)=
            $result = 7975, last SWITCH if $code == 7969; #   h(=
            $result = 7982, last SWITCH if $code == 7976; #  *h)=
            $result = 7983, last SWITCH if $code == 7977; #  *h(=
            $result = 8134, last SWITCH if $code ==  951; #   h =

            $result = 7990, last SWITCH if $code == 7984; #   i)=
            $result = 7991, last SWITCH if $code == 7985; #   i(=
            $result = 7998, last SWITCH if $code == 7992; #  *i)=
            $result = 7999, last SWITCH if $code == 7993; #  *i(=
            $result = 8150, last SWITCH if $code ==  953; #   i =

            $result = 8022, last SWITCH if $code == 8016; #   u)=
            $result = 8023, last SWITCH if $code == 8017; #   u(=
                          # There is no *u) and therefore no *u)=
            $result = 8031, last SWITCH if $code == 8025; #  *u(=
            $result = 8166, last SWITCH if $code ==  965; #   u =

            $result = 8038, last SWITCH if $code == 8032; #   w)=
            $result = 8039, last SWITCH if $code == 8033; #   w(=
            $result = 8046, last SWITCH if $code == 8040; #  *w)=
            $result = 8047, last SWITCH if $code == 8041; #  *w(=
            $result = 8182, last SWITCH if $code ==  969; #   w =
            $result = $code;
        }
    }

    return $result;
}
        
sub add_breath {
    my ( $code, $mark ) = @_;
    my $result;
    my $smooth = 1 if $mark eq 'SMOOTH';

    SWITCH: {
        $result = $smooth ? 7944  : 7945, last SWITCH if ( $code == 913 );  # *a)  *a(
        $result = $smooth ? 7960  : 7961, last SWITCH if ( $code == 917 );  # *e)  *e(
        $result = $smooth ? 7976  : 7977, last SWITCH if ( $code == 919 );  # *h)  *h(
        $result = $smooth ? 7992  : 7992, last SWITCH if ( $code == 921 );  # *i)  *i(
        $result = $smooth ? 8008  : 8009, last SWITCH if ( $code == 927 );  # *o)  *o(
        $result = $smooth ? $code : 8172, last SWITCH if ( $code == 929 );  # *r)  *r(
        $result = $smooth ? $code : 8025, last SWITCH if ( $code == 933 );  # *u)  *u(
        $result = $smooth ? 8040  : 8041, last SWITCH if ( $code == 937 );  # *w)  *w(

        $result = $smooth ? 7936  : 7937, last SWITCH if ( $code == 945 ); #  a)   a(
        $result = $smooth ? 7952  : 7953, last SWITCH if ( $code == 949 ); #  e)   e(
        $result = $smooth ? 7968  : 7969, last SWITCH if ( $code == 951 ); #  h)   h(
        $result = $smooth ? 7984  : 7985, last SWITCH if ( $code == 953 ); #  i)   i(
        $result = $smooth ? 8000  : 8001, last SWITCH if ( $code == 959 ); #  o)   o(
        $result = $smooth ? 8164  : 8165, last SWITCH if ( $code == 961 ); #  r)   r(
        $result = $smooth ? 8016  : 8017, last SWITCH if ( $code == 965 ); #  u)   u(
        $result = $smooth ? 8032  : 8033, last SWITCH if ( $code == 969 ); #  w)   w(
        $result = $code;
    }

    return $result;
}

sub add_diaeresis {
    my ( $code ) = @_;
    my $result;

    SWITCH: {

        $result =  938, last SWITCH if $code ==  921 ; # *i+
        $result =  939, last SWITCH if $code ==  933 ; # *u+
        $result =  970, last SWITCH if $code ==  953 ; #  i +
        $result =  971, last SWITCH if $code ==  965 ; #  u +
        $result = 8146, last SWITCH if $code == 8054 ; #  i\+
        $result = 8147, last SWITCH if $code == 8055 ; #  i/+
        $result = 8151, last SWITCH if $code == 8150 ; #  i=+
        $result = 8162, last SWITCH if $code == 8058 ; #  u\+
        $result = 8163, last SWITCH if $code == 8059 ; #  u/+
        $result = 8167, last SWITCH if $code == 8166 ; #  u=+
        $result = $code;
    }
    
    return $result
}

sub add_iota {
    my ( $code ) = @_;
    my $result;

    SWITCH: {
        $result = 8064, last SWITCH if $code == 7936; #  a) |
        $result = 8065, last SWITCH if $code == 7937; #  a( |
        $result = 8066, last SWITCH if $code == 7938; #  a)\|
        $result = 8067, last SWITCH if $code == 7939; #  a(\|
        $result = 8068, last SWITCH if $code == 7940; #  a)/|
        $result = 8069, last SWITCH if $code == 7941; #  a(/|
        $result = 8070, last SWITCH if $code == 7942; #  a)=|
        $result = 8071, last SWITCH if $code == 7943; #  a(=|
        $result = 8072, last SWITCH if $code == 7944; # *a) |
        $result = 8073, last SWITCH if $code == 7945; # *a( |
        $result = 8074, last SWITCH if $code == 7946; # *a)\|
        $result = 8075, last SWITCH if $code == 7947; # *a(\|
        $result = 8076, last SWITCH if $code == 7948; # *a)/|
        $result = 8077, last SWITCH if $code == 7949; # *a(/|
        $result = 8078, last SWITCH if $code == 7950; # *a)=|
        $result = 8079, last SWITCH if $code == 7951; # *a(=|
        $result = 8115, last SWITCH if $code ==  945; #  a  |
        $result = 8114, last SWITCH if $code == 8048; #  a \|
        $result = 8116, last SWITCH if $code ==  940; #  a /|
        $result = 8116, last SWITCH if $code == 8049; #  a /|
        $result = 8119, last SWITCH if $code == 8118; #  a =|
        $result = 8124, last SWITCH if $code ==  913; # *a  |

        $result = 8080, last SWITCH if $code == 7968; #  h) |
        $result = 8081, last SWITCH if $code == 7969; #  h( |
        $result = 8082, last SWITCH if $code == 7970; #  h)\|
        $result = 8083, last SWITCH if $code == 7971; #  h(\|
        $result = 8084, last SWITCH if $code == 7972; #  h)/|
        $result = 8085, last SWITCH if $code == 7973; #  h(/|
        $result = 8086, last SWITCH if $code == 7974; #  h)=|
        $result = 8087, last SWITCH if $code == 7975; #  h(=|
        $result = 8088, last SWITCH if $code == 7976; # *h) |
        $result = 8089, last SWITCH if $code == 7977; # *h( |
        $result = 8090, last SWITCH if $code == 7978; # *h)\|
        $result = 8091, last SWITCH if $code == 7979; # *h(\|
        $result = 8092, last SWITCH if $code == 7980; # *h)/|
        $result = 8093, last SWITCH if $code == 7981; # *h(/|
        $result = 8094, last SWITCH if $code == 7982; # *h)=|
        $result = 8095, last SWITCH if $code == 7983; # *h(=|
        $result = 8130, last SWITCH if $code == 8052; #  h \|
        $result = 8131, last SWITCH if $code ==  951; #  h  |
        $result = 8132, last SWITCH if $code == 8053; #  h /|
        $result = 8132, last SWITCH if $code ==  942; #  h /|
        $result = 8135, last SWITCH if $code == 8134; #  h =|
        $result = 8140, last SWITCH if $code ==  919; # *h  |

        $result = 8096, last SWITCH if $code == 8032; #  w) |
        $result = 8097, last SWITCH if $code == 8033; #  w( |
        $result = 8098, last SWITCH if $code == 8034; #  w)\|
        $result = 8099, last SWITCH if $code == 8035; #  w(\|
        $result = 8100, last SWITCH if $code == 8036; #  w)/|
        $result = 8101, last SWITCH if $code == 8037; #  w(/|
        $result = 8102, last SWITCH if $code == 8038; #  w)=|
        $result = 8103, last SWITCH if $code == 8039; #  w(=|
        $result = 8104, last SWITCH if $code == 8040; # *w) |
        $result = 8105, last SWITCH if $code == 8041; # *w( |
        $result = 8106, last SWITCH if $code == 8042; # *w)\|
        $result = 8107, last SWITCH if $code == 8043; # *w(\|
        $result = 8108, last SWITCH if $code == 8044; # *w)/|
        $result = 8109, last SWITCH if $code == 8045; # *w(/|
        $result = 8110, last SWITCH if $code == 8046; # *w)=|
        $result = 8111, last SWITCH if $code == 8047; # *w(=|
        $result = 8178, last SWITCH if $code == 8060; #  w \|
        $result = 8179, last SWITCH if $code ==  969; #  w  |
        $result = 8180, last SWITCH if $code == 8057; #  w /|
        $result = 8180, last SWITCH if $code ==  974; #  w /|
        $result = 8183, last SWITCH if $code == 8182; #  w =|
        $result = 8188, last SWITCH if $code ==  937; # *w  |
        $result = $code;
    }
    
    return $result;
}

__END__

=head1 COPYRIGHT

Copyright (c) 1998 Sean Redmond. All rights reserved. 

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself. 

=head1 AUTHOR

Sean Redmond