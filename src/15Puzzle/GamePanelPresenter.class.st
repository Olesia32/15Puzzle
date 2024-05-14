Class {
	#name : 'GamePanelPresenter',
	#superclass : 'SpPresenter',
	#category : '15Puzzle',
	#package : '15Puzzle'
}

{ #category : 'layout' }
GamePanelPresenter >> defaultLayout [ 
| gridLayout |
gridLayout := SpGridLayout new
    rows: 4;
    columns: 4.

1 to: 4 do: [ :row |
    1 to: 4 do: [ :column |
        | cell |
        cell := CellPresenter new. 
        gridLayout add: cell at: row @ column. 
    ]
].

^ gridLayout.


]
