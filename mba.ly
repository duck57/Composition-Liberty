\version "2.12.0"  % necessary for upgrading to future LilyPond versions.

\include "common.ly"

marimbaPart = \relative c {
  \set Staff.midiInstrument = "marimba"

  \clef bass

  a16(\p\< b c d c)\fp\< b( c d e8.)\mf b16 a8 e' cis4~ |
  \times 2/3 { \stemUp cis8 d e } \stemNeutral f16 g \times 2/3 {a16 g e} cis16\(\p\< e g b \times 2/3 { cis8 dis e } f8 fis\)\f |

  \clef treble cis8\(\mf\< d e f g2 a4 b8 c |
  d4\)\f c'8\mf( b c4) |
  <d, d,>4 <d d,> |
  <dis dis,>\f <dis dis,> |

  e,16( f g8 a4) c16( b a8 gis4) c |
  c16( d e g) d8 f c4 \crescTextCresc b8\subp\< a g f16( e |
  d16 e f g a) f( g a b) g( a b c2:32)\f\fermata \crescHairpin |



  r2*7/8 s16\ff \dimTextDecresc <c, e g c>8.\> <bes d f bes>16 r8 <a d> |
  \clef bass <c, e g c>8. <bes d f bes>16 r8 <a d> <c e g c>8. <bes d f bes>16 r8 <a d> <c e g c>8. <bes d f bes>16 r8 <a d> |


  \times 2/3 { a8\p\<\( ais b } \dimHairpin \times 2/3 { c[ cis d] } \times 2/3 { dis e f } \times 2/3 { fis g gis } a2->\ff\) |
  \times 2/3 { a,8\mp\<\( b cis } \times 2/3 { dis f g } a2\f\) f8 c'8 |

  f,16\> e f e \times 2/3 { c8~(\mp\< <c e>~ <c e g>~ } <c e g c>8.\f\> <bes d f bes>16-.) r8 <a d e a> |
  <c e g c>8.\p\< <bes d f bes>16 r8 <a d e a>-. <c e g c>4--\mf\> <bes d f bes>-- \arpeggioArrowUp <a d e a>--\arpeggio |
  \arpeggioArrowDown <c e g c>8.\arpeggio\(\mp \arpeggioNormal <bes d f bes>16-.\) r8 <a d e a>8 |

  c8.--\mf c16-- c8.-_ c16-- c4-. r1 - \markup { \small { drop 2 mallets } } |
  a16(\< b c d) b( c d e) c( e f g a4)\f |
  \set beatGrouping = #'(3 3 3 3 3) \crescTextCresc f8(\subp\< g a) g( a b) a( b c) \clef treble b( c d) c( d e |
  \set beatGrouping = #'(3 3) f16 g a b c d e)\fp\< c( d e f g  |
  \crescHairpin a b c d) c( d e f)\fp\< \ottava#1 g,(c e g \times 2/3 { c16 aes e) } f,8\ff |
}

mSetup = {
  \set Staff.instrumentName = \markup { \center-column { \line { \smaller { \concat { 4 \char ##x2153 } octave } } "marimba" } }
  \set Staff.shortInstrumentName = #"Mba. "
}