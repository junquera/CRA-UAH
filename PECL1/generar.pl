% Ver si esto nos puede servir: http://blog.ivank.net/prolog-matrices.html

/* N <- Ancho; M <- Alto; B <- Bombas */
genera_tablero_oculto(N, M, B, Tablero_oculto):-
    genera_tablero(N, M, Tablero), imprime_tablero(Tablero, N).

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

genera_tablero(N, M, Tablero):-
    Dim is N * M,
    genera_tablero_aux(Dim, [], Tablero).

genera_tablero_aux(0,Z,Z).
genera_tablero_aux(N, Z, Tablero):-
    N1 is N-1,
    genera_tablero_aux(N1, [0 | Z], Tablero).

set_bombs().
set_bomb([_|T], 0, [1|T]).
set_bomb([H|T], P, Result):-
    P1 is P - 1,
    set_bomb(T, P1, Result1),
    Result = [H|Result1].
