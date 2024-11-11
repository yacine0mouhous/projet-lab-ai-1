% Q1
belongs(X, [X|_]).
belongs(X, [_|T]) :- belongs(X, T).

% Q2
belongs_with_message(X, [X|_]) :- write("Found it!").
belongs_with_message(X, [_|T]) :- belongs_with_message(X, T).

% Q3
last_element(X, [X]) :- write("Last element confirmed.").
last_element(X, [_|T]) :- last_element(X, T).

% Q4
is_penultimate(X, [X, _]) :- !.
is_penultimate(X, [_|T]) :- is_penultimate(X, T).

% Q5
remove_the_kth(1, [_|Tail], Tail).
remove_the_kth(K, [H|T], [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    remove_the_kth(K1, T, R).

% Q6
list_length([], 0).
list_length([_|T], N) :- 
    list_length(T, N1), 
    N is N1 + 1.

% Q7
even([]).
even([X|T]) :- 
    X mod 2 =:= 0, 
    even(T).

% Q8
concat_list([], L2, L2).
concat_list([X|L1], L2, [X|L3]) :- 
    concat_list(L1, L2, L3).

% Q9
palindrome([]) :- write("Empty list is a palindrome.").
palindrome(L) :- 
    reverse(L, L), 
    write("The list is a palindrome.").
