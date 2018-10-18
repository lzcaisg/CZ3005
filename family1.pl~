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

father(Father, Kid) :- parent_of(Father, Kid), male(Father).
mother(Mother, Kid) :- parent_of(Mother, Kid), female(Mother).


son(Son, Parent) :- male(Son), parent_of(Parent, Son).
daughter(Daughter, Parent) :- female(Daughter), parent_of(Parent, Daughter).

grandfather(GdFather, Kid) :- father(GdFather, Parent), parent_of(Parent, Kid).

sibling(X,Y) :- brother(X,Y); brother(Y,X).
sibling(X,Y) :- sister(X,Y); sister(Y,X).

aunt(Auntie, Kid) :- parent_of(Parent, Kid), sister(Auntie, Parent).

uncle(Uncle, Kid) :- parent_of(Parent, Kid), brother(Uncle, Parent).

cousin(Kid1, Kid2) :- (aunt(Parent, Kid2); uncle(Parent,Kid2)), parent_of(Parent, Kid1).

spouse(Father, Mother) :- father(Father, Kid), mother(Mother, Kid).

parent_of(Parent, UnknownKid) :- sibling(UnknownKid, KnownKid), parent_of(Parent, KnownKid).
