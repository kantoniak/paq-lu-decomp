A = [
2, 4, 5, 8;
1, 7, 2, 4;
3, 9, 6, 1;
8, 2, 9, 7
]

[R, p, q] = ROZKLAD(A, 2);
b = [1, 1, 1, 1]
x_wlasny = ROZWIAZ(R, p, q, b')
x_matlab = A\b'