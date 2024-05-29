function [status, g] = Monte_Carlo(status, T, r)
x = status.x;
y = status.y;
N = status.N;
del = status.del;
sigma = status.sigma;
beta = status.beta;
L = status.L;
thick = status.thick;
M = length(r);
g = zeros(1, M);
x2 = x;
y2 = y;
for t = 1: T
    for i = 1: N
        dx = (2 * rand() - 1) * del;
        dy = (2 * rand() - 1) * del;
        x2(i) = x(i) + dx;
        y2(i) = y(i) + dy;
        % periodic boundary
        if x2(i) < 0
            x2(i) = x2(i) + L;
        end
        if y2(i) < 0
            y2(i) = y2(i) + L;
        end
        if x2(i) > L
            x2(i) = x2(i) - L;
        end
        if y2(i) > L
            y2(i) = y2(i) - L;
        end
    end
    dU = 0;
    for i = 1: N
        for j = 1: N
            if j == i
                continue
            end
            dU = dU + u_simp(sqrt((x2(i)-x2(j))^2+(y2(i)-y2(j))^2), sigma);
            dU = dU - u_simp(sqrt((x(i)-x(j))^2+(y(i)-y(j))^2), sigma);
        end
    end
    if rand() <= exp(-beta * dU)
        x = x2;
        y = y2;
    else
        x2 = x;
        y2 = y;
    end
    % calculate g
    for k = 1: M
        for i = 1: N
            for j = 1: N
                rr = sqrt((x(j)-x(i))^2+(y(j)-y(i))^2);
                if rr > r(k) && rr < r(k) + thick
                    g(k) = g(k) + 1;
                end
            end
        end
    end
end
status.x = x;
status.y = y;
rho = N / L^2;
for k = 1: M
    A = pi * ((r(k)+thick)^2-r(k)^2);
    g(k) = g(k) / (A*(N-1)*T*rho);
end
end
function [U] = u_simp(r, sigma)
if r < sigma
    U = inf;
else
    U = 0;
end
end

