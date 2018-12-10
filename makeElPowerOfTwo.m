%Function takes all data and reduces the amount to a power of two.
function x_out = makeElPowerOfTwo(x_in)
    f = 2;
    while f*2 <= numel(x_in)
       f = f*2; 
    end
    x_out = x_in(1:f);
end
