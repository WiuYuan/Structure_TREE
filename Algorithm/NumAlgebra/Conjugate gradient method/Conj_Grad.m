% using Conjugate gradient method to solve Ax = b
% stop criterion : ||p|| <= tol * ||b||
% input : A, b. initial value x0, tol
% output : solution x, iteration number num
function [x, num] = Conj_Grad(A, b, x0, tol)

    if nargin == 2
        tol = 1e-15;
    end

    num = 0;
    x = x0;
    r = b - A * x0;
    p = r;
    s = p' * p;
    lower_bound = norm(b) * tol;

    while sqrt(s) > lower_bound
        num = num + 1;
        z = A * p;
        v = s / (p' * z);
        x = x + v * p;
        r = r - v * z;
        ss = r' * r;
        p = r + (ss / s) * p;
        s = ss;
    end

end
