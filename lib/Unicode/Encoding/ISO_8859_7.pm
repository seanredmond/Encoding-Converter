package Unicode::Encoding::ISO_8859_7;

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

my %uni = (
    0xA1 => 0x02BD, # modifier letter reversed comma
    0xA2 => 0x02BC, # modifier letter apostrophe
    0xAF => 0x2015, # horizontal bar
    0xB4 => 0x0384, # greek tonos
    0xB5 => 0x0385, # greek dialytika tonos
    0xB6 => 0x0386, # greek capital letter alpha with tonos
    0xB8 => 0x0388, # greek capital letter epsilon with tonos
    0xB9 => 0x0389, # greek capital letter eta with tonos
    0xBA => 0x038A, # greek capital letter iota with tonos
    0xBC => 0x038C, # greek capital letter omicron with tonos
    0xBE => 0x038E, # greek capital letter upsilon with tonos
    0xBF => 0x038F, # greek capital letter omega with tonos
    0xC0 => 0x0390, # greek small letter iota with dialytika and tonos
    0xC1 => 0x0391, # greek capital letter alpha
    0xC2 => 0x0392, # greek capital letter beta
    0xC3 => 0x0393, # greek capital letter gamma
    0xC4 => 0x0394, # greek capital letter delta
    0xC5 => 0x0395, # greek capital letter epsilon
    0xC6 => 0x0396, # greek capital letter zeta
    0xC7 => 0x0397, # greek capital letter eta
    0xC8 => 0x0398, # greek capital letter theta
    0xC9 => 0x0399, # greek capital letter iota
    0xCA => 0x039A, # greek capital letter kappa
    0xCB => 0x039B, # greek capital letter lamda
    0xCC => 0x039C, # greek capital letter mu
    0xCD => 0x039D, # greek capital letter nu
    0xCE => 0x039E, # greek capital letter xi
    0xCF => 0x039F, # greek capital letter omicron
    0xD0 => 0x03A0, # greek capital letter pi
    0xD1 => 0x03A1, # greek capital letter rho
    0xD3 => 0x03A3, # greek capital letter sigma
    0xD4 => 0x03A4, # greek capital letter tau
    0xD5 => 0x03A5, # greek capital letter upsilon
    0xD6 => 0x03A6, # greek capital letter phi
    0xD7 => 0x03A7, # greek capital letter chi
    0xD8 => 0x03A8, # greek capital letter psi
    0xD9 => 0x03A9, # greek capital letter omega
    0xDA => 0x03AA, # greek capital letter iota with dialytika
    0xDB => 0x03AB, # greek capital letter upsilon with dialytika
    0xDC => 0x03AC, # greek small letter alpha with tonos
    0xDD => 0x03AD, # greek small letter epsilon with tonos
    0xDE => 0x03AE, # greek small letter eta with tonos
    0xDF => 0x03AF, # greek small letter iota with tonos
    0xE0 => 0x03B0, # greek small letter upsilon with dialytika and tonos
    0xE1 => 0x03B1, # greek small letter alpha
    0xE2 => 0x03B2, # greek small letter beta
    0xE3 => 0x03B3, # greek small letter gamma
    0xE4 => 0x03B4, # greek small letter delta
    0xE5 => 0x03B5, # greek small letter epsilon
    0xE6 => 0x03B6, # greek small letter zeta
    0xE7 => 0x03B7, # greek small letter eta
    0xE8 => 0x03B8, # greek small letter theta
    0xE9 => 0x03B9, # greek small letter iota
    0xEA => 0x03BA, # greek small letter kappa
    0xEB => 0x03BB, # greek small letter lamda
    0xEC => 0x03BC, # greek small letter mu
    0xED => 0x03BD, # greek small letter nu
    0xEE => 0x03BE, # greek small letter xi
    0xEF => 0x03BF, # greek small letter omicron
    0xF0 => 0x03C0, # greek small letter pi
    0xF1 => 0x03C1, # greek small letter rho
    0xF2 => 0x03C2, # greek small letter final sigma
    0xF3 => 0x03C3, # greek small letter sigma
    0xF4 => 0x03C4, # greek small letter tau
    0xF5 => 0x03C5, # greek small letter upsilon
    0xF6 => 0x03C6, # greek small letter phi
    0xF7 => 0x03C7, # greek small letter chi
    0xF8 => 0x03C8, # greek small letter psi
    0xF9 => 0x03C9, # greek small letter omega
    0xFA => 0x03CA, # greek small letter iota with dialytika
    0xFB => 0x03CB, # greek small letter upsilon with dialytika
    0xFC => 0x03CC, # greek small letter omicron with tonos
    0xFD => 0x03CD, # greek small letter upsilon with tonos
    0xFE => 0x03CE # greek small letter omega with tonos
);


sub _initialize {
    my $self = shift;
    $self->{NAME} = 'ISO-8859-7/ELOT-928';
    $self->{UNICODE} = \%uni;
    $self->{LANGUAGE} = 'Greek';
}

return 1;

