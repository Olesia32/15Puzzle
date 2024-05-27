Class {
	#name : 'Cell',
	#superclass : 'Object',
	#instVars : [
		'row',
		'column',
		'correctNumber',
		'isEmpty',
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
Cell >> correctNumber [

	^ correctNumber
]

{ #category : 'accessing' }
Cell >> correctNumber: arg1 [

	correctNumber := arg1.
	correctNumber ifNil: [ isEmpty := true ] ifNotNil: [
		isEmpty := false.
		color := correctNumber = (row - 1 * 4 + column)
			         ifTrue: [ 'lightGreen' ]
			         ifFalse: [ 'lightRed' ] ]
]

{ #category : 'api' }
Cell >> currentNumber [

	^ row - 1 * 4 + column
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

	^ correctNumber = self currentNumber
]

{ #category : 'accessing' }
Cell >> isEmpty [

	^ isEmpty
]

{ #category : 'accessing' }
Cell >> isEmpty: arg1 [

	isEmpty := arg1.
	isEmpty ifTrue: [ color := 'lightPurple' ]
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
