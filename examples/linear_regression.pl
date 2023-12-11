/*
This program performs linear regression using the Moore–Penrose pseudoinverse
(see https://en.wikipedia.org/wiki/Bayesian_linear_regression )

It also includes predicate generate_data(N,Variance,Coeff,X,Y)
that generates an N-row dataset with predictor variables in matrix X
and predicted variable in list Y.
The predicted variable is computed with the formula
Y=Coeff dotprod X+Noise

Variance is the variance of Noise

Predicate example_lr(N,Coeff) is used to test the algorithm for linear regression and
dataset generation: it generates a N-row dataset with 5 as the noise variance and
coefficients [1,2,3].
Coeff is the output of regression and should be a list of three numbers close to [1,2,3]
The higher N is, the closer to [1,2,3] Coeff should be

*/


:-use_module(library(matrix)).
:-use_module(library(mcintyre)).
:-use_module(library(clpfd)).

/** <examples>
?- example_lr(100,Coeff).
it should return [1,2,3]

*/

:- mc.

:- begin_lpad.

noise(_,Epsilon,Variance):gaussian(Epsilon,0,Variance).

x(_,_,X_ij):gaussian(X_ij,0,10).

:-end_lpad.




example_lr(N,Coeff):-
    generate_data(N,5,[1,2,3],X,Y),
	linear_regression(X,Y,Coeff),
    draw_dataset(X,Y,Coeff).

draw_dataset(X,Y,Coeff):-
    <-library(plot3D),
    transpose(X,XT),
    XT=[X1,X2|_],
    XV=..[c|X1],
    x<-XV,
    YV=..[c|X2],
    y<-YV,
    ZV=..[c|Y],
    z<-ZV,
    numlist(-10,10,L),
    LV=..[c|L],
    xm<-LV,
    ym<-LV,
    m<-mesh(xm,ym),
    xs<-m$x,
    ys<-m$y,
    generate_plane(L,Coeff,Z),
    ZSV=..[c|Z],
    generate_plane(L,[1,2,3],ZT),
    ZTV=..[c|ZT],
    zs<-matrix(ZSV,ncol=21, byrow='TRUE'),
    zt<-matrix(ZTV,ncol=21, byrow='TRUE'),
    <- {|r||scatter3D(x,y,z,xlab="x1",ylab="x2",zlab="y",xlim=c(-10,10), ylim=c(-10,10), zlim=c(-10,10),
                bty="b2", clim = range(zs),col="black")
 	        surf3D(xs, ys, zs, xlim=c(-10,10), ylim=c(-10,10), zlim=c(-10,10),
            bty = "b2", border = "gray",add = TRUE, clim = range(zs), alpha=0.9)|}.
% true plane
%            surf3D(xs, ys, zt, xlim=c(-10,10), ylim=c(-10,10), zlim=c(-10,10), col="gray",
%     bty = "b2", border = "black",add = TRUE, clim = range(zs), alpha=1.0)|}.

generate_plane(L,Coeff,Z):-
    findall(V,(member(X,L),member(Y,L),lin_fun(X,Y,Coeff,V)),Z).
        
lin_fun(X,Y,[A,B,C],V):-
    V is A*X+B*Y+C.
%%  linear_regression(+X,+Y,-Coeff) is det.
% perform linear regression on data X,Y and return the coefficients in Coeff
% X is a matrix with one row per example and one entry per predictor variable except for
% the last one that should always be 1 (used for the intercept).
% Y is a vector with one element per example encoding the predicted variable
% So X is
% [[x_1(1),x_2(1),...,1],
%  [x_1(2),x_2(2),...,1],
%  ...
%  [x_1(N),x_2(N),...,1]]
% and Y is
% Y=[y(1),y(2),...,y(N)]
%
linear_regression(X,Y,Coeff):-
    transpose(X,XT),
    matrix_multiply(XT,X,XTX),
    matrix_inversion(XTX,XTX_1),
    matrix_multiply(XTX_1,XT,XTX_1XT),
    transpose([Y],YT),
    matrix_multiply(XTX_1XT,YT,CoeffT),
    transpose(CoeffT,[Coeff]).



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
    Y_I is Y_I_0+Epsilon.

prod(A,X,Y0,Y):-
    Y is Y0+ A*X.


sample_noise(I,Variance,Epsilon):-
    mc_sample_arg_raw(noise(I,Noise,Variance),1,Noise,Sample),
    Sample=[Epsilon].

sample_data(I,J,X_IJ):-
    mc_sample_arg_raw(x(I,J,X),1,X,Sample),
    Sample=[X_IJ].