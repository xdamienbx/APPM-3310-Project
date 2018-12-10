function [x_out, t] = completeFourierTransform(x_in, Fs)
    x_in = makeElPowerOfTwo(x_in);
    xtemp = 2*myRadixMethod(x_in)/numel(x_in);
    x_out = zeros(2, numel(xtemp));
   	t = 0:(numel(x_in(1,:))-1);
    t = t*Fs/numel(x_in);
    for it = 1:numel(x_in)
        x_out(1, it) = sqrt(real(xtemp(it))^2 + imag(xtemp(it))^2);
        x_out(2, it) = atan(imag(xtemp(it))/imag(xtemp(it)));
        
    end 
end