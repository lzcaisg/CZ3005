male(jerry).
male(stuart).
male(warren).
male(peter).

female(kather).
female(maryalice).
female(ann).

brother(jerry,stuart).
brother(jerry,kather).
brother(peter, warren).


sister(ann, mayalice).
sister(kather,jerry).


parent_of(warren,jerry).
parent_of(maryalice,jerry).

parent_of(Parent, UnknownKid) :-  sibling(UnknownKid, KnownKid), (father(Parent, KnownKid);mother(Parent, KnownKid)).

sibling(X,Y) :- brother(X,Y); brother(Y,X).
sibling(X,Y) :- sister(X,Y); sister(Y,X).



father(Father, Kid) :- male(Father), parent_of(Father, Kid).
mother(Mother, Kid) :- female(Mother), parent_of(Mother, Kid).

son(Son, Parent) :- male(Son), parent_of(Parent, Son).
daughter(Daughter, Parent) :- female(Daughter), parent_of(Parent, Daughter).

grandfather(GdFather, Kid) :- parent_of(Parent, Kid), father(GdFather, Parent).

aunt(Auntie, Kid) :- parent_of(Parent, Kid), sister(Auntie, Parent).

uncle(Uncle, Kid) :- parent_of(Parent, Kid), brother(Uncle, Parent).

cousin(Kid1, Kid2) :- (aunt(Parent, Kid2); uncle(Parent,Kid2)), parent_of(Parent, Kid1).

spouse(Father, Mother) :- father(Father, Kid), mother(Mother, Kid).

