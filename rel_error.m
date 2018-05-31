function [w] = rel_error(x, x_approx)
%rel_error  Zwraca błąd względny wektora

  w = norm(x-x_approx)/norm(x);

end