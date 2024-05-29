% get A = LU, L lower, U upper
function [L, U] = LU(A)
    [~, n] = size(A);
    L = zeros(n);
    U = zeros(n);

    for i = 1:n
        L(i, i) = 1;
        U(i, i:n) = A(i, i:n);

        if i ~= n
            L((i + 1):n, i) = A((i + 1):n, i) / A(i, i);
            A((i + 1):n, (i + 1):n) = A((i + 1):n, (i + 1):n) - L((i + 1):n, i) * U(i, (i + 1):n);
        end

    end

end
