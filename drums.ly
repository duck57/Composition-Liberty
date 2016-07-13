\version "2.12.0"

\include "common.ly"

normalPos= \revert MultiMeasureRest #'staff-position


up = \drummode {
  \normalPos
  #(add-grace-property 'Voice 'Stem 'direction ly:stem::calc-direction)
  #(remove-grace-property 'Voice 'Stem 'direction)

  \oneVoice
  R1*5/4 r2. \voiceOne
  <<
    r2
    \new CueVoice {
      \notemode { \cueClef "treble" \stemUp \times 2/3 { cis'8_"mba" dis' e' } f'8 fis' }
    }
  >>
  \cueClefUnset |

  cymr4\mp <cymr sn>8 <cymr sn>8  cymr4 cymr <cymr sn>8  cymr8 <cymr sn>8 bd |
  \stemUp bd4 \stemDown \acciaccatura sn8 sn4 \acciaccatura sn8 sn4 |
  \stemUp bd4 \stemDown \acciaccatura sn8 sn4 |
  \stemUp bd4 \stemDown \acciaccatura sn8 sn4 |

  \stemUp cymr4 <cymr sn>8. cymr16 sn8[ cymc sn cymr] cymr[ cymr] |
  cymr4 <cymr sn>8. cymr16 sn8[ cymc sn cymr] cymr[ cymr] |
  \crescTextCresc tomh16\f\< tomh16 tomh8 tommh16 tommh8 toml16 sn4-^\ff \crescHairpin cymch4:32~\fermata\pp\< cymch8\laissezVibrer\f r8 |


  cymr8\mf cymr16 cymr16 sn16 cymr8 hhc16 hh hh hh8 sn8 cyms8 |
  cymr4 <cymr sn>8 <cymr sn>8 cymr4 cymr4 \times 2/3 { <cymr sn>8 cymr cymr } <cymr sn>8[ bd] |

  \times 2/3 { hhc8 hh hh } \times 2/3 { sn[ hh hh] } \times 2/3 { hh hh hh } \times 2/3 { sn hh hh } hhho8 cymr16 cymr sn8 bd |
  \times 2/3 { hhc8 hh hh } \times 2/3 { sn[ hh hh] } hh8[ hh <hh sn> hh] hh[ hh] |

  \repeat unfold 4 { r8[ hhho sn hho] }
  sn->[ sn->] |
  r[ hhho sn hho] |

  cymc4-> sn8. cymr16 cymr4 <sn cymr>8 hho-- cymr4 \acciaccatura { sn16[ sn] }sn4 \acciaccatura { rb16[ rb rb] } cyms8. bd16 |
  hhc16 hh hh hh sn hh hh hh hh sn hh hh sn hh sn hh |
  \set beatGrouping = #'(3 3 3 3 3) \crescTextCresc sn8\subp\<\( tomh( tommh)\) sn\( tommh( tomml)\) sn\( tomml( toml)\) sn\( toml( tomfh)\) sn\( tomfh( tomfl)\) |
  \set beatGrouping = #'(2 2 2) r8\f \acciaccatura sn sn-> r \acciaccatura sn sn-> r sn16\( sn |
  cymr8->\) cymr16 cymr16 sn8 hhho8 cymr16 cymr8 cymr16 sn8 hho8 |
}

down = \drummode {
  \normalPos
  #(add-grace-property 'Voice 'Stem 'direction ly:stem::calc-direction)
  #(remove-grace-property 'Voice 'Stem 'direction)

  s1*5/4*2 |

  bd4. bd8 bd4 bd4 bd4. s8 |
  s2. |
  s2*2 |

  r4 bd4 bd4. bd8 bd4~ |
  bd4 bd4 bd4. bd8 bd4~ |
  bd8 bd8 bd4 bd4 bd2\fermata |


  bd 8 bd r bd bd8. bd16 r8 bd |
  bd4. bd8 bd 4 bd bd4. s8 |

  \times 2/3 { bd8 bd4 } \times 2/3 { bd4 bd8 } \times 2/3 { r8 bd4 } bd4 bd8. bd16 r8 s |
  bd8 bd bd4 bd4. bd4 bd8 |

  \repeat unfold 4 { bd4 r4 } bd8 bd |
  \time 2/4 bd4 bd |

  bd4.. bd16 bd4 bd bd8 bd bd4.. s16 |
  bd8. bd16 r8 bd8 bd bd~ bd16 bd8. |
  \set beatGrouping = #'(3 3 3 3 3) bd4. bd4. bd4. bd4. bd4. |
  \set beatGrouping = #'(2 2 2) bd4 bd4 bd4 |
  bd8. bd16 r8 bd8 r16 bd8 bd16 r8 bd8 |
}


drumSet = \new DrumStaff <<
  \set Staff.instrumentName = #"drum set "
  \set Staff.shortInstrumentName = #"D.S. "

  \new DrumVoice { \voiceOne \up }
  \new DrumVoice { \voiceTwo << \global \down >> }  
>>