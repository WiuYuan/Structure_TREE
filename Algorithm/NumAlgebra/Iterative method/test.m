A = rand(10); A = A + 2 * eye(10); b = rand(10, 1);
xstar = A \ b; x0 = zeros(10, 1); x0(1) = 1;
[x, num] = SOR(A, b, x0, 1.5, 1e-10);
num