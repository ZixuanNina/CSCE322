


% find(List,What,Where)
find([What|_],What,0).
find([_|T],What,Where):-
    find(T,What,WhereT),
    Where is WhereT + 1.

find2D([Row|_],What,Where):-
    find(Row,What,Col),
    Where = (0,Col).
find2D([_|Rows],What,Where):-
    find2D(Rows,What,(RowWhere,ColWhere)),
    Row is RowWhere + 1,
    Where = (Row,ColWhere).
