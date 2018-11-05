




% sumList(List,SumOfValuesInList)
sumList([],0).
sumList([H|T],Sum):-
    sumList(T,SumT),
    Sum is H + SumT.

% sumMatrix(Matrix,Sum)
sumMatrix([],0).
sumMatrix([H|T],Sum):-
    sumList(H,SumH),
    sumMatrix(T,SumT),
    Sum is SumH + SumT.









