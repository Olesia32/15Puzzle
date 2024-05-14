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

{ #category : 'initialization' }
Game >> initialize [ 
timer := Stopwatch new.
moves := 0.
cells := { }.

1 to: 4 do: [ :row |
    cells at: row put: { }.
    1 to: 4 do: [ :column |
        | cell |
        cell := Cell new.
        cell currentNumber: row * 4 + column + 1; isEmpty: true.
        cells at: row * 4 + column + 1 put: cell.
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
            ifFalse: [ cellNumber := numbers removeFirst.
        (cells at: index) correctNumber: cellNumber. ]
    ].

timer activate.
]

{ #category : 'accessing' }
Game >> timer: aTimerValue [
    timer := aTimerValue.
]
