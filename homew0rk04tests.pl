combineSequences([],[],[]).
combineSequences([Space|Spaces],[Value|Values],[(Space,Value)|SpacesValues]):-
    combineSequences(Spaces,Values,SpacesValues).

printSequences([]).
printSequences([H|T]):-
    writeln(H),
    printSequences(T).

loadHelpers:-
    ['helpers.pl'],
    ['csce322homew0rk04part01.pl'],
    ['csce322homew0rk04part02.pl'],
    ['csce322homew0rk04part03.pl'],
    ['csce322homew0rk04part04.pl'].
    
part01:-
    readMagicSquareInfoFile('test04.msi',_,_,Game),
    writeln(game),
    printGame(Game),
    percentageSpaces(Game),
	writeln(check).
    
part02:-
    readMagicSquareInfoFile('test04.msi',_,_,Game),
    writeln(game),
    printGame(Game),
    filledRows(Game,Rows),
    writeln(rows),
    writeln(Rows).

part03:-
    readMagicSquareInfoFile('test04.msi',_,_,Game),
    writeln(game),
    printGame(Game),
    solveGame(Game,Spaces,Values),
    writeln(moves),
    combineSequences(Spaces,Values,SpacesValues),
    sort(SpacesValues,SortedSpacesValues),
    printSequences(SortedSpacesValues).
  
part04:-
    readMagicSquareInfoFile('test04.msi',_,_,Game),
    writeln(game),
    printGame(Game),
    checkGame(Game).
