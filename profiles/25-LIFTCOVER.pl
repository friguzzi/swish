% Empty with liftcover loaded
:-use_module(library(liftcover)).

:-lift.

% Settings
:- set_lift(verbosity,1).

:- begin_in.

% Input theory here


:- end_in.  

:- begin_bg.

% Background knowledge here

:- end_bg.

% Fold definition
% fold(train,[folds list]).
% fold(test,[[folds list]).


% Language bias


% Models / Examples



/** <examples> Your example queries go here, e.g.

?- induce_par_lift([train],P),test_lift(P,[test],LL,AUCROC,ROC,AUCPR,PR).

?- induce_lift([train],P),test_lift(P,[test],LL,AUCROC,ROC,AUCPR,PR).

*/
