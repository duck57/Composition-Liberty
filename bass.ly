\version "2.12.0"  % necessary for upgrading to future LilyPond versions.

\include "common.ly"

bassLine = \relative c {
  \set Staff.midiInstrument = "electric bass (pick)"
  \override Glissando #'style = #'trill
  \transposition c

  \clef bass

  r2 e8.\mf b16 a8 e' cis4~ |
  \times 2/3 { \stemUp cis8 d e } \stemNeutral g8 a e b \times 2/3 {a4 e'8} cis8. < \parenthesize e >16 |

  <e, a g'>2.-> \arpeggioArrowUp <e a d g>4\arpeggio \arpeggioNormal <f b d>2 |
  c'2.\p |
  d4\mf d4 |
  dis4\f dis4 |

  a'1 c,4 |
  f,4.\mp a8 c4 b g |
  d'8\(\< f a g\)\f\> b a f,16(\mf\< c' g'8~\fermata g4)\f\laissezVibrer |

  c,4\mf aes8 c g4. b8 |
  c16 c c c g g g8-. r8 c-. r e-. r g\( f16 d b g\) |

  a4 c ees ges a8 a,8 r4 |
  a4 ees'4 a8. c,16 c'4 bes |

  \crescTextCresc f,1\laissezVibrer\fp\< |
  c'16( e g bes)\mf \crescHairpin f( d a8) c4( bes a) |
  g'8.( f16~ f8 e8) |

  a16(\< b c d e4\f) a,4( g1) |
  a,8\mp a a a a a a16 b gis a |
  \set beatGrouping = #'(3 3 3 3 3) f2.\mf ^"glissando or pitch bend" \glissando b4. a16\f b c b a g f8 g16 a g8 |
  \set beatGrouping = #'(3 3) f16\(\p\< g a b c d \crescTextCresc e\)\fp\< c\( d e f g |
  a16 b c d\) b,\( c d e\) g\( b d f c4\ff\) |
}

bassName = {
  \set Staff.instrumentName = \markup { \center-column { \line { \smaller { 4-string } } \smaller { electric } \line { bass \smaller { guitar } } \line { \smaller { (standard tuning) } } } }
  \set Staff.shortInstrumentName = #"Bass "
}