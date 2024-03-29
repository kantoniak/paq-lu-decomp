function [x] = ROZWIAZ(R, p, q, b)
%ROZWIAZ  Rozwiązuje układ równań Ax=b korzystając z rozkładu trójkątno-trójkątnego macierzy A.
% Składnia: [x] = ROZWIAZ(R, p, q, b)
%
% Argumenty:
%  R - macierz zawierająca czynniki L i U rozkładu
%  p - wektor permutacji wierszy
%  q - wektor permutacji kolumn
%  b - wektor b z równania do rozwiązania
%
% Wyjście:
%  x - rozwiązanie układu równań
%
% Zobacz też: ROZKLAD

  n = size(R, 1);
  P = eye(n); P = P(p,:);
  Q = eye(n); Q = Q(q,:);
  c = P*b;

  % Rozwiązujemy Lz = c
  z(1) = c(1);
  for i=2:n
    z(i) = c(i) - R(i,1:i-1)*z(1:i-1)';
  end
  z = z';

  % Rozwiązujemy Uy = z
  y(n) = z(n)/R(n,n);
  for i=n-1:-1:1
    y(i) = (z(i) - R(i,i+1:n)*y'(i+1:n))/R(i,i);
  end
  y = y';

  x = Q'*y;
end