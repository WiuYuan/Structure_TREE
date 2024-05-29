%calculate eigenvalue of symmetric matrix using Jacobi,slowest at large
%n,but highest accuracy
function [eig_value,J]=eig_J(A,tol)
if nargin==1
    tol=1e-20;
end
[~,n]=size(A);
J=eye(n);
    function Jacobi_Rotation(j,k)
        if abs(A(j,k))<tol
            return
        end
        r=(A(j,j)-A(k,k))/(2*A(j,k));
        t=sign(r)/(abs(r)+sqrt(1+r^2));
        c=1/sqrt(1+t^2);
        s=c*t;
        R=[c,-s;s,c];
        A([j,k],:)=R'*A([j,k],:);
        A(:,[j,k])=A(:,[j,k])*R;
        J(:,[j,k])=J(:,[j,k])*R;
    end
off=0;
for i=1:n-1
    for j=i+1:n
        off=off+A(i,j)^2;
    end
end
while off>tol
    off1=off;
    for i=1:n-1
        for j=i+1:n
            off=off-A(i,j)^2;
            Jacobi_Rotation(i,j);
        end
    end
    if off1==off
        break
    end
end
eig_value=sort(diag(A));
end