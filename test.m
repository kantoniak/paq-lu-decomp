A = [
2, 4, 5, 8;
1, 7, 2, 4;
3, 9, 6, 1;
8, 2, 9, 7
];

[R, p, q] = ROZKLAD(A, 2);

P = eye(n); P = P(p,:);
Q = eye(n); Q = Q(q,:);
L = tril(R, -1) + eye(4);
U = triu(R);

P*A*Q'
L*U