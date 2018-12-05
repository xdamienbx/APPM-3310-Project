function F = buildFourier(n)
F = zeros(n,n);                     %create matrix size n by n all zeros

E = exp((-2*pi*1i)/n);%Epsilon equation 

for k = 1:n
    for j = 1:n
        m = (k-1)*(j-1);            %raise E to the power of 
        F(k,j) = E^m;
    end
end

end