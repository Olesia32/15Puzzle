Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'moves',
		'cells'
	],
	#category : '15Puzzle',
	#package : '15Puzzle'
}

{ #category : 'adding' }
Game >> addObserver: anObserver [
    observers add: anObserver.
]

{ #category : 'accessing' }
Game >> cells [

	^ cells
]

{ #category : 'as yet unclassified' }
Game >> changeOrder: arg1 [

	| tmp1 tmp2 tmp3 tmp4 |
	tmp1 := cells
		        detect: [ :arg2 | arg2 currentNumber = arg1 ]
		        ifNone: [  ].
	tmp1 isEmpty ifFalse: [
		tmp2 := cells detect: [ :arg3 | arg3 isEmpty ] ifNone: [  ].
		((tmp1 row = tmp2 row and: (tmp1 column - tmp2 column) abs = 1) or:
			 (tmp1 column = tmp2 column and: (tmp1 row - tmp2 row) abs = 1))
			ifTrue: [
				tmp3 := tmp2 row.
				tmp4 := tmp2 column.
				tmp2 correctNumber: tmp1 correctNumber.
				tmp1
					isEmpty: true;
					correctNumber: nil.
				cells
					at: tmp2 currentNumber put: tmp2;
					at: tmp1 currentNumber put: tmp1 ] ].
	moves := moves + 1
]

{ #category : 'initialization' }
Game >> initialize [ 
|i|
i := 1.
cells := Array new: 16.

1 to: 4 do: [ :row |
    1 to: 4 do: [ :column |
        | cell|
        cell := Cell new.
        cell row: row.
        cell column: column.
        cell isEmpty: true.
        cells at: i put: cell.
        i := i + 1.
    ]
].
]

{ #category : 'testing' }
Game >> isGameOver [

	cells isEmpty ifTrue: [ ^ false ].
	nil.
	^ cells noneSatisfy: [ :arg1 |
		  arg1 isEmpty or: [ arg1 isCorrect not ] ]
]

{ #category : 'accessing' }
Game >> moves [

	^ moves
]

{ #category : 'removing' }
Game >> removeObserver: anObserver [
    observers remove: anObserver.
]

{ #category : 'as yet unclassified' }
Game >> startGame [
|numbers|
numbers := (1 to: 15) asArray shuffled.
self initialize.
1 to: 16 do: [ :index|
        | cellNumber |
        (index == 16)
            ifFalse: [ cellNumber := numbers at: index.
        (cells at: index) correctNumber: cellNumber. ]
    ].
moves := 0.
]

{ #category : 'accessing' }
Game >> timer: aTimerValue [
    timer := aTimerValue.
]
