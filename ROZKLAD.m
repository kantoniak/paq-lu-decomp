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
%
% W przypadku rozkładu bez wyboru elementu głównego, jeśli
% macierz A w którymś kroku trafi na zero na przekątnej, to
% zostanie zwrócony błąd 'ROZKLAD:zeroOnDiagonal'.

  n = size(A, 1);
  R = A;
  p = 1:n;
  q = 1:n;

  switch s
    case 0 % Bez wyboru elementu głównego

      for x=1:n-1
        R = wyeliminuj_kolumne(R, x);
      end


    case 1 % Z elementem głównym w kolumnie
      
      for x=1:n-1
        % Wyszukiwanie el. głównego w kolumnie
        maks = x;
        for i=x+1:n
          if (abs(R(i,x)) > abs(R(maks,x)))
            maks = i;
          end
        end

        % Zamiana wierszy
        if (maks > x)
          [R, p] = zamien_wiersze(R, p, maks(1), x);
        end

        R = wyeliminuj_kolumne(R, x);
      end


    case 2 % Z elementem głównym w macierzy
      
      for x=1:n-1
        % Wyszukiwanie el. głównego w podmacierzy
        maks = [x, x];
        maks_val = R(maks(1), maks(2));
        for i=x:n
          for j=x:n
            if (abs(R(i,j)) > abs(maks_val))
              maks = [i, j];
              maks_val = R(maks(1), maks(2));
            end
          end
        end

        % Zamiana wierszy
        if (maks(1) > x)
          [R, p] = zamien_wiersze(R, p, maks(1), x);
        end

        % Zamiana kolumn
        if (maks(2) > x)
          [R, q] = zamien_kolumny(R, q, maks(2), x);
        end

        R = wyeliminuj_kolumne(R, x);
      end


    otherwise
      error(sprintf('Opcja s=%d nie jest wspierana.', s));
  end
end

function [R] = wyeliminuj_kolumne(R, x)
% wyeliminuj_kolumne wykonuje odejmowania, które eliminują x-tą kolumnę podmacierzy.

  if (R(x,x) == 0)
    error('ROZKLAD:zeroOnDiagonal', 'Element zerowy na przekątnej');
  end

  n = size(R, 1);
  for y=x+1:n
    R(y,x) = R(y,x)/R(x,x);
    R(y,x+1:n) = R(y,x+1:n) - R(y,x)*R(x,x+1:n);
  end

end

function [R, p] = zamien_wiersze(R, p, i, j)
% zamien_wiersze zamienia wiersze w macierzy i w wektorze permutacji.

  tmp = R(i, :);
  R(i, :) = R(j, :);
  R(j, :) = tmp;

  tmp = p(i);
  p(i) = p(j);
  p(j) = tmp;

end

function [R, q] = zamien_kolumny(R, q, i, j)
% zamien_kolumny zamienia kolumny w macierzy i w wektorze permutacji.

  tmp = R(:, i);
  R(:, i) = R(:, j);
  R(:, j) = tmp;

  tmp = q(i);
  q(i) = q(j);
  q(j) = tmp;

end