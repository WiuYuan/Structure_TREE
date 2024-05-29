% use 2-order Gauss method
% function : f, interval : [a, b], a = x_0, b = x_N, equal points
function [y] = Gauss(f, a, b, N)
    h = (b - a) / N;
    y = 0;

    for i = 0:N - 1
        ai = a + i * h;
        x1 = ai + h / 2 - h / (2 * sqrt(3));
        x2 = ai + h / 2 + h / (2 * sqrt(3));
        y = y + f(x1) + f(x2);
    end

    y = y * h / 2;
end
