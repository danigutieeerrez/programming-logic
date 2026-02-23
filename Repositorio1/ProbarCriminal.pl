%Hechos
es_estadounidense(west).
es_enemigo_de(corea_sur, usa).
le_vendio_armas_a(west, corea_sur).
%Regla
es_criminal(X) :-
es_estadounidense(X),
es_enemigo_de(Y, usa),
le_vendio_armas_a(X, Y).