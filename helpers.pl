:- module( helpers,
	 [ readMagicSquareInfoFile/4
	 , printGame/1
	 , myfindall2D/3
	 , countRs/3
	 , sumRows/2
	 , sumCols/2
	 , sumColL/3
	 ]
    ).

readMagicSquareInfoFile(File,Spaces,Values,Game):-
    open(File,read,Input),
    read(Input,Spaces),
    read(Input,Values),
    readGame(Input,Game),
    close(Input).

readGame(Input,[]):-
    at_end_of_stream(Input),
    !.
readGame(Input,[Row|Rows]):-
    \+ at_end_of_stream(Input),
    read(Input,Row),
    readGame(Input,Rows).

printGame([]).
printGame([Row|Rows]):-
    writeln(Row),
    printGame(Rows).

%generate functions self
%find numbers of 0
myfindall([],_,0).
myfindall(Row,What,Space):-
	findall(What, member(What,Row), L),
	length(L,Space).
myfindall2D([],_,0).
myfindall2D([Row|Rows],What,SUM):-
	myfindall(Row,What,Space),
    myfindall2D(Rows,What,RestOfSpaces),
	SUM is Space + RestOfSpaces.

%find number of rows contain the element
countRs([],_,0).
countRs([H|T],What,Rows):-
	member(What,H),
	countRs(T,What,RowsT),
	Rows is RowsT + 1.
countRs([H|T],What,Rows):-
	not(member(What,H)),
	countRs(T,What,RowsT),
	Rows is RowsT.

%check summation	
	

	
%funtions gave
% sumList(List,SumOfValuesInList) use for check summation of rows directly
sumList([],0).
sumList([H|T],Sum):-
    sumList(T,SumT),
    Sum is H + SumT.

sumRows([],_).
sumRows([Row|_],Sum):-
	sumList(Row,Sum).
sumRows([_|T],Sum):-
	sumRows(T,Sum).
	
%sum of cols
sumCol([H|T],Col,Sum):-
	%check one col
	findall(X,find2D([H|T],X,(_,Col),_),L),
	sumList(L,Sum).

sumColL([_],_,[]).
sumColL([H|T],Col,SumL):-
	length([H|T],Len),
	Col @< Len,
	sumCol([H|T],Col,Sum),
	Cols is Col + 1,
	sumColL([H|T],Cols,Sums),
	append([Sum],Sums,SumL).
sumColL([H|T],Col,[]):-
	length([H|T],Len),
	Col = Len.

sumCols([],_).
sumCols([H|T],H):-
	sumCols(T,H).
	
% find(List,What,Where)
find([What|_],What,0).
find([_|T],What,Where):-
    find(T,What,WhereT),
    Where is WhereT + 1.

find2D([Row|_],What,Where,What):-
    find(Row,What,Col),
    Where = (0,Col).
find2D([_|Rows],What,Where,Sum):-
    find2D(Rows,What,(RowWhere,ColWhere),SumN),
    Row is RowWhere + 1,
    Where = (Row,ColWhere),
	Sum is What + SumN.

% change(Before,(WhereRow,WhereCol),What,After)
change([BeforeH|BeforeT],(0,WhereCol),What,[AfterH|BeforeT]):-
    changeRow(BeforeH,WhereCol,What,AfterH).
change([BeforeH|BeforeT],(WhereRow,WhereCol),What,[BeforeH|AfterT]):-
    length([BeforeH|BeforeT],Len),
    LessLen is Len - 1,
    between(1,LessLen,WhereRow),
    NewWhere is WhereRow - 1,
    change(BeforeT,(NewWhere,WhereCol),What,AfterT).


% changeRow(Before,Where,What,After)
changeRow([_|T],0,What,[What|T]).
changeRow([H|T],Where,What,[H|ChangeT]):-
    length([H|T],Len),
    LessLen is Len - 1,
    between(1,LessLen,Where),
    NewWhere is Where - 1,
    changeRow(T,NewWhere,What,ChangeT).
	