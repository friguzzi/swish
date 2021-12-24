/*  Part of SWI-Prolog

    Author:        Jan Wielemaker
    E-mail:        J.Wielemaker@cs.vu.nl
    WWW:           http://www.swi-prolog.org
    Copyright (C): 2014-2015, VU University Amsterdam

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

    As a special exception, if you link this library with other files,
    compiled with a Free Software compiler, to produce an executable, this
    library does not by itself cause the resulting executable to be covered
    by the GNU General Public License. This exception does not however
    invalidate any other reasons why the executable file might be covered by
    the GNU General Public License.
*/

:- module(swish_render_pic,
	  [ term_rendering//3			% +Term, +Vars, +Options
	  ,clauses//1
	  ]).
:- use_module(library(apply)).
:- use_module(library(lists)).
:- use_module(library(option)).
:- use_module(library(http/html_write)).
:- use_module(library(http/term_html)).
:- use_module(library(pascal)).
:- use_module('../render').

:- register_renderer(pic, "Render a probabilistic constraint logic theory").

/** <module> SWISH table renderer

Render table-like data.
*/

%%	term_rendering(+Term, +Vars, +Options)//
%
%	Renders Term as  a  table.   This  renderer  recognises  several
%	representations of table-like data:
%
%	  $ A list of terms of equal arity :
%	  $ A list of lists of equal length :
%
%	@tbd: recognise more formats

term_rendering(Term, _Vars, _Options) -->
	{is_list_of_clauses(Term)
	}, !,
	html(pre(\clauses(Term))).

clauses([]) --> [].
clauses([HC|T]) -->
	{
	 numbervars(HC,0,_),
         HC=rule((H:-B),P),!
	},
	pic(H,B,P),
	clauses(T).

pic(H,B,P)-->
  {
    format(atom(Prob),'~f ::~n',[P]),
    format(atom(I),'--->~n',[])},
  [Prob],
  conj(B),
  [I],
  head(H).

head([])-->!,
  {format(atom(A),"false.~n~n",[])},
  [A].

head([((+),Conj)])-->!,
  {format(atom(A),"",[])},
  [A],
  conj(Conj),
  {format(atom(B),".~n~n",[])},
  [B].

head([((-),Conj)])-->!,
  {format(atom(A),"not(",[])},
  [A],
  conj(Conj),
  {format(atom(B),").~n~n",[])},
  [B].

head([((+),Conj)|Rest])-->
  {format(atom(A),"",[])},
  [A],
  conj(Conj),
  {format(atom(B),"~n\\/~n",[])},
  [B],
  head(Rest).

head([((-),Conj)|Rest])-->
  {format(atom(A),"not(",[])},
  [A],
  conj(Conj),
  {format(atom(B),")\\/",[])},
  [B],
  head(Rest).

conj([])-->
  {format(atom(A),"true",[])},
  [A].

conj([H])-->
  {format(atom(A),"~q",[H])},!,
  [A].

conj([H|T])-->
  {format(atom(A),"~q/\\",[H])},
  [A],
  conj(T).






%%	is_list_of_terms(@Term, -Rows, -Cols) is semidet.
%
%	Recognises a list of terms with   the  same functor and non-zero
%	ariry.

is_list_of_clauses(Term) :-
	is_list(Term), Term \== [],
	maplist(is_clause, Term).

is_clause(rule((_H :- _B),_)).

%%	is_list_of_lists(@Term, -Rows, -Cols) is semidet.
%
%	Recognise a list of lists of equal length.

is_list_of_lists(Term, Rows, Cols) :-
	is_list(Term), Term \== [],
	length(Term, Rows),
	maplist(is_list_row(Cols), Term),
	Cols > 0.

is_list_row(Length, Term) :-
	is_list(Term),
	length(Term, Length).

