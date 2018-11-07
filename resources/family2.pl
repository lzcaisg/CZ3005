sibling(X,Y):- check_sibling(X,Y,[]).

original_sibling(X,Y) :-
	brother(X,Y), X\=Y;
	brother(Y,X), X\=Y;
	sister(X,Y), X\=Y;
	sister(Y,X), X\=Y.

check_sibling(X,Y,List) :-
	original_sibling(X,Z),
	not(member(Z,List)),
	(Y=Z; check_sibling(Z,Y,[X|List])).

full_parent_of(X,Y) :-
	parent_of(X,Y);
	parent_of(X,Z), sibling(Z,Y).

father(X,Y) :-
	male(X), full_parent_of(X,Y).
mother(X,Y) :-
	female(X), full_parent_of(X,Y).
son(X,Y) :-
	male(X),full_parent_of(Y,X).
daughter(X,Y) :-
	female(X), full_parent_of(Y,X).
grandfather(X,Y) :-
	male(X),full_parent_of(X,Z), full_parent_of(Z,Y).
aunt(X,Y) :-
	female(X), sibling(X,P), full_parent_of(P,Y).
uncle(X,Y) :-
	male(X), sibling(X,P), full_parent_of(P,Y).
cousin(X,Y):-
	full_parent_of(P1,X),full_parent_of(P2,Y), sibling(P1,P2),X\=Y.
spouse(X,Y) :-
	full_parent_of(X,Z),full_parent_of(Y,Z),X\=Y.


male(jerry).
male(stuart).
male(warren).
male(peter).
female(kather).
female(maryalice).
female(ann).
brother(jerry,stuart).
brother(jerry,kather).
brother(peter,warren).
sister(ann,maryalice).
sister(kather,jerry).
parent_of(warren,jerry).
parent_of(maryalice,jerry).


%brother(peter, warren).
%brother(jerry,kather).
%brother(jerry,stuart).
%male(stuart).
%male(peter).
%male(warren).
%male(jerry).
%female(kather).
%female(ann).
%female(maryalice).
%sister(kather,jerry).
%sister(ann, maryalice).
%parent_of(maryalice,jerry).
%parent_of(warren,jerry).

