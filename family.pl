
% LzCai, U1622184H, Nanyang Technological University,
% School of Computer Science and Engineering,
% For CZ3005 Lab-1, Oct/2018

% ============ Definitions for Question-1  ============ %
% male(jerry).
% male(stuart).
% male(warren).
% male(peter).
% male(grandpa).

% female(kather).
% female(maryalice).
% female(ann).

% brother(jerry,stuart).
% brother(jerry,kather).
% brother(peter, warren).

% sister(ann, mayalice).
% sister(kather,jerry).

% parent_of(warren,jerry).
% parent_of(maryalice,jerry).
% parent_of(grandpa, warren).


% ============ Definitions for Question-2  ============ %

brother(peter, warren).
brother(jerry,kather).
brother(jerry,stuart).
male(stuart).
male(peter).
male(warren).
male(jerry).

female(kather).
female(ann).
female(maryalice).

sister(kather,jerry).
sister(ann, mayalice).

parent_of(maryalice,jerry).
parent_of(warren,jerry).

% ============ Core Algorighms  ============ %
atomic_sibling(X,Y) :-
    brother(X,Y), X\=Y;
    brother(Y,X), Y\=X;
    sister(X,Y), X\=Y;
    sister(Y,X), Y\=X.

check_sibling(X, Y, List) :-
    atomic_sibling(X, Sibling_of_X), % If you find a sibling of X,
    not(member(Sibling_of_X, List)), % And this sibling of X is not seen before,
    (
        Y = Sibling_of_X; % If is the one we are looking for, Return
        check_sibling(Sibling_of_X, Y, [X|List])). % If not, do a DFS since sibling's sibling is also a sibling.


sibling(X, Y) :- check_sibling(X, Y, []).


all_parent_of(Parent, Kid) :-
    parent_of(Parent, Kid);
    parent_of(Parent, Sibling_of_Kid), sibling(Sibling_of_Kid, Kid).



% ============ Other Relationships  ============ %
father(Father, Kid) :- all_parent_of(Father, Kid), male(Father).
mother(Mother, Kid) :- all_parent_of(Mother, Kid), female(Mother).

son(Son, Parent) :- male(Son), all_parent_of(Parent, Son) .
daughter(Daughter, Parent) :-  female(Daughter), all_parent_of(Parent, Daughter).

grandfather(GdFather, Kid) :- all_parent_of(Parent, Kid), father(GdFather, Parent).

aunt(Auntie, Kid) :- all_parent_of(Parent, Kid), sister(Auntie, Parent).

uncle(Uncle, Kid) :- all_parent_of(Parent, Kid), brother(Uncle, Parent).

cousin(Kid1, Kid2) :- (aunt(Parent, Kid2); uncle(Parent,Kid2)), all_parent_of(Parent, Kid1).

spouse(First, Second) :- father(First, Kid), mother(Second, Kid);
                         mother(First, Kid), father(Second, Kid).

