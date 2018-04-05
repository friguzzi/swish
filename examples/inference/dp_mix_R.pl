/*
Mixture model from a Dirichlet process (DP), see http://www.robots.ox.ac.uk/~fwood/anglican/examples/viewer/?worksheet=nonparametrics/dp-mixture-model
https://en.wikipedia.org/wiki/Dirichlet_process
Samples are drawn from a mixture of normal distributions whose parameters are
defined by means of a Dirichlet process, so the number of components is not
fixed in advance. For each component, the variance is sampled from a gamma
disrtibution and the mean is sampled from a Guassian with mean 0 and variance
30 times the variance of the compoment.
Given some observations, the aim is to find how the distribution of values is
updated. Less observations are considered with respect to http://www.robots.ox.ac.uk/~fwood/anglican/examples/viewer/?worksheet=nonparametrics/dp-mixture-model
because the weights go rapidly to 0.
*/
/** <examples>
?- dens(200).
% draw the prior and posterior densities
?- prior(200).
% draw the prior density
?- post(200).
% draw the posterior density
?- post_exp(200).
% draw the posterior density using the exponential function.

*/
 :- use_module(library(mcintyre)).
 :- use_module(library(cplint_r)).
:- mc.
:- begin_lpad.

dp_n_values(N,N,_Alpha,[]):-!.

dp_n_values(N0,N,Alpha,[[V]-1|Vs]):-
  N0<N,
  dp_value(N0,Alpha,V),
  N1 is N0+1,
  dp_n_values(N1,N,Alpha,Vs).
  
dp_value(NV,Alpha,V):-
  dp_stick_index(NV,Alpha,I),
  dp_pick_value(I,NV,V).

dp_pick_value(I,NV,V):-
  ivar(I,IV),
  Var is 1.0/IV,
  mean(I,Var,M),
  value(NV,M,Var,V).

ivar(_,IV):gamma(IV,1,0.1).

mean(_,V0,M):gaussian(M,0,V):-V is V0*30.

value(_,M,V,Val):gaussian(Val,M,V).

dp_stick_index(NV,Alpha,I):-
  dp_stick_index(1,NV,Alpha,I).

dp_stick_index(N,NV,Alpha,V):-
  stick_proportion(N,Alpha,P),
  choose_prop(N,NV,Alpha,P,V).
  
choose_prop(N,NV,_Alpha,P,N):-
  pick_portion(N,NV,P).

choose_prop(N,NV,Alpha,P,V):-
  neg_pick_portion(N,NV,P),
  N1 is N+1,
  dp_stick_index(N1,NV,Alpha,V).
 


stick_proportion(_,Alpha,P):beta(P,1,Alpha).

pick_portion(N,NV,P):P;neg_pick_portion(N,NV,P):1-P.

:- end_lpad.

dens(Samples):-
  mc_sample_arg_first(dp_n_values(0,Samples,10.0,V),1,V,L),
  L=[Vs-_],
  obs(O),
  maplist(to_val,O,O1),
  length(O1,N),
  mc_lw_sample_arg(dp_value(0,10.0,T),dp_n_values(0,N,10.0,O1),Samples,T,LP),
  densities_r(Vs,LP).

obs([-1,7,3]).

prior(Samples):-
  mc_sample_arg_first(dp_n_values(0,Samples,10.0,V),1,V,L),
  L=[Vs-_],
  density_r(Vs).

post(Samples):-
  obs(O),
  maplist(to_val,O,O1),
  length(O1,N),
  mc_lw_sample_arg(dp_value(0,10.0,T),dp_n_values(0,N,10.0,O1),Samples,T,L),
  density_r(L).

post_exp(Samples):-
  obs(O),
  maplist(to_val,O,O1),
  length(O1,N),
  mc_lw_sample_arg_log(dp_value(0,10.0,T),dp_n_values(0,N,10.0,O1),Samples,T,L),
  maplist(keys,L,LW),
  max_list(LW,Max),
  maplist(exp(Max),L,L1),
  density_r(L1).


keys(_-W,W).

exp(Min,L-W,L-W1):- W1 is exp(W-Min).

to_val(V,[V]-1).


