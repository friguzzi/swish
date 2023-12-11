/*
This program performs logistic regression using Iteratively reweighted least squares (IRLS)
(see https://en.wikipedia.org/wiki/Logistic_regression
Murphy, Kevin P. (2012). Machine Learning – A Probabilistic Perspective. The MIT Press)

It also includes predicate generate_data(N,Variance,Coeff,X,Y)
that generates an N-row dataset with predictor variables in matrix X
and predicted variable in list Y.
The predicted variable is computed with the formula
Y=(Coeff dotprod X+Noise>0->1;0)

Variance is the variance of Noise

Predicate example_log_r(N,Coeff) is used to test the algorithm for logistic regression and
dataset generation: it generates a N-row dataset with 5 as the noise variance and
coefficients [1,2,3].
Then it performs 10 iterations of logistic regression
Coeff is the output of regression and should be a list of three numbers close to [1,2,3]
The higher N is, the closer to C*[1,2,3] Coeff should be, where C is a constant.

*/


:-use_module(library(matrix)).
:-use_module(library(mcintyre)).
:-use_module(library(clpfd)).

/** <examples>
?- example_log_r(100,Coeff).
it should return [1,2,3]

*/

:- mc.

:- begin_lpad.

noise(_,Epsilon,Variance):gaussian(Epsilon,0,Variance).

x(_,_,X_ij):gaussian(X_ij,0,10).

:-end_lpad.




example_log_r(N,CoeffNorm):-
    generate_data(N,5,[1,2,3],X,Y),
	logistic_regression(X,Y,10,Coeff),
    draw_dataset(X,Y,Coeff),
    Coeff=[C|_],
    maplist(norm(C),Coeff,CoeffNorm).

norm(C,A,AN):-
    AN is A/C.

draw_dataset(X,Y,Coeff):-
    <-library(plot3D),
    transpose(X,XT),
    XT=[X1,X2|_],
    filter_pos(X1,Y,X1P),
    filter_pos(X2,Y,X2P),
    filter_neg(X1,Y,X1N),
    filter_neg(X2,Y,X2N),
    XPV=..[c|X1P],
    xp<-XPV,
    YPV=..[c|X2P],
    yp<-YPV,
    XNV=..[c|X1N],
    xn<-XNV,
    YNV=..[c|X2N],
    yn<-YNV,
    numlist(-10,10,L),
    LV=..[c|L],
    xs<-LV,
    generate_line(L,Coeff,YS),
    YSV=..[c|YS],
    ys<-YSV,
    generate_line(L,[1,2,3],YT),
    YTV=..[c|YT],
    yt<-YTV,
    <- {|r||plot(xp,yp,pch="+",xlim=c(-10,10), ylim=c(-10,10),xlab="x1",ylab="x2")
            points(xn,yn,pch="-",xlim=c(-10,10), ylim=c(-10,10))
            lines(xs,ys)
            lines(xs,yt,col="red")
            legend(x= -10, y=10, legend=c("Predicted", "True"),col=c("black", "red"),
              lty=1, cex=0.8)|}.

generate_line(L,Coeff,Y):-
    maplist(lin(Coeff),L,Y).

lin([A,B,C],X,Y):-
	Y is -A/B*X-C/B.

filter_pos([],[],[]).

filter_pos([X|TX],[1|TY],[X|TXO]):-!,
    filter_pos(TX,TY,TXO).

filter_pos([_|TX],[_|TY],TXO):-
    filter_pos(TX,TY,TXO).

filter_neg([],[],[]).

filter_neg([X|TX],[0|TY],[X|TXO]):-!,
    filter_neg(TX,TY,TXO).

filter_neg([_|TX],[_|TY],TXO):-!,
    filter_neg(TX,TY,TXO).


neg(0).
%%  logistic_regression(+X,+Y,+It,-Coeff) is det.
% perform It iterations of logistic regression on data X,Y and return the coefficients in Coeff
% X is a matrix with one row per example and one entry per predictor variable except for
% the last one that should always be 1 (used for the intercept).
% Y is a vector with one element per example encoding the class (0 or 1)
% So X is
% [[x_1(1),x_2(1),...,1],
%  [x_1(2),x_2(2),...,1],
%  ...
%  [x_1(N),x_2(N),...,1]]
% and Y is
% Y=[y(1),y(2),...,y(N)]
%
logistic_regression(X,Y,Iterations,Coeff):-
    transpose(X,XT),
    X=[Row1|_],
    length(Row1,N),
    list0(N,Coeff0),
    logistic_regression_iter(0,Iterations,X,XT,Y,Coeff0,Coeff).


logistic_regression_iter(Iterations,Iterations,_X,_XT,_Y,Coeff,Coeff):-!.

logistic_regression_iter(I,Iterations,X,XT,Y,Coeff0,Coeff):-
    generate_nu(X,Coeff0,Nu),
    maplist(logistic,Nu,Mu),
    generate_s(Mu,S_vec),
    generate_zs(Nu,Y,Mu,S_vec,ZS),
    matrix_diagonal(S_vec,S),
    matrix_multiply(XT,S,XTS),
    matrix_multiply(XTS,X,XTSX),
    matrix_inversion(XTSX,XTSX_1),
    matrix_multiply(XTSX_1,XT,XTSX_1XT),
    transpose([ZS],ZST),
    matrix_multiply(XTSX_1XT,ZST,Coeff1T),
    transpose(Coeff1T,[Coeff1]),
    compute_log_lik(Mu,Y,LL),
    compute_accuracy(Mu,Y,Acc),
    I1 is I+1,
    format("Iteration ~d, log likelihood ~7f, accuracy ~5f~n",[I1,LL,Acc]), 
	logistic_regression_iter(I1,Iterations,X,XT,Y,Coeff1,Coeff).

compute_accuracy(Mu,Y,Acc):-
    foldl(correct,Mu,Y,0,Correct),
    length(Y,N),
    Acc is Correct/N.

correct(Mu,Y,C0,C):-
    (Mu>0.5->  
    	(Y=1->  
        	C is C0+1
        ;   
        	C is C0
        )
    ;   
    	(Y=0->
        	C is C0+1
        ;   
        	C is C0
        )
	).        

compute_log_lik(Mu,Y,LL):-
    foldl(log_lik,Mu,Y,0,LL).

log_lik(Mu,Y,LL0,LL):-
    (Y=1->
    	LL is LL0+log(Mu)
    ;   
    	LL is LL0+log(1-Mu)
    ).
    
generate_nu(X,W,Mu):-
    maplist(gen_nu_i(W),X,Mu).

gen_nu_i(W,X_i,Nu_i):-
	foldl(prod,W,X_i,0,Nu_i).

generate_s(Mu,S_vec):-
    maplist(mu_1_mu,Mu,S_vec).

mu_1_mu(Mu_i,S_i):-
    S_i is Mu_i*(1-Mu_i).

generate_zs(Nu,Y,Mu,S_vec,Z):-
    maplist(gen_xs,Nu,Y,Mu,S_vec,Z).

maplist(Goal, List1, List2, List3, List4, List5) :-
    maplist_(List1, List2, List3, List4, List5, Goal).

maplist_([], [], [], [], [], _).
maplist_([Elem1|Tail1], [Elem2|Tail2], [Elem3|Tail3], [Elem4|Tail4], [Elem5|Tail5], Goal) :-
    call(Goal, Elem1, Elem2, Elem3, Elem4, Elem5),
    maplist_(Tail1, Tail2, Tail3, Tail4, Tail5, Goal).

gen_xs(Nu,Y,Mu,S,ZS):-
    ZS is S*Nu +(Y-Mu).

logistic(X,Sigma_X):-
    Sigma_X is 1/(1+exp(-X)).

% generates data
% Variance is the noise variance
% Coeff is a list of coefficients for the predictor variables
% the last element of Coeff is the y-intercept (fixed term)
% the number of predictors is |Coeff|-1
% each predictor is sampled from Gauss(0,10)
generate_data(N,Variance,Coeff,X,Y):-
    numlist(1,N,Indexes),
    maplist(linear_funct(Variance,Coeff),Indexes,X,Y).

% computes Y_I=X_I dotprod Coeff + Noise
% Noise is Epsilon
linear_funct(Variance,Coeff,I,X_I,Y_I):-
    sample_noise(I,Variance,Epsilon),
    length(Coeff,N_predictors_1),
    N_predictors is N_predictors_1-1,
    numlist(1,N_predictors,Predictors_Indexes),
    maplist(sample_data(I),Predictors_Indexes,X_Ip),
	append(X_Ip,[1],X_I),
    foldl(prod,Coeff,X_I,0,Y_I_0),
    Y_I_R is Y_I_0+Epsilon,
    (Y_I_R>0->
     	Y_I=1
   	;   
    	Y_I=0
    ).

prod(A,X,Y0,Y):-
    Y is Y0+ A*X.


sample_noise(I,Variance,Epsilon):-
    mc_sample_arg_raw(noise(I,Noise,Variance),1,Noise,Sample),
    Sample=[Epsilon].

sample_data(I,J,X_IJ):-
    mc_sample_arg_raw(x(I,J,X),1,X,Sample),
    Sample=[X_IJ].