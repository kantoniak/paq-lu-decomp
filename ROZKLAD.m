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
          tmp = R(x,:);
          R(x,:) = R(maks,:);
          R(maks,:) = tmp;

          tmp = p(x);
          p(x) = p(maks);
          p(maks) = tmp;
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
          tmp = R(x,:);
          R(x,:) = R(maks(1),:);
          R(maks(1),:) = tmp;

          tmp = p(x);
          p(x) = p(maks(1));
          p(maks(1)) = tmp;
        end

        % Zamiana kolumn
        if (maks(2) > x)
          tmp = R(:,x);
          R(:,x) = R(:,maks(2));
          R(:,maks(2)) = tmp;

          tmp = q(x);
          q(x) = q(maks(2));
          q(maks(2)) = tmp;
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
    error('Macierz A jest osobliwa');
  end

  n = size(R, 1);
  for y=x+1:n
    R(y,x) = R(y,x)/R(x,x);
    R(y,x+1:n) = R(y,x+1:n) - R(y,x)*R(x,x+1:n);
  end

end