% use Simpson method
% function : f, interval : [a, b], a = x_0, b = x_N, equal points
function [y] = Simpson(f, a, b, N)
    h = (b - a) / N;
    y = 0;

    for i = 0:N - 1
        xi = a + i * h;
        xi1f2 = a + (i +1/2) * h;
        xi1 = a + (i + 1) * h;
        y = y + f(xi) + 4 * f(xi1f2) + f(xi1);
    end

    y = y * h / 6;
end
