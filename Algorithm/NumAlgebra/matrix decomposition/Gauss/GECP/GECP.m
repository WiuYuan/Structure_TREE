% get PAQ = LU, L lower, U upper, P and Q pivoting
% not consider A(k, k) == 0
function [P, Q, L, U] = GECP(A)
    [~, n] = size(A);
    L = zeros(n, n);
    U = zeros(n, n);
    P = eye(n, n);
    Q = eye(n, n);

    for k = 1:n
        p = k; q = k;

        for i = k:n

            for j = k:n

                if abs(A(p, q)) < abs(A(i, j))
                    p = i; q = j;
                end

            end

        end

        if p ~= k
            A([k, p], :) = A([p, k], :);
            L([k, p], :) = L([p, k], :);
            P([k, p], :) = P([p, k], :);
        end

        if q ~= k
            A(:, [k, q]) = A(:, [q, k]);
            U(:, [k, q]) = U(:, [q, k]);
            Q(:, [k, q]) = Q(:, [q, k]);
        end

        L((k + 1):n, k) = A((k + 1):n, k) / A(k, k);
        U(k, k:n) = A(k, k:n);
        A((k + 1):n, (k + 1):n) = A((k + 1):n, (k + 1):n) - L((k + 1):n, k) * U(k, (k + 1):n);
        L(k, k) = 1;
    end

end
