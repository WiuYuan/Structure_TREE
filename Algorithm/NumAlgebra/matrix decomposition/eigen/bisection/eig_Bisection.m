%calculate eigenvalue of symmetric matrix using bisection,fastest,and
%enough accuracy,but no eigenvector
function [eig_value, Q] = eig_Bisection(A, desired, eig_min, eig_max, tol)

    if nargin < 4
        tol = 1e-10;
    end

    if nargin < 3
        eig_min = -1000;
        eig_max = 1000;
    end

    if nargin == 1
        desired = 0;
    end

    [~, n] = size(A);

    if desired
        [QQ, A] = Hessenberg(A);
    else
        [~, A] = Hessenberg(A, 1);
    end

    function [num] = Negcount(z)
        d = A(1, 1) - z;

        if d < 0
            num = 1;
        else
            num = 0;
        end

        for i = 2:n
            d = (A(i, i) - z) - A(i, i - 1) ^ 2 / d;

            if d < 0
                num = num + 1;
            end

        end

    end

    function [b] = eig_B_inv(z, b)
        ll = zeros(n - 1, 1);
        d = zeros(n, 1);
        d(1) = A(1, 1) - z;

        for i = 2:n
            d(i) = (A(i, i) - z) - A(i, i - 1) ^ 2 / d(i - 1);
            ll(i - 1) = A(i, i - 1) / d(i - 1);
        end

        for i = 2:n
            b(i) = b(i) - ll(i - 1) * b(i - 1);
        end

        for i = 1:n
            b(i) = b(i) / d(i);
        end

        for i = n - 1:-1:1
            b(i) = b(i) - ll(i) * b(i + 1);
        end

    end

    function [x] = eig_B_inv_it(z)
        x = randn(n, 1);
        x = x / norm(x);

        while 1
            y = eig_B_inv(z, x);
            ev = x' * y;

            if sum(abs(ev * x - y)) < tol
                break
            end

            x = y / norm(y);
        end

    end

    num_list = zeros(10000, 4);
    num_list_top = 1;
    na = Negcount(eig_min);
    nb = Negcount(eig_max);

    if nargin < 3

        while nb - na < n
            eig_min = eig_min * 2;
            eig_max = eig_max * 2;
            na = Negcount(eig_min);
            nb = Negcount(eig_max);
        end

    end

    eig_value = zeros(nb - na, 1);
    eig_num = 0;
    num_list(1, :) = [eig_min, na, eig_max, nb];

    while num_list_top ~= 0
        a = num_list(num_list_top, :);
        num_list_top = num_list_top - 1;
        mid = (a(1) + a(3)) / 2;

        if a(3) - a(1) < tol

            for j = a(2) + 1:a(4)
                eig_num = eig_num + 1;
                eig_value(eig_num) = mid;
            end

        else
            n_mid = Negcount(mid);

            if a(2) < n_mid
                num_list_top = num_list_top + 1;
                num_list(num_list_top, :) = [a(1), a(2), mid, n_mid];
            end

            if a(4) > n_mid
                num_list_top = num_list_top + 1;
                num_list(num_list_top, :) = [mid, n_mid, a(3), a(4)];
            end

        end

    end

    eig_value = sort(eig_value);
    Q = zeros(n);

    if desired

        for j = 1:n - 1
            Q(:, j) = eig_B_inv_it((eig_value(j) * 2 + eig_value(j + 1)) / 3);
        end

        Q(:, n) = eig_B_inv_it(eig_value(n) + 1);
        Q = QQ * Q;
    end

end
