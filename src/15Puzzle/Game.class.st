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
Game >> changeOrder: aCurrentNumber [
|cell emptyCell|
cell := cells detect: [ :each | each currentNumber = aCurrentNumber ] ifNone: [ nil ].
(cell isEmpty) ifFalse: [ 
	 emptyCell := cells detect: [ :each | each isEmpty ] ifNone: [ nil ].
	 (((cell row = emptyCell row) and: ((cell column - emptyCell column ) abs = 1)) or: ((cell column = emptyCell column) and: ((cell row - emptyCell row ) abs = 1)))
	ifTrue: [ 
		emptyCell row: cell row.
		emptyCell column: cell column.
		emptyCell correctNumber: cell correctNumber.
		cell isEmpty: true.
		cell correctNumber: nil.
		cells at: emptyCell currentNumber put: emptyCell.
		cells at: cell currentNumber put: cell]
	]
]

{ #category : 'initialization' }
Game >> initialize [ 
|i|
i := 1.
timer := Stopwatch new.
moves := 0.
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
]

{ #category : 'accessing' }
Game >> timer: aTimerValue [
    timer := aTimerValue.
]
