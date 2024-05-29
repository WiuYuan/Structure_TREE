function [status] = init_status(M1, M2, mu, m, n)
status = -ones(m, n);
M = -m * n;
M1 = M1 / mu;
M2 = M2 / mu;
for i = 1: m
    for j = 1: n
        if M >= M1 && M <= M2
            return
        end
        status(i, j) = 1;
        M = M + 2;
    end
end
end

