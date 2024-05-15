Class {
	#name : 'FifteenPuzzlePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'game',
		'mainLabel',
		'newGameButton',
		'timeValue',
		'movesValue',
		'gamePanel',
		'cells'
	],
	#category : '15Puzzle',
	#package : '15Puzzle'
}

{ #category : 'initialization' }
FifteenPuzzlePresenter >> connectPresenters [ 
newGameButton action: [ game startGame.
	self redrawCells ].
cells do: [ :each |
    each action: [
        | index |
        index := cells indexOf: each.
        game changeOrder: index.
        self redrawCells.
    ].
].
]

{ #category : 'layout' }
FifteenPuzzlePresenter >> defaultLayout [ 
 ^ SpBoxLayout newTopToBottom
        spacing: 15;
        add: (SpBoxLayout new hAlignCenter; add: mainLabel; yourself) expand: false;
		  add: (SpBoxLayout newHorizontal 
		         spacing: 300;
		         add: newGameButton withConstraints: [:constr | constr padding: 40; expand:false];
		         add: (SpGridLayout new
                    add: 'Time' at: 1@1;
                    add: #timeValue at: 1@2;
                    add: 'Moves' at: 2@1;
                    add: #movesValue at: 2@2;
                    yourself);
            yourself) expand:false;
		add: (SpGridLayout new
		       columnHomogeneous: false;
		       add: (cells at: 1) at: 1@1;
		       add: (cells at: 2) at: 1@2;
		       add: (cells at: 3) at: 1@3;
		       add: (cells at: 4) at: 1@4;
		       add: (cells at: 5) at: 2@1;
		       add: (cells at: 6) at: 2@2;
		       add: (cells at: 7) at: 2@3;
		       add: (cells at: 8) at: 2@4;
		       add: (cells at: 9) at: 3@1;
		       add: (cells at: 10) at: 3@2;
		       add: (cells at: 11) at: 3@3;
		       add: (cells at: 12) at: 3@4;
		       add: (cells at: 13) at: 4@1;
		       add: (cells at: 14) at: 4@2;
		       add: (cells at: 15) at: 4@3;
		       add: (cells at: 16) at: 4@4;
		yourself );
		yourself 
]

{ #category : 'initialization' }
FifteenPuzzlePresenter >> initializeCells [

1 to: 16 do: [ :index|
	|cell|
	cell := self newButton.
	cell 
	    label: (game cells at: index) number;
	    color: (game cells at: index) color;
	    borderWidth: 0.
	cells at: index put: cell.
	].
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
mainLabel := self newLabel.
gamePanel := self newPresenter.
cells := Array new: 16.


1 to: 16 do: [ :index|
	|cell|
	cell := self newButton.
	cell 
	    label: (game cells at: index) number;
	    color: (game cells at: index) color;
	    borderWidth: 0.
	cells at: index put: cell.
	].

newGameButton 
   label: 'New Game'.

mainLabel 
   label: '15Puzzle'.

self initializeStyles.

]

{ #category : 'initialization' }
FifteenPuzzlePresenter >> initializeStyles [ 
self addStyle: 'green'.
mainLabel addStyle: 'title'.
newGameButton addStyle: 'buttonStyle'.
cells do: [ :each |
	each addStyle: 'cellStyle' ]

]

{ #category : 'initialization' }
FifteenPuzzlePresenter >> initializeWindow: aWindowPresenter [
 aWindowPresenter
         title: '';
         initialExtent: 700 @ 800
]

{ #category : 'initialization' }
FifteenPuzzlePresenter >> redrawCells [

1 to: 16 do: [ :index|
	|cell|
	cell := cells at: index.
	cell 
	    label: (game cells at: index) number;
	    color: (game cells at: index) color;
	    borderWidth: 0.
	cells at: index put: cell.
	].
^ self defaultLayout 
]
