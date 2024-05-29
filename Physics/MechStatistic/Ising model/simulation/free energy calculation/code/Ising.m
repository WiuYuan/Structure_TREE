function [status, p] = Ising(status, beta, J, H, T, M, mu, M1, M2)
[m, n] = size(status);
dir = [1, 0; -1, 0; 0, 1; 0, -1];
M = M / mu;
M1 = M1 / mu;
M2 = M2 / mu;
M_now = sum(sum(status));
p = 0;
for t = 1: T
    if M == M_now
        p = p + 1;
    end
    x = randi([1, m]);
    y = randi([1, n]);
    M_new = M_now - 2 * status(x, y);
    if M_new < M1 || M_new > M2
        continue
    end
    dE = 0;
    for i = 1: 4
        xx = x + dir(i, 1);
        yy = y + dir(i, 2);
        if xx >= 1 && xx <= m && yy >= 1 && yy <= n
            dE = dE + 2 * J * status(x, y) * status(xx, yy);
        end
    end
    dE = dE + 2 * H * status(x, y);
    if rand() <= exp(-beta * dE)
        M_now = M_new;
        status(x, y) = -status(x, y);
    end
end
p = p / T;
end

