N = [10 15 20 25 50 75];  % Rozmiar macierzy % 10 15 20 25 50 75

rel_matlab = zeros(size(N, 2), 1);
rel_bez_gl = zeros(size(N, 2), 1);
rel_gl_kol = zeros(size(N, 2), 1);
rel_gl_mat = zeros(size(N, 2), 1);

for i=1:size(N, 2)

    A = hilb(N(i));
    x = ones(N(i), 1);
    b = A*x;

    rel_matlab(i) = rel_error(x, A\b);

    [R, p, q] = ROZKLAD(A, 0);
    x_bez_gl = ROZWIAZ(R, p, q, b);
    rel_bez_gl(i) = rel_error(x, x_bez_gl);

    [R, p, q] = ROZKLAD(A, 1);
    x_gl_kol = ROZWIAZ(R, p, q, b);
    rel_gl_kol(i) = rel_error(x, x_gl_kol);

    [R, p, q] = ROZKLAD(A, 2);
    x_gl_mat = ROZWIAZ(R, p, q, b);
    rel_gl_mat(i) = rel_error(x, x_gl_mat);

end

values = [N', rel_matlab, rel_bez_gl, rel_gl_kol, rel_gl_mat];

hold on
  grid on
  semilogy(N, rel_matlab);
  semilogy(N, rel_bez_gl);
  semilogy(N, rel_gl_kol);
  semilogy(N, rel_gl_mat);
  xlabel('Rozmiar macierzy');
  ylabel('Błąd względny');
  title('Porównanie błędów względnych rozwiązania układu równań danego macierzą Hilberta');
  legend('Matlab', 'Gauss bez el. głównego', 'Z el. głównym w kolumnie', 'Z el. głównym w macierzy');
  %print -depscairo '-S450, 300' 'test_error_hilbert_matrices.eps'
hold off
