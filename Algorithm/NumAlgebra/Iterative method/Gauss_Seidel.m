% using Gauss-Seidel method to solve Ax = b
% x0 : start point, tol : ||Ax-b||<tol*||b||, num : iterative number
function [x, num] = Gauss_Seidel(A, b, x0, tol)
    num = 0;
    [n, ~] = size(A);
    x = x0;

    while norm(A * x - b) / norm(b) > tol
        num = num + 1;

        for i = 1:n
            x(i) = (b(i) - A(i, 1:(i - 1)) * x(1:(i - 1)) - A(i, (i + 1):n) * x((i + 1):n)) / A(i, i);
        end

    end

end
