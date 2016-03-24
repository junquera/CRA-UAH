% Ver si esto nos puede servir: http://blog.ivank.net/prolog-matrices.html

/* N <- Ancho; M <- Alto; B <- Bombas */
genera_tablero_oculto(N, M, B, Tablero_oculto):-
    D is N * M, genera_tablero(D, Tablero),
    set_bombs(Tablero, D, B, Tablero_oculto),
    imprime_tablero(Tablero_oculto, N).

imprime_tablero(T,N):- imprime_tablero_aux(T, N, 0, 0).
imprime_tablero_aux([],_,_,_).
% I <- Iteración
imprime_tablero_aux([H|T],N, I, 0) :-
    nl, write(H), succ(I, I1), R is I1 mod N,
    imprime_tablero_aux(T, N, I1, R).
imprime_tablero_aux([H|T],N,I,_) :-
    write(H), succ(I, I1), R is I1 mod N,
    imprime_tablero_aux(T, N, I1, R).

quita_cabeza([_|Z], Z).

genera_tablero(D, Tablero):-
    genera_tablero_aux(D, [], Tablero).

genera_tablero_aux(0,Z,Z).
genera_tablero_aux(N, Z, Tablero):-
    N1 is N-1,
    genera_tablero_aux(N1, [0 | Z], Tablero).

set_bombs(T, D, B, TB):-
    set_bombs_aux(T, D, B, 0, TB).
set_bombs_aux(T, _, B, B, T).
set_bombs_aux(T, D, B, B0, TB):-
    random(0, D, X),
    set_bomb(T, X, T1),
    cuenta_bombas(T1, B1),
    set_bombs_aux(T1, D, B, B1, TB).

cuenta_bombas([], 0).
cuenta_bombas([0|T], B):-
    cuenta_bombas(T, B).
cuenta_bombas([1|T], B):-
    cuenta_bombas(T, B1),
    succ(B1, B).

set_bomb([_|T], 0, [1|T]).
% P <- Posición
set_bomb([H|T], P, Result):-
    P1 is P - 1,
    set_bomb(T, P1, Result1),
    Result = [H|Result1].
