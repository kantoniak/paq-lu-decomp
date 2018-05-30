A = [
4, 4, 1, 1;
0, 0, 1, 0;
1, 0, 1, 1;
1, 1, 0, 1
];

try
  ROZKLAD(A, 0);
  error('Rozkład bez el. głównego nie zatrzymał się na 0 na przekątnej!');
catch er
  if strcmp(er.identifier, 'ROZKLAD:zeroOnDiagonal')
    disp('Rozkład bez el. głównego wyłapał 0 na przekątnej.')
  else
    rethrow(er)
  endif
end

ROZKLAD(A, 1);
disp('Rozkład z el. głównym w kolumnie obsłużył 0 na przekątnej.');

ROZKLAD(A, 2);
disp('Rozkład z el. głównym w podmacierzy obsłużył 0 na przekątnej.');
  