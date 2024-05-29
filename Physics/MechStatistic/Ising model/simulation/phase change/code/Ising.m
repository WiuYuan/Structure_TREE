function [status] = Ising(status, beta, J, H, T)
[m, n] = size(status);
dir = [1, 0; -1, 0; 0, 1; 0, -1];
for t = 1: T
    x = randi([1, m]);
    y = randi([1, n]);
    dE = 0;
    for i = 1: 4
        xx = x + dir(i, 1);
        yy = y + dir(i, 2);
        if xx >= 1 && xx <= m && yy >= 1 && yy <= n
            dE = dE + 2 * J * status(x, y) * status(xx, yy);
        end
    end
    dE = dE + 2 * H * status(x, y);
    if dE <= 0
        status(x, y) = -status(x, y);
    else
        if rand() <= exp(-beta * dE)
            status(x, y) = -status(x, y);
        end
    end
end
end

