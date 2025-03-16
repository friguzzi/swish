/* Sample example for performing inference with LIFTCOVER. 
The program is inspired from UWCSE dataset from Kok S, Domingos P (2005) 
Learning the structure of Markov Logic Networks. In:
Proceedings of the 22nd international conference on Machine learning, ACM, pp
441-448


      Arnaud Nguembang Fadja and Fabrizio Riguzzi. 
*/


/** <examples>
?- prob_lift(advisedby(ai,harry, ben),Prob).  % Prob contains the probability that harry is advised by ben in the ai interpretation
*/


:- use_module(library(liftcover)).
:- if(current_predicate(use_rendering/1)).
:- use_rendering(c3).
:- use_rendering(lpad).
:- endif.

:- lift.


  
bg([]).

:- begin_in.
advisedby(A,B):0.3:-
    student(A),
    professor(B),
    project(A,C),
    project(A,C),
    publication(P, A, C),
    publication(P, B, C).
advisedby(A,B):0.6 :-
    student(A),
    professor(B),
    ta(C,A),
    taughtby(C, B).
:- end_in.


fold(ai, [ai]).

output(advisedby/2).


input(student/1).
input(professor/1).
input(project/2).
input(publication/3).
input(taughtby/2).
input(ta/2).



% data in the keys format
advisedby(ai, harry, ben).
student(ai, harry).
professor(ai, ben).

taughtby(ai, c1, ben).
taughtby(ai, c2, ben).
ta(ai, c1, harry). 
ta(ai, c2, harry).

project(ai, harry, pr1). 
project(ai, harry, pr2).
project(ai, ben, pr1). 
project(ai, ben, pr2).
publication(ai, p1, harry, pr1).
publication(ai, p2, harry, pr1).
publication(ai, p3, harry, pr2).
publication(ai, p4, harry, pr2).
publication(ai, p1, ben, pr1).
publication(ai, p2, ben, pr1).
publication(ai, p3, ben, pr2). 
publication(ai, p4, ben, pr2).
