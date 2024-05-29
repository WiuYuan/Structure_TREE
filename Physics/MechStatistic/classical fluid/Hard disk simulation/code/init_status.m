function [status] = init_status(status)
tot = 0;
N = status.N;
x = zeros(1, N);
y = zeros(1, N);
sigma = status.sigma;
L = sigma * sqrt(N / status.density);
status.L = L;
while tot < N
    x2 = rand() * L;
    y2 = rand() * L;
    jud = 1;
    for j = 1: tot
        if sqrt((x2-x(j))^2+(y2-y(j))^2) < sigma
            jud = 0;
            break
        end
    end
    if jud
        tot = tot + 1;
        x(tot) = x2;
        y(tot) = y2;
    end
end
status.x = x;
status.y = y;
end

