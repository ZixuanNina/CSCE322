filledRows([],0).
filledRows([H|T],Rows):-
	countRs([H|T],0,Count),
	length([H|T],Len),
	Rows is Len - Count.