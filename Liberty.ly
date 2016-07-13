\version "2.12.2"

\include "mba.ly"
\include "vib.ly"
\include "bass.ly"
\include "drums.ly"
\include "common.ly"

\book {
  \paper {
    #(set-paper-size "letter")
    indent = 23\mm
    ragged-last = ##t
    ragged-last-bottom = ##t
    %ragged-bottom = ##t
    left-margin = 19\mm
    %right-margin = 11\mm
    line-width = 216\mm - 37\mm
  }
  \header {
    title = "Composition of Liberty"
    composer = "Chris J.M."
    copyright = \markup { \char ##x00A9 "2006, minor revisions 2016" }
    breakbefore = ##t
  }
  %\pageBreak
  \score {
    <<
      \new Staff << \global \vibraphonePart >>
      \new Staff << \global \marimbaPart >>
      \new Staff << \global \bassLine >>
      \drumSet
    >>
    \midi {  }
    \layout {  }
  }
  %\pageBreak
}