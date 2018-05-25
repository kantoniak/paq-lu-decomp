function [R, p, q] = ROZKLAD(A, s)
%ROZKLAD  Dokonuje rozkładu trójkątno-trójkątnego macierzy A.
% Składnia: [R, p, q] = ROZKLAD(A, s)
%
% Argumenty:
%  A - nieosobliwa, kwadratowa macierz dowolnej wielkości
%  s - wariant rozkładu, gdzie:
%    0 - rozkład bez wyboru elementu głównego
%    1 - rozkład z wyborem elementu głównego w kolumnie
%    2 - rozkład z pełnym wyborem elementu głównego
%
% Wyjście:
%  R - macierz zawierająca czynniki L i U rozkładu
%  p - wektor permutacji wierszy
%  q - wektor permutacji kolumn

  % TODO(kantoniak): Uzupełnić
  n = size(A, 1);
  R = A;
  p = zeros(n, 1);
  q = zeros(n, 1);
end