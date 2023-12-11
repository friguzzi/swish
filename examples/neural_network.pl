/*
This program computes the output of a 3-layer neural network.



*/
/** <examples>
?- nn_out(O).
*/
:-use_module(library(matrix)).


logistic(X,Sigma_X):-
    Sigma_X is 1/(1+exp(-X)).

soft_max_vec(X,SM):-
    foldl(sum_exp,X,0,Det),
    maplist(soft_max(Det),X,SM).

soft_max(Det,X,SM):-
    SM is exp(X)/Det.
    
sum_exp(X,S0,S):-
    S is S0+exp(X).

% weights for the 3 layers: neurons 3-4-4-3
w_1([[2,-1,1,4],[-1,2,-3,1],[3,-2,-1,5]]). 
w_2([[3,1,-2,1],[-2,4,1,-4],[-1,-3,2,-5],[3,1,1,1]]).
w_3([[-1,3,-2],[1,-1,-3],[3,-2,2],[1,2,1]]).

% training set: input matrix, 3 inputs, 7 examples
x_mat_in([[0.5,0.8,0.2],[0.1,0.9,0.6],[0.2,0.2,0.3],
          [0.6,0.1,0.9],[0.5,0.5,0.4],[0.9,0.1,0.9],[0.1,0.8,0.7]]).

% neural network output
nn_out(O):-
    x_mat_in(X_mat_in),
    w_1(W_1),
    w_2(W_2),
    w_3(W_3),
    matrix_multiply(X_mat_in,W_1,Z_1),
    maplist(maplist(logistic),Z_1,A_1),
    writeln(Z_1),
    writeln(A_1),
    matrix_multiply(A_1,W_2,Z_2),
    maplist(maplist(logistic),Z_2,A_2),
    writeln(Z_2),
    writeln(A_2),
    matrix_multiply(A_2,W_3,Z_3),
    writeln(Z_3),
    maplist(soft_max_vec,Z_3,O).
    

