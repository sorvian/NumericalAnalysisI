%HW 3 Script Files

%Backwards Substitution method
%
%Inputs 
%
%U - a square upper triangular matrix to be substituted on
%
%y - the vector such that Ux = y
%
%Outputs
%
%x - solution to the system Ux = y

function x = BackSubs(U,y)

%Initialize the solution vector a (0,0,0)^T
x(1:size(U),1) = zeros(size(U),1);

%Defining x_n
x(size(U,1),1) = y(size(U,1))/U(size(U,1),size(U,1));

for i = size(U,1)-1:-1:1
    
    %set x_i = y_i
    
    x(i) = y(i);
    
    for j = size(U,1):-1:i
        
        %Subtract x_j*U_ij from y_i
   
        x(i) = x(i) - x(j)*U(i:i,j:j);
        
    end
    
    %Divide by U_ii
    
    x(i) = x(i)/U(i:i,i:i);
    
end

end



