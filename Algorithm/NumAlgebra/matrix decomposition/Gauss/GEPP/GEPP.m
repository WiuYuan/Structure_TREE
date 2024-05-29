% get PA = LU, L lower, U upper, P pivoting
function [P, L, U] = GEPP(A)
    [~, n] = size(A);
    L = zeros(n, n);
    U = zeros(n, n);
    P = eye(n, n);

    for k = 1:n
        p = k;

        for i = k:n

            if abs(A(p, k)) < abs(A(i, k))
                p = i;
            end

        end

        if p ~= k
            A([k, p], :) = A([p, k], :);
            L([k, p], :) = L([p, k], :);
            P([k, p], :) = P([p, k], :);
        end

        L((k + 1):n, k) = A((k + 1):n, k) / A(k, k);
        U(k, k:n) = A(k, k:n);
        A((k + 1):n, (k + 1):n) = A((k + 1):n, (k + 1):n) - L((k + 1):n, k) * U(k, (k + 1):n);
        L(k, k) = 1;
    end

end
