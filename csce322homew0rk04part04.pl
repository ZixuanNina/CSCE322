checkGame(game).
	length(game,Len),
	Sum is (Len*Len*Len + Len)/2,
	sumRows(game,Sum),
	sumColL(game,0,List),
	sumCols(List,Sum).