seed = 1;                 % Wartość początkowa generatora liczb losowych
SAMPLES = 50;             % Liczba testów do uśrednienia
N = [10 15 20 25 50 75];  % Rozmiar macierzy % 10 15 20 25 50 75

averages = zeros(size(N, 2), 5);

for i=1:size(N, 2)

  rand('seed', seed);
  times(1) = average_time(@()(
    lu(rand(N(i)))
  ), SAMPLES);

  rand('seed', seed);
  times(2) = average_time(@()(
    ROZKLAD(rand(N(i)), 0)
  ), SAMPLES);

  rand('seed', seed);
  times(3) = average_time(@()(
    ROZKLAD(rand(N(i)), 1)
  ), SAMPLES);

  rand('seed', seed);
  times(4) = average_time(@()(
    ROZKLAD(rand(N(i)), 2)
  ), SAMPLES);

  averages(i, :) = [N(i), times/N(i)];

end

hold on
  grid on
  %plot(N, averages(1:size(N, 2), 2));
  plot(N, averages(1:size(N, 2), 3));
  plot(N, averages(1:size(N, 2), 4));
  plot(N, averages(1:size(N, 2), 5));
  xlabel('Rozmiar macierzy');
  ylabel('Czas rozkładu [sekundy/n]');
  title('Porównanie średnich czasów rozkładu macierzy (sekundy/n)');
  legend('Gauss bez el. głównego', 'Z el. głównym w kolumnie', 'Z el. głównym w macierzy');
  %print -depscairo '-S450, 300' 'test_time_random_matrices_vs_matlab.eps'
hold off
