Class {
	#name : 'FifteenPuzzleAplication',
	#superclass : 'SpApplication',
	#category : '15Puzzle',
	#package : '15Puzzle'
}

{ #category : 'initialization' }
FifteenPuzzleAplication >> initialize [ 
super initialize.
self 
useBackend: #Morphic.
]

{ #category : 'running' }
FifteenPuzzleAplication >> start [
| window |
	window := (self newPresenter: FifteenPuzzlePresenter ) open.
	window window beUnresizeable; removeExpandBox; removeCollapseBox; removeMenuBox

]
