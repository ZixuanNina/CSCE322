percentageSpaces([]).
percentageSpaces([Row|Rows]):-
	length(Row, Len),
    Sum is Len*Len,
    TotalS is Sum/4,
	myfindall2D([Row|Rows],0,Spaces),
    Spaces >= TotalS.
