%Recursive Function that calcuates each segment of the fouirer
%decomposition using the radix-2 method. 
function x_out = myRadixMethod(x_in)
%If the number of x_in elements is greater than one calculate the 1st one +
%W*2nd one where W is a complex number representing e^(2*pi/N)
    if numel(x_in) > 1
        %declaring the size of x_out
        x_out = zeros(1, numel(x_in));
        %Recursive Part call this function with x_in sorted properly split
        %into even odd pairs. 
        x1 = myRadixMethod(x_in(1:2:(end - 1)));
        x2 = myRadixMethod(x_in(2:2:end));
        W = zeros(1, numel(x_in));
        for it = 1:numel(x_in)
           %Creating a W for each iteration count
           W(it) = (cos(-1*2*pi/numel(x_in)) + 1i*sin(-1*2*pi/numel(x_in)))^(it - 1);
        end
        for it = 1:numel(x_in)/2
            %X_out is x1+ W*x2 if in the first half, otherwise it is x1 -
            %W*x2
            x_out(it) = x1(it) + W(it)*x2(it);
            x_out((it + (numel(x_in)/2))) = x1(it) + W((it + (numel(x_in)/2)))*x2(it);
        end
    %In the case of x_in of one element long, x_out = x_in
    else
        x_out = x_in;
    end
end



