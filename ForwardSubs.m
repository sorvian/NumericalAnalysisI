%Forwards Substitution method

%Inputs
%
%L - Lower triangle matrix to substituted on
%
%y - the vector such that Ux = y
%
%Outputs
%
%x - Solution to the system Ux = y

function x = ForwardSubs(L,y)

%Initialize the solution vector
x = zeros(size(L,1),1);

%Defining x_1

x(1) = y(1)/(L(1,1));

for i= 1:size(L)
    
    %Set x_i = y_i
    
    x(i) = y(i);
    
    for j = 1:size(L,1)
       
        %Subtract x_j*U_ij from y_i
        
        x(i) = x(i) - x(j)*L(i:i,j:j);
        
    end
    
    %Divide by L_ii
    
    x(i) = x(i)/L(i:i,i:i);
end

end