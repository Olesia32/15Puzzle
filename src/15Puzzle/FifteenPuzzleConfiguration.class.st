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
		.cellStyle [ Geometry { #width: 80, #height: 80 }, Font { #size: 20, #bold: true}],
		.green [ Draw { #backgroundColor: #AEC09A} ],
		.title [ Font { #size: 60, #bold: true, #italic: true},
			Geometry { #height: Reset, #width: Reset } ]]
'

]
