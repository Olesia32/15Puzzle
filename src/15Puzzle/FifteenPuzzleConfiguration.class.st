Class {
	#name : 'FifteenPuzzleConfiguration',
	#superclass : 'SpMorphicConfiguration',
	#category : '15Puzzle',
	#package : '15Puzzle'
}

{ #category : 'configuring' }
FifteenPuzzleConfiguration >> configure: anApplication [

	super configure: anApplication.
	self addStyleSheetFromString: self customStyleSheet
]

{ #category : 'as yet unclassified' }
FifteenPuzzleConfiguration >> customStyleSheet [ 
	^ '
	.application [

.buttonStyle [ Geometry { #width: 110, #height: 50 }, Draw { #backgroundColor: #344C11, #color: #778D45} ],
.cellStyle [ Geometry { #width: 80, #height: 80 } ],
.green [
Draw {
#backgroundColor: #AEC09A
}
],
.redOverlay [
Draw { #backgroundColor: #C0392BBB },
Geometry { #height: 300, #width: 300 }
],
.title [ Font { #size: 60, #bold: true, #italic: true},
Geometry { #height: Reset, #width: Reset } ]

]
'

]
