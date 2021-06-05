/* Bongard dataset from
L. De Raedt and W. Van Laer. Inductive constraint logic. 
In Klaus P. Jantke, Takeshi Shinohara, and Thomas Zeugmann, editors, 
Proceedings of the Sixth International Workshop on Algorithmic
Learning Theory, volume 997 of Lecture Notes in Artificial Intelligence, 
pages 80-94. SpringerVerlag, 1995.

Downloaded from 
https://dtai.cs.kuleuven.be/static/ACE/doc/

     Arnaud Nguembang Fadja and Fabrizio Riguzzi. 
      Hierachical probabilistic logic programs
*/

/** <examples>
?- induce_hplp([train],P),test_hplp(P,[test],LL,AUCROC,ROC,AUCPR,PR). % learn the structure and the parameters and test the result
?- induce_hplp_par([train],P),test_hplp(P,[test],LL,AUCROC,ROC,AUCPR,PR). % learn the parameteters and test the result
?- inside(P),test_hplp(P,[test],LL,AUCROC,ROC,AUCPR,PR). % test the input theory
?- induce_hplp_par([all],P).
?- induce_hplp([all],P).
*/

:-use_module(library(phil)).
:- if(current_predicate(use_rendering/1)).
:- use_rendering(c3).
:- use_rendering(lpad).
:- endif.

:-phil.


:- set_hplp(neg_ex,given).
:- set_hplp(verbosity,1).
% Structure learning settings
:- set_hplp(megaex_bottom,10). % max number of mega examples to considered in the generation of bottoms clauses
:- set_hplp(initial_clauses_per_megaex,1).
:- set_hplp(rate,1.0). % defines the probabilityu for going from the first layer to the second layer
:- set_hplp(max_layer,-1). % Define the max number of layer: -1 for the maximum depth possible 
:- set_hplp(min_probability,0.00001).  % threshold value of the probability under which a clauses is dropped out

% Parameter learning settings
:- set_hplp(algorithmType,dphil). % parameter learning algorithm dphil or emphil
% Maximun iteration and other stop conditions.
:- set_hplp(maxIter_phil,1000).  
:- set_hplp(epsilon_deep,0.0001). 
:- set_hplp(epsilon_deep_fraction,0.00001).

% regularization parameters 
:- set_hplp(regularized,no). % yes to enable regularization and no otherwise 
:- set_hplp(regularizationType,0). % 1 for L1, 2 for L2 and 3 for L3. L3 available only for emphil. If set to 0 no regularization is done
:- set_hplp(gamma,10). % regularization strength
:- set_hplp(gammaCount,0). 

% Adam parameter for dphil algorithm
:- set_hplp(adam_params,[0.1,0.9,0.999,1e-8]). % adam(Eta,Beta1,Beta2,Epsilon_adam_hat)
% Gradient descent strategy and the corresponding batch size
:- set_hplp(batch_strategy,minibatch(50)).
%:- set_hplp(batch_strategy,stoch_minibatch(50)).
%:- set_hplp(batch_strategy,batch).



bg([]).


in([
(
  pos:0.197575 :-
  	circle(A),
	inside(B,A)),
(
  pos:0.000303421 :-
	circle(A),
	triangle(B)), 
(
pos:0.000448807 :-
	triangle(A),
	circle(B)
)]).


fold(train,[2,3,5,6,9,12,14,15,17,20,24,25,28,29,31,36,37,40,41,50,52,55,56,57,
  59,62,63,65,66,67,69,74,76,77,79,83,93,95,99,101,103,104,105,106,107,109,110,
  111,112,117,120,121,125,126,127,128,131,135,137,140,143,144,151,154,155,156,
  159,167,168,169,172,175,176,177,178,181,184,188,190,192,193,194,196,198,202,
  206,208,209,211,214,219,222,223,224,225,227,230,231,233,238,241,243,244,248,
  249,250,256,258,260,268,270,273,280,282,286,287,288,289,290,295,300,301,303,
  304,307,309,314,316,319,321,324,326,327,328,329,331,334,337,343,345,348,352,
  353,355,358,366,369,370,373,375,376,378,379,381,382,390,393,402,404,408,411,
  412,416,417,419,420,421,424,425,427,428,431,432,433,437,444,445,447,453,456,
  457,459,462,463,464,465,468,470,473,474,476,477,479,481,482,483,485,488,489]).

fold(test,
  [490,491,494,497,499,500,512,513,516,517,520,521,527,529,531,533,534,539,540,
  542,543,544,546,550,552,553,555,559,565,567,568,572,578,582,583,591,595,597,
  600,602,609,612,614,615,616,617,622,625,628,634,635,637,639,640,641,642,647,
  648,649,650,654,656,657,658,662,667,669,671,679,682,683,685,686,691,693,698,
  700,701,705,708,709,710,719,722,723,725,728,732,734,737,740,741,743,744,745,
  747,748,750,751,753,754,755,765,766,768,769,772,773,777,779,780,781,787,794,
  795,797,803,805,807,814,815,816,818,819,822,829,832,833,835,836,837,838,841,
  844,845,846,847,848,849,856,859,862,864,867,872,874,876,880,882,887,890,892,
  893,897,899,900,904,909,910,912,915,917,926,927,929,930,931,932,933,938,939,
  940,941,944,945,946,947,955,957,961,971,973,974,975,977,978,979,984,989,991,
  995,997,1000]).

fold(all,F):-
  fold(train,FTr),
  fold(test,FTe),
  append(FTr,FTe,F).


output(pos/0).

input(triangle/1).
input(square/1).
input(circle/1).
input(inside/2).
input(config/2).

determination(pos/0,triangle/1).
determination(pos/0,square/1).
determination(pos/0,circle/1).
determination(pos/0,inside/2).
determination(pos/0,config/2).

modeh(*,pos).
modeb(*,triangle(-obj)).
modeb(*,square(-obj)).
modeb(*,circle(-obj)).
modeb(*,inside(+obj,-obj)).
modeb(*,inside(-obj,+obj)).
modeb(*,config(+obj,-#dir)).

begin(model(2)).
pos.
triangle(o5).
config(o5,up).
square(o4).
inside(o4,o5).
circle(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(2)).

begin(model(3)).
neg(pos).
circle(o4).
circle(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(3)).

begin(model(5)).
neg(pos).
square(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(5)).

begin(model(6)).
pos.
triangle(o5).
config(o5,down).
triangle(o4).
config(o4,up).
inside(o4,o5).
circle(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(6)).

begin(model(9)).
pos.
circle(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,down).
square(o1).
inside(o1,o2).
end(model(9)).

begin(model(12)).
neg(pos).
triangle(o5).
config(o5,down).
square(o4).
inside(o4,o5).
circle(o3).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(12)).

begin(model(14)).
neg(pos).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(14)).

begin(model(15)).
neg(pos).
triangle(o4).
config(o4,down).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(15)).

begin(model(17)).
pos.
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(17)).

begin(model(20)).
pos.
triangle(o6).
config(o6,up).
triangle(o5).
config(o5,up).
inside(o5,o6).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(20)).

begin(model(24)).
pos.
triangle(o4).
config(o4,up).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(24)).

begin(model(25)).
neg(pos).
square(o2).
square(o1).
inside(o1,o2).
end(model(25)).

begin(model(28)).
neg(pos).
square(o5).
square(o4).
inside(o4,o5).
circle(o3).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(28)).

begin(model(29)).
neg(pos).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(29)).

begin(model(31)).
neg(pos).
circle(o4).
square(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(31)).

begin(model(36)).
neg(pos).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(36)).

begin(model(37)).
neg(pos).
square(o6).
circle(o5).
inside(o5,o6).
square(o4).
circle(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(37)).

begin(model(40)).
neg(pos).
circle(o4).
square(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(40)).

begin(model(41)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(41)).

begin(model(50)).
pos.
triangle(o6).
config(o6,up).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,down).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(50)).

begin(model(52)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(52)).

begin(model(55)).
neg(pos).
triangle(o2).
config(o2,down).
square(o1).
inside(o1,o2).
end(model(55)).

begin(model(56)).
neg(pos).
circle(o5).
circle(o4).
inside(o4,o5).
circle(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(56)).

begin(model(57)).
neg(pos).
circle(o4).
circle(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(57)).

begin(model(59)).
neg(pos).
square(o5).
triangle(o4).
config(o4,up).
inside(o4,o5).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(59)).

begin(model(62)).
pos.
triangle(o5).
config(o5,up).
triangle(o4).
config(o4,down).
inside(o4,o5).
triangle(o3).
config(o3,up).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(62)).

begin(model(63)).
neg(pos).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(63)).

begin(model(65)).
neg(pos).
circle(o6).
circle(o5).
inside(o5,o6).
circle(o4).
circle(o3).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(65)).

begin(model(66)).
neg(pos).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(66)).

begin(model(67)).
neg(pos).
circle(o4).
circle(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(67)).

begin(model(69)).
pos.
circle(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(69)).

begin(model(74)).
pos.
circle(o6).
triangle(o5).
config(o5,up).
inside(o5,o6).
triangle(o4).
config(o4,down).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(74)).

begin(model(76)).
pos.
square(o6).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,up).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(76)).

begin(model(77)).
neg(pos).
square(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
square(o1).
end(model(77)).

begin(model(79)).
pos.
triangle(o5).
config(o5,up).
triangle(o4).
config(o4,down).
inside(o4,o5).
triangle(o3).
config(o3,down).
triangle(o2).
config(o2,up).
inside(o2,o3).
square(o1).
end(model(79)).

begin(model(83)).
pos.
triangle(o3).
config(o3,up).
triangle(o2).
config(o2,down).
inside(o2,o3).
square(o1).
end(model(83)).

begin(model(93)).
neg(pos).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(93)).

begin(model(95)).
pos.
circle(o6).
square(o5).
inside(o5,o6).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(95)).

begin(model(99)).
neg(pos).
triangle(o4).
config(o4,down).
square(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(99)).

begin(model(101)).
neg(pos).
square(o6).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,down).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(101)).

begin(model(103)).
pos.
circle(o4).
square(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(103)).

begin(model(104)).
pos.
circle(o5).
triangle(o4).
config(o4,up).
inside(o4,o5).
circle(o3).
square(o2).
inside(o2,o3).
circle(o1).
end(model(104)).

begin(model(105)).
neg(pos).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(105)).

begin(model(106)).
pos.
triangle(o5).
config(o5,up).
triangle(o4).
config(o4,up).
inside(o4,o5).
circle(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(106)).

begin(model(107)).
pos.
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(107)).

begin(model(109)).
neg(pos).
square(o4).
circle(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(109)).

begin(model(110)).
neg(pos).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(110)).

begin(model(111)).
neg(pos).
square(o6).
circle(o5).
inside(o5,o6).
square(o4).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(111)).

begin(model(112)).
neg(pos).
square(o4).
circle(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(112)).

begin(model(117)).
neg(pos).
square(o2).
square(o1).
inside(o1,o2).
end(model(117)).

begin(model(120)).
pos.
circle(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(120)).

begin(model(121)).
neg(pos).
triangle(o3).
config(o3,down).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(121)).

begin(model(125)).
neg(pos).
circle(o4).
circle(o3).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(125)).

begin(model(126)).
neg(pos).
circle(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(126)).

begin(model(127)).
neg(pos).
triangle(o3).
config(o3,up).
square(o2).
inside(o2,o3).
square(o1).
end(model(127)).

begin(model(128)).
neg(pos).
circle(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(128)).

begin(model(131)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(131)).

begin(model(135)).
pos.
triangle(o5).
config(o5,down).
triangle(o4).
config(o4,up).
inside(o4,o5).
triangle(o3).
config(o3,down).
square(o2).
inside(o2,o3).
square(o1).
end(model(135)).

begin(model(137)).
neg(pos).
square(o6).
circle(o5).
inside(o5,o6).
circle(o4).
circle(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(137)).

begin(model(140)).
neg(pos).
square(o3).
triangle(o2).
config(o2,down).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(140)).

begin(model(143)).
neg(pos).
circle(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(143)).

begin(model(144)).
neg(pos).
triangle(o5).
config(o5,down).
circle(o4).
inside(o4,o5).
square(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(144)).

begin(model(151)).
neg(pos).
circle(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(151)).

begin(model(154)).
neg(pos).
circle(o4).
square(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(154)).

begin(model(155)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(155)).

begin(model(156)).
neg(pos).
square(o6).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,down).
square(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(156)).

begin(model(159)).
neg(pos).
triangle(o6).
config(o6,up).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,down).
square(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(159)).

begin(model(167)).
pos.
circle(o4).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(167)).

begin(model(168)).
pos.
triangle(o4).
config(o4,up).
triangle(o3).
config(o3,down).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(168)).

begin(model(169)).
neg(pos).
triangle(o6).
config(o6,up).
square(o5).
inside(o5,o6).
circle(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(169)).

begin(model(172)).
neg(pos).
square(o4).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(172)).

begin(model(175)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(175)).

begin(model(176)).
neg(pos).
circle(o5).
circle(o4).
inside(o4,o5).
circle(o3).
square(o2).
inside(o2,o3).
circle(o1).
end(model(176)).

begin(model(177)).
neg(pos).
circle(o4).
circle(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(177)).

begin(model(178)).
pos.
triangle(o4).
config(o4,up).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(178)).

begin(model(181)).
neg(pos).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(181)).

begin(model(184)).
neg(pos).
square(o2).
circle(o1).
inside(o1,o2).
end(model(184)).

begin(model(188)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(188)).

begin(model(190)).
neg(pos).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(190)).

begin(model(192)).
pos.
circle(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(192)).

begin(model(193)).
neg(pos).
triangle(o4).
config(o4,up).
circle(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(193)).

begin(model(194)).
neg(pos).
circle(o4).
square(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(194)).

begin(model(196)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(196)).

begin(model(198)).
pos.
triangle(o3).
config(o3,down).
triangle(o2).
config(o2,down).
inside(o2,o3).
square(o1).
end(model(198)).

begin(model(202)).
neg(pos).
circle(o5).
circle(o4).
inside(o4,o5).
square(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(202)).

begin(model(206)).
neg(pos).
circle(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(206)).

begin(model(208)).
neg(pos).
square(o4).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(208)).

begin(model(209)).
neg(pos).
square(o5).
square(o4).
inside(o4,o5).
circle(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(209)).

begin(model(211)).
pos.
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(211)).

begin(model(214)).
pos.
triangle(o5).
config(o5,down).
square(o4).
inside(o4,o5).
circle(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(214)).

begin(model(219)).
pos.
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(219)).

begin(model(222)).
pos.
triangle(o4).
config(o4,up).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(222)).

begin(model(223)).
pos.
circle(o6).
circle(o5).
inside(o5,o6).
circle(o4).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(223)).

begin(model(224)).
pos.
circle(o6).
square(o5).
inside(o5,o6).
square(o4).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(224)).

begin(model(225)).
pos.
circle(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(225)).

begin(model(227)).
pos.
circle(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
circle(o1).
end(model(227)).

begin(model(230)).
neg(pos).
square(o5).
square(o4).
inside(o4,o5).
square(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(230)).

begin(model(231)).
pos.
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(231)).

begin(model(233)).
neg(pos).
square(o2).
circle(o1).
inside(o1,o2).
end(model(233)).

begin(model(238)).
pos.
triangle(o5).
config(o5,up).
triangle(o4).
config(o4,down).
inside(o4,o5).
triangle(o3).
config(o3,down).
triangle(o2).
config(o2,up).
inside(o2,o3).
circle(o1).
end(model(238)).

begin(model(241)).
neg(pos).
triangle(o5).
config(o5,up).
circle(o4).
inside(o4,o5).
square(o3).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(241)).

begin(model(243)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(243)).

begin(model(244)).
pos.
square(o5).
square(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
triangle(o2).
config(o2,down).
inside(o2,o3).
square(o1).
end(model(244)).

begin(model(248)).
pos.
circle(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(248)).

begin(model(249)).
neg(pos).
circle(o5).
circle(o4).
inside(o4,o5).
square(o3).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(249)).

begin(model(250)).
neg(pos).
square(o6).
circle(o5).
inside(o5,o6).
circle(o4).
square(o3).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(250)).

begin(model(256)).
pos.
circle(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(256)).

begin(model(258)).
pos.
triangle(o4).
config(o4,up).
triangle(o3).
config(o3,down).
inside(o3,o4).
circle(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(258)).

begin(model(260)).
pos.
square(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(260)).

begin(model(268)).
neg(pos).
square(o5).
circle(o4).
inside(o4,o5).
circle(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(268)).

begin(model(270)).
pos.
circle(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(270)).

begin(model(273)).
neg(pos).
square(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(273)).

begin(model(280)).
neg(pos).
square(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(280)).

begin(model(282)).
pos.
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(282)).

begin(model(286)).
neg(pos).
triangle(o4).
config(o4,down).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
square(o1).
inside(o1,o2).
end(model(286)).

begin(model(287)).
neg(pos).
triangle(o4).
config(o4,up).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(287)).

begin(model(288)).
pos.
circle(o5).
triangle(o4).
config(o4,up).
inside(o4,o5).
circle(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(288)).

begin(model(289)).
neg(pos).
triangle(o6).
config(o6,up).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,up).
square(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(289)).

begin(model(290)).
neg(pos).
triangle(o5).
config(o5,down).
circle(o4).
inside(o4,o5).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
square(o1).
end(model(290)).

begin(model(295)).
pos.
circle(o6).
triangle(o5).
config(o5,down).
inside(o5,o6).
triangle(o4).
config(o4,down).
triangle(o3).
config(o3,down).
inside(o3,o4).
circle(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(295)).

begin(model(300)).
neg(pos).
square(o3).
triangle(o2).
config(o2,down).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(300)).

begin(model(301)).
neg(pos).
square(o6).
triangle(o5).
config(o5,up).
inside(o5,o6).
square(o4).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(301)).

begin(model(303)).
neg(pos).
circle(o3).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(303)).

begin(model(304)).
neg(pos).
square(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(304)).

begin(model(307)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(307)).

begin(model(309)).
neg(pos).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(309)).

begin(model(314)).
pos.
square(o5).
triangle(o4).
config(o4,down).
inside(o4,o5).
triangle(o3).
config(o3,down).
triangle(o2).
config(o2,down).
inside(o2,o3).
circle(o1).
end(model(314)).

begin(model(316)).
neg(pos).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(316)).

begin(model(319)).
pos.
triangle(o5).
config(o5,down).
triangle(o4).
config(o4,down).
inside(o4,o5).
square(o3).
square(o2).
inside(o2,o3).
circle(o1).
end(model(319)).

begin(model(321)).
neg(pos).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(321)).

begin(model(324)).
neg(pos).
square(o5).
square(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
square(o2).
inside(o2,o3).
square(o1).
end(model(324)).

begin(model(326)).
neg(pos).
square(o6).
circle(o5).
inside(o5,o6).
circle(o4).
square(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(326)).

begin(model(327)).
neg(pos).
square(o2).
circle(o1).
inside(o1,o2).
end(model(327)).

begin(model(328)).
neg(pos).
square(o2).
circle(o1).
inside(o1,o2).
end(model(328)).

begin(model(329)).
neg(pos).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
square(o1).
end(model(329)).

begin(model(331)).
pos.
triangle(o4).
config(o4,up).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(331)).

begin(model(334)).
neg(pos).
triangle(o4).
config(o4,up).
circle(o3).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(334)).

begin(model(337)).
neg(pos).
circle(o4).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
square(o1).
inside(o1,o2).
end(model(337)).

begin(model(343)).
pos.
triangle(o6).
config(o6,down).
triangle(o5).
config(o5,up).
inside(o5,o6).
square(o4).
square(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(343)).

begin(model(345)).
pos.
circle(o5).
triangle(o4).
config(o4,up).
inside(o4,o5).
circle(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
square(o1).
end(model(345)).

begin(model(348)).
neg(pos).
square(o4).
square(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(348)).

begin(model(352)).
neg(pos).
triangle(o6).
config(o6,down).
circle(o5).
inside(o5,o6).
triangle(o4).
config(o4,up).
circle(o3).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(352)).

begin(model(353)).
neg(pos).
square(o2).
square(o1).
inside(o1,o2).
end(model(353)).

begin(model(355)).
neg(pos).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(355)).

begin(model(358)).
pos.
circle(o6).
square(o5).
inside(o5,o6).
circle(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(358)).

begin(model(366)).
pos.
square(o6).
triangle(o5).
config(o5,down).
inside(o5,o6).
circle(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(366)).

begin(model(369)).
neg(pos).
triangle(o6).
config(o6,down).
circle(o5).
inside(o5,o6).
square(o4).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(369)).

begin(model(370)).
neg(pos).
circle(o6).
circle(o5).
inside(o5,o6).
square(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(370)).

begin(model(373)).
pos.
triangle(o3).
config(o3,up).
triangle(o2).
config(o2,down).
inside(o2,o3).
square(o1).
end(model(373)).

begin(model(375)).
pos.
triangle(o4).
config(o4,down).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(375)).

begin(model(376)).
neg(pos).
square(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(376)).

begin(model(378)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(378)).

begin(model(379)).
pos.
triangle(o3).
config(o3,up).
triangle(o2).
config(o2,up).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(379)).

begin(model(381)).
pos.
circle(o5).
square(o4).
inside(o4,o5).
square(o3).
triangle(o2).
config(o2,down).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(381)).

begin(model(382)).
pos.
circle(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(382)).

begin(model(390)).
pos.
triangle(o4).
config(o4,down).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(390)).

begin(model(393)).
neg(pos).
triangle(o3).
config(o3,up).
square(o2).
inside(o2,o3).
square(o1).
end(model(393)).

begin(model(402)).
pos.
triangle(o5).
config(o5,down).
square(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
triangle(o2).
config(o2,up).
inside(o2,o3).
circle(o1).
end(model(402)).

begin(model(404)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(404)).

begin(model(408)).
neg(pos).
square(o2).
square(o1).
inside(o1,o2).
end(model(408)).

begin(model(411)).
neg(pos).
circle(o5).
triangle(o4).
config(o4,down).
inside(o4,o5).
circle(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(411)).

begin(model(412)).
neg(pos).
circle(o6).
circle(o5).
inside(o5,o6).
square(o4).
circle(o3).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(412)).

begin(model(416)).
neg(pos).
circle(o4).
square(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(416)).

begin(model(417)).
neg(pos).
triangle(o6).
config(o6,up).
square(o5).
inside(o5,o6).
square(o4).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(417)).

begin(model(419)).
neg(pos).
square(o2).
circle(o1).
inside(o1,o2).
end(model(419)).

begin(model(420)).
pos.
triangle(o4).
config(o4,up).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(420)).

begin(model(421)).
neg(pos).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(421)).

begin(model(424)).
neg(pos).
square(o2).
circle(o1).
inside(o1,o2).
end(model(424)).

begin(model(425)).
neg(pos).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
square(o1).
end(model(425)).

begin(model(427)).
pos.
square(o6).
circle(o5).
inside(o5,o6).
square(o4).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(427)).

begin(model(428)).
pos.
circle(o4).
square(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(428)).

begin(model(431)).
neg(pos).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(431)).

begin(model(432)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(432)).

begin(model(433)).
pos.
triangle(o6).
config(o6,down).
square(o5).
inside(o5,o6).
circle(o4).
square(o3).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(433)).

begin(model(437)).
neg(pos).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(437)).

begin(model(444)).
neg(pos).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(444)).

begin(model(445)).
neg(pos).
square(o5).
triangle(o4).
config(o4,up).
inside(o4,o5).
triangle(o3).
config(o3,down).
square(o2).
inside(o2,o3).
square(o1).
end(model(445)).

begin(model(447)).
neg(pos).
square(o5).
square(o4).
inside(o4,o5).
square(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(447)).

begin(model(453)).
pos.
circle(o6).
triangle(o5).
config(o5,down).
inside(o5,o6).
triangle(o4).
config(o4,down).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(453)).

begin(model(456)).
pos.
triangle(o3).
config(o3,up).
triangle(o2).
config(o2,up).
inside(o2,o3).
square(o1).
end(model(456)).

begin(model(457)).
neg(pos).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(457)).

begin(model(459)).
pos.
triangle(o6).
config(o6,down).
triangle(o5).
config(o5,up).
inside(o5,o6).
circle(o4).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(459)).

begin(model(462)).
neg(pos).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(462)).

begin(model(463)).
pos.
square(o6).
triangle(o5).
config(o5,down).
inside(o5,o6).
square(o4).
square(o3).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(463)).

begin(model(464)).
pos.
triangle(o4).
config(o4,down).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(464)).

begin(model(465)).
pos.
triangle(o3).
config(o3,down).
triangle(o2).
config(o2,down).
inside(o2,o3).
square(o1).
end(model(465)).

begin(model(468)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(468)).

begin(model(470)).
neg(pos).
triangle(o4).
config(o4,down).
square(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(470)).

begin(model(473)).
neg(pos).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(473)).

begin(model(474)).
neg(pos).
triangle(o6).
config(o6,up).
square(o5).
inside(o5,o6).
square(o4).
circle(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(474)).

begin(model(476)).
neg(pos).
triangle(o5).
config(o5,down).
square(o4).
inside(o4,o5).
circle(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(476)).

begin(model(477)).
neg(pos).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(477)).

begin(model(479)).
pos.
circle(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(479)).

begin(model(481)).
neg(pos).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(481)).

begin(model(482)).
pos.
triangle(o4).
config(o4,up).
triangle(o3).
config(o3,up).
inside(o3,o4).
circle(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(482)).

begin(model(483)).
neg(pos).
circle(o4).
circle(o3).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(483)).

begin(model(485)).
neg(pos).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(485)).

begin(model(488)).
neg(pos).
triangle(o4).
config(o4,down).
circle(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(488)).

begin(model(489)).
neg(pos).
triangle(o3).
config(o3,down).
square(o2).
inside(o2,o3).
square(o1).
end(model(489)).

begin(model(490)).
neg(pos).
triangle(o5).
config(o5,down).
circle(o4).
inside(o4,o5).
circle(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(490)).

begin(model(491)).
neg(pos).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(491)).

begin(model(494)).
neg(pos).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(494)).

begin(model(497)).
neg(pos).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(497)).

begin(model(499)).
neg(pos).
square(o5).
triangle(o4).
config(o4,down).
inside(o4,o5).
square(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(499)).

begin(model(500)).
neg(pos).
circle(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(500)).

begin(model(512)).
neg(pos).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(512)).

begin(model(513)).
neg(pos).
triangle(o6).
config(o6,up).
square(o5).
inside(o5,o6).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(513)).

begin(model(516)).
pos.
circle(o4).
square(o3).
inside(o3,o4).
circle(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(516)).

begin(model(517)).
neg(pos).
square(o5).
square(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
square(o2).
inside(o2,o3).
square(o1).
end(model(517)).

begin(model(520)).
pos.
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(520)).

begin(model(521)).
neg(pos).
circle(o6).
circle(o5).
inside(o5,o6).
square(o4).
square(o3).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(521)).

begin(model(527)).
pos.
circle(o5).
triangle(o4).
config(o4,up).
inside(o4,o5).
circle(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(527)).

begin(model(529)).
neg(pos).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(529)).

begin(model(531)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(531)).

begin(model(533)).
neg(pos).
triangle(o4).
config(o4,up).
square(o3).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(533)).

begin(model(534)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(534)).

begin(model(539)).
pos.
square(o6).
triangle(o5).
config(o5,down).
inside(o5,o6).
circle(o4).
square(o3).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(539)).

begin(model(540)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(540)).

begin(model(542)).
neg(pos).
square(o5).
square(o4).
inside(o4,o5).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(542)).

begin(model(543)).
neg(pos).
triangle(o4).
config(o4,up).
square(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(543)).

begin(model(544)).
neg(pos).
circle(o6).
circle(o5).
inside(o5,o6).
square(o4).
circle(o3).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(544)).

begin(model(546)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(546)).

begin(model(550)).
pos.
triangle(o4).
config(o4,up).
square(o3).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(550)).

begin(model(552)).
pos.
circle(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
circle(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(552)).

begin(model(553)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(553)).

begin(model(555)).
neg(pos).
square(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(555)).

begin(model(559)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(559)).

begin(model(565)).
pos.
triangle(o6).
config(o6,down).
triangle(o5).
config(o5,up).
inside(o5,o6).
circle(o4).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(565)).

begin(model(567)).
pos.
circle(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(567)).

begin(model(568)).
pos.
square(o6).
square(o5).
inside(o5,o6).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
circle(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(568)).

begin(model(572)).
pos.
triangle(o4).
config(o4,down).
triangle(o3).
config(o3,down).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(572)).

begin(model(578)).
neg(pos).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(578)).

begin(model(582)).
pos.
triangle(o4).
config(o4,down).
triangle(o3).
config(o3,up).
inside(o3,o4).
circle(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(582)).

begin(model(583)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(583)).

begin(model(591)).
neg(pos).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(591)).

begin(model(595)).
pos.
square(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(595)).

begin(model(597)).
pos.
circle(o4).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(597)).

begin(model(600)).
neg(pos).
square(o2).
square(o1).
inside(o1,o2).
end(model(600)).

begin(model(602)).
pos.
circle(o5).
triangle(o4).
config(o4,down).
inside(o4,o5).
circle(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
circle(o1).
end(model(602)).

begin(model(609)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(609)).

begin(model(612)).
neg(pos).
triangle(o5).
config(o5,down).
circle(o4).
inside(o4,o5).
square(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(612)).

begin(model(614)).
neg(pos).
triangle(o3).
config(o3,up).
square(o2).
inside(o2,o3).
square(o1).
end(model(614)).

begin(model(615)).
neg(pos).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(615)).

begin(model(616)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(616)).

begin(model(617)).
neg(pos).
square(o5).
triangle(o4).
config(o4,down).
inside(o4,o5).
square(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(617)).

begin(model(622)).
pos.
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(622)).

begin(model(625)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(625)).

begin(model(628)).
neg(pos).
triangle(o5).
config(o5,down).
circle(o4).
inside(o4,o5).
square(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(628)).

begin(model(634)).
pos.
square(o6).
triangle(o5).
config(o5,up).
inside(o5,o6).
triangle(o4).
config(o4,down).
triangle(o3).
config(o3,up).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(634)).

begin(model(635)).
neg(pos).
triangle(o5).
config(o5,down).
circle(o4).
inside(o4,o5).
triangle(o3).
config(o3,up).
square(o2).
inside(o2,o3).
circle(o1).
end(model(635)).

begin(model(637)).
neg(pos).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(637)).

begin(model(639)).
pos.
triangle(o5).
config(o5,up).
square(o4).
inside(o4,o5).
circle(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(639)).

begin(model(640)).
pos.
circle(o6).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,up).
triangle(o3).
config(o3,down).
inside(o3,o4).
triangle(o2).
config(o2,down).
square(o1).
inside(o1,o2).
end(model(640)).

begin(model(641)).
pos.
circle(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(641)).

begin(model(642)).
pos.
circle(o6).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,up).
square(o3).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(642)).

begin(model(647)).
pos.
triangle(o4).
config(o4,up).
triangle(o3).
config(o3,down).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(647)).

begin(model(648)).
pos.
triangle(o6).
config(o6,down).
triangle(o5).
config(o5,down).
inside(o5,o6).
square(o4).
circle(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(648)).

begin(model(649)).
pos.
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(649)).

begin(model(650)).
pos.
circle(o4).
square(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(650)).

begin(model(654)).
neg(pos).
triangle(o4).
config(o4,up).
circle(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(654)).

begin(model(656)).
neg(pos).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(656)).

begin(model(657)).
pos.
circle(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
square(o1).
end(model(657)).

begin(model(658)).
neg(pos).
square(o4).
circle(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(658)).

begin(model(662)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(662)).

begin(model(667)).
pos.
circle(o6).
circle(o5).
inside(o5,o6).
triangle(o4).
config(o4,down).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(667)).

begin(model(669)).
neg(pos).
square(o4).
square(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(669)).

begin(model(671)).
neg(pos).
square(o5).
square(o4).
inside(o4,o5).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
square(o1).
end(model(671)).

begin(model(679)).
neg(pos).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(679)).

begin(model(682)).
neg(pos).
triangle(o4).
config(o4,up).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(682)).

begin(model(683)).
neg(pos).
square(o4).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(683)).

begin(model(685)).
pos.
square(o6).
circle(o5).
inside(o5,o6).
circle(o4).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(685)).

begin(model(686)).
pos.
circle(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(686)).

begin(model(691)).
neg(pos).
square(o5).
circle(o4).
inside(o4,o5).
triangle(o3).
config(o3,up).
square(o2).
inside(o2,o3).
circle(o1).
end(model(691)).

begin(model(693)).
neg(pos).
triangle(o6).
config(o6,up).
square(o5).
inside(o5,o6).
square(o4).
circle(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(693)).

begin(model(698)).
neg(pos).
triangle(o6).
config(o6,up).
circle(o5).
inside(o5,o6).
square(o4).
square(o3).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(698)).

begin(model(700)).
neg(pos).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(700)).

begin(model(701)).
neg(pos).
circle(o5).
square(o4).
inside(o4,o5).
circle(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(701)).

begin(model(705)).
neg(pos).
circle(o5).
circle(o4).
inside(o4,o5).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(705)).

begin(model(708)).
neg(pos).
triangle(o5).
config(o5,up).
square(o4).
inside(o4,o5).
circle(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(708)).

begin(model(709)).
neg(pos).
circle(o5).
circle(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
square(o1).
end(model(709)).

begin(model(710)).
neg(pos).
square(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(710)).

begin(model(719)).
neg(pos).
square(o4).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(719)).

begin(model(722)).
neg(pos).
triangle(o4).
config(o4,down).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(722)).

begin(model(723)).
neg(pos).
circle(o4).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(723)).

begin(model(725)).
pos.
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(725)).

begin(model(728)).
neg(pos).
circle(o4).
circle(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(728)).

begin(model(732)).
neg(pos).
circle(o5).
triangle(o4).
config(o4,down).
inside(o4,o5).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(732)).

begin(model(734)).
neg(pos).
square(o4).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(734)).

begin(model(737)).
neg(pos).
square(o4).
circle(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(737)).

begin(model(740)).
neg(pos).
square(o2).
square(o1).
inside(o1,o2).
end(model(740)).

begin(model(741)).
neg(pos).
triangle(o5).
config(o5,up).
circle(o4).
inside(o4,o5).
square(o3).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(741)).

begin(model(743)).
neg(pos).
triangle(o2).
config(o2,down).
square(o1).
inside(o1,o2).
end(model(743)).

begin(model(744)).
neg(pos).
triangle(o5).
config(o5,down).
square(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(744)).

begin(model(745)).
pos.
circle(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(745)).

begin(model(747)).
neg(pos).
square(o2).
square(o1).
inside(o1,o2).
end(model(747)).

begin(model(748)).
neg(pos).
square(o5).
circle(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(748)).

begin(model(750)).
neg(pos).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(750)).

begin(model(751)).
neg(pos).
triangle(o2).
config(o2,down).
square(o1).
inside(o1,o2).
end(model(751)).

begin(model(753)).
pos.
circle(o6).
triangle(o5).
config(o5,up).
inside(o5,o6).
square(o4).
square(o3).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(753)).

begin(model(754)).
neg(pos).
square(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(754)).

begin(model(755)).
neg(pos).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(755)).

begin(model(765)).
neg(pos).
triangle(o2).
config(o2,down).
square(o1).
inside(o1,o2).
end(model(765)).

begin(model(766)).
neg(pos).
triangle(o3).
config(o3,up).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(766)).

begin(model(768)).
pos.
square(o6).
square(o5).
inside(o5,o6).
circle(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(768)).

begin(model(769)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(769)).

begin(model(772)).
neg(pos).
square(o5).
circle(o4).
inside(o4,o5).
square(o3).
triangle(o2).
config(o2,down).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(772)).

begin(model(773)).
neg(pos).
square(o5).
triangle(o4).
config(o4,up).
inside(o4,o5).
square(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(773)).

begin(model(777)).
neg(pos).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(777)).

begin(model(779)).
neg(pos).
square(o5).
triangle(o4).
config(o4,down).
inside(o4,o5).
triangle(o3).
config(o3,up).
square(o2).
inside(o2,o3).
square(o1).
end(model(779)).

begin(model(780)).
neg(pos).
square(o5).
square(o4).
inside(o4,o5).
circle(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(780)).

begin(model(781)).
neg(pos).
triangle(o6).
config(o6,up).
square(o5).
inside(o5,o6).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(781)).

begin(model(787)).
pos.
square(o6).
triangle(o5).
config(o5,down).
inside(o5,o6).
triangle(o4).
config(o4,down).
square(o3).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(787)).

begin(model(794)).
neg(pos).
triangle(o3).
config(o3,up).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(794)).

begin(model(795)).
neg(pos).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(795)).

begin(model(797)).
neg(pos).
circle(o5).
circle(o4).
inside(o4,o5).
circle(o3).
square(o2).
inside(o2,o3).
circle(o1).
end(model(797)).

begin(model(803)).
neg(pos).
triangle(o4).
config(o4,up).
circle(o3).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(803)).

begin(model(805)).
pos.
circle(o6).
triangle(o5).
config(o5,down).
inside(o5,o6).
square(o4).
triangle(o3).
config(o3,down).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(805)).

begin(model(807)).
neg(pos).
square(o5).
triangle(o4).
config(o4,up).
inside(o4,o5).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(807)).

begin(model(814)).
neg(pos).
square(o2).
square(o1).
inside(o1,o2).
end(model(814)).

begin(model(815)).
neg(pos).
circle(o5).
circle(o4).
inside(o4,o5).
square(o3).
circle(o2).
inside(o2,o3).
square(o1).
end(model(815)).

begin(model(816)).
pos.
triangle(o6).
config(o6,up).
triangle(o5).
config(o5,down).
inside(o5,o6).
triangle(o4).
config(o4,up).
circle(o3).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(816)).

begin(model(818)).
neg(pos).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(818)).

begin(model(819)).
neg(pos).
circle(o5).
circle(o4).
inside(o4,o5).
square(o3).
square(o2).
inside(o2,o3).
circle(o1).
end(model(819)).

begin(model(822)).
neg(pos).
square(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(822)).

begin(model(829)).
neg(pos).
square(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(829)).

begin(model(832)).
neg(pos).
square(o5).
circle(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
square(o1).
end(model(832)).

begin(model(833)).
neg(pos).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(833)).

begin(model(835)).
pos.
triangle(o6).
config(o6,down).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,up).
triangle(o3).
config(o3,up).
inside(o3,o4).
circle(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(835)).

begin(model(836)).
neg(pos).
square(o6).
square(o5).
inside(o5,o6).
circle(o4).
square(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(836)).

begin(model(837)).
pos.
triangle(o5).
config(o5,down).
triangle(o4).
config(o4,down).
inside(o4,o5).
square(o3).
triangle(o2).
config(o2,down).
inside(o2,o3).
square(o1).
end(model(837)).

begin(model(838)).
neg(pos).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(838)).

begin(model(841)).
pos.
triangle(o5).
config(o5,down).
triangle(o4).
config(o4,down).
inside(o4,o5).
square(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(841)).

begin(model(844)).
pos.
square(o6).
square(o5).
inside(o5,o6).
circle(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(844)).

begin(model(845)).
neg(pos).
triangle(o4).
config(o4,up).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(845)).

begin(model(846)).
neg(pos).
square(o5).
square(o4).
inside(o4,o5).
square(o3).
square(o2).
inside(o2,o3).
square(o1).
end(model(846)).

begin(model(847)).
neg(pos).
circle(o6).
circle(o5).
inside(o5,o6).
circle(o4).
square(o3).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(847)).

begin(model(848)).
neg(pos).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(848)).

begin(model(849)).
pos.
triangle(o5).
config(o5,down).
triangle(o4).
config(o4,up).
inside(o4,o5).
circle(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
square(o1).
end(model(849)).

begin(model(856)).
neg(pos).
triangle(o2).
config(o2,down).
square(o1).
inside(o1,o2).
end(model(856)).

begin(model(859)).
neg(pos).
square(o2).
circle(o1).
inside(o1,o2).
end(model(859)).

begin(model(862)).
neg(pos).
square(o3).
triangle(o2).
config(o2,down).
inside(o2,o3).
square(o1).
end(model(862)).

begin(model(864)).
pos.
circle(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
square(o1).
end(model(864)).

begin(model(867)).
neg(pos).
circle(o5).
circle(o4).
inside(o4,o5).
square(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
circle(o1).
end(model(867)).

begin(model(872)).
neg(pos).
square(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(872)).

begin(model(874)).
pos.
triangle(o3).
config(o3,down).
triangle(o2).
config(o2,down).
inside(o2,o3).
square(o1).
end(model(874)).

begin(model(876)).
neg(pos).
square(o2).
circle(o1).
inside(o1,o2).
end(model(876)).

begin(model(880)).
pos.
circle(o6).
circle(o5).
inside(o5,o6).
triangle(o4).
config(o4,up).
triangle(o3).
config(o3,up).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(880)).

begin(model(882)).
neg(pos).
triangle(o4).
config(o4,down).
circle(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(882)).

begin(model(887)).
neg(pos).
triangle(o4).
config(o4,down).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(887)).

begin(model(890)).
neg(pos).
triangle(o3).
config(o3,down).
square(o2).
inside(o2,o3).
square(o1).
end(model(890)).

begin(model(892)).
neg(pos).
triangle(o5).
config(o5,down).
circle(o4).
inside(o4,o5).
square(o3).
triangle(o2).
config(o2,up).
inside(o2,o3).
square(o1).
end(model(892)).

begin(model(893)).
pos.
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(893)).

begin(model(897)).
neg(pos).
square(o6).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,up).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(897)).

begin(model(899)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(899)).

begin(model(900)).
neg(pos).
square(o6).
triangle(o5).
config(o5,down).
inside(o5,o6).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
square(o1).
inside(o1,o2).
end(model(900)).

begin(model(904)).
neg(pos).
circle(o5).
circle(o4).
inside(o4,o5).
square(o3).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(904)).

begin(model(909)).
pos.
circle(o6).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,up).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(909)).

begin(model(910)).
pos.
triangle(o4).
config(o4,down).
square(o3).
inside(o3,o4).
circle(o2).
square(o1).
inside(o1,o2).
end(model(910)).

begin(model(912)).
neg(pos).
circle(o6).
triangle(o5).
config(o5,down).
inside(o5,o6).
triangle(o4).
config(o4,up).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(912)).

begin(model(915)).
neg(pos).
triangle(o5).
config(o5,up).
square(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(915)).

begin(model(917)).
neg(pos).
triangle(o3).
config(o3,up).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(917)).

begin(model(926)).
neg(pos).
square(o4).
square(o3).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(926)).

begin(model(927)).
neg(pos).
triangle(o5).
config(o5,down).
circle(o4).
inside(o4,o5).
triangle(o3).
config(o3,up).
circle(o2).
inside(o2,o3).
circle(o1).
end(model(927)).

begin(model(929)).
neg(pos).
square(o2).
circle(o1).
inside(o1,o2).
end(model(929)).

begin(model(930)).
pos.
triangle(o3).
config(o3,up).
triangle(o2).
config(o2,up).
inside(o2,o3).
square(o1).
end(model(930)).

begin(model(931)).
neg(pos).
square(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(931)).

begin(model(932)).
pos.
triangle(o5).
config(o5,down).
square(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
triangle(o2).
config(o2,up).
inside(o2,o3).
circle(o1).
end(model(932)).

begin(model(933)).
neg(pos).
square(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(933)).

begin(model(938)).
pos.
circle(o6).
circle(o5).
inside(o5,o6).
triangle(o4).
config(o4,down).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(938)).

begin(model(939)).
neg(pos).
triangle(o2).
config(o2,up).
square(o1).
inside(o1,o2).
end(model(939)).

begin(model(940)).
pos.
triangle(o4).
config(o4,down).
triangle(o3).
config(o3,up).
inside(o3,o4).
circle(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(940)).

begin(model(941)).
neg(pos).
triangle(o3).
config(o3,down).
circle(o2).
inside(o2,o3).
square(o1).
end(model(941)).

begin(model(944)).
neg(pos).
circle(o4).
circle(o3).
inside(o3,o4).
circle(o2).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(944)).

begin(model(945)).
neg(pos).
square(o5).
square(o4).
inside(o4,o5).
square(o3).
circle(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(945)).

begin(model(946)).
pos.
triangle(o5).
config(o5,up).
circle(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
triangle(o2).
config(o2,down).
inside(o2,o3).
circle(o1).
end(model(946)).

begin(model(947)).
pos.
circle(o5).
circle(o4).
inside(o4,o5).
triangle(o3).
config(o3,down).
triangle(o2).
config(o2,down).
inside(o2,o3).
circle(o1).
end(model(947)).

begin(model(955)).
neg(pos).
circle(o6).
triangle(o5).
config(o5,down).
inside(o5,o6).
square(o4).
triangle(o3).
config(o3,up).
inside(o3,o4).
square(o2).
circle(o1).
inside(o1,o2).
end(model(955)).

begin(model(957)).
pos.
triangle(o6).
config(o6,down).
circle(o5).
inside(o5,o6).
circle(o4).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(957)).

begin(model(961)).
neg(pos).
square(o4).
circle(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(961)).

begin(model(971)).
pos.
circle(o5).
triangle(o4).
config(o4,down).
inside(o4,o5).
triangle(o3).
config(o3,up).
triangle(o2).
config(o2,down).
inside(o2,o3).
square(o1).
end(model(971)).

begin(model(973)).
neg(pos).
square(o4).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(973)).

begin(model(974)).
neg(pos).
circle(o6).
circle(o5).
inside(o5,o6).
square(o4).
circle(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(974)).

begin(model(975)).
neg(pos).
square(o3).
triangle(o2).
config(o2,down).
inside(o2,o3).
triangle(o1).
config(o1,up).
end(model(975)).

begin(model(977)).
neg(pos).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(977)).

begin(model(978)).
pos.
triangle(o2).
config(o2,down).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(978)).

begin(model(979)).
pos.
circle(o2).
triangle(o1).
config(o1,up).
inside(o1,o2).
end(model(979)).

begin(model(984)).
neg(pos).
square(o2).
circle(o1).
inside(o1,o2).
end(model(984)).

begin(model(989)).
neg(pos).
triangle(o2).
config(o2,up).
circle(o1).
inside(o1,o2).
end(model(989)).

begin(model(991)).
pos.
circle(o6).
square(o5).
inside(o5,o6).
triangle(o4).
config(o4,down).
square(o3).
inside(o3,o4).
triangle(o2).
config(o2,up).
triangle(o1).
config(o1,down).
inside(o1,o2).
end(model(991)).

begin(model(995)).
pos.
triangle(o6).
config(o6,up).
triangle(o5).
config(o5,up).
inside(o5,o6).
square(o4).
square(o3).
inside(o3,o4).
circle(o2).
circle(o1).
inside(o1,o2).
end(model(995)).

begin(model(997)).
neg(pos).
square(o3).
square(o2).
inside(o2,o3).
triangle(o1).
config(o1,down).
end(model(997)).

begin(model(1000)).
neg(pos).
square(o6).
triangle(o5).
config(o5,up).
inside(o5,o6).
triangle(o4).
config(o4,up).
circle(o3).
inside(o3,o4).
triangle(o2).
config(o2,down).
circle(o1).
inside(o1,o2).
end(model(1000)).

