package Unicode::Encoding::GreekKeys;

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
    0x21 => 0x03F2, # greek lunate sigma symbol
    0x23 => 0x03CB, # greek small letter upsilon with dialytika
    0x25 => -1, # greek capital letter lunate sigma
    0x26 => 0x1FB3, # greek small letter alpha with ypogegrammeni
    0x3a => 0x0387, # greek ano teleia
    0x3b => 0x037E, # greek question mark
    0x3d => 0x1FE5, # greek small letter rho with dasia
    0x40 => 0x1FE3, # greek small letter upsilon with dialytika and oxia
    0x41 => 0x0391, # greek capital letter alpha
    0x42 => 0x0392, # greek capital letter beta
    0x43 => 0x03A8, # greek capital letter psi
    0x44 => 0x0394, # greek capital letter delta
    0x45 => 0x0395, # greek capital letter epsilon
    0x46 => 0x03A6, # greek capital letter phi
    0x47 => 0x0393, # greek capital letter gamma
    0x48 => 0x0397, # greek capital letter eta
    0x49 => 0x0399, # greek capital letter iota
    0x4a => 0x039E, # greek capital letter xi
    0x4b => 0x039A, # greek capital letter kappa
    0x4c => 0x039B, # greek capital letter lamda
    0x4d => 0x039C, # greek capital letter mu
    0x4e => 0x039D, # greek capital letter nu
    0x4f => 0x039F, # greek capital letter omicron
    0x50 => 0x03A0, # greek capital letter pi
    0x51 => 0x03E0, # greek letter sampi
    0x52 => 0x03A1, # greek capital letter rho
    0x53 => 0x03A3, # greek capital letter sigma
    0x54 => 0x03A4, # greek capital letter tau
    0x55 => 0x03A5, # greek capital letter upsilon
    0x56 => 0x03A9, # greek capital letter omega
    0x57 => 0x03DC, # greek letter digamma
    0x58 => 0x03A7, # greek capital letter chi
    0x59 => 0x0398, # greek capital letter theta
    0x5a => 0x0396, # greek capital letter zeta
    0x61 => 0x03B1, # greek small letter alpha
    0x62 => 0x03B2, # greek small letter beta
    0x63 => 0x03C8, # greek small letter psi
    0x64 => 0x03B4, # greek small letter delta
    0x65 => 0x03B5, # greek small letter epsilon
    0x66 => 0x03C6, # greek small letter phi
    0x67 => 0x03B3, # greek small letter gamma
    0x68 => 0x03B7, # greek small letter eta
    0x69 => 0x03B9, # greek small letter iota
    0x6a => 0x03BE, # greek small letter xi
    0x6b => 0x03BA, # greek small letter kappa
    0x6c => 0x03BB, # greek small letter lamda
    0x6d => 0x03BC, # greek small letter mu
    0x6e => 0x03BD, # greek small letter nu
    0x6f => 0x03BF, # greek small letter omicron
    0x70 => 0x03C0, # greek small letter pi
    0x71 => 0x03DE, # greek letter koppa
    0x72 => 0x03C1, # greek small letter rho
    0x73 => 0x03C3, # greek small letter sigma
    0x74 => 0x03C4, # greek small letter tau
    0x75 => 0x03C5, # greek small letter upsilon
    0x76 => 0x03C9, # greek small letter omega
    0x77 => 0x03C2, # greek small letter final sigma
    0x78 => 0x03C7, # greek small letter chi
    0x79 => 0x03B8, # greek small letter theta
    0x7a => 0x03B6, # greek small letter zeta
    0x80 => [ 0x1FFD, 0x41, 0x45, 0x48, 0x49, 0x4f, 0x55, 0x56 ], # greek oxia
    0x81 => [ 0x1FEF, 0x41, 0x45, 0x48, 0x49, 0x4f, 0x55, 0x56 ], # greek varia
    0x82 => 0x1FC0, # greek perispomeni
    0x83 => [ 0x1FBF, 0x41, 0x45, 0x48, 0x49, 0x4f, 0x56 ], # greek psili
    0x84 => [ 0x1FFE, 0x41, 0x45, 0x48, 0x49, 0x4f, 0x55, 0x56 ], # greek dasia
    0x85 => [ 0x1FCE, 0x41, 0x45, 0x48, 0x49, 0x4f, 0x56 ], # greek psili and oxia
    0x86 => [ 0x1FDE, 0x41, 0x45, 0x48, 0x49, 0x4f, 0x55, 0x56 ], # greek dasia and oxia
    0x87 => [ 0x1FCD, 0x41, 0x45, 0x48, 0x49, 0x4f, 0x56 ], # greek psili and varia
    0x88 => [ 0x1FDD, 0x41, 0x45, 0x48, 0x49, 0x4f, 0x55, 0x56 ], # greek dasia and varia
    0x89 => [ 0x1FCF, 0x41, 0x48, 0x49, 0x56 ], # greek psili and perispomeni
    0x8a => [ 0x1FDF, 0x41, 0x48, 0x49, 0x56 ], # greek dasia and perispomeni
    0x8b => 0x1F71, # greek small letter alpha with oxia
    0x8c => 0x1F70, # greek small letter alpha with varia
    0x8d => 0x1FB6, # greek small letter alpha with perispomeni
    0x8e => 0x1F00, # greek small letter alpha with psili
    0x8f => 0x1F01, # greek small letter alpha with dasia
    0x90 => 0x1F04, # greek small letter alpha with psili and oxia
    0x91 => 0x1F05, # greek small letter alpha with dasia and oxia
    0x92 => 0x1F02, # greek small letter alpha with psili and varia
    0x93 => 0x1F03, # greek small letter alpha with dasia and varia
    0x94 => 0x1F06, # greek small letter alpha with psili and perispomeni
    0x95 => 0x1F07, # greek small letter alpha with dasia and perispomeni
    0x96 => 0x1FB4, # greek small letter alpha with oxia and ypogegrammeni
    0x97 => 0x1FB2, # greek small letter alpha with varia and ypogegrammeni
    0x98 => 0x1FB7, # greek small letter alpha with perispomeni and ypogegrammeni
    0x99 => 0x1F80, # greek small letter alpha with psili and ypogegrammeni
    0x9a => 0x1F81, # greek small letter alpha with dasia and ypogegrammeni
    0x9b => 0x1F84, # greek small letter alpha with psili and oxia and ypogegrammeni
    0x9c => 0x1F85, # greek small letter alpha with dasia and oxia and ypogegrammeni
    0x9d => 0x1F82, # greek small letter alpha with psili and varia and ypogegrammeni
    0x9e => 0x1F83, # greek small letter alpha with dasia and varia and ypogegrammeni
    0x9f => 0x1F86, # greek small letter alpha with psili and perispomeni and ypogegrammeni
    0xa0 => 0x1F87, # greek small letter alpha with dasia and perispomeni and ypogegrammeni
    0xa1 => 0x1F73, # greek small letter epsilon with oxia
    0xa2 => 0x1F72, # greek small letter epsilon with varia
    0xa3 => 0x1FE2, # greek small letter upsilon with dialytika and varia
    0xa4 => 0x1F10, # greek small letter epsilon with psili
    0xa5 => 0x1F11, # greek small letter epsilon with dasia
    0xa6 => 0x1F14, # greek small letter epsilon with psili and oxia
    0xa7 => 0x1F15, # greek small letter epsilon with dasia and oxia
    0xa8 => 0x1F12, # greek small letter epsilon with psili and varia
    0xa9 => 0x1F13, # greek small letter epsilon with dasia and varia
    0xae => 0x1F75, # greek small letter eta with oxia
    0xaf => 0x1F74, # greek small letter eta with varia
    0xb0 => 0x1FC6, # greek small letter eta with perispomeni
    0xb1 => 0x1F20, # greek small letter eta with psili
    0xb2 => 0x1F21, # greek small letter eta with dasia
    0xb3 => 0x1F24, # greek small letter eta with psili and oxia
    0xb4 => 0x1F25, # greek small letter eta with dasia and oxia
    0xb5 => 0x1F22, # greek small letter eta with psili and varia
    0xb6 => 0x1F23, # greek small letter eta with dasia and varia
    0xb7 => 0x1F26, # greek small letter eta with psili and perispomeni
    0xb8 => 0x1F27, # greek small letter eta with dasia and perispomeni
    0xb9 => 0x1FC4, # greek small letter eta with oxia and ypogegrammeni
    0xba => 0x1FC2, # greek small letter eta with varia and ypogegrammeni
    0xbb => 0x1FC7, # greek small letter eta with perispomeni and ypogegrammeni
    0xbc => 0x1F90, # greek small letter eta with psili and ypogegrammeni
    0xbd => 0x1F91, # greek small letter eta with dasia and ypogegrammeni
    0xbe => 0x1F94, # greek small letter eta with psili and oxia and ypogegrammeni
    0xbf => 0x1F95, # greek small letter eta with dasia and oxia and ypogegrammeni
    0xc0 => 0x1F92, # greek small letter eta with psili and varia and ypogegrammeni
    0xc1 => 0x1F93, # greek small letter eta with dasia and varia and ypogegrammeni
    0xc2 => 0x1F96, # greek small letter eta with psili and perispomeni and ypogegrammeni
    0xc3 => 0x1F97, # greek small letter eta with dasia and perispomeni and ypogegrammeni
    0xc4 => 0x1FF3, # greek small letter omega with ypogegrammeni
    0xc5 => 0x1F7D, # greek small letter omega with oxia
    0xc6 => 0x1F7C, # greek small letter omega with varia
    0xc7 => 0x1FF6, # greek small letter omega with perispomeni
    0xc8 => 0x1F60, # greek small letter omega with psili
    0xc9 => 0x1F61, # greek small letter omega with dasia
    0xca => 0x1F64, # greek small letter omega with psili and oxia
    0xcb => 0x1F65, # greek small letter omega with dasia and oxia
    0xcc => 0x1F62, # greek small letter omega with psili and varia
    0xcd => 0x1F63, # greek small letter omega with dasia and varia
    0xce => 0x1F66, # greek small letter omega with psili and perispomeni
    0xcf => 0x1F67, # greek small letter omega with dasia and perispomeni
    0xd0 => 0x1FF4, # greek small letter omega with oxia and ypogegrammeni
    0xd1 => 0x1FF2, # greek small letter omega with varia and ypogegrammeni
    0xd2 => 0x1FF7, # greek small letter omega with perispomeni and ypogegrammeni
    0xd3 => 0x1FA0, # greek small letter omega with psili and ypogegrammeni
    0xd4 => 0x1FA1, # greek small letter omega with dasia and ypogegrammeni
    0xd5 => 0x1FA4, # greek small letter omega with psili and oxia and ypogegrammeni
    0xd6 => 0x1FA5, # greek small letter omega with dasia and oxia and ypogegrammeni
    0xd7 => 0x1FA2, # greek small letter omega with psili and varia and ypogegrammeni
    0xd8 => 0x1FA3, # greek small letter omega with dasia and varia and ypogegrammeni
    0xd9 => 0x1FA6, # greek small letter omega with psili and perispomeni and ypogegrammeni
    0xda => 0x1FA7, # greek small letter omega with dasia and perispomeni and ypogegrammeni
    0xdb => 0x1F77, # greek small letter iota with oxia
    0xdc => 0x1F76, # greek small letter iota with varia
    0xdd => 0x1FD6, # greek small letter iota with perispomeni
    0xde => 0x1F30, # greek small letter iota with psili
    0xdf => 0x1F31, # greek small letter iota with dasia
    0xe0 => 0x1F34, # greek small letter iota with psili and oxia
    0xe1 => 0x1F35, # greek small letter iota with dasia and oxia
    0xe2 => 0x1F32, # greek small letter iota with psili and varia
    0xe3 => 0x1F33, # greek small letter iota with dasia and varia
    0xe4 => 0x1F36, # greek small letter iota with psili and perispomeni
    0xe5 => 0x1F37, # greek small letter iota with dasia and perispomeni
    0xe6 => 0x1F7B, # greek small letter upsilon with oxia
    0xe7 => 0x1F7A, # greek small letter upsilon with varia
    0xe8 => 0x1FE6, # greek small letter upsilon with perispomeni
    0xe9 => 0x1F50, # greek small letter upsilon with psili
    0xea => 0x1F51, # greek small letter upsilon with dasia
    0xeb => 0x1F54, # greek small letter upsilon with psili and oxia
    0xec => 0x1F55, # greek small letter upsilon with dasia and oxia
    0xed => 0x1F52, # greek small letter upsilon with psili and varia
    0xee => 0x1F53, # greek small letter upsilon with dasia and varia
    0xef => 0x1F56, # greek small letter upsilon with psili and perispomeni
    0xf0 => 0x1F57, # greek small letter upsilon with dasia and perispomeni
    0xf1 => 0x1F79, # greek small letter omicron with oxia
    0xf2 => 0x1F78, # greek small letter omicron with varia
    0xf3 => 0x03CA, # greek small letter iota with dialytika
    0xf4 => 0x1F40, # greek small letter omicron with psili
    0xf5 => 0x1F41, # greek small letter omicron with dasia
    0xf6 => 0x1F44, # greek small letter omicron with psili and oxia
    0xf7 => 0x1F45, # greek small letter omicron with dasia and oxia
    0xf8 => 0x1F42, # greek small letter omicron with psili and varia
    0xf9 => 0x1F43, # greek small letter omicron with dasia and varia
    0xfa => 0x1FC3, # greek small letter eta with ypogegrammeni
    0xfb => 0x03DA, # greek letter stigma
    0xfd => 0x1FD3, # greek small letter iota with dialytika and oxia
    0xfe => 0x1FD2  # greek small letter iota with dialytika and varia
);


my %combo = (
    0x80     => {       
        0x41     => 0x1FBB  , # greek capital letter alpha with oxia
        0x45     => 0x1FC9  , # greek capital letter epsilon with oxia
        0x48     => 0x1FCB  , # greek capital letter eta with oxia
        0x49     => 0x1FDB  , # greek capital letter iota with oxia
        0x4f     => 0x1FF9  , # greek capital letter omicron with oxia
        0x55     => 0x1FEB  , # greek capital letter upsilon with oxia
        0x56     => 0x1FFB    # greek capital letter omega with oxia
    },              
    0x81     => {       
        0x41     => 0x1FBA  , # greek capital letter alpha with varia
        0x45     => 0x1FC8  , # greek capital letter epsilon with varia
        0x48     => 0x1FCA  , # greek capital letter eta with varia
        0x49     => 0x1FDA  , # greek capital letter iota with varia
        0x4f     => 0x1FF8  , # greek capital letter omicron with varia
        0x55     => 0x1FEA  , # greek capital letter upsilon with varia
        0x56     => 0x1FFA    # greek capital letter omega with varia
    },              
    0x83     => {       
        0x41     => 0x1F08  , # greek capital letter alpha with psili
        0x45     => 0x1F18  , # greek capital letter epsilon with psili
        0x48     => 0x1F28  , # greek capital letter eta with psili
        0x49     => 0x1F38  , # greek capital letter iota with psili
        0x4f     => 0x1F48  , # greek capital letter omicron with psili
        0x56     => 0x1F68    # greek capital letter omega with psili
    },              
    0x84     => {       
        0x41     => 0x1F09  , # greek capital letter alpha with dasia
        0x45     => 0x1F19  , # greek capital letter epsilon with dasia
        0x48     => 0x1F29  , # greek capital letter eta with dasia
        0x49     => 0x1F39  , # greek capital letter iota with dasia
        0x4f     => 0x1F49  , # greek capital letter omicron with dasia
        0x55     => 0x1F59  , # greek capital letter upsilon with dasia
        0x56     => 0x1F69    # greek capital letter omega with dasia
    },              
    0x85     => {       
        0x41     => 0x1F0C  , # greek capital letter alpha with psili and oxia
        0x45     => 0x1F1C  , # greek capital letter epsilon with psili and oxia
        0x48     => 0x1F2C  , # greek capital letter eta with psili and oxia
        0x49     => 0x1F3C  , # greek capital letter iota with psili and oxia
        0x4f     => 0x1F4C  , # greek capital letter omicron with psili and oxia
        0x56     => 0x1F6C    # greek capital letter omega with psili and oxia
    },              
    0x86     => {       
        0x41     => 0x1F0D  , # greek capital letter alpha with dasia and oxia
        0x45     => 0x1F1D  , # greek capital letter epsilon with dasia and oxia
        0x48     => 0x1F2D  , # greek capital letter eta with dasia and oxia
        0x49     => 0x1F3D  , # greek capital letter iota with dasia and oxia
        0x4f     => 0x1F4D  , # greek capital letter omicron with dasia and oxia
        0x55     => 0x1F5D  , # greek capital letter upsilon with dasia and oxia
        0x56     => 0x1F6D    # greek capital letter omega with dasia and oxia
    },              
    0x87     => {       
        0x41     => 0x1F0A  , # greek capital letter alpha with psili and varia
        0x45     => 0x1F1A  , # greek capital letter epsilon with psili and varia
        0x48     => 0x1F2A  , # greek capital letter eta with psili and varia
        0x49     => 0x1F3A  , # greek capital letter iota with psili and varia
        0x4f     => 0x1F4A  , # greek capital letter omicron with psili and varia
        0x56     => 0x1F6A    # greek capital letter omega with psili and varia
    },              
    0x88     => {       
        0x41     => 0x1F0B  , # greek capital letter alpha with dasia and varia
        0x45     => 0x1F1B  , # greek capital letter epsilon with dasia and varia
        0x48     => 0x1F2B  , # greek capital letter eta with dasia and varia
        0x49     => 0x1F3B  , # greek capital letter iota with dasia and varia
        0x4f     => 0x1F4B  , # greek capital letter omicron with dasia and varia
        0x55     => 0x1F5B  , # greek capital letter upsilon with dasia and varia
        0x56     => 0x1F6B    # greek capital letter omega with dasia and varia
    },              
    0x89     => {       
        0x41     => 0x1F0E  , # greek capital letter alpha with psili and perispomeni
        0x48     => 0x1F2E  , # greek capital letter eta with psili and perispomeni
        0x49     => 0x1F3E  , # greek capital letter iota with psili and perispomeni
        0x56     => 0x1F6E    # greek capital letter omega with psili and perispomeni
    },              
    0x8a     => {       
        0x41     => 0x1F0F  , # greek capital letter alpha with dasia and perispomeni
        0x48     => 0x1F2F  , # greek capital letter eta with dasia and perispomeni
        0x49     => 0x1F3F  , # greek capital letter iota with dasia and perispomeni
        0x55     => 0x1F5F  , # greek capital letter upsilon with dasia and perispomeni
        0x56     => 0x1F6F    # greek capital letter omega with dasia and perispomeni
    }               
);

my %noconvert = (
    -1 => 'GREEK CAPITAL LETTER LUNATE SIGMA'
);

my %decode = (
    0x037E => 0x3b, # greek question mark
    0x0384 => 0x80, # greek tonos
    0x0386 => [ 0x80, 0x41 ], # greek capital letter alpha with tonos
    0x0387 => 0x3a, # greek ano teleia
    0x0388 => [ 0x80, 0x45 ], # greek capital letter epsilon with tonos
    0x0389 => [ 0x80, 0x48 ], # greek capital letter eta with tonos
    0x038A => [ 0x80, 0x49 ], # greek capital letter iota with tonos
    0x038C => [ 0x80, 0x4f ], # greek capital letter omicron with tonos
    0x038E => [ 0x80, 0x55 ], # greek capital letter upsilon with tonos
    0x038F => [ 0x80, 0x56 ], # greek capital letter omega with tonos
    0x0390 => 0xfd, # greek small letter iota with dialytika and tonos
    0x0391 => 0x41, # greek capital letter alpha
    0x0392 => 0x42, # greek capital letter beta
    0x0393 => 0x47, # greek capital letter gamma
    0x0394 => 0x44, # greek capital letter delta
    0x0395 => 0x45, # greek capital letter epsilon
    0x0396 => 0x5a, # greek capital letter zeta
    0x0397 => 0x48, # greek capital letter eta
    0x0398 => 0x59, # greek capital letter theta
    0x0399 => 0x49, # greek capital letter iota
    0x039A => 0x4b, # greek capital letter kappa
    0x039B => 0x4c, # greek capital letter lamda
    0x039C => 0x4d, # greek capital letter mu
    0x039D => 0x4e, # greek capital letter nu
    0x039E => 0x4a, # greek capital letter xi
    0x039F => 0x4f, # greek capital letter omicron
    0x03A0 => 0x50, # greek capital letter pi
    0x03A1 => 0x52, # greek capital letter rho
    0x03A3 => 0x53, # greek capital letter sigma
    0x03A4 => 0x54, # greek capital letter tau
    0x03A5 => 0x55, # greek capital letter upsilon
    0x03A6 => 0x46, # greek capital letter phi
    0x03A7 => 0x58, # greek capital letter chi
    0x03A8 => 0x43, # greek capital letter psi
    0x03A9 => 0x56, # greek capital letter omega
    0x03AA => 0x49, # greek capital letter iota with dialytika
    0x03AB => 0x55, # greek capital letter upsilon with dialytika
    0x03AC => 0x8b, # greek small letter alpha with tonos
    0x03AD => 0xa1, # greek small letter epsilon with tonos
    0x03AE => 0xae, # greek small letter eta with tonos
    0x03AF => 0xdb, # greek small letter iota with tonos
    0x03B0 => 0x40, # greek small letter upsilon with dialytika and tonos
    0x03B1 => 0x61, # greek small letter alpha
    0x03B2 => 0x62, # greek small letter beta
    0x03B3 => 0x67, # greek small letter gamma
    0x03B4 => 0x64, # greek small letter delta
    0x03B5 => 0x65, # greek small letter epsilon
    0x03B6 => 0x7a, # greek small letter zeta
    0x03B7 => 0x68, # greek small letter eta
    0x03B8 => 0x79, # greek small letter theta
    0x03B9 => 0x69, # greek small letter iota
    0x03BA => 0x6b, # greek small letter kappa
    0x03BB => 0x6c, # greek small letter lamda
    0x03BC => 0x6d, # greek small letter mu
    0x03BD => 0x6e, # greek small letter nu
    0x03BE => 0x6a, # greek small letter xi
    0x03BF => 0x6f, # greek small letter omicron
    0x03C0 => 0x70, # greek small letter pi
    0x03C1 => 0x72, # greek small letter rho
    0x03C2 => 0x77, # greek small letter final sigma
    0x03C3 => 0x73, # greek small letter sigma
    0x03C4 => 0x74, # greek small letter tau
    0x03C5 => 0x75, # greek small letter upsilon
    0x03C6 => 0x66, # greek small letter phi
    0x03C7 => 0x78, # greek small letter chi
    0x03C8 => 0x63, # greek small letter psi
    0x03C9 => 0x76, # greek small letter omega
    0x03CA => 0xf3, # greek small letter iota with dialytika
    0x03CB => 0x23, # greek small letter upsilon with dialytika
    0x03CC => 0xf1, # greek small letter omicron with tonos
    0x03CD => 0xe6, # greek small letter upsilon with tonos
    0x03CE => 0xc5, # greek small letter omega with tonos
    0x03D0 => 0x62, # greek beta symbol
    0x03D1 => 0x79, # greek theta symbol
    0x03D5 => 0x66, # greek phi symbol
    0x03D6 => 0x70, # greek pi symbol
    0x03DA => 0xfb, # greek letter stigma
    0x03DC => 0x57, # greek letter digamma
    0x03DE => 0x71, # greek letter koppa
    0x03E0 => 0x51, # greek letter sampi
    0x03F0 => 0x6b, # greek kappa symbol
    0x03F1 => 0x72, # greek rho symbol
    0x03F2 => 0x21, # greek lunate sigma symbol
    0x1F00 => 0x8e, # greek small letter alpha with psili
    0x1F01 => 0x8f, # greek small letter alpha with dasia
    0x1F02 => 0x92, # greek small letter alpha with psili and varia
    0x1F03 => 0x93, # greek small letter alpha with dasia and varia
    0x1F04 => 0x90, # greek small letter alpha with psili and oxia
    0x1F05 => 0x91, # greek small letter alpha with dasia and oxia
    0x1F06 => 0x94, # greek small letter alpha with psili and perispomeni
    0x1F07 => 0x95, # greek small letter alpha with dasia and perispomeni
    0x1F08 => [ 0x83, 0x41 ], # greek capital letter alpha with psili
    0x1F09 => [ 0x84, 0x41 ], # greek capital letter alpha with dasia
    0x1F0A => [ 0x87, 0x41 ], # greek capital letter alpha with psili and varia
    0x1F0B => [ 0x88, 0x41 ], # greek capital letter alpha with dasia and varia
    0x1F0C => [ 0x85, 0x41 ], # greek capital letter alpha with psili and oxia
    0x1F0D => [ 0x86, 0x41 ], # greek capital letter alpha with dasia and oxia
    0x1F0E => [ 0x89, 0x41 ], # greek capital letter alpha with psili and perispomeni
    0x1F0F => [ 0x8a, 0x41 ], # greek capital letter alpha with dasia and perispomeni
    0x1F10 => 0xa4, # greek small letter epsilon with psili
    0x1F11 => 0xa5, # greek small letter epsilon with dasia
    0x1F12 => 0xa8, # greek small letter epsilon with psili and varia
    0x1F13 => 0xa9, # greek small letter epsilon with dasia and varia
    0x1F14 => 0xa6, # greek small letter epsilon with psili and oxia
    0x1F15 => 0xa7, # greek small letter epsilon with dasia and oxia
    0x1F18 => [ 0x83, 0x45 ], # greek capital letter epsilon with psili
    0x1F19 => [ 0x84, 0x45 ], # greek capital letter epsilon with dasia
    0x1F1A => [ 0x87, 0x45 ], # greek capital letter epsilon with psili and varia
    0x1F1B => [ 0x88, 0x45 ], # greek capital letter epsilon with dasia and varia
    0x1F1C => [ 0x85, 0x45 ], # greek capital letter epsilon with psili and oxia
    0x1F1D => [ 0x86, 0x45 ], # greek capital letter epsilon with dasia and oxia
    0x1F20 => 0xb1, # greek small letter eta with psili
    0x1F21 => 0xb2, # greek small letter eta with dasia
    0x1F22 => 0xb5, # greek small letter eta with psili and varia
    0x1F23 => 0xb6, # greek small letter eta with dasia and varia
    0x1F24 => 0xb3, # greek small letter eta with psili and oxia
    0x1F25 => 0xb4, # greek small letter eta with dasia and oxia
    0x1F26 => 0xb7, # greek small letter eta with psili and perispomeni
    0x1F27 => 0xb8, # greek small letter eta with dasia and perispomeni
    0x1F28 => [ 0x83, 0x48 ], # greek capital letter eta with psili
    0x1F29 => [ 0x84, 0x48 ], # greek capital letter eta with dasia
    0x1F2A => [ 0x87, 0x48 ], # greek capital letter eta with psili and varia
    0x1F2B => [ 0x88, 0x48 ], # greek capital letter eta with dasia and varia
    0x1F2C => [ 0x85, 0x48 ], # greek capital letter eta with psili and oxia
    0x1F2D => [ 0x86, 0x48 ], # greek capital letter eta with dasia and oxia
    0x1F2E => [ 0x89, 0x48 ], # greek capital letter eta with psili and perispomeni
    0x1F2F => [ 0x8a, 0x48 ], # greek capital letter eta with dasia and perispomeni
    0x1F30 => 0xde, # greek small letter iota with psili
    0x1F31 => 0xdf, # greek small letter iota with dasia
    0x1F32 => 0xe2, # greek small letter iota with psili and varia
    0x1F33 => 0xe3, # greek small letter iota with dasia and varia
    0x1F34 => 0xe0, # greek small letter iota with psili and oxia
    0x1F35 => 0xe1, # greek small letter iota with dasia and oxia
    0x1F36 => 0xe4, # greek small letter iota with psili and perispomeni
    0x1F37 => 0xe5, # greek small letter iota with dasia and perispomeni
    0x1F38 => [ 0x83, 0x49 ], # greek capital letter iota with psili
    0x1F39 => [ 0x84, 0x49 ], # greek capital letter iota with dasia
    0x1F3A => [ 0x87, 0x49 ], # greek capital letter iota with psili and varia
    0x1F3B => [ 0x88, 0x49 ], # greek capital letter iota with dasia and varia
    0x1F3C => [ 0x85, 0x49 ], # greek capital letter iota with psili and oxia
    0x1F3D => [ 0x86, 0x49 ], # greek capital letter iota with dasia and oxia
    0x1F3E => [ 0x89, 0x49 ], # greek capital letter iota with psili and perispomeni
    0x1F3F => [ 0x8a, 0x49 ], # greek capital letter iota with dasia and perispomeni
    0x1F40 => 0xf4, # greek small letter omicron with psili
    0x1F41 => 0xf5, # greek small letter omicron with dasia
    0x1F42 => 0xf8, # greek small letter omicron with psili and varia
    0x1F43 => 0xf9, # greek small letter omicron with dasia and varia
    0x1F44 => 0xf6, # greek small letter omicron with psili and oxia
    0x1F45 => 0xf7, # greek small letter omicron with dasia and oxia
    0x1F48 => [ 0x83, 0x4f ], # greek capital letter omicron with psili
    0x1F49 => [ 0x84, 0x4f ], # greek capital letter omicron with dasia
    0x1F4A => [ 0x87, 0x4f ], # greek capital letter omicron with psili and varia
    0x1F4B => [ 0x88, 0x4f ], # greek capital letter omicron with dasia and varia
    0x1F4C => [ 0x85, 0x4f ], # greek capital letter omicron with psili and oxia
    0x1F4D => [ 0x86, 0x4f ], # greek capital letter omicron with dasia and oxia
    0x1F50 => 0xe9, # greek small letter upsilon with psili
    0x1F51 => 0xea, # greek small letter upsilon with dasia
    0x1F52 => 0xed, # greek small letter upsilon with psili and varia
    0x1F53 => 0xee, # greek small letter upsilon with dasia and varia
    0x1F54 => 0xeb, # greek small letter upsilon with psili and oxia
    0x1F55 => 0xec, # greek small letter upsilon with dasia and oxia
    0x1F56 => 0xef, # greek small letter upsilon with psili and perispomeni
    0x1F57 => 0xf0, # greek small letter upsilon with dasia and perispomeni
    0x1F59 => [ 0x84, 0x55 ], # greek capital letter upsilon with dasia
    0x1F5B => [ 0x88, 0x55 ], # greek capital letter upsilon with dasia and varia
    0x1F5D => [ 0x86, 0x55 ], # greek capital letter upsilon with dasia and oxia
    0x1F5F => [ 0x8a, 0x55 ], # greek capital letter upsilon with dasia and perispomeni
    0x1F60 => 0xc8, # greek small letter omega with psili
    0x1F61 => 0xc9, # greek small letter omega with dasia
    0x1F62 => 0xcc, # greek small letter omega with psili and varia
    0x1F63 => 0xcd, # greek small letter omega with dasia and varia
    0x1F64 => 0xca, # greek small letter omega with psili and oxia
    0x1F65 => 0xcb, # greek small letter omega with dasia and oxia
    0x1F66 => 0xce, # greek small letter omega with psili and perispomeni
    0x1F67 => 0xcf, # greek small letter omega with dasia and perispomeni
    0x1F68 => [ 0x83, 0x56 ], # greek capital letter omega with psili
    0x1F69 => [ 0x84, 0x56 ], # greek capital letter omega with dasia
    0x1F6A => [ 0x87, 0x56 ], # greek capital letter omega with psili and varia
    0x1F6B => [ 0x88, 0x56 ], # greek capital letter omega with dasia and varia
    0x1F6C => [ 0x85, 0x56 ], # greek capital letter omega with psili and oxia
    0x1F6D => [ 0x86, 0x56 ], # greek capital letter omega with dasia and oxia
    0x1F6E => [ 0x89, 0x56 ], # greek capital letter omega with psili and perispomeni
    0x1F6F => [ 0x8a, 0x56 ], # greek capital letter omega with dasia and perispomeni
    0x1F70 => 0x8c, # greek small letter alpha with varia
    0x1F71 => 0x8b, # greek small letter alpha with oxia
    0x1F72 => 0xa2, # greek small letter epsilon with varia
    0x1F73 => 0xa1, # greek small letter epsilon with oxia
    0x1F74 => 0xaf, # greek small letter eta with varia
    0x1F75 => 0xae, # greek small letter eta with oxia
    0x1F76 => 0xdc, # greek small letter iota with varia
    0x1F77 => 0xdb, # greek small letter iota with oxia
    0x1F78 => 0xf2, # greek small letter omicron with varia
    0x1F79 => 0xf1, # greek small letter omicron with oxia
    0x1F7A => 0xe7, # greek small letter upsilon with varia
    0x1F7B => 0xe6, # greek small letter upsilon with oxia
    0x1F7C => 0xc6, # greek small letter omega with varia
    0x1F7D => 0xc5, # greek small letter omega with oxia
    0x1F80 => 0x99, # greek small letter alpha with psili and ypogegrammeni
    0x1F81 => 0x9a, # greek small letter alpha with dasia and ypogegrammeni
    0x1F82 => 0x9d, # greek small letter alpha with psili and varia and ypogegrammeni
    0x1F83 => 0x9e, # greek small letter alpha with dasia and varia and ypogegrammeni
    0x1F84 => 0x9b, # greek small letter alpha with psili and oxia and ypogegrammeni
    0x1F85 => 0x9c, # greek small letter alpha with dasia and oxia and ypogegrammeni
    0x1F86 => 0x9f, # greek small letter alpha with psili and perispomeni and ypogegrammeni
    0x1F87 => 0xa0, # greek small letter alpha with dasia and perispomeni and ypogegrammeni
    0x1F88 => [ 0x83, 0x41, 0x49 ], # greek capital letter alpha with psili and prosgegrammeni
    0x1F89 => [ 0x84, 0x41, 0x49 ], # greek capital letter alpha with dasia and prosgegrammeni
    0x1F8A => [ 0x87, 0x41, 0x49 ], # greek capital letter alpha with psili and varia and prosgegrammeni
    0x1F8B => [ 0x88, 0x41, 0x49 ], # greek capital letter alpha with dasia and varia and prosgegrammeni
    0x1F8C => [ 0x85, 0x41, 0x49 ], # greek capital letter alpha with psili and oxia and prosgegrammeni
    0x1F8D => [ 0x86, 0x41, 0x49 ], # greek capital letter alpha with dasia and oxia and prosgegrammeni
    0x1F8E => [ 0x89, 0x41, 0x49 ], # greek capital letter alpha with psili and perispomeni and prosgegrammeni
    0x1F8F => [ 0x8a, 0x41, 0x49 ], # greek capital letter alpha with dasia and perispomeni and prosgegrammeni
    0x1F90 => 0xbc, # greek small letter eta with psili and ypogegrammeni
    0x1F91 => 0xbd, # greek small letter eta with dasia and ypogegrammeni
    0x1F92 => 0xc0, # greek small letter eta with psili and varia and ypogegrammeni
    0x1F93 => 0xc1, # greek small letter eta with dasia and varia and ypogegrammeni
    0x1F94 => 0xbe, # greek small letter eta with psili and oxia and ypogegrammeni
    0x1F95 => 0xbf, # greek small letter eta with dasia and oxia and ypogegrammeni
    0x1F96 => 0xc2, # greek small letter eta with psili and perispomeni and ypogegrammeni
    0x1F97 => 0xc3, # greek small letter eta with dasia and perispomeni and ypogegrammeni
    0x1F98 => [ 0x83, 0x48, 0x49 ], # greek capital letter eta with psili and prosgegrammeni
    0x1F99 => [ 0x84, 0x48, 0x49 ], # greek capital letter eta with dasia and prosgegrammeni
    0x1F9A => [ 0x87, 0x48, 0x49 ], # greek capital letter eta with psili and varia and prosgegrammeni
    0x1F9B => [ 0x88, 0x48, 0x49 ], # greek capital letter eta with dasia and varia and prosgegrammeni
    0x1F9C => [ 0x85, 0x48, 0x49 ], # greek capital letter eta with psili and oxia and prosgegrammeni
    0x1F9D => [ 0x86, 0x48, 0x49 ], # greek capital letter eta with dasia and oxia and prosgegrammeni
    0x1F9E => [ 0x89, 0x48, 0x49 ], # greek capital letter eta with psili and perispomeni and prosgegrammeni
    0x1F9F => [ 0x8a, 0x48, 0x49 ], # greek capital letter eta with dasia and perispomeni and prosgegrammeni
    0x1FA0 => 0xd3, # greek small letter omega with psili and ypogegrammeni
    0x1FA1 => 0xd4, # greek small letter omega with dasia and ypogegrammeni
    0x1FA2 => 0xd7, # greek small letter omega with psili and varia and ypogegrammeni
    0x1FA3 => 0xd8, # greek small letter omega with dasia and varia and ypogegrammeni
    0x1FA4 => 0xd5, # greek small letter omega with psili and oxia and ypogegrammeni
    0x1FA5 => 0xd6, # greek small letter omega with dasia and oxia and ypogegrammeni
    0x1FA6 => 0xd9, # greek small letter omega with psili and perispomeni and ypogegrammeni
    0x1FA7 => 0xda, # greek small letter omega with dasia and perispomeni and ypogegrammeni
    0x1FA8 => [ 0x83, 0x56, 0x49 ], # greek capital letter omega with psili and prosgegrammeni
    0x1FA9 => [ 0x84, 0x56, 0x49 ], # greek capital letter omega with dasia and prosgegrammeni
    0x1FAA => [ 0x87, 0x56, 0x49 ], # greek capital letter omega with psili and varia and prosgegrammeni
    0x1FAB => [ 0x88, 0x56, 0x49 ], # greek capital letter omega with dasia and varia and prosgegrammeni
    0x1FAC => [ 0x85, 0x56, 0x49 ], # greek capital letter omega with psili and oxia and prosgegrammeni
    0x1FAD => [ 0x86, 0x56, 0x49 ], # greek capital letter omega with dasia and oxia and prosgegrammeni
    0x1FAE => [ 0x89, 0x56, 0x49 ], # greek capital letter omega with psili and perispomeni and prosgegrammeni
    0x1FAF => [ 0x8a, 0x56, 0x49 ], # greek capital letter omega with dasia and perispomeni and prosgegrammeni
    0x1FB2 => 0x97, # greek small letter alpha with varia and ypogegrammeni
    0x1FB3 => 0x26, # greek small letter alpha with ypogegrammeni
    0x1FB4 => 0x96, # greek small letter alpha with oxia and ypogegrammeni
    0x1FB6 => 0x8d, # greek small letter alpha with perispomeni
    0x1FB7 => 0x98, # greek small letter alpha with perispomeni and ypogegrammeni
    0x1FB8 => 0x41, # greek capital letter alpha with vrachy
    0x1FB9 => 0x41, # greek capital letter alpha with macron
    0x1FBA => [ 0x81, 0x41 ], # greek capital letter alpha with varia
    0x1FBB => [ 0x80, 0x41 ], # greek capital letter alpha with oxia
    0x1FBC => [ 0x41, 0x49 ], # greek capital letter alpha with prosgegrammeni
    0x1FBE => 0x49, # greek prosgegrammeni
    0x1FBF => 0x83, # greek psili
    0x1FC0 => 0x82, # greek perispomeni
    0x1FC2 => 0xba, # greek small letter eta with varia and ypogegrammeni
    0x1FC3 => 0xfa, # greek small letter eta with ypogegrammeni
    0x1FC4 => 0xb9, # greek small letter eta with oxia and ypogegrammeni
    0x1FC6 => 0xb0, # greek small letter eta with perispomeni
    0x1FC7 => 0xbb, # greek small letter eta with perispomeni and ypogegrammeni
    0x1FC8 => [ 0x81, 0x45 ], # greek capital letter epsilon with varia
    0x1FC9 => [ 0x80, 0x45 ], # greek capital letter epsilon with oxia
    0x1FCA => [ 0x81, 0x48 ], # greek capital letter eta with varia
    0x1FCB => [ 0x80, 0x48 ], # greek capital letter eta with oxia
    0x1FCC => [ 0x48, 0x49 ], # greek capital letter eta with prosgegrammeni
    0x1FCD => 0x87, # greek psili and varia
    0x1FCE => 0x85, # greek psili and oxia
    0x1FCF => 0x89, # greek psili and perispomeni
    0x1FD2 => 0xfe, # greek small letter iota with dialytika and varia
    0x1FD3 => 0xfd, # greek small letter iota with dialytika and oxia
    0x1FD6 => 0xdd, # greek small letter iota with perispomeni
    0x1FDA => [ 0x81, 0x49 ], # greek capital letter iota with varia
    0x1FDB => [ 0x80, 0x49 ], # greek capital letter iota with oxia
    0x1FDD => 0x88, # greek dasia and varia
    0x1FDE => 0x86, # greek dasia and oxia
    0x1FDF => 0x8a, # greek dasia and perispomeni
    0x1FE2 => 0xa3, # greek small letter upsilon with dialytika and varia
    0x1FE3 => 0x40, # greek small letter upsilon with dialytika and oxia
    0x1FE5 => 0x3d, # greek small letter rho with dasia
    0x1FE6 => 0xe8, # greek small letter upsilon with perispomeni
    0x1FEA => [ 0x81, 0x55 ], # greek capital letter upsilon with varia
    0x1FEB => [ 0x80, 0x55 ], # greek capital letter upsilon with oxia
    0x1FEC => [ 0x84, 0x52 ], # greek capital letter rho with dasia
    0x1FEF => 0x81, # greek varia
    0x1FF2 => 0xd1, # greek small letter omega with varia and ypogegrammeni
    0x1FF3 => 0xc4, # greek small letter omega with ypogegrammeni
    0x1FF4 => 0xd0, # greek small letter omega with oxia and ypogegrammeni
    0x1FF6 => 0xc7, # greek small letter omega with perispomeni
    0x1FF7 => 0xd2, # greek small letter omega with perispomeni and ypogegrammeni
    0x1FF8 => [ 0x81, 0x4f ], # greek capital letter omicron with varia
    0x1FF9 => [ 0x80, 0x4f ], # greek capital letter omicron with oxia
    0x1FFA => [ 0x81, 0x56 ], # greek capital letter omega with varia
    0x1FFB => [ 0x80, 0x56 ], # greek capital letter omega with oxia
    0x1FFC => [ 0x56, 0x49 ], # greek capital letter omega with prosgegrammeni
    0x1FFD => 0x80, # greek oxia
    0x1FFE => 0x84 # greek dasia
);


sub _initialize {
    my $self = shift;
    $self->{NAME}      = 'GreekKeys';
    $self->{UNICODE}   = \%uni;
    $self->{COMBOS}    = \%combo;
    $self->{DECODE}    = \%decode;
    $self->{NOCONVERT} = \%noconvert;
    $self->{LANGUAGE}  = 'Greek';
}

__END__




sub Convert {
    my ( $self, $text ) = @_;
    my ( $char, @conv );

    my @chars = unpack( "C" x length( $text ), $text );

    while ( $char = shift( @chars ) ) {

        if( ref( $uni{$char} ) eq 'ARRAY' ) {
            push( @conv, $self->Combo( $char, \@chars ) );
            
        }
        else {
            push( @conv, $uni{$char} );
        }
    }

    return @conv;
}

sub Combo {
    my ( $self, $char, $chars ) = @_;

    my @choices = @{$uni{$char}};
    my $base = shift( @choices );

    my $next;
    if ( $next = shift( @$chars ) ) {
        my %nexts;
        for ( @choices ) {
            $nexts{$_}++;
        }
        if ( $nexts{$next}++ ) {
            my $combos = $combo{$char};
            return $$combos{$next} if $$combos{$next};
        }
    }

    unshift( @$chars, $next );
    return $base;
}
    

    
    

sub Name {
    return 'GreekKeys';
}



__END__

$uni{0} = 0;
$uni{1} = 1;
$uni{2} = 2;
$uni{3} = 3;
$uni{4} = 4;
$uni{5} = 5;
$uni{6} = 6;
$uni{7} = 7;
$uni{8} = 8;
$uni{9} = 9;
$uni{10} = 10;
$uni{11} = 11;
$uni{12} = 12;
$uni{13} = 13;
$uni{14} = 14;
$uni{15} = 15;
$uni{16} = 16;
$uni{17} = 17;
$uni{18} = 18;
$uni{19} = 19;
$uni{20} = 20;
$uni{21} = 21;
$uni{22} = 22;
$uni{23} = 23;
$uni{24} = 24;
$uni{25} = 25;
$uni{26} = 26;
$uni{27} = 27;
$uni{28} = 28;
$uni{29} = 29;
$uni{30} = 30;
$uni{31} = 31;
$uni{32} = 32;
$uni{33} = 1010;    #*
$uni{34} = 34;
$uni{35} = 971;
$uni{36} = 0;       #* 
$uni{37} = 0;       #8
$uni{38} = 8115;
$uni{39} = 8127;    # smooth
$uni{40} = 40;
$uni{41} = 41;
$uni{42} = 42;
$uni{43} = 837;
$uni{44} = 44;
$uni{45} = 45;
$uni{46} = 46;
$uni{47} = 47;
$uni{48} = 48;
$uni{49} = 49;
$uni{50} = 50;
$uni{51} = 51;
$uni{52} = 52;
$uni{53} = 53;
$uni{54} = 54;
$uni{55} = 55;
$uni{56} = 56;
$uni{57} = 57;
$uni{58} = 903;
$uni{59} = 894;
$uni{60} = 12296;   #*
$uni{61} = 8165;
$uni{62} = 12297;   #*
$uni{63} = 63;
$uni{64} = 8163;
$uni{65} = 913;
$uni{66} = 914;
$uni{67} = 936;
$uni{68} = 916;
$uni{69} = 917;
$uni{70} = 934;
$uni{71} = 915;
$uni{72} = 919;
$uni{73} = 921;
$uni{74} = 926;
$uni{75} = 922;
$uni{76} = 923;
$uni{77} = 924;
$uni{78} = 925;
$uni{79} = 927;
$uni{80} = 928;
$uni{81} = 992;
$uni{82} = 929;
$uni{83} = 930;
$uni{84} = 932;
$uni{85} = 933;
$uni{86} = 937;
$uni{87} = 988;
$uni{88} = 935;
$uni{89} = 920;
$uni{90} = 918;
$uni{91} = 91;
$uni{92} = 92;
$uni{93} = 93;
$uni{94} = 94;
$uni{95} = 12310;
$uni{96} = 803;
$uni{97} = 945;
$uni{98} = 946;
$uni{99} = 968;
$uni{100} = 948;
$uni{101} = 949;
$uni{102} = 966;
$uni{103} = 947;
$uni{104} = 951;
$uni{105} = 953;
$uni{106} = 958;
$uni{107} = 954;
$uni{108} = 955;
$uni{109} = 956;
$uni{110} = 957;
$uni{111} = 959;
$uni{112} = 960;
$uni{113} = 990;
$uni{114} = 961;
$uni{115} = 963;
$uni{116} = 964;
$uni{117} = 965;
$uni{118} = 969;
$uni{119} = 962;
$uni{120} = 967;
$uni{121} = 952;
$uni{122} = 950;
$uni{123} = 123;
$uni{124} = 124;
$uni{125} = 125;
$uni{126} = 8224;
$uni{127} = 127;
$uni{128} = 8189;   # acute
$uni{129} = 8175;   # grave
$uni{130} = 8128;   # circumflex
$uni{131} = 8127;   # smooth
$uni{132} = 8190;   # rough
$uni{133} = 8142;   # smoth acute
$uni{134} = 8158;   # rough acute
$uni{135} = 8141;   # smooth grave
$uni{136} = 8157;   # rough grave
$uni{137} = 8143;   # smooth circumflex
$uni{138} = 8159;   # rough circumflex
$uni{139} = 8049;
$uni{140} = 8048;
$uni{141} = 8118;
$uni{142} = 7936;
$uni{143} = 7937;
$uni{144} = 7940;
$uni{145} = 7941;
$uni{146} = 7938;
$uni{147} = 7939;
$uni{148} = 7942;
$uni{149} = 7943;
$uni{150} = 8116;
$uni{151} = 8114;
$uni{152} = 8119;
$uni{153} = 8064;
$uni{154} = 8065;
$uni{155} = 8068;
$uni{156} = 8069;
$uni{157} = 8066;
$uni{158} = 8067;
$uni{159} = 8070;
$uni{160} = 160;
$uni{161} = 8051;
$uni{162} = 8050;
$uni{163} = 8162;
$uni{164} = 7952;
$uni{165} = 7953;
$uni{166} = 7956;
$uni{167} = 7957;
$uni{168} = 7954;
$uni{169} = 7955;
$uni{170} = 170;
$uni{171} = 12311;
$uni{172} = 172;
$uni{173} = 728;
$uni{174} = 8053;
$uni{175} = 8052;
$uni{176} = 8134;
$uni{177} = 7968;
$uni{178} = 7969;
$uni{179} = 7972;
$uni{180} = 7973;
$uni{181} = 7970;
$uni{182} = 7971;
$uni{183} = 7974;
$uni{184} = 7975;
$uni{185} = 8132;
$uni{186} = 8130;
$uni{187} = 8135;
$uni{188} = 8080;
$uni{189} = 8081;
$uni{190} = 8084;
$uni{191} = 8085;
$uni{192} = 8082;
$uni{193} = 8083;
$uni{194} = 8086;
$uni{195} = 8087;
$uni{196} = 8179;
$uni{197} = 8061;
$uni{198} = 8060;
$uni{199} = 8182;
$uni{200} = 8032;
$uni{201} = 8033;
$uni{202} = 8036;
$uni{203} = 8037;
$uni{204} = 8034;
$uni{205} = 8035;
$uni{206} = 8038;
$uni{207} = 8039;
$uni{208} = 8180;
$uni{209} = 8178;
$uni{210} = 8183;
$uni{211} = 8096;
$uni{212} = 8097;
$uni{213} = 8100;
$uni{214} = 8101;
$uni{215} = 8098;
$uni{216} = 8099;
$uni{217} = 8102;
$uni{218} = 8103;
$uni{219} = 8055;
$uni{220} = 8054;
$uni{221} = 8150;
$uni{222} = 7984;
$uni{223} = 7985;
$uni{224} = 7988;
$uni{225} = 7989;
$uni{226} = 7986;
$uni{227} = 7987;
$uni{228} = 7990;
$uni{229} = 7991;
$uni{230} = 8059;
$uni{231} = 8058;
$uni{232} = 8166;
$uni{233} = 8016;
$uni{234} = 8017;
$uni{235} = 8020;
$uni{236} = 8021;
$uni{237} = 8018;
$uni{238} = 8019;
$uni{239} = 8022;
$uni{240} = 8023;
$uni{241} = 8057;
$uni{242} = 8056;
$uni{243} = 970;
$uni{244} = 8000;
$uni{245} = 8001;
$uni{246} = 8004;
$uni{247} = 8005;
$uni{248} = 8002;
$uni{249} = 8003;
$uni{250} = 8131;
$uni{251} = 986;
$uni{252} = 252;   #*  
$uni{253} = 8147;
$uni{254} = 8146;
$uni{255} = 255;

+ (43) = i
% (37)




