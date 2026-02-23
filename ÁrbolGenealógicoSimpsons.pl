% Hechos

madre(jacqueline, marge).
madre(jacqueline, patty).
madre(jacqueline, selma).

madre(mona, homero).
madre(mona, herbert).

madre(marge, bart).
madre(marge, lisa).
madre(marge, maggie).

madre(selma, ling).

padre(clancy, marge).
padre(clancy, patty).
padre(clancy, selma).

padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).

padre(abraham, homero).
padre(abraham, herbert).

esposos(homero, marge).
esposos(clancy, jacqueline).
esposos(abraham, mona).


% Reglas

hermano(X, Y) :-
    padre(P, X),
    padre(P, Y),
    madre(M, X),
    madre(M, Y),
    X \= Y.

hermana(X, Y) :-
    hermano(X, Y).

abuelo_paterno(A, N) :-
    padre(A, P),
    padre(P, N),
    A \= N.

abuela_paterna(A, N) :-
    madre(A, P),
    padre(P, N),
    A \= N.

abuelo_materno(A, N) :-
    padre(A, M),
    madre(M, N),
    A \= N.

abuela_materna(A, N) :-
    madre(A, M),
    madre(M, N),
    A \= N.

tio(T, S) :-
    hermano(T, P),
    padre(P, S),
    T \= S.

tia(T, S) :-
    hermana(T, P),
    madre(P, S),
    T \= S.

sobrino(S, T) :-
    tio(T, S),
    S \= T.

sobrina(S, T) :-
    tia(T, S),
    S \= T.

primo(X, Y) :-
    padre(P1, X),
    padre(P2, Y),
    hermano(P1, P2),
    X \= Y.

prima(X, Y) :-
    madre(M1, X),
    madre(M2, Y),
    hermana(M1, M2),
    X \= Y.