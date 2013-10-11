%Gaussian Elimination
%
%Function takes in a matrix and row reduces into an upper triangular matrix
%which is then backwards substituted using the method BackSubs 
%
%Inputs
%
%A - A square matrix of real numbers
%
%Outputs
%
%x - solution to the system Ax = b

function x = GaussElim(A,b)

x = zeros(size(A),1);

for i = 1:size(A,1)
    
    if A(i,i) ~= 0
    
        for j = i+1:size(A,1)  %descending rows beneath the ith row
        
        %Compute a_ij/a_ii
        
        pivot = A(j,i)/A(i,i);
        
            for k = i:size(A,1)
            
            %iterating across to subtract from each element in the jth row
            %and kth column
          
            
                A(j,k) = A(j,k) - A(i,k)*pivot;
                
            
            
            end
            
            
            b(j) = b(j) - b(i)*pivot;
        
        end
    end
    
end

x = BackSubs(A,b);
end

