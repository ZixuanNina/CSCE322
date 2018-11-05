% dropn(N,Before,After)
% dropn(N,Before,After): After is Before with first N elements removed
dropn(0,Before,Before).
dropn(_,[],[]).
dropn(N,[BH|BT],[AH|AT]):-
    length([BH|BT],BeforeLen),
    between(1,BeforeLen,N),
    Nminus1 is N - 1,
    dropn(Nminus1,BT,[AH|AT]).
