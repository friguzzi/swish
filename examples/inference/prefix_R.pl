/*
Prefix parser for probabilistic context free grammars.
The program computes the probability that a string is 
a prefix of a string generated by the grammar. 
From 
T. Sato, P. Meyer, Tabling for infinite probability computation, in: 
International Conference on Logic Programming, Vol. 17 of LIPIcs, 2012, 
pp.  348-358.
T. Sato, P. Meyer, Infinite probability computation by cyclic explanation
graphs, Theory and Practice of Logic Programming 14 (2014) 909-937.
doi:10.1017/S1471068413000562.
*/

:- use_module(library(mcintyre)).
:- use_module(library(cplint_r)).

:- mc.

:- begin_lpad.
% grammar
% 0.4:S->SS
% 0.3:S->a
% 0.3:S->b
pre_pcfg(L):- pre_pcfg(['S'],[],_Der,L,[]).

pre_pcfg([A|_R],Der0,Der,L0,[]):-
  rule(A,Der0,RHS),      % A is a non terminal
  pre_pcfg(RHS,[rule(A,RHS)|Der0],Der,L0,[]). % pseudo success, R is discarded

pre_pcfg([A|R],Der0,Der,L0,L2):-
  rule(A,Der0,RHS),      % rule A->RHS is selected
  pre_pcfg(RHS,[rule(A,RHS)|Der0],Der1,L0,L1), % recursion
  pre_pcfg(R,Der1,Der,L1,L2).   % recursion

pre_pcfg([A|R],Der0,Der,[A|L1],L2):-
  \+ rule(A,_,_),     % A is a terminal, consume A
  pre_pcfg(R,Der0,Der,L1,L2).

pre_pcfg([],Der,Der,L,L).      % termination

rule('S',Der,['S','S']):0.4; rule('S',Der,[a]):0.3; 
  rule('S',Der,[b]):0.3.



:- end_lpad.


/** <examples>

?- mc_prob(pre_pcfg([a]),P).
% expected result ~ 0.5.

?- mc_prob(pre_pcfg([a,b]),P).
% expected result ~ 0.09692857142857143.

?- mc_prob(pre_pcfg([b]),P).
% expected result ~ 0.49946153846153846.

?- mc_prob(pre_pcfg([a,b,a]),P).
% expected result ~ 0.0302.

?- mc_prob(pre_pcfg([b,a]),P).
% expected result ~ 0.1014.

?- mc_prob(pre_pcfg([b,a]),P),bar_r(P).
% expected result ~ 0.1014.

?- mc_sample(pre_pcfg([b,a]),1000,P,[successes(T),failures(F)]).
% expected result ~ 0.1014.

?- mc_sample(pre_pcfg([b,a]),1000,P),bar_r(P).
% expected result ~ 0.1014.


*/
 
