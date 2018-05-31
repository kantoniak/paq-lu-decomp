function [w] = average_time(f, samples)
%average_time  Zwraca średni czas wykonania f samples razy.

  tic
  for n=1:samples
    f();
  end
  w = toc/samples;

end