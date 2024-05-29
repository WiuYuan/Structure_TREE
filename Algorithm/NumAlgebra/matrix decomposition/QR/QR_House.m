% use House rotate to calculate A=QR,and lower accuracy, but able to
% calculate singular matrix
function [Q, R] = QR_House(A)
    [m, n] = size(A);
    Q = eye(m);

    for i = 1:n
        [beta, nu] = House(A(i:m, i));
        A(i:m, i:n) = A(i:m, i:n) - (beta * nu) * (nu' * A(i:m, i:n));
        Q(:, i:m) = Q(:, i:m) - (Q(:, i:m) * nu) * (beta * nu');
    end

    R = A;
end
