% use trapezoid method
% function : f, interval : [a, b], a = x_0, b = x_N, equal points
function [y] = Trapezoid(f, a, b, N)
    h = (b - a) / N;
    y = 0;

    for i = 0:N - 1
        xi = a + i * h;
        xi1 = a + (i + 1) * h;
        y = y + f(xi) + f(xi1);
    end

    y = y * h / 2;
end
