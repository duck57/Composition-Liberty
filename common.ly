\version "2.12.2"

XinO = {
  \once \override  NoteHead  #'stencil = #ly:text-interface::print
  \once \override  NoteHead #'text = \markup {
    \combine
      \halign #-0.7 \draw-circle #0.85 #0.2 ##f
      \musicglyph #"noteheads.s2cross"
  }
}

Xnote = {
  \once \override NoteHead  #'stencil = #ly:text-interface::print
  \once \override NoteHead #'text = \markup {    
      \musicglyph #"noteheads.s2cross"
  }
}

mps = #(make-dynamic-script
		(markup #:normal-text (#:italic "espressivo")
			#:dynamic "mp"))

smp = #(make-dynamic-script
		(markup #:normal-text (#:italic "sub.")
			#:dynamic "mp"))

subp = #(make-dynamic-script
		(markup #:normal-text (#:italic "subito")
			#:dynamic "p"))

accSpan = \once \override TextSpanner #'(bound-details left text) = "accel."
ritSpan = \once \override TextSpanner #'(bound-details left text) = "rit."
simSpan = \once \override TextSpanner #'(bound-details left text) = "sim."

nienteCircle = \once \override Hairpin #'circled-tip = ##t

toBarF = \once \override Hairpin #'to-barline = ##f

lh = \markup { \teeny { L } }
rh = \markup { \teeny { R } }

bracketTsig = { \once \override Staff.TimeSignature #'stencil = #(lambda (grob)
    (bracketify-stencil (ly:time-signature::print grob) Y 0.22 0.14 0.09)) }

eee = \tempo \markup {
    \concat { 
     (
      \smaller \general-align #Y #DOWN \note #"8" #1
      " = "
      \smaller \general-align #Y #DOWN \note #"8" #1
     )
    }
  }

flam =
#(define-music-function (parser location note) (ly:music?)
   "Return { \\grace { note8 } note }."
   (let ((mypitch (ly:music-property (first (ly:music-property note 'elements))
                                     'drum-type)))
     (make-sequential-music
      (list (make-grace-music
             (make-sequential-music
              (list
               (context-spec-music
                (make-grob-property-set 'Stem
                                        'stroke-style "grace")
                'Bottom)
               (make-event-chord
                (list (make-music 'NoteEvent
                                  'duration (ly:make-duration 3 0 1 1)
                                  'drum-type mypitch))))))
            note))))

drag =
#(define-music-function (parser location note) (ly:music?)
   "Return { \\grace { note16[ note16] } note }."
   (let ((mypitch (ly:music-property (first (ly:music-property note 'elements))
                                     'drum-type)))
     (make-sequential-music
      (list (make-grace-music
             (make-sequential-music
              (list (make-event-chord
                     (list (make-music 'NoteEvent
                                       'duration (ly:make-duration 4 0 1 1)
                                       'drum-type mypitch)
                           (make-span-event 'BeamEvent START)))
                    (make-event-chord
                     (list (make-music 'NoteEvent
                                       'duration (ly:make-duration 4 0 1 1)
                                       'drum-type mypitch)
                           (make-span-event 'BeamEvent STOP))))))
            note))))

ruff =
#(define-music-function (parser location note) (ly:music?)
   "Return { \\grace { note16[ note16 note16] } note }."
   (let ((mypitch (ly:music-property (first (ly:music-property note 'elements))
                                     'drum-type)))
     (make-sequential-music
      (list (make-grace-music
             (make-sequential-music
              (list (make-event-chord
                     (list (make-music 'NoteEvent
                                       'duration (ly:make-duration 4 0 1 1)
                                       'drum-type mypitch)
                           (make-span-event 'BeamEvent START)))
                    (make-event-chord
                     (list (make-music 'NoteEvent
                                       'duration (ly:make-duration 4 0 1 1)
                                       'drum-type mypitch)))
                    (make-event-chord
                     (list (make-music 'NoteEvent
                                       'duration (ly:make-duration 4 0 1 1)
                                       'drum-type mypitch)
                           (make-span-event 'BeamEvent STOP))))))
            note))))


global = {
  \override Staff.TimeSignature #'stencil = ##f
  #(set-accidental-style 'modern-cautionary)
  \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \override Score.PaperColumn #'keep-inside-line = ##t
  \compressFullBarRests
  \tempo 8 = 224

  \time 5/4 s1*5/4*2
  \time 6/4 \mark \markup { \musicglyph #"scripts.segno" } s1.
  \time 3/4 s2.
  \time 2/4 s2*2
  \time 5/4 s1*5/4*2
  \ritSpan s2.\startTextSpan s4\stopTextSpan \mark "Fine" \tempo "a tempo" s4 \bar "|."
  \time 4/4 s1
  \time 6/4 s1.
  \repeat volta 2 { s1.
    \time 5/4 s1*5/4 }
  \alternative {
    { \time 4/4 s1
      \time 5/4 s1*5/4
      \time 2/4 s2 }
    { \time 7/4 s1.. } }
  \time 4/4 s1
  \time 15/8 s1...
  \time 6/8 s2.
  \time 4/4 s2.. \mark "D.S. al Fine" s8 \bar "||"
}