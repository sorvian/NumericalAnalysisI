%LU Decomposition Method
%
%Decomposes a matrix A  such that A = L*U and L is a lower triangular matrix
%and U is an upper triangular matrix recursively. The function 
%stores all elements in before creating L and U from these entries.
%
%Input
%
%A - A matrix to be decomposed into L and U components
%
%Outputs 
%
%L - a lower triangular matrix in the decomposition of A
%
%U - an upper triangular matrix in the decomposition of A

function  [L,U] = LUDecomp(A)

%Initialize L and U matrices

L = zeros(size(A,1));

U = zeros(size(A,1),size(A,1));

%Store A in a checking matrix B

B = A;

%Recursive base case of a 2x2 matrix whose LU decomposition is easy to
%solve

if size(A) == 2
    
    disp(A)
    
    %First row of U equal to the first row of A
    
     U(1,1) = A(1,1);
     U(1,2) = A(1,2);
     
     L(2,1) = A(2,1)/A(1,1);
     L(1,1) = 1;
     L(2,2) = 1;
    
     disp(L(2,1)*U(1,2))
     
     %u_ii = a_ii - l_i,i-1*u_i-1,i
     
     U(2,2) = A(2,2) - L(2,1)*U(1,2);
     
else

%The first row of U is equal to the first row of A
%so we need to create the first column of L

for i = 1:size(A,1) 
            
                    %Set the matrix elements for L and U at row and col 1
    
                    L(i,1) = A(i,1)/A(1,1);
                    U(1,i) = A(1,i);
                    
                    
end

for i = 1:size(A,1)
   
    %Set the A matrix with same components, this will be
    %useful in recursive definition using A
    
    A(i,1) = L(i,1);
    
end

%Now we need to use those rows to find the smaller rows and columns
%of U and L respectively. We can do this recursively by subtracting out an
%n-1xn-1 matrix. 

[L(2:size(A),2:size(A)),U(2:size(A),2:size(A))] = LUDecomp(A(2:size(A),2:size(A)) - A(2:size(A),1)*A(1,2:size(A)));





end

%Check to see if L*U = A using B

if L*U == B

    disp('Sucessful decomposition')
    
end

end


   