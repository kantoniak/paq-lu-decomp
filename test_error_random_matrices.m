seed = 1;                 % Wartość początkowa generatora liczb losowych
SAMPLES = 50;             % Liczba testów do uśrednienia
N = [2 5 7 10 15 20 25 50 75];  % Rozmiar macierzy % 2 5 7 10 15 20 25 50 75

rel_matlab = zeros(size(N, 2), 1);
rel_bez_gl = zeros(size(N, 2), 1);
rel_gl_kol = zeros(size(N, 2), 1);
rel_gl_mat = zeros(size(N, 2), 1);

for i=1:size(N, 2)

    x = ones(N(i), 1);

    rand('seed', 1);
    for n=1:SAMPLES
        A = rand(N(i));
        b = A*x;

        err_rel_matlab = rel_error(x, A\b);

        [R, p, q] = ROZKLAD(A, 0);
        x_bez_gl = ROZWIAZ(R, p, q, b);
        err_rel_bez_gl = rel_error(x, x_bez_gl);

        [R, p, q] = ROZKLAD(A, 1);
        x_gl_kol = ROZWIAZ(R, p, q, b);
        err_rel_gl_kol = rel_error(x, x_gl_kol);

        [R, p, q] = ROZKLAD(A, 2);
        x_gl_mat = ROZWIAZ(R, p, q, b);
        err_rel_gl_mat = rel_error(x, x_gl_mat);

        rel_matlab(i) = rel_matlab(i) + err_rel_matlab;
        rel_bez_gl(i) = rel_bez_gl(i) + err_rel_bez_gl;
        rel_gl_kol(i) = rel_gl_kol(i) + err_rel_gl_kol;
        rel_gl_mat(i) = rel_gl_mat(i) + err_rel_gl_mat;
    end

    rel_matlab(i) = rel_matlab(i) / SAMPLES;
    rel_bez_gl(i) = rel_bez_gl(i) / SAMPLES;
    rel_gl_kol(i) = rel_gl_kol(i) / SAMPLES;
    rel_gl_mat(i) = rel_gl_mat(i) / SAMPLES;

end
rand('seed', 'reset');

averages = [N', rel_matlab, rel_bez_gl, rel_gl_kol, rel_gl_mat];

hold on
  grid on
  semilogy(N, rel_matlab);
  semilogy(N, rel_bez_gl);
  semilogy(N, rel_gl_kol);
  semilogy(N, rel_gl_mat);
  xlabel('Rozmiar macierzy');
  ylabel('Średni błąd względny');
  %title('Porównanie średnich błędów względnych rozwiązania układu równań');
  legend('Matlab', 'Gauss bez el. głównego', 'Z el. głównym w kolumnie', 'Z el. głównym w macierzy');
  print -depscairo '-S450, 300' 'test_error_random_matrices.eps'
hold off
