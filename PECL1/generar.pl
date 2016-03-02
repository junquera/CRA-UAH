% generar_tablero_oculto(N, M, Bombas, Tablero_oculto).

genera_tablero_oculto(N, M, Bombas, Tablero_oculto):- genera_tablero(N, M, Tablero), coloca_bombas(Bombas, Tablero, Tablero_oculto).

coloca_bombas(Bombas, Z, Tablero_bombas):- coloca_bombaux(Bombas, Z, [], Tablero_bombas).
coloca_bombaux(0, Z, Zaux, Tablero_bombas):-append(Zaux, Z, Tablero_bombas).
coloca_bombaux(Bombas, Z, Zaux, Tablero_bombas):-B1 is Bombas - 1, quita_cabeza(Z, Z1), coloca_bombaux(B1, Z1, [ 1 | Zaux], Tablero_bombas).
quita_cabeza([_|Z], Z).

imprime(tamanoFila, Tablero_oculto).

genera_tablero(N, M, Tablero):- Dim is N * M,
                                genera_tablero_aux(Dim, [], Tablero).
genera_tablero_aux(0,Z,Z).
genera_tablero_aux(N, Z, Tablero):- N1 is N-1,
                                    genera_tablero_aux(N1, [0 | Z], Tablero).
