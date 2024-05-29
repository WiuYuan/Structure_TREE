% get A = LL^T, L lower and diag positive
function [L] = Cholesky(A)
    [~, n] = size(A);
    L = zeros(n, n);

    for j = 1:n
        L(j, j) = sqrt(A(j, j));
        L(j + 1:n, j) = A(j + 1:n, j) / L(j, j);
        A(j + 1:n, j + 1:n) = A(j + 1:n, j + 1:n) - L(j + 1:n, j) * L(j + 1:n, j)';
    end

end
