Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'timer',
		'moves',
		'cells',
		'observers'
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
	| cell emptyCell emptyCellRow emptyCellColumn |
	cell := cells
		        detect: [ :arg2 | arg2 currentNumber = arg1 ]
		        ifNone: [  ].
	cell isEmpty ifFalse: [
		emptyCell := cells detect: [ :arg3 | arg3 isEmpty ] ifNone: [  ].
		((cell row = emptyCell row and: (cell column - emptyCell column) abs = 1) or:
			 (cell column = emptyCell column and: (cell row - emptyCell row) abs = 1))
			ifTrue: [
				emptyCellRow := emptyCell row.
				emptyCellColumn := emptyCell column.
				emptyCell
					correctNumber: cell correctNumber.
				cell
				   isEmpty: true;
					correctNumber: nil.
				cells
					at: emptyCell currentNumber put: emptyCell;
					at: cell currentNumber put: cell ]].
			moves := moves + 1.
]

{ #category : 'initialization' }
Game >> initialize [ 
|i|
i := 1.
timer := Stopwatch new.
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
    "Перевіряє, чи гра завершилась"
    cells isEmpty ifTrue: [ ^ false ]. 
    cells do: [ :cell |
        (cell isEmpty or: [ cell isCorrect not ]) ifTrue: [ ^ false ].
    ].

    timer stop.
    ^ true.

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
1 to: 16 do: [ :index|
        | cellNumber |
        (index == 16)
            ifFalse: [ cellNumber := numbers at: index.
        (cells at: index) correctNumber: cellNumber. ]
    ].

timer activate.
moves := 0.
]

{ #category : 'accessing' }
Game >> timer: aTimerValue [
    timer := aTimerValue.
]
