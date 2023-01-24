%%
% Prolog program of NBA example file (Relational/NBA).
%
% Example taken from relational.fit.cvut.cz

/* 
* ?- induce_lift([f1,f2,f3,f4],P),test_lift(P,[f5],LL,AUCROC,ROC,AUCPR,PR). % learn the structure and the parameters and test the result
* ?- induce_lift([f1,f2,f3,f4,f5],P).
* */
%%

:-use_module(library(liftcover)).

%:- if(current_predicate(use_rendering/1)).
%:- use_rendering(c3).
%:- use_rendering(lpad).
%:- endif.

:-lift.

:- set_lift(neg_ex,given).
:- set_lift(megaex_bottom,4).
:- set_lift(max_iter,20).
:- set_lift(max_var,100).
:- set_lift(maxdepth_var,20). %da inserire nel tutorial
:- set_lift(verbosity,0).


fold(f1,[1,2,3,4,5,6]).
fold(f2,[7,8,9,10,11,12]).
fold(f3,[15,13,14,16,17,18]).
fold(f4,[19,20,21,22,23,24]).
fold(f5,[27,28,29,30,25,26]).


output(game/5).    % game(GameId,Team1Id,Team2Id,ResultOfTeam1,URL,Date).
input(actions/21). % actions(GameId,TeamId,PlayerId,...
input(player/2).   % player(PlayerId,PlayerName).
input(team/2).     % team(TeamId,TeamName).

%modeh(1,win1).


modeh(1,game(+teamId,+teamId,-#resulteam1,+url,+date)).

%------- nessun istanziato --------%
%modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

%------- una var istanziata --------%

modeb(3,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).
/*
modeb(1,actions(+teamId,-playerId,-#minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-#fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-#fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-#threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-#threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-#freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -#freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-#plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-#offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-#defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-#totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-#assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-#personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-#steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-#turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-#blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-#blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-#points,-starter)).

modeb(1,actions(+teamId,-playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-#starter)).
*/

%------- playerID istanziato + una var istanziata --------%
/*
modeb(1,actions(+teamId,-#playerId,-#minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-#fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-#fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-#threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-#threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-#freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -#freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-#plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-#offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-#defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-#totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-#assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-#personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-#steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-#turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-#blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-#blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-#points,-starter)).

modeb(1,actions(+teamId,-#playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-#starter)).
*/
%------- tutto istanziato --------%

%modeb(1,actions(+teamId,-#playerId,-#minutes,-#fieldGoalsMade,-#fieldGoalAttempts,-#threePointsMade,-#threePointAttempts,-#freeThrowsMade, -#freeThrowAttempts,-#plusMinus,-#offensiveRebounds,-#defensiveRebounds,-#totalRebounds,-#assists,-#personalFouls,-#steals,-#turnovers,-#blockedShots,-#blocksAgainst,-#points,-#starter)).


%------- playerID input --------%

%modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

%------- playerID input + una var istanziata --------%
/*
modeb(1,actions(+teamId,+playerId,-#minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-#fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-#fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-#threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-#threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-#freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -#freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-#plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-#offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-#defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-#totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-#assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-#personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-#steals,-turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-#turnovers,-blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-#blockedShots,-blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-#blocksAgainst,-points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-#points,-starter)).

modeb(1,actions(+teamId,+playerId,-minutes,-fieldGoalsMade,-fieldGoalAttempts,-threePointsMade,-threePointAttempts,-freeThrowsMade, -freeThrowAttempts,-plusMinus,-offensiveRebounds,-defensiveRebounds,-totalRebounds,-assists,-personalFouls,-steals,-turnovers,-blockedShots,-blocksAgainst,-points,-#starter)).
*/

%------- playerID input + tutto istanziato --------%

%modeb(1,actions(+teamId,+playerId,-#minutes,-#fieldGoalsMade,-#fieldGoalAttempts,-#threePointsMade,-#threePointAttempts,-#freeThrowsMade, -#freeThrowAttempts,-#plusMinus,-#offensiveRebounds,-#defensiveRebounds,-#totalRebounds,-#assists,-#personalFouls,-#steals,-#turnovers,-#blockedShots,-#blocksAgainst,-#points,-#starter)).


modeb(3,player(+playerId,-#pname)).
modeb(3,team(+teamId,-#tname)).


determination(game/5,actions/21).
determination(game/5,player/2).
determination(game/5,team/2).





% Game information
%%
% predicate: game_k(GameId,ResultOfTeam1).

%game_k(1).
%game_k(2).
%game_k(3).
%game_k(4).
%game_k(10).
%game_k(11).
%game_k(15).
%game_k(19).
%game_k(20).
%game_k(23).
%game_k(24).
%game_k(27).
%game_k(28).
%game_k(29).
%game_k(30).
%
%neg(game_k(5)).
%neg(game_k(6)).
%neg(game_k(7)).
%neg(game_k(8)).
%neg(game_k(9)).
%neg(game_k(12)).
%neg(game_k(13)).
%neg(game_k(14)).
%neg(game_k(16)).
%neg(game_k(17)).
%neg(game_k(18)).
%neg(game_k(21)).
%neg(game_k(22)).
%neg(game_k(25)).
%neg(game_k(26)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Game information
%%
% predicate: game(GameId,Team1Id,Team2Id,ResultOfTeam1,URL,Date).

game(1,7,8,1,"http://www.nba.com/games/20140331/NYKUTA/gameinfo.html","2014-03-31 00:00:00").
game(2,9,10,1,"http://www.nba.com/games/20140331/MEMDEN/gameinfo.html","2014-03-31 00:00:00").
game(3,11,12,1,"http://www.nba.com/games/20140331/SACNOP/gameinfo.html","2014-03-31 00:00:00").
game(4,13,14,1,"http://www.nba.com/games/20140331/LACMIN/gameinfo.html","2014-03-31 00:00:00").
neg(game(5,15,16,-1,"http://www.nba.com/games/20140331/BOSCHI/gameinfo.html","2014-03-31 00:00:00")).
neg(game(6,17,18,-1,"http://www.nba.com/games/20140331/TORMIA/gameinfo.html","2014-03-31 00:00:00")).
neg(game(7,19,20,-1,"http://www.nba.com/games/20140331/MILDET/gameinfo.html","2014-03-31 00:00:00")).
neg(game(8,21,22,-1,"http://www.nba.com/games/20140331/PHIATL/gameinfo.html","2014-03-31 00:00:00")).
neg(game(9,23,24,-1,"http://www.nba.com/games/20140331/WASCHA/gameinfo.html","2014-03-31 00:00:00")).
game(10,1,2,1,"http://www.nba.com/games/20140401/PORLAL/gameinfo.html?ls=slt","2014-04-01 00:00:00").
game(11,3,4,1,"http://www.nba.com/games/20140401/GSWDAL/gameinfo.html?ls=slt","2014-04-01 00:00:00").
neg(game(12,5,6,-1,"http://www.nba.com/games/20140401/HOUBKN/gameinfo.html?ls=slt","2014-04-01 00:00:00")).
neg(game(13,20,25,-1,"http://www.nba.com/games/20140402/DETIND/gameinfo.html","2014-04-02 00:00:00")).
neg(game(14,6,7,-1,"http://www.nba.com/games/20140402/BKNNYK/gameinfo.html","2014-04-02 00:00:00")).
game(15,26,27,1,"http://www.nba.com/games/20140402/CLEORL/gameinfo.html","2014-04-02 00:00:00").
neg(game(16,21,24,-1,"http://www.nba.com/games/20140402/CHAPHI/gameinfo.html","2014-04-02 00:00:00")).
neg(game(17,5,17,-1,"http://www.nba.com/games/20140402/HOUTOR/gameinfo.html","2014-04-02 00:00:00")).
neg(game(18,15,23,-1,"http://www.nba.com/games/20140402/BOSWAS/gameinfo.html","2014-04-02 00:00:00")).
game(19,16,22,1,"http://www.nba.com/games/20140402/CHIATL/gameinfo.html","2014-04-02 00:00:00").
game(20,18,19,1,"http://www.nba.com/games/20140402/MILMIA/gameinfo.html","2014-04-02 00:00:00").
neg(game(21,9,14,-1,"http://www.nba.com/games/20140402/MEMMIN/gameinfo.html","2014-04-02 00:00:00")).
neg(game(22,3,28,-1,"http://www.nba.com/games/20140402/GSWSAS/gameinfo.html","2014-04-02 00:00:00")).
game(23,10,12,1,"http://www.nba.com/games/20140402/NOPDEN/gameinfo.html","2014-04-02 00:00:00").
game(24,13,29,1,"http://www.nba.com/games/20140402/LACPHX/gameinfo.html","2014-04-02 00:00:00").
neg(game(25,2,11,-1,"http://www.nba.com/games/20140402/LALSAC/gameinfo.html","2014-04-02 00:00:00")).
neg(game(26,28,30,-1,"http://www.nba.com/games/20140403/SASOKC/gameinfo.html","2014-04-03 00:00:00")).
game(27,4,13,1,"http://www.nba.com/games/20140403/DALLAC/gameinfo.html","2014-04-03 00:00:00").
game(28,9,10,1,"http://www.nba.com/games/20140404/DENMEM/gameinfo.html","2014-04-04 00:00:00").
game(29,24,27,1,"http://www.nba.com/games/20140404/ORLCHA/gameinfo.html","2014-04-04 00:00:00").
game(30,17,25,1,"http://www.nba.com/games/20140404/INDTOR/gameinfo.html","2014-04-04 00:00:00").
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Actions type information
%%
% predicate: actions(GameId,TeamId,PlayerId,Minutes,FieldGoalsMade,FieldGoalAttempts,3PointsMade,3PointAttempts,FreeThrowsMade,
%                    FreeThrowAttempts,PlusMinus,OffensiveRebounds,DefensiveRebounds,TotalRebounds,Assists,PersonalFouls,Steals,
%                    Turnovers,BlockedShots,BlocksAgainst,Points,Starter).

actions(1,7,78,2605,5,14,3,3,0,0,12,0,3,3,4,2,1,1,0,0,13,1).
actions(1,7,79,2359,11,19,3,3,8,8,13,0,8,8,3,2,3,3,1,0,34,1).
actions(1,7,80,2104,6,7,3,3,3,8,18,2,7,9,1,3,1,1,2,0,15,1).
actions(1,7,81,1392,1,5,3,3,0,0,3,0,2,2,0,4,1,0,0,0,2,1).
actions(1,7,82,2124,5,8,3,3,1,2,5,0,3,3,6,1,1,4,0,0,12,1).
actions(1,7,83,1880,3,9,3,3,3,4,5,0,2,2,2,3,0,0,0,0,10,0).
actions(1,7,84,1009,0,3,3,3,0,0,5,1,3,4,2,0,1,0,0,0,0,0).
actions(1,7,85,773,2,4,3,3,2,2,-12,0,6,6,0,3,0,0,3,0,6,0).
actions(1,7,86,77,0,1,3,3,0,0,-2,0,0,0,0,0,0,0,0,0,0,0).
actions(1,7,87,77,0,0,3,3,0,0,-2,0,1,1,0,0,0,0,0,0,0,0).
actions(1,7,88,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(1,7,89,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(1,8,90,1680,5,9,3,3,0,0,-5,0,2,2,3,2,0,0,0,0,11,1).
actions(1,8,91,1874,2,5,3,3,0,0,-13,2,8,10,2,4,2,0,0,0,5,1).
actions(1,8,92,1294,6,14,3,3,1,3,-4,8,5,13,0,4,0,0,0,3,13,1).
actions(1,8,93,2362,5,14,3,3,5,8,-7,0,2,2,1,1,1,2,0,0,18,1).
actions(1,8,94,1876,2,8,3,3,0,0,-8,1,3,4,3,3,0,3,0,1,5,1).
actions(1,8,95,1506,5,11,3,3,2,2,-4,2,4,6,0,3,0,0,0,1,12,0).
actions(1,8,96,2052,7,12,3,3,1,2,-4,1,6,7,4,3,1,5,0,0,17,0).
actions(1,8,97,1084,0,8,3,3,0,0,-2,0,3,3,1,1,0,0,0,0,0,0).
actions(1,8,98,518,0,3,3,3,0,0,-2,0,1,1,1,2,1,1,0,1,0,0).
actions(1,8,99,77,1,1,3,3,0,0,2,2,0,2,0,0,0,0,0,0,2,0).
actions(1,8,100,77,0,0,3,3,0,0,2,0,0,0,0,0,0,0,0,0,0,0).
actions(1,8,101,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(1,8,102,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(2,9,103,1742,0,4,3,3,1,2,-6,2,2,4,1,3,0,1,1,0,1,1).
actions(2,9,104,2049,8,15,3,3,4,8,1,2,9,11,3,4,1,2,0,2,20,1).
actions(2,9,105,1991,6,19,3,3,1,3,-6,4,4,8,2,2,0,2,1,1,13,1).
actions(2,9,106,2048,6,12,3,3,4,6,2,2,5,7,3,2,0,0,0,0,19,1).
actions(2,9,107,1823,9,15,3,3,0,0,-7,2,0,2,2,1,1,2,0,0,19,1).
actions(2,9,108,1057,4,7,3,3,0,0,7,1,1,2,3,2,1,3,0,0,9,0).
actions(2,9,109,580,1,1,3,3,1,1,3,0,1,1,1,2,0,0,0,0,3,0).
actions(2,9,110,1029,1,2,3,3,0,0,6,0,2,2,0,0,0,1,0,0,2,0).
actions(2,9,111,1140,2,7,3,3,2,3,2,4,2,6,0,2,1,0,1,0,6,0).
actions(2,9,112,941,1,3,3,3,0,0,-2,0,0,0,2,1,3,0,0,0,2,0).
actions(2,9,113,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(2,9,114,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(2,9,115,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(2,10,116,1059,1,2,3,3,0,0,-8,0,3,3,0,1,0,1,0,0,3,1).
actions(2,10,117,1908,6,14,3,3,5,9,8,5,3,8,2,2,3,2,1,2,17,1).
actions(2,10,118,1895,9,15,3,3,5,7,0,2,8,10,1,5,0,2,1,1,23,1).
actions(2,10,119,2414,6,13,3,3,0,0,11,2,7,9,4,2,2,2,0,0,13,1).
actions(2,10,120,2371,3,9,3,3,2,4,-1,0,5,5,6,2,0,2,0,0,8,1).
actions(2,10,121,973,2,5,3,3,0,0,-8,1,1,2,0,2,0,1,0,0,5,0).
actions(2,10,122,1029,2,3,3,3,0,0,-6,0,3,3,1,2,0,1,0,0,5,0).
actions(2,10,123,1766,4,8,3,3,0,0,4,0,0,0,6,1,1,2,0,0,10,0).
actions(2,10,124,984,3,4,3,3,2,4,0,1,2,3,0,6,1,1,1,0,8,0).
actions(2,10,125,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(2,10,126,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(2,10,127,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(2,10,128,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(3,11,129,2388,7,18,3,3,7,8,13,3,2,5,5,2,0,3,0,1,22,1).
actions(3,11,130,1388,1,1,3,3,1,2,13,2,10,12,0,5,1,3,0,0,3,1).
actions(3,11,131,2246,13,18,3,3,9,12,23,3,11,14,3,3,1,3,2,3,35,1).
actions(3,11,132,2302,5,11,3,3,3,4,15,2,3,5,1,1,0,4,1,0,14,1).
actions(3,11,133,2636,9,19,3,3,3,5,12,0,2,2,10,3,2,1,0,2,22,1).
actions(3,11,134,1017,1,6,3,3,0,0,-15,0,1,1,1,1,2,0,0,0,2,0).
actions(3,11,135,538,1,2,3,3,0,0,-15,0,0,0,0,0,0,1,0,1,2,0).
actions(3,11,136,253,1,3,3,3,0,0,-9,1,0,1,0,1,0,0,0,1,2,0).
actions(3,11,137,554,0,2,3,3,0,0,-10,0,2,2,0,2,0,2,0,2,0,0).
actions(3,11,138,1080,0,0,3,3,0,0,-2,4,1,5,0,1,1,1,0,0,0,0).
actions(3,11,139,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(3,11,140,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(3,12,141,1149,1,1,3,3,2,2,-14,0,2,2,0,2,3,0,0,0,4,1).
actions(3,12,142,2261,5,13,3,3,12,14,-20,2,6,8,4,3,2,1,4,0,22,1).
actions(3,12,143,829,1,1,3,3,2,3,-14,0,0,0,0,4,0,0,0,0,4,1).
actions(3,12,144,1535,7,15,3,3,1,2,-16,0,2,2,4,3,2,4,0,1,15,1).
actions(3,12,145,1313,4,12,3,3,0,0,-15,0,1,1,2,1,0,1,0,1,9,1).
actions(3,12,146,1730,3,4,3,3,0,0,12,0,3,3,1,2,1,1,1,0,6,0).
actions(3,12,147,500,0,3,3,3,0,0,-7,1,0,1,0,4,0,1,0,0,0,0).
actions(3,12,148,1430,2,5,3,3,2,4,9,0,1,1,9,3,0,3,0,1,6,0).
actions(3,12,149,1695,9,13,3,3,1,1,14,0,3,3,1,1,2,0,0,0,23,0).
actions(3,12,150,1686,4,4,3,3,0,0,19,0,7,7,1,3,1,2,5,0,8,0).
actions(3,12,151,272,0,2,3,3,0,0,7,0,2,2,0,0,0,0,0,0,0,0).
actions(3,12,152,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(3,12,153,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(4,13,154,2056,7,14,3,3,2,2,16,1,5,6,3,3,2,1,0,2,19,1).
actions(4,13,155,2129,6,10,3,3,2,2,17,0,4,4,3,4,0,1,0,0,16,1).
actions(4,13,156,2408,4,6,3,3,3,8,14,10,14,24,0,2,0,5,4,0,11,1).
actions(4,13,157,2602,9,17,3,3,8,8,15,1,2,3,7,1,1,6,0,1,28,1).
actions(4,13,158,2281,6,16,3,3,8,8,16,1,6,7,9,4,3,3,0,1,22,1).
actions(4,13,159,691,2,5,3,3,0,0,-4,0,2,2,0,0,0,0,0,0,6,0).
actions(4,13,160,877,3,9,3,3,0,0,-11,0,0,0,1,3,0,1,0,0,6,0).
actions(4,13,161,824,1,5,3,3,0,0,-6,0,2,2,0,1,1,1,0,0,3,0).
actions(4,13,162,318,0,0,3,3,1,2,-2,0,1,1,0,0,1,0,0,0,1,0).
actions(4,13,163,214,0,0,3,3,2,2,-5,0,0,0,0,0,0,0,0,0,2,0).
actions(4,13,164,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(4,13,165,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(4,13,166,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(4,14,167,1246,4,8,3,3,0,0,-22,0,1,1,1,1,1,1,2,0,9,1).
actions(4,14,168,1762,8,21,3,3,2,3,-30,5,8,13,4,1,1,4,0,0,20,1).
actions(4,14,170,1816,4,14,3,3,2,2,-21,0,2,2,0,2,0,0,0,0,12,1).
actions(4,14,171,1659,1,6,3,3,0,0,-32,1,1,2,7,1,1,5,0,0,3,1).
actions(4,14,172,1162,4,4,3,3,6,6,-4,3,1,4,3,4,3,1,1,0,14,0).
actions(4,14,173,1462,2,10,3,3,0,0,19,0,3,3,8,5,0,2,0,1,4,0).
actions(4,14,174,1144,4,8,3,3,0,0,5,3,3,6,2,1,0,2,0,0,8,0).
actions(4,14,175,1634,5,8,3,3,1,1,12,0,5,5,1,2,2,1,1,1,12,0).
actions(4,14,176,1382,4,8,3,3,0,0,16,0,2,2,3,3,1,1,0,1,11,0).
actions(4,14,177,720,5,6,3,3,1,2,12,0,3,3,1,2,0,0,0,0,11,0).
actions(4,14,178,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(4,14,179,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(4,14,392,413,0,3,3,3,0,0,-5,0,1,1,0,1,0,0,0,1,0,1).
actions(5,15,180,2380,4,13,3,3,0,0,-12,0,2,2,1,4,2,4,0,0,9,1).
actions(5,15,181,1888,7,10,3,3,4,4,-6,3,6,9,3,1,0,2,4,0,18,1).
actions(5,15,182,1523,5,7,3,3,1,2,-29,1,2,3,1,2,1,2,0,1,11,1).
actions(5,15,183,824,0,5,3,3,1,1,-6,0,2,2,3,0,0,0,0,1,1,1).
actions(5,15,184,1980,6,14,3,3,2,2,-20,0,2,2,5,1,1,1,0,0,18,1).
actions(5,15,185,1194,1,6,3,3,0,0,-3,1,5,6,1,2,0,1,0,0,2,0).
actions(5,15,186,2105,1,7,3,3,3,4,0,1,1,2,0,1,2,0,0,0,5,0).
actions(5,15,187,1132,4,8,3,3,0,2,-2,1,1,2,3,2,4,2,0,0,9,0).
actions(5,15,188,1098,3,6,3,3,0,0,10,4,3,7,0,2,0,4,0,1,7,0).
actions(5,15,189,276,0,1,3,3,0,0,-2,1,1,2,0,0,0,0,0,0,0,0).
actions(5,15,190,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(5,15,191,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(5,16,192,2329,7,12,3,3,5,5,11,0,3,3,3,2,0,3,0,0,22,1).
actions(5,16,193,1440,7,12,3,3,2,2,4,3,4,7,1,3,0,1,0,0,16,1).
actions(5,16,194,2339,9,19,3,3,1,1,26,4,7,11,5,2,2,3,2,3,19,1).
actions(5,16,195,2547,8,13,3,3,2,2,9,1,3,4,4,1,1,0,0,1,18,1).
actions(5,16,196,1641,0,6,3,3,1,2,11,0,3,3,3,1,4,1,1,0,1,1).
actions(5,16,197,1833,1,9,3,3,2,2,11,0,1,1,11,2,0,1,0,0,4,0).
actions(5,16,198,1705,6,9,3,3,2,2,5,3,8,11,0,4,1,3,0,0,14,0).
actions(5,16,199,276,0,0,3,3,0,0,-7,0,0,0,0,0,0,0,0,0,0,0).
actions(5,16,200,290,0,0,3,3,0,0,0,0,0,0,1,1,1,1,0,0,0,0).
actions(5,16,201,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(5,16,202,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(5,16,203,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(6,17,204,1443,1,6,3,3,0,0,-12,0,6,6,0,1,0,0,0,0,2,1).
actions(6,17,205,1430,2,3,3,3,0,2,-10,1,5,6,1,4,0,1,0,0,4,1).
actions(6,17,206,1949,7,9,3,3,0,0,-13,2,8,10,0,4,1,2,0,0,14,1).
actions(6,17,207,2357,8,14,3,3,0,1,-8,0,2,2,7,3,2,2,0,0,16,1).
actions(6,17,208,1553,4,11,3,3,2,3,-19,1,0,1,4,2,0,5,0,0,11,1).
actions(6,17,209,488,1,4,3,3,0,0,-3,1,0,1,0,3,0,0,0,0,2,0).
actions(6,17,210,1544,4,6,3,3,1,1,3,0,2,2,0,3,2,0,0,0,13,0).
actions(6,17,211,1129,1,3,3,3,0,0,6,0,0,0,3,2,1,0,0,0,2,0).
actions(6,17,212,1388,6,11,3,3,2,3,6,0,0,0,1,3,0,4,0,2,17,0).
actions(6,17,213,349,0,0,3,3,0,0,3,0,1,1,0,0,0,0,0,0,0,0).
actions(6,17,214,633,1,3,3,3,0,0,2,0,1,1,1,0,1,0,1,0,2,0).
actions(6,17,215,137,0,0,3,3,0,0,-5,0,0,0,0,0,0,0,0,0,0,0).
actions(6,17,216,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(6,18,217,2333,11,20,3,3,9,11,22,0,7,7,8,2,1,6,0,0,32,1).
actions(6,18,218,997,1,3,3,3,0,0,2,1,4,5,1,0,1,0,0,0,2,1).
actions(6,18,219,2057,8,16,3,3,2,3,27,1,3,4,2,0,1,1,0,0,18,1).
actions(6,18,220,1448,2,4,3,3,0,0,10,0,3,3,0,4,0,1,0,0,5,1).
actions(6,18,221,2190,4,8,3,3,1,1,9,0,3,3,4,1,0,0,0,0,12,1).
actions(6,18,222,1170,1,4,3,3,0,0,-5,1,2,3,2,2,1,1,0,0,2,0).
actions(6,18,223,1211,0,1,3,3,1,2,-6,0,0,0,2,1,1,3,0,0,1,0).
actions(6,18,224,1482,2,5,3,3,2,2,-5,0,4,4,0,1,0,2,0,1,8,0).
actions(6,18,225,1512,5,5,3,3,3,3,-4,3,4,7,0,3,0,1,2,0,13,0).
actions(6,18,226,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(6,18,227,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(6,18,228,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(6,18,229,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(7,19,230,1906,6,16,3,3,0,0,-15,0,1,1,1,3,2,2,1,0,14,1).
actions(7,19,231,1612,7,13,3,3,2,2,-10,4,4,8,1,2,0,1,0,3,16,1).
actions(7,19,232,2094,6,13,3,3,0,0,-3,7,6,13,6,2,0,3,3,1,12,1).
actions(7,19,233,2620,5,10,3,3,9,11,-6,2,3,5,11,3,1,3,0,0,20,1).
actions(7,19,234,2286,7,21,3,3,11,14,-9,3,6,9,7,3,0,0,0,1,25,1).
actions(7,19,235,1828,4,6,3,3,4,5,15,0,5,5,2,0,1,1,1,0,14,0).
actions(7,19,236,1043,3,8,3,3,1,2,1,1,4,5,0,4,1,2,0,0,7,0).
actions(7,19,237,1011,1,1,3,3,1,2,2,1,3,4,0,3,0,1,0,0,3,0).
actions(7,19,238,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(7,19,239,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(7,19,240,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(7,19,241,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(7,19,242,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(7,20,243,1775,11,19,3,3,2,3,-1,0,1,1,3,4,1,3,1,0,26,1).
actions(7,20,244,2370,12,21,3,3,4,6,19,4,10,14,1,1,0,1,2,0,28,1).
actions(7,20,245,1692,5,9,3,3,0,0,23,8,8,16,0,4,2,2,0,2,10,1).
actions(7,20,246,1704,5,10,3,3,2,2,2,3,2,5,2,3,0,2,1,1,14,1).
actions(7,20,247,2306,7,17,3,3,1,3,6,1,2,3,13,5,1,1,0,1,20,1).
actions(7,20,248,1215,2,5,3,3,0,1,3,0,0,0,0,1,0,2,0,0,4,0).
actions(7,20,249,681,0,4,3,3,0,0,-3,3,4,7,1,3,0,0,0,0,0,0).
actions(7,20,250,807,1,4,3,3,0,0,-12,0,1,1,0,1,0,0,0,1,2,0).
actions(7,20,251,1397,3,6,3,3,6,6,-1,0,2,2,8,3,1,0,0,0,12,0).
actions(7,20,252,452,0,2,3,3,0,0,-11,0,1,1,0,1,0,0,1,0,0,0).
actions(7,20,253,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(7,20,254,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(7,20,255,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(8,21,256,1493,2,3,3,3,0,1,-4,0,3,3,2,3,0,1,0,0,5,1).
actions(8,21,257,2130,7,10,3,3,4,4,-11,0,3,3,4,5,4,3,3,0,23,1).
actions(8,21,258,1617,3,8,3,3,2,3,11,2,3,5,2,3,1,1,0,0,8,1).
actions(8,21,259,2074,8,16,3,3,0,0,-3,0,3,3,4,2,0,3,0,0,19,1).
actions(8,21,260,2028,7,14,3,3,2,2,1,1,8,9,9,3,3,3,0,0,16,1).
actions(8,21,261,1078,3,8,3,3,0,0,-7,0,1,1,3,4,0,5,0,0,6,0).
actions(8,21,262,1239,2,3,3,3,1,7,-16,1,8,9,0,1,0,2,3,0,5,0).
actions(8,21,263,1148,3,8,3,3,3,3,-5,2,2,4,1,2,1,0,0,0,10,0).
actions(8,21,264,852,0,5,3,3,0,0,-9,0,0,0,0,2,1,1,0,0,0,0).
actions(8,21,265,742,1,2,3,3,0,0,3,0,3,3,0,2,1,1,0,0,3,0).
actions(8,21,266,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(8,21,267,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(8,22,268,1727,4,9,3,3,0,0,9,2,3,5,4,2,2,1,0,0,9,1).
actions(8,22,269,2156,9,15,3,3,9,13,9,5,12,17,4,1,3,3,0,1,28,1).
actions(8,22,270,1270,1,8,3,3,0,0,-10,2,2,4,2,4,0,1,0,2,2,1).
actions(8,22,271,1611,3,10,3,3,4,5,-11,0,2,2,2,2,0,3,0,0,11,1).
actions(8,22,272,2006,4,11,3,3,3,3,15,1,2,3,5,0,1,4,0,2,12,1).
actions(8,22,273,1494,7,12,3,3,6,6,23,1,4,5,5,1,1,1,0,0,22,0).
actions(8,22,274,1313,2,5,3,3,0,0,19,1,3,4,1,4,0,0,0,0,4,0).
actions(8,22,275,855,2,6,3,3,2,3,4,0,4,4,0,1,1,1,0,1,6,0).
actions(8,22,276,874,2,5,3,3,0,0,-7,0,1,1,2,0,2,1,0,0,4,0).
actions(8,22,277,265,1,2,3,3,0,0,-3,0,2,2,0,1,0,1,0,0,2,0).
actions(8,22,278,828,1,1,3,3,0,0,-8,1,1,2,0,1,0,0,0,0,3,0).
actions(8,22,279,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(9,23,280,1795,4,9,3,3,0,0,-22,0,2,2,1,1,0,1,0,0,11,1).
actions(9,23,281,1188,2,5,3,3,0,0,-11,1,1,2,1,1,2,0,1,1,4,1).
actions(9,23,282,1616,3,7,3,3,0,0,-21,2,9,11,1,3,0,1,1,1,6,1).
actions(9,23,283,2392,8,12,3,3,2,3,0,0,2,2,5,3,0,4,1,0,20,1).
actions(9,23,284,1756,4,16,3,3,2,3,-24,0,1,1,6,2,0,5,0,2,10,1).
actions(9,23,285,1633,5,12,3,3,2,2,0,4,4,8,2,5,2,0,0,1,12,0).
actions(9,23,286,1600,5,7,3,3,2,2,10,0,2,2,1,2,0,1,0,0,14,0).
actions(9,23,287,1238,4,5,3,3,1,3,15,0,5,5,0,3,1,1,0,0,11,0).
actions(9,23,288,1124,2,5,3,3,0,0,18,1,2,3,9,1,1,1,0,0,4,0).
actions(9,23,289,59,1,1,3,3,0,0,5,1,0,1,0,0,0,0,0,0,2,0).
actions(9,23,290,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(9,23,291,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(9,23,292,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(9,24,293,1250,0,5,3,3,3,4,2,3,3,6,0,2,1,1,0,1,3,1).
actions(9,24,294,1633,1,2,3,3,0,0,-3,3,2,5,1,1,0,0,1,0,2,1).
actions(9,24,295,2403,8,19,3,3,3,3,-2,3,8,11,0,3,0,0,2,1,19,1).
actions(9,24,296,1625,3,7,3,3,3,4,-1,0,3,3,2,2,1,1,0,0,9,1).
actions(9,24,297,2292,6,22,3,3,9,10,16,1,4,5,10,2,1,1,1,1,21,1).
actions(9,24,298,1220,4,4,3,3,7,8,9,3,5,8,2,1,1,1,0,0,15,0).
actions(9,24,299,477,2,2,3,3,0,0,8,0,0,0,0,0,1,0,1,0,4,0).
actions(9,24,300,1255,3,6,3,3,2,2,7,1,5,6,1,2,1,3,0,0,9,0).
actions(9,24,301,588,0,2,3,3,0,0,-10,0,1,1,1,1,0,2,0,0,0,0).
actions(9,24,302,1657,7,9,3,3,2,3,4,1,2,3,0,1,0,1,0,0,18,0).
actions(9,24,303,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(9,24,304,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(9,24,305,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(10,1,1,2134,6,13,3,3,0,0,18,2,3,5,7,2,2,1,0,0,16,1).
actions(10,1,2,1952,12,20,3,3,7,8,27,1,14,15,6,2,1,2,2,1,31,1).
actions(10,1,3,2043,4,5,3,3,2,2,21,3,7,10,1,2,0,0,2,0,10,1).
actions(10,1,4,1952,4,12,3,3,0,0,17,0,4,4,6,1,0,1,1,0,10,1).
actions(10,1,5,2130,10,22,3,3,9,9,24,0,2,2,8,3,3,2,0,3,34,1).
actions(10,1,6,1077,3,7,3,3,1,2,-13,3,3,6,0,2,3,1,0,3,7,0).
actions(10,1,7,1490,3,11,3,3,0,0,2,0,1,1,3,4,1,0,0,1,8,0).
actions(10,1,8,676,4,7,3,3,0,0,-13,2,3,5,1,1,0,2,0,1,8,0).
actions(10,1,9,559,0,0,3,3,0,0,-5,0,1,1,0,0,0,0,0,0,0,0).
actions(10,1,10,129,0,0,3,3,0,0,-6,0,1,1,0,0,0,1,0,0,0,0).
actions(10,1,11,129,0,2,3,3,0,0,-6,0,0,0,0,0,0,0,0,1,0,0).
actions(10,1,12,92,0,0,3,3,0,0,-4,0,0,0,0,1,0,0,0,0,0,0).
actions(10,1,13,37,0,0,3,3,0,0,-2,0,0,0,0,0,0,0,0,0,0,0).
actions(10,2,14,1821,6,10,3,3,3,4,-20,0,4,4,1,2,2,1,0,0,17,1).
actions(10,2,15,1700,4,9,3,3,1,1,-18,1,3,4,7,4,1,3,2,2,9,1).
actions(10,2,16,1744,6,16,3,3,0,0,-19,1,5,6,2,2,1,2,3,0,12,1).
actions(10,2,17,1597,2,7,3,3,0,0,-20,0,2,2,2,0,0,1,0,0,4,1).
actions(10,2,18,1155,2,4,3,3,2,2,-14,0,6,6,5,3,1,1,0,0,8,1).
actions(10,2,19,1308,2,5,3,3,6,6,8,0,4,4,10,1,0,1,1,1,10,0).
actions(10,2,20,788,0,4,3,3,0,0,7,0,0,0,0,1,0,0,0,1,0,0).
actions(10,2,21,1108,1,3,3,3,1,2,5,1,5,6,1,0,0,0,2,0,3,0).
actions(10,2,22,1208,3,8,3,3,2,2,8,4,5,9,2,3,0,1,2,0,9,0).
actions(10,2,23,1971,15,26,3,3,4,5,3,2,2,4,1,0,2,1,0,1,40,0).
actions(10,2,24,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(10,2,25,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(10,2,26,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(11,3,27,2437,7,9,3,3,0,1,5,2,6,8,7,0,1,0,0,0,16,1).
actions(11,3,28,2525,4,9,3,3,0,0,12,1,6,7,6,3,2,2,1,1,9,1).
actions(11,3,29,1994,9,12,3,3,2,4,-2,4,4,8,0,1,0,1,1,1,20,1).
actions(11,3,30,2830,11,24,3,3,1,1,6,0,5,5,5,3,1,2,0,2,27,1).
actions(11,3,31,2587,10,17,3,3,0,0,8,0,5,5,5,3,1,2,0,2,27,1).
actions(11,3,32,1026,4,7,3,3,0,0,6,2,7,9,1,3,0,4,0,1,8,0).
actions(11,3,33,785,0,0,3,3,0,0,-5,0,0,0,1,1,0,1,1,0,0,0).
actions(11,3,34,783,0,3,3,3,0,0,-9,0,0,0,3,1,0,1,0,0,0,0).
actions(11,3,35,933,7,10,3,3,0,0,-11,0,4,4,0,2,0,0,0,0,19,0).
actions(11,3,36,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(11,3,37,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(11,3,38,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(11,4,39,2154,4,8,3,3,0,0,-8,4,6,10,2,1,0,1,1,0,8,1).
actions(11,4,40,2380,13,21,3,3,1,3,-1,1,10,11,3,0,2,0,1,1,33,1).
actions(11,4,41,424,1,2,3,3,0,0,-15,2,1,3,0,1,0,0,0,0,2,1).
actions(11,4,42,2561,11,23,3,3,3,4,-9,1,1,2,6,0,2,2,1,1,27,1).
actions(11,4,43,2198,3,9,3,3,1,1,-8,0,2,2,6,2,0,3,0,0,8,1).
actions(11,4,44,1858,4,13,3,3,1,2,9,2,2,4,4,2,2,0,1,0,12,0).
actions(11,4,45,1523,5,6,3,3,4,4,-3,4,1,5,0,0,0,1,1,0,14,0).
actions(11,4,46,982,3,7,3,3,2,2,6,0,1,1,4,3,0,0,0,1,10,0).
actions(11,4,47,1141,0,3,3,3,0,0,15,0,2,2,2,0,0,0,0,0,0,0).
actions(11,4,48,679,3,4,3,3,0,0,4,1,2,3,0,3,1,1,0,0,6,0).
actions(11,4,49,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(11,4,50,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(11,4,51,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(12,5,52,2477,7,15,3,3,0,2,-9,0,8,8,4,2,1,2,0,2,16,1).
actions(12,5,53,506,0,2,3,3,0,0,-6,1,1,2,0,4,0,0,0,0,0,1).
actions(12,5,54,2142,5,8,3,3,2,6,-8,6,17,23,0,1,1,3,2,1,12,1).
actions(12,5,55,2166,4,10,3,3,16,16,-17,6,17,23,0,1,1,3,2,1,12,1).
actions(12,5,56,1975,6,14,3,3,2,2,-14,1,3,4,2,0,1,2,0,1,16,1).
actions(12,5,57,1335,3,10,3,3,0,0,-5,1,1,2,0,2,0,0,0,0,7,0).
actions(12,5,58,1532,4,9,3,3,0,0,9,0,2,2,3,2,0,0,1,1,10,0).
actions(12,5,59,1390,1,8,3,3,0,0,-1,0,1,1,1,1,0,2,0,0,2,0).
actions(12,5,60,877,2,8,3,3,2,2,6,0,1,1,3,2,1,2,0,0,7,0).
actions(12,5,61,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(12,5,62,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(12,5,63,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(12,5,64,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(12,6,65,2034,13,21,3,3,2,2,17,0,4,4,3,2,1,1,0,0,32,1).
actions(12,6,66,1406,2,4,3,3,0,0,11,0,6,6,1,1,1,2,0,0,4,1).
actions(12,6,67,1658,5,6,3,3,1,3,8,3,3,6,4,2,1,2,2,1,11,1).
actions(12,6,68,1751,6,12,3,3,5,6,4,0,6,6,2,2,2,1,1,1,17,1).
actions(12,6,69,2129,6,14,3,3,0,0,7,0,3,3,6,4,2,1,0,0,12,1).
actions(12,6,70,1643,1,3,3,3,2,4,4,0,2,2,2,5,1,1,0,0,4,0).
actions(12,6,71,1194,6,12,3,3,1,2,1,2,2,4,2,4,0,4,2,0,13,0).
actions(12,6,72,1474,4,7,3,3,0,0,-2,1,6,7,1,2,1,1,0,1,10,0).
actions(12,6,73,1039,1,3,3,3,0,0,-3,0,4,4,2,4,0,0,0,0,2,0).
actions(12,6,74,44,0,1,3,3,0,0,-2,0,0,0,0,0,0,0,0,0,0,0).
actions(12,6,75,28,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(12,6,76,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(12,6,77,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(13,20,243,2240,9,20,3,3,3,7,-11,0,5,5,1,4,2,1,1,1,24,1).
actions(13,20,244,1867,6,21,3,3,5,6,6,7,9,16,2,4,3,0,1,2,17,1).
actions(13,20,245,1880,5,9,3,3,3,6,-5,6,8,14,0,2,0,1,1,1,13,1).
actions(13,20,246,2368,3,11,3,3,3,3,3,3,2,5,3,1,0,1,0,1,10,1).
actions(13,20,247,2107,4,11,3,3,2,3,2,0,2,2,9,2,1,1,0,0,12,1).
actions(13,20,248,1936,6,12,3,3,3,3,-16,0,1,1,0,0,0,0,1,0,16,0).
actions(13,20,249,529,0,1,3,3,0,0,6,1,1,2,0,0,0,0,0,0,0,0).
actions(13,20,250,360,0,1,3,3,0,0,-5,0,1,1,1,1,0,0,0,1,0,0).
actions(13,20,251,773,1,5,3,3,0,0,-9,0,1,1,0,2,1,1,0,1,2,0).
actions(13,20,252,340,0,2,3,3,0,0,-6,0,0,0,0,2,0,0,0,0,0,0).
actions(13,20,253,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(13,20,254,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(13,20,255,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(13,25,306,2263,9,19,3,3,5,6,9,1,12,13,7,2,2,2,0,1,27,1).
actions(13,25,307,1990,7,10,3,3,1,1,1,2,6,8,3,3,0,0,2,0,15,1).
actions(13,25,308,1742,4,10,3,3,3,4,-4,1,2,3,3,5,0,2,2,0,11,1).
actions(13,25,309,2040,5,10,3,3,0,0,10,0,5,5,4,2,0,3,0,1,11,1).
actions(13,25,310,2323,4,9,3,3,4,5,15,0,1,1,2,3,1,0,0,1,12,1).
actions(13,25,311,890,3,7,3,3,3,4,6,4,3,7,2,4,0,2,0,1,9,0).
actions(13,25,312,1044,2,5,3,3,0,0,1,0,3,3,1,1,0,0,0,0,4,0).
actions(13,25,313,1138,4,5,3,3,2,4,11,2,3,5,1,0,1,0,3,0,10,0).
actions(13,25,314,413,1,2,3,3,0,0,-6,0,1,1,0,0,0,0,0,0,2,0).
actions(13,25,315,557,0,2,3,3,0,0,-8,0,1,1,1,1,0,1,0,0,0,0).
actions(13,25,316,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(13,25,317,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(13,25,318,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(14,6,65,1341,5,13,3,3,4,5,-3,0,1,1,1,1,2,2,0,1,16,1).
actions(14,6,66,1604,2,7,3,3,4,4,-7,0,4,4,1,3,1,1,0,2,8,1).
actions(14,6,67,1367,1,1,3,3,3,3,-6,2,2,4,2,4,1,1,0,0,5,1).
actions(14,6,68,1499,1,4,3,3,2,4,0,1,2,3,3,1,2,1,0,0,4,1).
actions(14,6,69,1654,5,11,3,3,0,0,-9,0,1,1,0,1,1,2,0,1,12,1).
actions(14,6,70,1539,2,5,3,3,6,8,-25,1,2,3,0,2,1,3,0,0,11,0).
actions(14,6,71,1067,1,3,3,3,0,2,-20,1,1,2,1,1,0,2,0,0,3,0).
actions(14,6,72,1282,3,8,3,3,0,0,-21,1,0,1,1,0,0,1,0,0,6,0).
actions(14,6,73,930,2,3,3,3,2,2,-13,0,0,0,0,1,1,1,0,0,6,0).
actions(14,6,74,440,1,2,3,3,0,0,-2,0,0,0,2,0,0,1,0,0,2,0).
actions(14,6,75,440,0,0,3,3,0,0,-2,0,1,1,0,0,0,0,0,0,0,0).
actions(14,6,76,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(14,6,77,1237,3,8,3,3,0,0,-32,1,2,3,0,2,0,1,0,1,8,0).
actions(14,7,78,2121,9,16,3,3,0,0,17,0,8,8,6,3,1,1,0,0,24,1).
actions(14,7,79,2241,8,16,3,3,7,8,21,1,9,10,3,3,2,3,1,0,23,1).
actions(14,7,80,1780,2,2,3,3,0,2,13,1,4,5,1,4,1,2,2,0,4,1).
actions(14,7,81,1446,4,6,3,3,2,3,29,1,2,3,2,5,5,2,0,0,10,0).
actions(14,7,82,1223,2,5,3,3,0,0,4,2,1,3,3,0,0,1,0,0,5,1).
actions(14,7,83,1653,7,10,3,3,0,0,33,1,0,1,0,1,0,0,0,0,17,0).
actions(14,7,84,1230,2,2,3,3,1,1,17,1,1,2,3,2,0,2,0,0,6,0).
actions(14,7,85,363,0,0,3,3,0,0,2,0,0,0,0,1,0,0,0,0,0,0).
actions(14,7,86,363,3,5,3,3,0,0,2,1,1,2,0,1,0,0,0,0,6,0).
actions(14,7,87,363,0,1,3,3,0,0,2,0,0,0,0,0,2,0,0,0,0,0).
actions(14,7,88,363,1,1,3,3,0,0,2,0,1,1,1,1,0,2,0,0,2,0).
actions(14,7,89,1254,4,6,3,3,5,6,-2,1,5,6,2,4,0,2,2,0,13,1).
actions(15,26,319,1262,4,7,3,3,0,0,28,0,2,2,2,0,0,0,0,1,8,1).
actions(15,26,320,1948,6,10,3,3,8,8,18,5,6,11,0,4,2,0,1,2,20,1).
actions(15,26,321,2010,7,16,3,3,2,2,17,0,8,8,5,1,0,1,0,1,20,1).
actions(15,26,322,2011,10,15,3,3,3,4,10,0,0,0,3,3,1,3,0,0,26,1).
actions(15,26,323,1707,7,8,3,3,3,4,20,0,6,6,8,1,1,4,0,0,17,1).
actions(15,26,324,1814,5,9,3,3,2,2,-2,0,4,4,4,2,1,3,0,0,13,0).
actions(15,26,325,1325,1,5,3,3,0,0,8,0,2,2,5,0,0,0,0,0,3,0).
actions(15,26,326,1119,2,3,3,3,0,0,9,1,2,3,0,1,0,1,2,0,4,0).
actions(15,26,327,939,1,3,3,3,1,2,-7,0,1,1,0,2,1,0,1,0,3,0).
actions(15,26,328,156,2,2,3,3,0,0,2,0,0,0,1,1,0,0,0,0,4,0).
actions(15,26,329,109,0,0,3,3,1,2,2,0,0,0,0,0,1,0,0,0,1,0).
actions(15,26,330,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(15,27,331,1271,4,7,3,3,0,0,-12,0,2,2,0,2,1,3,0,0,10,1).
actions(15,27,332,1083,3,5,3,3,2,2,-7,1,4,5,2,4,0,2,3,0,8,1).
actions(15,27,333,1637,3,11,3,3,1,2,-15,4,3,7,2,1,3,3,0,0,7,1).
actions(15,27,334,1725,3,10,3,3,0,0,-18,0,4,4,5,0,0,0,1,0,7,1).
actions(15,27,335,1375,3,8,3,3,2,3,-17,0,2,2,4,1,0,1,0,1,9,1).
actions(15,27,336,750,2,6,3,3,0,0,-20,0,1,1,1,3,0,0,0,0,4,0).
actions(15,27,337,1644,4,10,3,3,6,6,-9,0,0,0,4,4,2,2,0,2,16,0).
actions(15,27,338,1155,4,7,3,3,0,0,-3,0,0,0,0,3,0,0,0,0,10,0).
actions(15,27,339,1259,5,8,3,3,1,2,7,2,5,7,1,1,0,1,0,1,11,0).
actions(15,27,340,1470,3,5,3,3,5,5,-4,0,1,1,1,1,0,4,0,0,14,0).
actions(15,27,341,1031,1,2,3,3,0,0,-7,2,3,5,1,1,0,1,0,0,2,0).
actions(15,27,342,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(15,27,343,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(16,21,256,1578,3,5,3,3,2,2,-22,1,1,2,0,4,0,1,0,0,9,1).
actions(16,21,257,2048,4,13,3,3,3,3,-21,0,5,5,4,2,2,4,0,0,11,1).
actions(16,21,258,1875,5,13,3,3,5,7,-28,4,2,6,2,2,1,1,0,1,15,1).
actions(16,21,259,1507,0,4,3,3,0,0,-16,0,3,3,2,2,0,1,0,0,0,1).
actions(16,21,260,1594,10,18,3,3,2,4,-18,2,5,7,3,3,0,1,1,0,22,1).
actions(16,21,261,1232,2,8,3,3,4,6,-17,0,0,0,4,2,0,1,0,1,8,0).
actions(16,21,262,948,2,5,3,3,0,0,-7,0,1,1,4,5,0,1,1,0,4,0).
actions(16,21,263,1241,5,8,3,3,0,0,-5,0,2,2,0,3,0,1,0,2,12,0).
actions(16,21,264,430,1,2,3,3,0,0,-1,0,0,0,1,0,0,0,0,0,3,0).
actions(16,21,265,889,2,3,3,3,2,2,-4,0,3,3,0,1,0,0,0,0,6,0).
actions(16,21,266,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(16,21,267,1058,1,4,3,3,1,2,-11,0,3,3,1,0,2,0,0,0,3,0).
actions(16,24,293,1183,1,2,3,3,5,6,10,1,5,6,2,0,0,0,0,1,7,1).
actions(16,24,294,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(16,24,295,1835,9,17,3,3,7,10,12,1,9,10,0,0,0,1,0,0,25,1).
actions(16,24,296,1589,5,8,3,3,3,4,10,0,2,2,4,1,1,0,0,0,14,1).
actions(16,24,297,1216,3,6,3,3,2,2,15,0,0,0,5,4,0,0,0,0,8,1).
actions(16,24,298,1617,3,5,3,3,3,6,13,1,7,8,3,2,0,3,1,1,9,1).
actions(16,24,299,1045,1,3,3,3,0,0,18,4,3,7,0,3,0,1,2,0,2,0).
actions(16,24,300,1130,6,10,3,3,2,2,25,0,0,0,3,1,0,0,0,0,15,0).
actions(16,24,301,1202,3,8,3,3,0,0,11,0,2,2,1,1,0,1,0,0,8,0).
actions(16,24,302,1491,4,6,3,3,3,3,17,0,2,2,4,1,0,2,1,0,14,0).
actions(16,24,303,462,2,5,3,3,0,0,4,1,0,1,5,1,0,0,0,0,5,0).
actions(16,24,304,1263,5,8,3,3,2,2,17,1,7,8,5,3,0,1,0,0,16,0).
actions(16,24,305,367,0,1,3,3,0,0,-2,0,1,1,0,0,0,0,0,0,0,0).
actions(17,5,52,2138,8,16,3,3,3,3,-10,1,6,7,3,4,2,4,0,0,20,1).
actions(17,5,53,1361,6,11,3,3,1,1,2,3,2,5,1,5,0,3,0,0,13,0).
actions(17,5,54,1913,3,5,3,3,3,6,-1,2,13,15,0,3,1,3,0,0,9,1).
actions(17,5,55,2377,7,17,3,3,10,12,-14,0,6,6,4,4,2,1,0,0,26,1).
actions(17,5,56,2332,6,18,3,3,1,2,15,1,0,1,7,4,2,2,1,1,16,1).
actions(17,5,57,1397,2,4,3,3,3,4,8,1,4,5,1,2,0,0,0,0,8,0).
actions(17,5,58,1045,2,3,3,3,0,0,-3,0,1,1,2,3,0,0,0,0,4,0).
actions(17,5,59,1058,2,8,3,3,1,2,-2,1,3,4,1,2,1,0,0,1,7,0).
actions(17,5,60,191,0,1,3,3,0,0,-8,0,0,0,0,1,0,1,0,0,0,0).
actions(17,5,61,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(17,5,62,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(17,5,63,588,0,4,3,3,0,0,-7,1,2,3,0,2,0,1,0,1,0,1).
actions(17,5,64,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(17,17,204,2079,6,12,3,3,1,2,8,0,9,9,0,3,0,4,0,0,14,1).
actions(17,17,205,178,0,0,3,3,0,0,-4,0,2,2,0,0,0,0,0,0,0,1).
actions(17,17,206,1799,4,7,3,3,7,9,12,1,5,6,1,3,1,1,1,0,15,1).
actions(17,17,207,2407,10,19,3,3,8,10,0,0,6,6,4,5,2,2,0,0,29,1).
actions(17,17,209,1540,3,7,3,3,1,3,2,0,2,2,1,1,1,1,1,0,8,0).
actions(17,17,210,855,1,4,3,3,0,0,6,0,0,0,0,4,1,1,0,0,3,0).
actions(17,17,211,1325,3,8,3,3,4,4,-6,0,3,3,2,0,0,1,0,0,12,0).
actions(17,17,212,2394,4,12,3,3,3,4,6,0,4,4,8,4,1,0,0,1,15,1).
actions(17,17,213,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(17,17,214,755,1,4,3,3,2,2,2,1,0,1,2,2,0,1,0,0,4,0).
actions(17,17,215,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(17,17,216,1068,2,2,3,3,3,5,-6,1,2,3,2,3,1,2,1,0,7,0).
actions(17,17,344,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(18,15,180,1948,3,13,3,3,7,7,-22,0,1,1,3,2,1,1,1,0,13,1).
actions(18,15,181,905,2,2,3,3,4,4,-23,0,1,1,0,1,0,1,0,0,8,1).
actions(18,15,182,644,3,5,3,3,0,0,-10,1,0,1,0,0,0,0,0,0,6,1).
actions(18,15,183,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(18,15,184,1264,1,6,3,3,0,0,-22,0,0,0,1,3,3,0,0,0,2,1).
actions(18,15,185,2183,8,15,3,3,8,10,-9,1,3,4,1,5,1,1,0,0,25,0).
actions(18,15,186,1971,3,10,3,3,0,0,-6,3,5,8,1,1,1,1,0,2,8,0).
actions(18,15,187,1156,0,3,3,3,0,0,-3,0,0,0,6,1,2,0,0,0,0,0).
actions(18,15,188,1252,5,10,3,3,4,6,8,3,1,4,1,5,1,2,0,1,14,0).
actions(18,15,189,386,0,1,3,3,0,0,1,0,1,1,1,1,0,0,0,0,0,0).
actions(18,15,190,776,1,3,3,3,1,2,-18,1,1,2,0,1,1,1,0,1,3,0).
actions(18,15,191,1915,6,13,3,3,1,1,-26,1,6,7,6,2,0,7,1,0,13,1).
actions(18,23,280,1718,7,13,3,3,1,1,26,1,6,7,0,2,1,0,0,0,18,1).
actions(18,23,281,1479,3,5,3,3,4,6,26,1,4,5,1,1,0,1,1,0,10,1).
actions(18,23,282,1678,10,13,3,3,2,2,26,1,7,8,4,2,3,1,1,0,22,1).
actions(18,23,283,1877,7,8,3,3,4,4,20,0,2,2,2,3,1,3,0,0,19,1).
actions(18,23,284,1668,5,10,3,3,3,3,30,0,3,3,10,3,2,4,0,2,13,1).
actions(18,23,285,1086,1,5,3,3,0,0,-1,0,2,2,1,3,0,2,1,0,2,0).
actions(18,23,286,1687,3,6,3,3,0,0,4,1,1,2,2,1,0,0,0,0,8,0).
actions(18,23,287,940,4,6,3,3,2,2,-3,0,2,2,1,5,1,3,0,0,12,0).
actions(18,23,288,1188,1,1,3,3,0,0,-7,1,3,4,8,1,0,2,0,0,2,0).
actions(18,23,289,355,0,1,3,3,0,0,1,0,4,4,0,2,0,2,1,0,0,0).
actions(18,23,290,355,3,3,3,3,2,3,1,1,0,1,0,0,0,1,0,0,9,0).
actions(18,23,291,222,0,0,3,3,0,0,3,0,0,0,0,1,0,2,0,0,0,0).
actions(18,23,292,147,1,1,3,3,0,0,4,0,1,1,0,0,0,0,0,0,3,0).
actions(19,16,192,1835,2,3,3,3,2,2,0,0,2,2,3,3,2,1,0,0,8,1).
actions(19,16,193,1440,5,8,3,3,2,3,-2,1,5,6,2,1,0,4,0,0,12,1).
actions(19,16,194,2277,5,10,3,3,0,0,5,2,8,10,6,4,2,1,0,1,10,1).
actions(19,16,195,2453,6,16,3,3,2,2,11,1,1,2,2,2,3,0,0,1,17,1).
actions(19,16,196,1851,7,13,3,3,2,2,0,1,2,3,6,1,2,2,0,0,17,1).
actions(19,16,197,1696,8,15,3,3,3,4,18,0,1,1,5,3,2,3,0,0,23,0).
actions(19,16,198,1692,4,9,3,3,2,2,22,2,5,7,2,2,2,2,2,1,10,0).
actions(19,16,199,351,1,1,3,3,0,0,1,0,3,3,0,1,0,0,1,0,2,0).
actions(19,16,200,805,2,3,3,3,0,0,10,0,3,3,1,2,0,0,0,0,6,0).
actions(19,16,201,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(19,16,202,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(19,16,203,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(19,22,268,2186,3,8,3,3,2,3,-5,3,3,6,3,2,0,1,0,2,8,1).
actions(19,22,269,2239,8,17,3,3,5,7,-4,2,9,11,3,3,2,1,1,1,22,1).
actions(19,22,270,611,0,2,3,3,0,0,-2,0,1,1,1,2,0,0,0,0,0,1).
actions(19,22,271,2010,4,9,3,3,0,0,-4,0,4,4,1,0,0,4,0,0,12,1).
actions(19,22,272,2104,7,14,3,3,4,5,1,1,1,2,8,2,2,4,0,0,21,1).
actions(19,22,273,1263,1,4,3,3,4,5,-8,0,2,2,5,1,1,5,0,0,6,0).
actions(19,22,274,1552,4,5,3,3,0,0,-5,0,5,5,3,3,2,0,1,0,8,0).
actions(19,22,275,641,1,3,3,3,0,0,-9,1,2,3,0,1,0,0,1,0,2,0).
actions(19,22,276,776,2,5,3,3,1,2,-14,0,1,1,0,3,0,1,0,0,5,0).
actions(19,22,277,717,2,4,3,3,4,4,-6,2,1,3,0,0,0,0,0,0,8,0).
actions(19,22,278,301,0,1,3,3,0,0,-9,0,0,0,0,0,0,0,0,0,0,0).
actions(19,22,279,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(20,18,217,1761,7,12,3,3,2,5,18,0,4,4,8,0,1,2,1,0,17,1).
actions(20,18,218,1497,3,5,3,3,0,0,12,1,4,5,0,1,1,0,0,0,6,1).
actions(20,18,219,1575,7,13,3,3,0,0,13,0,0,0,2,1,1,2,1,0,15,1).
actions(20,18,220,1575,3,7,3,3,3,4,13,4,3,7,3,2,2,0,0,1,9,1).
actions(20,18,221,1954,6,8,3,3,0,1,8,0,4,4,3,2,2,1,0,0,14,1).
actions(20,18,222,974,3,6,3,3,0,0,14,1,2,3,2,3,0,2,0,1,7,0).
actions(20,18,223,1518,3,9,3,3,0,0,9,0,2,2,3,1,1,0,1,0,7,0).
actions(20,18,224,1501,3,6,3,3,0,0,17,0,2,2,0,1,1,0,0,0,9,0).
actions(20,18,225,1052,2,4,3,3,4,4,15,2,5,7,0,1,1,1,2,0,8,0).
actions(20,18,226,331,0,0,3,3,0,0,-8,0,1,1,0,0,1,1,0,0,0,0).
actions(20,18,227,331,1,5,3,3,0,0,-8,0,0,0,1,0,1,0,0,1,2,0).
actions(20,18,228,331,1,2,3,3,0,0,-8,0,0,0,0,0,0,0,0,0,2,0).
actions(20,19,230,1955,2,10,3,3,0,0,-15,1,3,4,2,4,1,3,0,1,4,1).
actions(20,19,231,2069,7,15,3,3,0,0,-1,1,6,7,2,2,0,2,1,1,14,1).
actions(20,19,232,1526,3,5,3,3,2,2,-14,6,10,16,4,2,0,0,0,0,8,1).
actions(20,19,233,2724,6,12,3,3,6,6,-13,0,3,3,6,1,1,5,0,0,19,1).
actions(20,19,234,2502,4,11,3,3,1,1,-27,1,4,5,2,2,1,5,1,0,11,1).
actions(20,19,235,1305,2,5,3,3,0,0,-6,1,1,2,1,1,0,1,1,1,5,0).
actions(20,19,236,901,5,9,3,3,0,0,-19,0,1,1,0,3,0,0,0,0,10,0).
actions(20,19,237,932,1,3,3,3,0,0,-12,0,2,2,1,1,0,0,0,2,2,0).
actions(20,19,238,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(20,19,239,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(20,19,240,331,1,1,3,3,0,0,8,1,0,1,0,0,0,1,0,0,2,0).
actions(20,19,241,154,1,2,3,3,0,0,4,0,1,1,0,0,0,0,0,0,2,0).
actions(20,19,242,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(20,18,345,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(21,9,103,822,3,9,3,3,0,0,-10,0,3,3,0,0,0,0,0,0,6,1).
actions(21,9,104,1614,1,8,3,3,2,2,-12,2,3,5,3,2,0,2,1,2,4,1).
actions(21,9,105,1998,9,18,3,3,0,0,-19,3,4,7,4,2,1,0,0,2,18,1).
actions(21,9,106,2057,6,9,3,3,0,0,-19,1,5,6,0,1,1,1,0,0,14,1).
actions(21,9,107,1996,3,15,3,3,0,0,-6,0,0,0,8,5,1,3,0,0,7,1).
actions(21,9,108,884,3,8,3,3,0,0,-8,0,3,3,3,1,0,2,0,1,6,0).
actions(21,9,109,1008,5,8,3,3,0,0,2,3,3,6,0,1,1,1,2,0,10,0).
actions(21,9,110,1703,4,8,3,3,0,0,-6,0,4,4,3,0,0,0,0,0,9,0).
actions(21,9,111,466,1,3,3,3,0,0,1,1,1,2,0,1,1,0,0,1,2,0).
actions(21,9,112,768,0,3,3,3,0,2,-6,1,0,1,1,0,1,2,0,0,0,0).
actions(21,9,113,880,3,4,3,3,2,2,9,0,1,1,2,2,0,0,0,0,8,0).
actions(21,9,114,204,2,2,3,3,0,0,4,0,0,0,0,0,0,0,0,0,4,0).
actions(21,9,115,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(21,14,167,2027,2,7,3,3,2,2,11,1,1,2,2,1,1,1,1,0,6,1).
actions(21,14,168,2167,9,15,3,3,4,5,14,4,12,16,10,2,1,2,1,0,24,1).
actions(21,14,170,2024,10,18,3,3,0,0,15,0,2,2,2,2,1,2,0,0,21,1).
actions(21,14,171,2006,5,11,3,3,3,4,15,1,2,3,7,3,3,2,0,0,14,1).
actions(21,14,172,1532,4,6,3,3,0,0,5,2,7,9,0,2,1,5,1,1,8,1).
actions(21,14,173,874,1,6,3,3,0,0,-1,1,0,1,7,1,1,1,0,1,2,0).
actions(21,14,174,620,2,3,3,3,1,2,2,0,3,3,1,0,0,0,0,0,5,0).
actions(21,14,175,903,1,5,3,3,0,0,1,0,1,1,0,0,0,0,0,1,3,0).
actions(21,14,176,93,0,0,3,3,0,0,-2,0,0,0,0,0,0,0,0,0,0,0).
actions(21,14,177,853,4,5,3,3,0,0,3,0,2,2,0,0,0,0,0,0,8,0).
actions(21,14,178,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(21,14,179,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(21,14,346,1301,5,5,3,3,1,3,7,3,4,7,2,2,0,1,3,0,11,0).
actions(22,3,27,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(22,3,28,1925,4,10,3,3,0,0,-19,0,8,8,4,3,0,1,2,2,8,1).
actions(22,3,29,264,0,0,3,3,0,0,-2,0,0,0,0,1,0,1,0,0,0,1).
actions(22,3,30,1963,5,8,3,3,2,2,-25,0,2,2,2,2,0,0,0,0,15,1).
actions(22,3,31,1843,5,15,3,3,0,0,-19,0,0,0,10,2,1,4,0,0,11,1).
actions(22,3,32,1793,10,16,3,3,2,2,4,4,5,9,0,4,1,2,0,0,22,0).
actions(22,3,33,2138,3,12,3,3,4,4,-13,0,2,2,0,2,1,2,0,0,11,1).
actions(22,3,34,1422,0,1,3,3,0,0,-9,0,1,1,3,0,1,1,0,0,0,0).
actions(22,3,35,2066,6,18,3,3,1,1,-19,0,2,2,2,3,1,0,0,0,16,0).
actions(22,3,36,986,3,5,3,3,1,1,-3,0,2,2,2,3,1,0,0,0,16,0).
actions(22,3,37,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(22,28,347,1765,4,9,3,3,3,3,15,0,4,4,1,0,4,1,0,0,11,1).
actions(22,28,348,1221,7,11,3,3,1,2,7,3,5,8,0,2,0,1,0,0,15,1).
actions(22,28,349,2008,3,9,3,3,2,2,12,1,2,3,5,0,0,0,0,0,8,1).
actions(22,28,350,1610,2,5,3,3,0,0,20,0,4,4,2,2,0,1,1,0,5,1).
actions(22,28,351,1695,7,13,3,3,4,4,16,0,3,3,8,1,0,4,0,1,18,1).
actions(22,28,352,1148,4,8,3,3,4,4,21,2,4,6,5,2,1,2,1,0,13,0).
actions(22,28,353,650,1,2,3,3,2,4,-1,1,6,7,2,2,1,2,0,1,4,0).
actions(22,28,354,1185,6,8,3,3,0,0,5,0,3,3,2,1,0,1,0,0,13,0).
actions(22,28,355,1665,5,10,3,3,2,2,9,0,1,1,1,0,0,0,0,0,12,0).
actions(22,28,356,820,4,5,3,3,1,1,5,1,4,5,2,2,0,1,0,0,9,0).
actions(22,28,357,632,1,3,3,3,0,0,-4,0,1,1,1,0,0,0,0,0,3,0).
actions(22,28,358,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(22,28,359,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(22,3,391,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(23,10,116,1341,2,6,3,3,0,2,7,1,3,4,0,3,2,0,0,0,6,1).
actions(23,10,117,1606,14,19,3,3,6,8,17,2,11,13,2,5,0,1,3,1,34,1).
actions(23,10,118,1584,5,11,3,3,4,4,14,1,1,2,0,1,1,1,2,1,15,1).
actions(23,10,119,1814,4,9,3,3,0,0,19,1,2,3,7,3,0,1,0,0,9,1).
actions(23,10,120,2007,3,7,3,3,8,10,29,0,3,3,12,4,1,3,0,0,14,1).
actions(23,10,121,996,3,5,3,3,0,0,18,0,2,2,0,1,0,1,3,1,8,0).
actions(23,10,122,1436,5,13,3,3,0,1,13,2,2,4,7,3,0,1,0,2,12,0).
actions(23,10,123,1784,9,12,3,3,0,0,18,0,3,3,1,3,2,1,2,1,24,0).
actions(23,10,124,1282,5,6,3,3,0,0,16,1,4,5,2,4,2,0,2,1,10,0).
actions(23,10,125,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(23,10,126,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(23,10,127,551,2,4,3,3,0,0,-1,0,1,1,3,2,0,2,0,0,5,0).
actions(23,10,128,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(23,12,141,1265,0,3,3,3,5,10,-7,2,5,7,1,2,0,1,0,0,5,1).
actions(23,12,142,630,3,4,3,3,0,0,-9,0,3,3,1,2,0,0,0,0,6,1).
actions(23,12,143,1210,4,9,3,3,1,2,-10,2,4,6,1,3,0,1,1,2,9,1).
actions(23,12,144,1962,9,17,3,3,9,9,-18,2,6,8,3,2,0,3,0,4,27,1).
actions(23,12,145,1209,3,7,3,3,0,0,-13,0,1,1,6,1,0,2,0,2,6,1).
actions(23,12,146,1235,3,5,3,3,3,4,-19,0,2,2,1,1,0,0,1,0,9,0).
actions(23,12,147,1182,3,6,3,3,3,4,-21,0,4,4,2,3,2,1,0,1,9,0).
actions(23,12,148,1652,1,4,3,3,4,6,-17,0,3,3,2,1,1,4,0,1,6,0).
actions(23,12,149,1748,5,12,3,3,5,5,-17,1,1,2,2,5,0,1,1,2,17,0).
actions(23,12,150,1795,4,5,3,3,5,5,-13,1,4,5,1,3,1,1,4,0,13,0).
actions(23,12,151,511,0,2,3,3,0,0,-6,0,1,1,1,2,1,2,0,0,0,0).
actions(23,12,152,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(23,12,153,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(24,13,154,2196,7,16,3,3,3,4,0,3,3,6,1,2,1,3,1,1,19,1).
actions(24,13,155,1440,2,5,3,3,6,6,19,0,3,3,0,3,1,2,1,0,12,0).
actions(24,13,156,1754,2,2,3,3,0,0,-20,1,10,11,0,4,0,0,1,0,4,1).
actions(24,13,157,2543,9,16,3,3,3,3,3,0,3,3,5,3,3,2,1,1,23,1).
actions(24,13,158,2116,6,17,3,3,4,5,5,0,2,2,9,3,3,2,0,1,20,1).
actions(24,13,160,1033,2,4,3,3,0,0,5,0,0,0,0,1,1,0,0,0,5,0).
actions(24,13,161,271,0,1,3,3,0,0,-4,0,0,0,0,0,0,0,0,0,0,0).
actions(24,13,162,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(24,13,163,612,1,1,3,3,2,2,10,2,2,4,0,2,0,1,0,0,4,0).
actions(24,13,164,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(24,13,165,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(24,13,166,2022,7,15,3,3,9,10,-6,4,2,6,3,3,1,3,0,1,23,1).
actions(24,13,169,413,1,2,3,3,0,0,8,0,1,1,0,3,0,0,0,0,2,0).
actions(24,29,360,2116,4,12,3,3,1,1,-7,6,5,11,1,3,1,1,0,1,10,1).
actions(24,29,361,1843,4,9,3,3,2,2,1,1,2,3,1,5,0,1,1,0,14,1).
actions(24,29,362,1564,6,7,3,3,1,1,6,3,4,7,1,2,1,1,0,0,13,1).
actions(24,29,363,2535,2,11,3,3,11,12,-6,0,1,1,8,3,0,4,0,1,15,1).
actions(24,29,364,1772,6,9,3,3,1,1,4,0,1,1,3,4,0,5,0,1,14,1).
actions(24,29,365,1376,5,11,3,3,3,4,-2,1,3,4,0,3,0,0,2,1,15,0).
actions(24,29,366,1823,3,7,3,3,5,7,-9,2,5,7,2,3,1,1,1,0,11,0).
actions(24,29,367,1150,6,12,3,3,4,5,-5,1,3,4,1,2,1,1,0,0,16,0).
actions(24,29,368,221,0,0,3,3,0,0,-2,0,0,0,0,1,0,0,0,0,0,0).
actions(24,29,369,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(24,29,370,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(24,29,371,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(24,29,372,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(25,2,14,1852,6,18,3,3,0,0,-4,1,6,7,6,2,2,3,0,0,14,1).
actions(25,2,15,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(25,2,16,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(25,2,17,2170,8,15,3,3,3,3,0,1,2,3,1,1,0,1,0,0,21,1).
actions(25,2,18,1951,3,9,3,3,0,0,1,0,7,7,10,4,2,3,0,1,7,1).
actions(25,2,19,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(25,2,20,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(25,2,21,1154,3,7,3,3,2,2,-6,1,0,1,3,1,0,0,0,0,8,0).
actions(25,2,22,1682,2,6,3,3,2,4,11,1,4,5,2,3,0,0,2,0,6,1).
actions(25,2,23,1797,6,17,3,3,1,1,-14,2,0,2,1,3,1,1,0,1,17,0).
actions(25,2,24,394,1,3,3,3,0,0,-5,0,0,0,0,0,1,0,0,1,3,0).
actions(25,2,25,1726,5,15,3,3,8,10,1,6,9,15,0,6,0,1,4,1,18,1).
actions(25,2,26,1674,3,6,3,3,0,0,-9,2,10,12,3,1,1,1,0,0,8,0).
actions(25,11,129,2562,12,24,3,3,6,7,-1,0,5,5,4,2,2,2,0,1,31,1).
actions(25,11,130,1026,1,3,3,3,1,2,-1,1,1,2,0,2,1,0,0,0,3,1).
actions(25,11,131,1287,8,14,3,3,4,5,-7,3,7,10,2,4,1,1,0,1,20,1).
actions(25,11,132,2707,5,11,3,3,1,1,7,2,2,4,0,2,1,1,0,2,12,1).
actions(25,11,133,2763,12,22,3,3,2,4,3,1,3,4,5,3,0,3,0,2,27,1).
actions(25,11,134,1927,3,8,3,3,3,4,9,0,7,7,2,2,0,0,0,0,11,0).
actions(25,11,135,603,0,2,3,3,1,2,4,0,3,3,0,0,0,1,1,0,1,0).
actions(25,11,136,117,0,0,3,3,0,0,2,0,0,0,0,0,0,0,0,0,0,0).
actions(25,11,137,1408,1,2,3,3,0,2,9,1,11,12,3,3,3,0,3,0,2,0).
actions(25,11,138,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(25,11,139,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(25,11,140,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(25,11,373,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(25,11,374,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(26,28,347,1721,8,15,3,3,0,0,0,0,2,2,3,4,3,2,0,1,17,1).
actions(26,28,348,1696,5,15,3,3,7,8,-9,2,6,8,1,2,0,0,2,1,17,1).
actions(26,28,349,1498,4,6,3,3,0,0,-16,1,2,3,2,3,0,4,0,0,8,0).
actions(26,28,350,2185,4,9,3,3,1,2,-5,1,4,5,2,2,0,1,0,0,11,1).
actions(26,28,351,1534,3,10,3,3,0,1,-4,2,2,4,3,2,0,3,0,1,6,1).
actions(26,28,352,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(26,28,353,1160,1,5,3,3,0,0,-2,3,0,3,2,0,1,2,1,2,2,1).
actions(26,28,354,1429,8,13,3,3,0,0,-11,2,4,6,1,1,1,2,0,0,21,0).
actions(26,28,355,1822,3,10,3,3,1,1,-16,0,6,6,1,1,0,4,0,0,8,0).
actions(26,28,356,809,1,2,3,3,0,0,-1,2,1,3,2,2,0,0,0,0,2,0).
actions(26,28,357,250,1,2,3,3,0,0,2,0,0,0,1,1,0,0,0,0,2,0).
actions(26,28,359,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(26,28,375,296,0,1,3,3,0,0,2,0,2,2,0,0,0,0,0,0,0,0).
actions(26,30,376,2358,11,26,3,3,6,6,13,0,7,7,3,1,0,4,1,1,28,1).
actions(26,30,377,2390,5,11,3,3,1,2,4,2,10,12,0,0,1,2,3,1,11,1).
actions(26,30,378,719,0,0,3,3,0,0,2,0,1,1,1,3,0,1,1,0,0,1).
actions(26,30,379,885,2,2,3,3,0,0,1,2,3,5,0,2,0,1,0,0,5,1).
actions(26,30,380,1838,10,20,3,3,6,6,2,0,1,1,6,1,4,2,0,0,27,1).
actions(26,30,381,1818,1,5,3,3,1,2,10,0,2,2,2,1,5,0,0,0,4,0).
actions(26,30,382,734,2,4,3,3,1,2,6,3,2,5,0,3,1,1,0,0,5,0).
actions(26,30,383,803,1,1,3,3,2,2,8,0,0,0,2,2,1,1,0,0,4,0).
actions(26,30,384,1823,6,8,3,3,0,0,13,1,3,4,4,0,1,1,0,1,14,0).
actions(26,30,385,924,1,3,3,3,3,3,1,0,1,1,0,3,1,0,0,0,6,0).
actions(26,30,386,55,1,1,3,3,0,0,0,0,1,1,0,0,0,0,0,0,2,0).
actions(26,30,387,52,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(26,30,388,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(27,4,39,1851,2,5,3,3,3,4,3,3,6,9,2,0,0,3,3,0,7,1).
actions(27,4,40,2088,10,18,3,3,2,2,2,0,11,11,1,4,2,2,1,1,26,1).
actions(27,4,41,1715,3,4,3,3,6,6,-7,3,3,6,1,4,0,2,2,0,12,1).
actions(27,4,42,2209,4,12,3,3,3,4,-4,0,4,4,9,0,0,2,1,0,12,1).
actions(27,4,43,1613,8,13,3,3,0,0,-15,0,2,2,1,4,0,1,0,0,19,1).
actions(27,4,44,1522,6,12,3,3,0,0,8,0,2,2,1,3,1,0,0,1,16,0).
actions(27,4,45,985,4,7,3,3,0,0,16,0,3,3,1,3,1,0,1,1,8,0).
actions(27,4,46,1402,2,6,3,3,0,0,17,0,3,3,7,1,0,0,0,1,6,0).
actions(27,4,47,835,2,3,3,3,1,2,13,1,4,5,1,2,0,1,1,0,5,0).
actions(27,4,48,180,0,2,3,3,2,2,-3,1,0,1,0,0,0,0,0,0,2,0).
actions(27,4,49,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(27,4,50,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(27,4,51,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(27,13,154,2289,2,9,3,3,1,2,-5,1,5,6,2,2,0,2,1,0,6,1).
actions(27,13,155,639,0,4,3,3,0,0,1,0,0,0,2,1,0,0,0,1,0,0).
actions(27,13,156,2317,9,12,3,3,3,8,1,5,10,15,0,3,2,0,2,1,21,1).
actions(27,13,157,2275,7,14,3,3,6,6,5,0,2,2,1,3,3,1,0,0,22,1).
actions(27,13,158,2373,7,14,3,3,2,2,-1,2,3,5,9,3,1,1,0,0,17,1).
actions(27,13,160,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(27,13,161,124,0,1,3,3,0,0,-1,0,0,0,0,1,0,0,0,0,0,0).
actions(27,13,162,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(27,13,163,588,2,4,3,3,0,0,-10,0,1,1,0,2,0,1,0,1,4,0).
actions(27,13,164,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(27,13,166,2379,9,23,3,3,7,7,-5,4,6,10,11,5,1,1,1,5,25,1).
actions(27,13,169,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(27,13,389,1416,3,10,3,3,4,4,-15,0,2,2,1,0,0,0,0,1,12,0).
actions(28,9,103,842,6,8,3,3,0,0,3,2,0,2,1,0,0,0,0,0,12,1).
actions(28,9,104,2499,7,22,3,3,6,6,17,3,12,15,4,4,2,1,3,2,20,1).
actions(28,9,105,2145,8,16,3,3,8,10,2,1,4,5,3,6,0,3,1,0,24,1).
actions(28,9,106,2324,3,7,3,3,3,3,11,0,1,1,1,1,1,2,0,0,10,1).
actions(28,9,107,2120,5,14,3,3,10,11,8,0,5,5,4,4,2,1,0,1,21,1).
actions(28,9,108,1040,1,3,3,3,2,2,5,0,1,1,2,3,2,1,0,1,4,0).
actions(28,9,109,374,1,4,3,3,0,0,-7,2,0,2,0,2,0,0,0,0,2,0).
actions(28,9,110,1056,0,4,3,3,2,2,-3,0,1,1,2,1,0,2,0,0,2,0).
actions(28,9,111,686,0,1,3,3,0,0,3,1,4,5,0,1,0,1,0,0,0,0).
actions(28,9,112,1224,1,4,3,3,3,4,-3,1,0,1,1,4,2,0,0,0,5,0).
actions(28,9,113,90,0,0,3,3,0,0,4,0,0,0,0,0,0,0,0,0,0,0).
actions(28,9,114,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(28,9,115,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(28,10,116,774,0,2,3,3,0,0,-17,0,1,1,0,1,1,1,0,0,0,1).
actions(28,10,117,1410,7,13,3,3,3,4,-7,5,7,12,2,2,1,5,0,0,17,1).
actions(28,10,118,1667,4,10,3,3,4,5,-4,1,2,3,2,5,0,1,1,1,13,1).
actions(28,10,119,2350,6,13,3,3,5,6,-11,2,7,9,4,5,0,2,1,1,21,1).
actions(28,10,120,1926,3,8,3,3,10,12,7,0,1,1,3,2,2,1,0,0,16,0).
actions(28,10,121,1430,1,9,3,3,3,3,7,2,5,7,1,5,2,2,2,1,6,0).
actions(28,10,122,1185,2,7,3,3,2,2,5,0,2,2,0,2,0,2,0,0,6,0).
actions(28,10,123,2421,5,13,3,3,0,0,-8,1,3,4,2,2,0,4,0,0,11,1).
actions(28,10,124,1237,1,5,3,3,0,0,-12,3,4,7,2,3,1,2,0,1,2,0).
actions(28,10,125,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(28,10,126,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(28,10,127,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(28,10,128,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(29,24,293,1006,0,3,3,3,0,0,5,0,2,2,1,0,1,0,0,1,0,1).
actions(29,24,294,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(29,24,295,2205,13,24,3,3,3,3,7,4,12,16,0,1,0,2,1,3,29,1).
actions(29,24,296,1373,2,7,3,3,3,3,15,0,3,3,2,5,1,3,2,1,7,1).
actions(29,24,297,2089,5,15,3,3,2,2,20,2,8,10,10,2,1,4,0,2,13,1).
actions(29,24,298,1487,2,4,3,3,4,6,11,1,3,4,0,2,0,2,2,0,8,1).
actions(29,24,299,675,1,1,3,3,0,0,4,1,1,2,1,1,0,0,0,0,13,0).
actions(29,24,300,1507,4,10,3,3,3,3,-4,0,3,3,2,1,0,2,0,1,12,0).
actions(29,24,301,791,1,2,3,3,0,0,-9,0,0,0,1,2,1,0,0,0,2,0).
actions(29,24,302,1874,1,5,3,3,3,4,6,0,3,3,3,1,1,1,0,2,5,0).
actions(29,24,303,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(29,24,304,1393,4,7,3,3,1,2,0,1,1,2,1,1,0,0,0,0,13,0).
actions(29,24,305,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(29,27,331,1855,1,3,3,3,0,0,-21,0,3,3,1,1,2,1,3,0,2,1).
actions(29,27,332,1778,5,20,3,3,0,0,-6,2,4,6,1,4,3,2,5,1,10,1).
actions(29,27,333,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(29,27,334,1386,2,10,3,3,4,4,-21,1,2,3,0,1,0,1,0,2,8,1).
actions(29,27,335,1287,5,11,3,3,0,0,-20,1,1,2,7,1,0,1,0,0,11,1).
actions(29,27,336,791,0,1,3,3,0,0,-18,1,2,3,0,4,0,0,0,0,0,1).
actions(29,27,337,1822,8,18,3,3,4,4,7,2,4,6,2,4,2,2,0,1,21,0).
actions(29,27,338,1236,3,7,3,3,0,0,8,0,2,2,2,1,0,2,1,1,6,0).
actions(29,27,339,1888,5,12,3,3,4,5,7,2,6,8,1,3,1,2,1,1,15,0).
actions(29,27,340,1255,0,0,3,3,0,0,14,0,2,2,1,2,0,1,0,0,0,0).
actions(29,27,341,1102,2,5,3,3,3,5,-5,5,3,8,0,4,0,1,0,1,7,0).
actions(29,27,342,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(29,27,343,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(30,17,204,1989,8,17,3,3,3,4,-2,2,3,5,1,2,1,0,0,2,24,1).
actions(30,17,206,2022,10,14,3,3,2,3,11,3,6,9,0,3,0,3,1,0,22,1).
actions(30,17,207,2375,8,19,3,3,4,5,9,0,4,4,9,3,0,3,1,1,20,1).
actions(30,17,209,1526,2,5,3,3,0,0,7,1,6,7,2,3,2,0,0,0,5,1).
actions(30,17,210,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(30,17,211,941,0,1,3,3,0,0,2,0,2,2,1,2,0,1,1,0,0,0).
actions(30,17,212,1963,4,12,3,3,0,0,7,0,5,5,3,3,1,2,0,0,10,1).
actions(30,17,213,1031,3,4,3,3,0,0,1,0,3,3,2,0,0,0,2,0,6,0).
actions(30,17,214,1373,3,8,3,3,2,2,10,0,2,2,5,1,2,2,0,0,10,0).
actions(30,17,215,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(30,17,216,1180,2,4,3,3,1,2,-5,3,2,5,0,3,0,0,0,0,5,0).
actions(30,25,306,2416,7,17,3,3,9,10,-4,1,5,6,3,3,0,3,0,0,26,1).
actions(30,25,307,2061,9,16,3,3,3,3,-5,1,6,7,4,1,2,0,0,0,21,1).
actions(30,25,308,1911,5,13,3,3,2,3,-2,1,1,2,0,4,1,1,1,1,12,1).
actions(30,25,309,1693,2,5,3,3,1,2,-13,0,3,3,1,4,1,2,0,0,6,1).
actions(30,25,310,2106,2,5,3,3,3,4,-3,0,4,4,5,1,1,1,0,0,8,1).
actions(30,25,311,819,3,7,3,3,0,2,-3,1,4,5,1,1,0,0,0,0,6,0).
actions(30,25,312,1188,1,8,3,3,0,0,3,3,2,5,1,2,1,1,0,4,2,0).
actions(30,25,313,968,1,2,3,3,2,2,-4,1,2,3,0,3,0,2,1,0,4,0).
actions(30,25,314,464,0,1,3,3,0,0,-4,0,3,3,1,0,0,0,1,0,0,0).
actions(30,25,315,774,3,4,3,3,2,2,-5,0,1,1,3,0,0,0,0,0,9,0).
actions(30,25,316,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(30,25,317,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(30,25,318,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(30,17,344,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
actions(30,17,390,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- begin_bg.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Players information
%%
% predicate: player(PlayerId,PlayerName).

player(1,"Nicolas Batum").
player(2,"LaMarcus Aldridge").
player(3,"Robin Lopez").
player(4,"Wesley Matthews").
player(5,"Damian Lillard").
player(6,"Thomas Robinson").
player(7,"Maurice Williams").
player(8,"Will Barton").
player(9,"Dorell Wright").
player(10,"Earl Watson").
player(11,"CJ McCollum").
player(12,"Meyers Leonard").
player(13,"Victor Claver").
player(14,"Kent Bazemore").
player(15,"Pau Gasol").
player(16,"Chris Kaman").
player(17,"Jodie Meeks").
player(18,"Kendall Marshall").
player(19,"Steve Nash").
player(20,"Xavier Henry").
player(21,"Robert Sacre").
player(22,"Ryan Kelly").
player(23,"Nick Young").
player(24,"Marshon Brooks").
player(25,"Jordan Hill").
player(26,"Wesley Johnson").
player(27,"Andre Iguodala").
player(28,"Draymond Green").
player(29,"Jermaine O'Neal").
player(30,"Klay Thompson").
player(31,"Stephen Curry").
player(32,"Marreese Speights").
player(33,"Harrison Barnes").
player(34,"Steve Blake").
player(35,"Jordan Crawford").
player(36,"Hilton Armstrong").
player(37,"Andrew Bogut").
player(38,"David Lee").
player(39,"Shawn Marion").
player(40,"Dirk Nowitzki").
player(41,"Samuel Dalembert").
player(42,"Monta Ellis").
player(43,"Jose Calderon").
player(44,"Vince Carter").
player(45,"Brandan Wright").
player(46,"Devin Harris").
player(47,"Jae Crowder").
player(48,"DeJuan Blair").
player(49,"Wayne Ellington").
player(50,"Bernard James").
player(51,"Shane Larkin").
player(52,"Chandler Parsons").
player(53,"Donatas Motiejunas").
player(54,"Omer Asik").
player(55,"James Harden").
player(56,"Jeremy Lin").
player(57,"Omri Casspi").
player(58,"Francisco Garcia").
player(59,"Isaiah Canaan").
player(60,"Jordan Hamilton").
player(61,"Patrick Beverley").
player(62,"Dwight Howard").
player(63,"Terrence Jones").
player(64,"Greg Smith").
player(65,"Joe Johnson").
player(66,"Paul Pierce").
player(67,"Mason Plumlee").
player(68,"Shaun Livingston").
player(69,"Deron Williams").
player(70,"Alan Anderson").
player(71,"Andray Blatche").
player(72,"Mizra Teletovic").
player(73,"Jorge Gutierrez").
player(74,"Marquis Teague").
player(75,"Jason Collins").
player(76,"Andrei Kirilenko").
player(77,"Marcus Thornton").
player(78,"JR Smith").
player(79,"Carmelo Anthony").
player(80,"Tyson Chandler").
player(81,"Iman Shumpert").
player(82,"Raymond Felton").
player(83,"Timothy Hardaway Jr.").
player(84,"Pablo Prigioni").
player(85,"Cole Aldrich").
player(86,"Jeremy Tyler").
player(87,"Shannon Brown").
player(88,"Toure Murry").
player(89,"Amar'e Stoudemire").
player(90,"Richard Jefferson").
player(91,"Marvin Williams").
player(92,"Derrick Favors").
player(93,"Gordon Hayward").
player(94,"Trey Burke").
player(95,"Enes Kanter").
player(96,"Alec Burks").
player(97,"Diante Garrett").
player(98,"Ian Clark").
player(99,"Rudy Gobert").
player(100,"Jeremy Evans").
player(101,"John Lucas III").
player(102,"Brandon Rush").
player(103,"Tayshaun Prince").
player(104,"Zach Randolph").
player(105,"Marc Gasol").
player(106,"Courtney Lee").
player(107,"Mike Conley").
player(108,"Nick Calathes").
player(109,"Ed Davis").
player(110,"Mike Miller").
player(111,"Kosta Koufos").
player(112,"Tony Allen").
player(113,"James Johnson").
player(114,"Jon Leuer").
player(115,"Beno Udrih").
player(116,"Quincy Miller").
player(117,"Kenneth Faried").
player(118,"Timofey Mozgov").
player(119,"Randy Foye").
player(120,"Ty Lawson").
player(121,"Darrell Arthur").
player(122,"Evan Fournier").
player(123,"Aaron Brooks").
player(124,"Jan Vesely").
player(125,"Wilson Chandler").
player(126,"JJ Hickson").
player(127,"Anthony Randolph").
player(128,"Nate Robinson").
player(129,"Rudy Gay").
player(130,"Reggie Evans").
player(131,"DeMarcus Cousins").
player(132,"Ben McLemore").
player(133,"Ray McCallum").
player(134,"Travis Outlaw").
player(135,"Derrick Williams").
player(136,"Jared Cunningham").
player(137,"Jason Thompson").
player(138,"Quincy Acy").
player(139,"Aaron Gray").
player(140,"Isaiah Thomas").
player(141,"Al-Farouq Aminu").
player(142,"Anthony Davis").
player(143,"Greg Stiemsma").
player(144,"Tyreke Evans").
player(145,"Brian Roberts").
player(146,"Darius Miller").
player(147,"Alexis Ajinca").
player(148,"Austin Rivers").
player(149,"Anthony Morrow").
player(150,"Jeff Withey").
player(151,"Luke Babbitt").
player(152,"Eric Gordon").
player(153,"Jason Smith").
player(154,"Matt Barnes").
player(155,"Jared Dudley").
player(156,"DeAndre Jordan").
player(157,"Darren Collison").
player(158,"Chris Paul").
player(159,"Hidayet Turkoglu").
player(160,"Willie Green").
player(161,"Reggie Bullock").
player(162,"Ryan Hollins").
player(163,"Glen Davis").
player(164,"Jamal Crawford").
player(165,"Danny Granger").
player(166,"Blake Griffin").
player(167,"Corey Brewer").
player(168,"Kevin Love").
player(169,"Hidayet Turkoglu").
player(170,"Kevin Martin").
player(171,"Ricky Rubio").
player(172,"Gorgui Dieng").
player(173,"Jose Barea").
player(174,"Dante Cunningham").
player(175,"Chase Budinger").
player(176,"Robbie Hummel").
player(177,"Shabazz Muhammad").
player(178,"Luc Mbah a Moute").
player(179,"Alexey Shved").
player(180,"Jeff Green").
player(181,"Brandon Bass").
player(182,"Kris Humphries").
player(183,"Avery Bradley").
player(184,"Jerryd Bayless").
player(185,"Jared Sullinger").
player(186,"Christapher Johnson").
player(187,"Phil Pressey").
player(188,"Kelly Olynyk").
player(189,"Chris Babb").
player(190,"Joel Anthony").
player(191,"Rajon Rondo").
player(192,"Mike Dunleavy").
player(193,"Carlos Boozer").
player(194,"Joakim Noah").
player(195,"Jimmy Butler").
player(196,"Kirk Hinrich").
player(197,"DJ Augustin").
player(198,"Taj Gibson").
player(199,"Nazr Mohammed").
player(200,"Tony Snell").
player(201,"Jimmer Fredette").
player(202,"Erik Murphy").
player(203,"Tornike Shengelia").
player(204,"Terrence Ross").
player(205,"Amir Johnson").
player(206,"Jonas Valanciunas").
player(207,"Demar DeRozan").
player(208,"Kyle Lowry").
player(209,"Patrick Patterson").
player(210,"Steve Novak").
player(211,"John Salmons").
player(212,"Greivis Vasquez").
player(213,"Chuck Hayes").
player(214,"Nando De Colo").
player(215,"Landry Fields").
player(216,"Tyler Hansbrough").
player(217,"Lebron James").
player(218,"Udonis Haslem").
player(219,"Chris Bosh").
player(220,"Toney Douglas").
player(221,"Mario Chalmers").
player(222,"Rashad Lewis").
player(223,"Norris Cole").
player(224,"James Jones").
player(225,"Chris Andersen").
player(226,"Shane Battier").
player(227,"Michael Beasley").
player(228,"Justin Hamilton").
player(229,"Dwayne Wade").
player(230,"Khris Middleton").
player(231,"Jeff Adrien").
player(232,"Zaza Pachulia").
player(233,"Ramon Sessions").
player(234,"Brandon Knight").
player(235,"Giannis Antetokounmpo").
player(236,"John Henson").
player(237,"Ekpe Udoh").
player(238,"Ersan Ilyasova").
player(239,"OJ Mayo").
player(240,"Miroslav Raduljica").
player(241,"DJ Stephens").
player(242,"Nate Wolters").
player(243,"Josh Smith").
player(244,"Greg Monroe").
player(245,"Andre Drummond").
player(246,"Kyle Singler").
player(247,"Brandon Jennings").
player(248,"Rodney Stuckey").
player(249,"Jonas Jerebko").
player(250,"Kentavious Caldwell-Pope").
player(251,"Will Bynum").
player(252,"Charlie Villanueva").
player(253,"Luigi Datome").
player(254,"Tony Mitchell").
player(255,"Peyton Siva").
player(256,"Hollis Thompson").
player(257,"Thaddeus Young").
player(258,"Henry Sims").
player(259,"James Anderson").
player(260,"Michael Carter-Williams").
player(261,"Tony Wroten").
player(262,"Jarvis Varnado").
player(263,"Elliot Williams").
player(264,"Casper Ware").
player(265,"Brandon Davies").
player(266,"Arnett Moultrie").
player(267,"James Nunnally").
player(268,"DeMarre Carroll").
player(269,"Paul Millsap").
player(270,"Pero Antic").
player(271,"Kyle Korver").
player(272,"Jeff Teague").
player(273,"Louis Williams").
player(274,"Elton Brand").
player(275,"Mike Scott").
player(276,"Dennis Schroder").
player(277,"Mike Muscala").
player(278,"Shelvin Mack").
player(279,"Cartier Martin").
player(280,"Trevor Ariza").
player(281,"Trevor Booker").
player(282,"Marcin Gortat").
player(283,"Bradley Beal").
player(284,"John Wall").
player(285,"Drew Gooden").
player(286,"Martell Webster").
player(287,"Al Harrington").
player(288,"Andre Miller").
player(289,"Kevin Seraphin").
player(290,"Otto Porter").
player(291,"Chris Singleton").
player(292,"Garrett Temple").
player(293,"Michael Kidd-Gilchrist").
player(294,"Josh McRoberts").
player(295,"Al Jefferson").
player(296,"Gerald Henderson").
player(297,"Kemba Walker").
player(298,"Cody Zeller").
player(299,"Bismack Biyombo").
player(300,"Gary Neal").
player(301,"Luke Ridnour").
player(302,"Chris Douglas-Roberts").
player(303,"Jannero Pargo").
player(304,"Anthony Tolliver").
player(305,"DJ White").
player(306,"Paul George").
player(307,"David West").
player(308,"Roy Hibbert").
player(309,"Lance Stephenson").
player(310,"George Hill").
player(311,"Luis Scola").
player(312,"Evan Turner").
player(313,"Ian Mahinmi").
player(314,"Rasual Butler").
player(315,"Donald Sloan").
player(316,"Lavoy Allen").
player(317,"Chris Copeland").
player(318,"Solomon Hill").
player(319,"Luol Deng").
player(320,"Tristan Thompson").
player(321,"Spencer Hawes").
player(322,"Dion Waiters").
player(323,"Kyrie Irving").
player(324,"Jarrett Jack").
player(325,"Matthew Dellavedova").
player(326,"Tyler Zeller").
player(327,"Alonzo Gee").
player(328,"Sergey Karasev").
player(329,"Scotty Hopson").
player(330,"Anderson Varejao").
player(331,"Maurice Harkless").
player(332,"Kyle O'Quinn").
player(333,"Nikola Vucevic").
player(334,"Arron Afflalo").
player(335,"Jameer Nelson").
player(336,"Andrew Nicholson").
player(337,"Victor Oladipo").
player(338,"Etwaun Moore").
player(339,"Tobias Harris").
player(340,"Doron Lamb").
player(341,"Dewayne Dedmon").
player(342,"Jason Maxiell").
player(343,"Ronnie Price").
player(344,"Julyan Stone").
player(345,"Ray Allen").
player(346,"Ronny Turiaf").
player(347,"Kawhi Leonard").
player(348,"Tim Duncan").
player(349,"Boris Diaw").
player(350,"Daniel Green").
player(351,"Tony Parker").
player(352,"Emanuel Ginobli").
player(353,"Tiago Splitter").
player(354,"Patrick Mills").
player(355,"Marco Belinelli").
player(356,"Jeff Ayres").
player(357,"Cory Joseph").
player(358,"Aron Baynes").
player(359,"Austin Daye").
player(360,"PJ Tucker").
player(361,"Channing Frye").
player(362,"Miles Plumlee").
player(363,"Goran Dragic").
player(364,"Eric Bledsoe").
player(365,"Gerald Green").
player(366,"Markieff Morris").
player(367,"Marcus Morris").
player(368,"Ish Smith").
player(369,"Dionte Christmas").
player(370,"Archie Goodwin").
player(371,"Alex Len").
player(372,"Shavlik Randolph").
player(373,"Orlando Johnson").
player(374,"Royce White").
player(375,"Damion James").
player(376,"Kevin Durant").
player(377,"Serge Ibaka").
player(378,"Kendrick Perkins").
player(379,"Andre Roberson").
player(380,"Russell Westbrook").
player(381,"Caron Butler").
player(382,"Steven Adams").
player(383,"Nick Collison").
player(384,"Reggie Jackson").
player(385,"Derek Fisher").
player(386,"Jeremy Lamb").
player(387,"Perry Jones").
player(388,"Hasheem Thabeet").
player(389,"JJ Redick").
player(390,"Dwight Buycks").
player(391,"David Lee").
player(392,"Nikola Pekovic").
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Teams information
%%
% predicate: team(TeamId,TeamName).

team(1,"Portland Trail Blazers").
team(2,"Los Angeles Lakers").
team(3,"Golden State Warriors").
team(4,"Dallas Mavericks").
team(5,"Houston Rockets").
team(6,"Brooklyn Nets").
team(7,"New York Knicks").
team(8,"Utah Jazz").
team(9,"Memphis Grizzlies").
team(10,"Denver Nuggets").
team(11,"Sacramento Kings").
team(12,"New Orleans Pelicans").
team(13,"Los Angeles Clippers").
team(14,"Minnesota Timberwolves").
team(15,"Boston Celtics").
team(16,"Chicago Bulls").
team(17,"Toronto Raptors").
team(18,"Miami Heat").
team(19,"Milwaukee Bucks").
team(20,"Detroit Pistons").
team(21,"Philadelphia 76ers").
team(22,"Atlanta Hawks").
team(23,"Washington Wizards").
team(24,"Charlotte Bobcats").
team(25,"Indiana Pacers").
team(26,"Cleveland Cavaliers").
team(27,"Orlando Magic").
team(28,"San Antonio Spurs").
team(29,"Phoenix Suns").
team(30,"Oklahoma City Thunder").
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- end_bg.
