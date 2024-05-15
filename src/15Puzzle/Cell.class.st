Class {
	#name : 'Cell',
	#superclass : 'Object',
	#instVars : [
		'row',
		'column',
		'correctNumber',
		'isEmpty',
		'isCorrect',
		'color'
	],
	#category : '15Puzzle',
	#package : '15Puzzle'
}

{ #category : 'accessing' }
Cell >> color [

	^ color
]

{ #category : 'accessing' }
Cell >> column [

	^ column
]

{ #category : 'accessing' }
Cell >> column: arg1 [

	column := arg1
]

{ #category : 'accessing' }
Cell >> correctNumber: anInteger [

	correctNumber := anInteger.
	isEmpty := false.
	color := correctNumber = (((column - 1) * 4) + row)
		         ifTrue: [ Color green. isCorrect := true]
		         ifFalse: [ Color red ]
]

{ #category : 'api' }
Cell >> currentNumber [
	^ (((column - 1) * 4) + row)
]

{ #category : 'api' }
Cell >> currentNumber: anInteger [

	currentNumber := anInteger.
	isEmpty := false.
	color := currentNumber == correctNumber
		         ifTrue: [ Color green. isCorrect := true ]
		         ifFalse: [ Color red. isCorrect := false ]
]

{ #category : 'accessing' }
Cell >> isCorrect [

	^ isCorrect
]

{ #category : 'accessing' }
Cell >> isEmpty [

	^ isEmpty
]

{ #category : 'accessing' }
Cell >> isEmpty: arg1 [

	isEmpty := arg1.
	isEmpty ifTrue: [ color := Color purple ]
]

{ #category : 'api' }
Cell >> number [

	correctNumber ifNotNil: [ ^ correctNumber asString ].
	^ ''
]

{ #category : 'accessing' }
Cell >> row [

	^ row
]

{ #category : 'accessing' }
Cell >> row: arg1 [

	row := arg1
]
