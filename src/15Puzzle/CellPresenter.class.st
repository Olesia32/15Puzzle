Class {
	#name : 'CellPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'cell',
		'body'
	],
	#category : '15Puzzle',
	#package : '15Puzzle'
}

{ #category : 'accessing' }
CellPresenter >> cell: aCell [
cell := aCell.

body
    label: cell number;
    color: cell color.
]

{ #category : 'initialization' }
CellPresenter >> initialize [ 
body := self newButton.
   
]
