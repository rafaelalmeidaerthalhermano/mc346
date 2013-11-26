%
% Conjectura de Goldbach
%
% Rafael Almeida Erthal Hermano - 121286
% MC346 - Paradigmas de Programação
% Lab 3 de Prolog
%
divisible(X,Y):- Y * Y =< X, X mod Y =:= 0, !.
divisible(X,Y):- Y < X, K is Y + 1, divisible(X, K), !.
is_prime(1).
is_prime(X):- X > 1, not(divisible(X,2)).

odd_goldbach(_, [L1, L2, L3], [L1, L2, L3]):- is_prime(L1), is_prime(L2), is_prime(L3), !.
odd_goldbach(E, [L1, L2], L):-
    L3 is E - L1 - L2,
    odd_goldbach(E, [L1, L2, L3], L), !.
odd_goldbach(E, [L1, Y], L):-
    L2 is Y + 2,
    odd_goldbach(E, [L1, L2], L), !.
odd_goldbach(E, [L1], L):-
    odd_goldbach(E, [L1, L1], L), !.
odd_goldbach(E, [Y], L):-
    L1 is Y + 2,
    odd_goldbach(E, [L1], L), !.
odd_goldbach(E, L):-
    E mod 2 =:= 1,
    E >= 7,
    odd_goldbach(E, [1], L), !.
