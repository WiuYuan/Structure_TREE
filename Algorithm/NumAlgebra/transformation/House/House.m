%find P=I-2u*u' such that P*x is zero only except for the first component
function [beta, nu] = House(x)
    s = x' * x;
    nu = x;

    if s == 0
        beta = 0;
        return
    end

    if x(1) >= 0
        nu(1) = nu(1) + sqrt(s);
    else
        nu(1) = nu(1) - sqrt(s);
    end

    beta = 2 / (nu' * nu);
end
