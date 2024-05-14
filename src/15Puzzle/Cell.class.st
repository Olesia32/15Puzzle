Class {
	#name : 'Cell',
	#superclass : 'Object',
	#instVars : [
		'row',
		'column',
		'correctNumber',
		'currentNumber',
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
Cell >> column: anInteger [
column := anInteger 
]

{ #category : 'accessing' }
Cell >> correctNumber: anInteger [
correctNumber := anInteger
]

{ #category : 'api' }
Cell >> currentNumber: anInteger [

	currentNumber := anInteger.
	isEmpty := false.
	color := currentNumber == correctNumber
		         ifTrue: [ Color r: 119 g: 141 b: 69. isCorrect := true ]
		         ifFalse: [ Color r: 250 g: 128 b: 114. isCorrect := false ]
]

{ #category : 'accessing' }
Cell >> isCorrect [
^isCorrect 
]

{ #category : 'accessing' }
Cell >> isEmpty [
^isEmpty 
]

{ #category : 'accessing' }
Cell >> isEmpty: aBoolean [
isEmpty := aBoolean.
(isEmpty)
ifTrue: [ color := Color r:123 g:104 b:238 ]
]

{ #category : 'api' }
Cell >> number [
(correctNumber > 0)
ifTrue: [ ^ correctNumber asString ] ifFalse: [ ^ '' ]
]

{ #category : 'accessing' }
Cell >> row [
^ row
]

{ #category : 'accessing' }
Cell >> row: anInteger [
row := anInteger
]
