:- module(hw, [cost/2, sort_units/2, buyable/4]).
:- [kb].

% DO NOT CHANGE THE UPPER CONTENT, WRITE YOUR CODE AFTER THIS LINE
cost([],0).
cost([(active_unit(X,T))|Y],Z):-
unit(X,A,B),
cost(Y,Z1),
Z is Z1+((3**(T-1))*A).


mybubble(Input,Output):-mybubbleV2(Input,[],Output).
mybubbleV2([],Ax,Ax).
mybubbleV2([A|B],Ax,Output):-mybubbleV3(A,B,Kalan,Min),mybubbleV2(Kalan,[Min|Ax],Output).
mybubbleV3(A,[],[],A).
mybubbleV3(A,[B|C],[A|D],Min):-unit(A,Pow1,L1),unit(B,Pow2,L2),Pow1>=Pow2,mybubbleV3(B,C,D,Min).
mybubbleV3(A,[B|C],[B|D],Min):-unit(A,Pow1,L1),unit(B,Pow2,L2),Pow1<Pow2,mybubbleV3(A,C,D,Min).
sort_units(Input,Output):-mybubble(Input,Output).



mycombination(A,B) :-mycombination(A,0,B).
mycombination([A],_,[A]).
mycombination([_],B,[]) :-B > 0.
mycombination([_|C],B,C2) :-mycombination(C,B,C2).
mycombination([A|B],C,[A|B1]) :-C1 is C+1,mycombination(B,C1,B1).
    
calmoney([],0).
calmoney([H|T],Money):-calmoney(T,Money1),unit(H,Pow1,L1),Money is Pow1+Money1.

buyable([],Money,[],Kalan).
buyable(Input,Money,List,Kalan):-mycombination(Input,Comb),calmoney(Comb,Mx),(Money-Mx) >=0,Kalan is (Money-Mx),append(Comb,[],List).