% solution 2: permutation 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% solution
solution(Queens):-
	permutation([1,2,3,4,5,6,7,8], Queens), 
	safe(Queens).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% permutation
% permutation( [ ], [ ]).
% permutation([ X | L], P):- 
	%permutation(L, L1),
	%insert(X, L1, P).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% del
del(X, [X | Tail], Tail).
del(X,[Y | Tail], [Y | Tail1]):- 
	del(X, Tail, Tail1).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% insert
insert(X, List, Biggerlist):- 
	del(X ,Biggerlist, List).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% safe
safe([ ]).
safe([Queen | Others]):-  
	safe(Others), 
	noattack(Queen, Others, 1).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% noattack
noattack( _ , [ ], _ ).
noattack(Y, [Y1 | Ylist], Xdist):-
	Y1 - Y=\= Xdist , Y - Y1 =\= Xdist,
	Dist1 is Xdist +1, noattack(Y, Ylist, Dist1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Query syntax:
%  ?- solution([Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8]).