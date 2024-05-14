Class {
	#name : 'FifteenPuzzlePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'game',
		'newGameButton',
		'timeValue',
		'movesValue',
		'cells'
	],
	#category : '15Puzzle',
	#package : '15Puzzle'
}

{ #category : 'layout' }
FifteenPuzzlePresenter >> defaultLayout [ 
 ^SpBoxLayout newTopToBottom 
        spacing: 15;
        add: '15Puzzle';
		  add: (SpBoxLayout newHorizontal 
		         add: newGameButton withConstraints: [:constr | constr width: 100; height: 50];
		         add: (SpGridLayout new
		                add: 'Time' at: 1@1;
		                add: #timeValue at: 2@1;
		                add: 'Moves' at: 1@2;
		                add: #movesValue at: 2@2;
		                yourself);
					yourself ) withConstraints: [ :constr | constr width: 500]
					;
		  add: gamePanel;
		  yourself
]

{ #category : 'initialization' }
FifteenPuzzlePresenter >> initializeGameGrid [
| gridLayout |
gridLayout := SpGridLayout new
    rows: 4;
    columns: 4.

1 to: 4 do: [ :row |
    1 to: 4 do: [ :column |
        | cell |
        cell := (cells at: row * 4 + column + 1).
        gridLayout add: cell at: row @ column. 
    ]
].

^ gridLayout.


]

{ #category : 'initialization' }
FifteenPuzzlePresenter >> initializePresenters [ 
game := Game new.
newGameButton := self newButton.
timeValue := self newLabel.
movesValue := self newLabel.
cells := { }.

1 to: 16 do: [ :index|
	|cell|
	cell := self newButton.
	cell 
	    label: (game cells at: index) number;
	    color: (game cells at: index) color.
	cells at: index put: cell.
	].

newGameButton 
   label: 'New Game';
   color: Color lightGreen.
  
]

{ #category : 'initialization' }
FifteenPuzzlePresenter >> initializeWindow: aWindowPresenter [
 aWindowPresenter
         title: '15Puzzle';
         initialExtent: 700 @ 800
]
