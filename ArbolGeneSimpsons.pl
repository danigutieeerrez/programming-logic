% Hechos

%madres
madre(jacqueline, marge).
madre(jacqueline, patty).
madre(jacqueline, selma).
madre(mona, homero).
madre(mona, herbert).
madre(marge, bart).
madre(marge, lisa).
madre(marge, maggie).
madre(selma, ling).

%padres
padre(clancy, marge).
padre(clancy, patty).
padre(clancy, selma).
padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).
padre(abraham, homero).
padre(abraham, herbert).

% Reglas
hermano(X, Y) :-
padre(P, X),
padre(P, Y),
madre(M, X),
madre(M, Y),
X \= Y.

hermana(X, Y) :-
hermano(X, Y).

abuelo_paterno(X, Y) :-
padre(X, Z),
padre(Z, Y).

abuela_paterna(X, Y) :-
madre(X, Z),
padre(Z, Y).

abuelo_materno(X, Y) :-
padre(X, Z),
madre(Z, Y).

abuela_materna(X, Y) :-
madre(X, Z),
madre(Z, Y).

tio(X, Y) :-
hermano(X, Z),
padre(Z, Y).

tia(X, Y) :-
hermana(X, Z),
madre(Z, Y).

sobrino(X, Y) :-
tio(Y, X).

sobrina(X, Y) :-
tia(Y, X).

primos(X, Y) :-
padre(Z, X),
padre(A, Y),
hermano(Z, A).

primos(X, Y) :-
madre(Z, X),
madre(A, Y),
hermana(Z, A).

%consultas de validación
% ¿Quién es el abuelo paterno de Bart?
% ?- abuelo_paterno(X, bart).
% X = Abraham
% ¿Quiénes son los hermanos de Lisa?
% ?- hermano(lisa, X).
% X= Bart
% X= Maggie
% ¿Quién es la abuela materna de Maggie?
% ?- abuela materna(X, maggie).
% X = Jacqueline
% ¿Quiénes son los tíos de Bart?
% ?- tio(X, bart).
% X= Herbert
% ¿Quiénes son los primos de Ling?
% ?- primos(X, ling).
% X= Bart
% X= Maggie
% X= Lisa