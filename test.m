A = [
2, 4, 5, 8;
1, 7, 2, 4;
3, 9, 6, 1;
8, 2, 9, 7
];

L = [
1, 0, 0, 0;
1/2, 1, 0, 0;
3/2, 3/5, 1, 0;
4, -14/5, 31/3, 1
]

U = [
2, 4, 5, 8;
0, 5, -0.5, 0;
0, 0, -6/5, -11;
0, 0, 0, 266/3
]

[R, p, q] = ROZKLAD(A, 0);
L - eye(size(L, 1)) + U
R