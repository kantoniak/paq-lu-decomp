>> help ROZKLAD
'ROZKLAD' is a function from the file ROZKLAD.m

ROZKLAD  Dokonuje rozkładu trójkątno-trójkątnego macierzy A.
 Składnia: [R, p, q] = ROZKLAD(A, s)

 Argumenty:
  A - nieosobliwa, kwadratowa macierz dowolnej wielkości
  s - wariant rozkładu, gdzie:
    0 - rozkład bez wyboru elementu głównego
    1 - rozkład z wyborem elementu głównego w kolumnie
    2 - rozkład z pełnym wyborem elementu głównego

 Wyjście:
  R - macierz zawierająca czynniki L i U rozkładu
  p - wektor permutacji wierszy
  q - wektor permutacji kolumn

 W przypadku rozkładu bez wyboru elementu głównego, jeśli
 macierz A w którymś kroku trafi na zero na przekątnej, to
 zostanie zwrócony błąd 'ROZKLAD:zeroOnDiagonal'.