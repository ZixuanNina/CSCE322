


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
