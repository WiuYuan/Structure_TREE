% calculate Hessenberg form A=Q*H*Q', while A symmetric H bidiagonal
% if undesired = 1, then we don't calculate Q
function [Q, H] = Hessenberg(A, undesired)

    if nargin == 1
        undesired = 0;
    end

    [~, n] = size(A);
    Q = eye(n);

    for i = 1:n - 2
        u = House(A(i + 1:n, i));
        A(i + 1:n, i:n) = A(i + 1:n, i:n) - 2 * u * (u' * A(i + 1:n, i:n));
        A(:, i + 1:n) = A(:, i + 1:n) - 2 * (A(:, i + 1:n) * u) * u';

        if undesired == 0
            Q(:, i + 1:n) = Q(:, i + 1:n) - 2 * (Q(:, i + 1:n) * u) * u';
        end

    end

    H = A;
end
