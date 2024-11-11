% Q1
belongs(X, [X|_]). % Base case: X is the first element.
belongs(X, [_|T]) :- belongs(X, T). % Recursive case: search the rest of the list.

% Q2
belongs_with_message(X, [X|_]) :- write("Found it!"). % Base case with message.
belongs_with_message(X, [_|T]) :- belongs_with_message(X, T). % Recursive case.

% Q3
last_element(X, [X]) :- write("Last element confirmed."). % Base case: one element left.
last_element(X, [_|T]) :- last_element(X, T). % Recursive case.

% Q4
is_penultimate(X, [X, _]) :- !. % Base case: X is the second-to-last element.
is_penultimate(X, [_|T]) :- is_penultimate(X, T). % Recursive case.

% Q5
remove_the_kth(1, [_|Tail], Tail). % Base case: remove the first element.
remove_the_kth(K, [H|T], [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    remove_the_kth(K1, T, R). % Recursive case: decrement K and proceed.

% Q6
list_length([], 0). % Base case: empty list has length 0.
list_length([_|T], N) :- 
    list_length(T, N1), 
    N is N1 + 1. % Recursive case: increment count.

% Q7
even([]). % Base case: empty list is considered even.
even([X|T]) :- 
    X mod 2 =:= 0, 
    even(T). % Recursive case: check the next element.

% Q8
concat_list([], L2, L2). % Base case: concatenating with an empty list.
concat_list([X|L1], L2, [X|L3]) :- 
    concat_list(L1, L2, L3). % Recursive case: add the head of L1 to the result.

% Q9
palindrome([]) :- write("Empty list is a palindrome."). % Special case for an empty list.
palindrome(L) :- 
    reverse(L, L), 
    write("The list is a palindrome."). % Check if the reversed list is the same as the original.
