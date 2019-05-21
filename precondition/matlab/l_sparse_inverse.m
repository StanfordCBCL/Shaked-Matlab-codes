function [m]=l_sparse_inverse(A,j,tol,n)
    ej=spalloc(1,n,1);
    ej(j)=1;
    m=ej/A(j,j);
    %m(j)=0;
    r=ej-m*A;
    for k=1:11
        %d=sparsify_tol(r,10^-2,n,A);
        %d=sparsify_shape(r,j,n,ceil(log2(log2(n))));
        d=sparsify_shape(r,j,n,5);
        %d(j)=r(j);
        q=d*A;
        alpha=(r*q')/(q*q');
        m=m+alpha*d;
        r=r-alpha*q;
        if norm(r)<tol
            break;
        end
    end
end
