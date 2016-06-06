![License](https://img.shields.io/badge/license-MIT-green.svg?style=plastic)

# Introduction
8QueenProlog is my assignment at college. Solving the 8-Queen Problem with 3 different ways on B-ProLog.
> Course: MCS, HCMUT <br />
> Subject: Logic Programmingand Constraints<br />
> Instructor: [Distinguished Instructor. Assoc. Prof. Dr. Duong Tuan Anh](http://cse.hcmut.edu.vn/~dtanh)

# Solution

## Solution 1 : Boardposition

### Source code

```prolog
% solution 1: boardposition

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% solution
solution([ ]).
solution([ p(X , Y) | Others]):-
	solution( Others), 
	member(Y , [1,2,3,4,5,6,7,8]),
	noattack(p(X,Y), Others).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% noattack
noattack( _ , [ ]).
noattack(p(X,Y), [ p(X1,Y1) | Others]):-
	Y =\= Y1 , 
	Y1-Y =\= X1-X , 
	Y1-Y =\= X-X1,
	noattack(p(X , Y), Others).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% member
% member( I,[ I | _ ]).
% member( I,[ _ | Rest]):-  member(I , Rest).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Query syntax:
%  ?- solution([p(1,Y1),p(2,Y2),p(3,Y3),p(4,Y4), p(5,Y5), p(6,Y6), p(7,Y7), p(8,Y8)]).

```

### Result

![](https://raw.githubusercontent.com/bs135/8QueenProlog/master/screenshot/screenshot_1.png)

## Solution 2 : Permutation

### Source

```prolog
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
```

### Result

![](https://raw.githubusercontent.com/bs135/8QueenProlog/master/screenshot/screenshot_2.png)

## Solution 1 : Exclusion

### Source code

```prolog
% solution 3: exclusion

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% solution
solution(Ylist):-
      sol(Ylist, [1, 2, 3, 4, 5, 6, 7, 8],
         [1, 2, 3, 4, 5, 6, 7, 8],
         [-7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7],
         [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]).
		 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sol
sol([], [], _, _, _).
sol( [Y|Ylist], [X|Dx1], Dy, Du, Dv):-
    del(Y, Dy, Dy1),
    U is X - Y,
    del(U, Du, Du1),
    V is X + Y,
    del(V, Dv, Dv1),
    sol(Ylist, Dx1, Dy1, Du1, Dv1).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% del	
del(Item, [Item| List], List).
del(Item, [First| List], [First| List1]):-
	del(Item, List, List1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Query syntax:
%  ?- solution([Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8]).
```

## Result

![](https://raw.githubusercontent.com/bs135/8QueenProlog/master/screenshot/screenshot_3.png)

# Help & Reference
- [Report](https://github.com/bs135/8QueenProlog/blob/master/report/report.pdf)
- [B-Prolog](http://www.picat-lang.org/bprolog/)

# Download
- [B-Prolog 8.1](https://github.com/bs135/8QueenProlog/raw/master/download/bp81_win.zip)
- [B-Prolog User Manual](https://github.com/bs135/8QueenProlog/raw/master/download/B-ProLog-manual.pdf)
