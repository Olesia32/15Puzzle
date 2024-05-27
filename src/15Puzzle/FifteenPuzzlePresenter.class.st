Class {
	#name : 'FifteenPuzzlePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'game',
		'mainLabel',
		'newGameButton',
		'movesValue',
		'gamePanel',
		'cells'
	],
	#category : '15Puzzle',
	#package : '15Puzzle'
}

{ #category : 'initialization' }
FifteenPuzzlePresenter >> connectPresenters [

	newGameButton action: [
		game startGame.
		self redrawCells ].
	cells do: [ :arg1 |
		arg1 action: [
			| tmp1 |
			tmp1 := cells indexOf: arg1. 
			game changeOrder: tmp1.
			self redrawCells ] ]
]

{ #category : 'layout' }
FifteenPuzzlePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 15;
		  add: (SpBoxLayout new
				   hAlignCenter;
				   add: mainLabel
				   withConstraints: [ :constr | constr padding: 35 ];
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   spacing: 100;
				   add: newGameButton withConstraints: [ :constr |
					   constr
						   padding: 20;
						   expand: false ];
				   add: (SpGridLayout new
						    add: 'Moves' at: 2 @ 1;
						    add: #movesValue at: 2 @ 2;
						    yourself);
				   yourself)
		  withConstraints: [ :constr |
			  constr
				  height: 60;
				  expand: false ];
		  add: self fillGameGrid;
		  yourself
]

{ #category : 'as yet unclassified' }
FifteenPuzzlePresenter >> fillGameGrid [

	| gridLayout |
	gridLayout := SpGridLayout new columnHomogeneous: false.

	1 to: 4 do: [ :row |
		1 to: 4 do: [ :column |
			| cell |
			cell := cells at: row - 1 * 4 + column.
			gridLayout add: cell at: column @ row ] ].

	^ gridLayout
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
	newGameButton := self newButton label: 'New Game'.
	movesValue := self newLabel.
	mainLabel := self newLabel label: '15Puzzle'.
	gamePanel := self newPresenter.
	cells := (1 to: 16) collect: [ :arg1 |
		         | tmp1 tmp3 |
		         tmp3 := self newButton.
		         tmp3
			         label: (game cells at: arg1) number;
			         addStyle: (game cells at: arg1) color.
		         tmp1 := tmp3 borderWidth: 0.
		         tmp1 ].
	self initializeStyles
]

{ #category : 'initialization' }
FifteenPuzzlePresenter >> initializeStyles [

	self addStyle: 'green'.
	mainLabel addStyle: 'title'.
	newGameButton addStyle: 'buttonStyle'.
	cells do: [ :arg1 | arg1 addStyle: 'cellStyle' ]
]

{ #category : 'initialization' }
FifteenPuzzlePresenter >> initializeWindow: arg1 [

	arg1
		title: '';
		initialExtent: 400 @ 600
]

{ #category : 'initialization' }
FifteenPuzzlePresenter >> redrawCells [

	| tmp1 |
	movesValue label: game moves asString.
	self removeColorStyle.
	1 to: 16 do: [ :tmp2 |
		tmp1 := nil.
		tmp1 := cells at: tmp2.
		tmp1
			label: (game cells at: tmp2) number;
			addStyle: (game cells at: tmp2) color;
			borderWidth: 0.
		cells at: tmp2 put: tmp1 ].
	1.
	game isGameOver ifTrue: [
		Transcript
			show: 'Вітаємо! Ви успішно зібрали пазл';
			cr ].
	^ self defaultLayout
]

{ #category : 'removing' }
FifteenPuzzlePresenter >> removeColorStyle [
1 to: 16 do: [ :index |
	|cell|
	cell := cells at: index.
	cell
	   removeStyle: (game cells at: index) color.]
]
