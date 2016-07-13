\version "2.12.0"

\include "common.ly"

vibraphonePart = \relative c' {
  \set Staff.midiInstrument = "vibraphone"

  \clef treble

  r2*3/4 s8\mp <a' cis e>2.-> |
  \times 2/3 { cis8(\< d e } f8)\mf e cis16 g f a \times 4/6 { cis16 d e f g f } e16 cis a f |

  e8 a f4 b2 f8 c'4. |
  r4 c8( b8 c4) |
  <d d,> <d d,> |
  <dis dis,>\f <dis dis,> |

  e a16\( ais b8 c4\) gis16\( ais b8 c16\) ais b8 |
  <f, a c g'>2.\mf <a c f a>2 |
  <f a b d>1--->\laissezVibrer\fermata \parenthesize g'8\f\( \parenthesize e8 -\markup { "( ) = 1st time only" }  |


  c16 aes f d c\) aes d( f aes2 |
  c4) g2 b4 d4 e16\( d c b |

  a1\sustainOn\glissando -\markup { \italic "white key glissando" } a'2\glissando |
  a,,2*7/8\) s16\sustainOff g16\(\p\< a b c d4\)\mp c'4 |

  d16\< e f g \times 2/3 { a8 b c } d\mf\> b16 g e c a f |
  e4\mp c' e16\(\> d c a\) \times 4/6 { f16\p\< g a g f e } f4\f |
  d16( f a d f8)-> f,8-> |

  r2*3/4 s8\ff <c' c'>2-> g'4(\mf\> e c) |
  a16\(\mp b c d e f g a b c d e f4\) |
  \set beatGrouping = #'(3 3 3 3 3) \crescTextCresc f,,4(\subp\< a8) g4( b8) a4( c8) b a g f g a |
  \set beatGrouping = #'(3 3) f16\( g a b c d e\)\fp\< c\( d e f g |
  a b c d\) c\( d e f\f\) \crescHairpin r[ c,(\sp\< e g] c4)\ff |
}

vSetup = {
  \set Staff.instrumentName = \markup { \center-column { \line { \smaller { 3.0 octave } } "vibraphone" } }
  \set Staff.shortInstrumentName = #"Vib. "
  \override Glissando #'style = #'trill
}