% get A = LDL^T, L unit lower, D diag
function [L, D] = LDLT(A)
    [~, n] = size(A);
    L = eye(n, n);
    D = zeros(n, 1);

    for j = 1:n
        D(j) = A(j, j);
        L(j + 1:n, j) = A(j + 1:n, j) / A(j, j);
        A(j + 1:n, j + 1:n) = A(j + 1:n, j + 1:n) - D(j) * L(j + 1:n, j) * L(j + 1:n, j)';
    end

end
