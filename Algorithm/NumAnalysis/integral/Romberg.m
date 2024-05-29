% use Romberg method
% function : f, interval : [a, b], a = x_0, b = x_N, equal points
% F : Q_0 basic method, m : calculate Q_m
% P = [p_1, p_2, ..., p_m], Q_0(h) = sum(a_i p_i h^i)
function [y] = Romberg(f, a, b, N, F, m, P)

    if m == 0
        y = F(f, a, b, N);
        return
    end

    y1 = Romberg(f, a, b, N, F, m - 1, P);
    y2 = Romberg(f, a, b, 2 * N, F, m - 1, P);
    p = P(m);
    y = (y2 - 2 ^ (-p) * y1) / (1 - 2 ^ (-p));
end
