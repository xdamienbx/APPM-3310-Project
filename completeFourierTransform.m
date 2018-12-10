%After the fourier tranform is complete this function makes it so
%amplitudes, phase displacement and frequnecies are spit out. This makes it
%easier to plot by using stem(t, x);
function [x_out, t] = completeFourierTransform(x_in, Fs)
    x_in = makeElPowerOfTwo(x_in);
    %Double and devide the the number of elements to get actual amplitude. 
    xtemp = 2*myRadixMethod(x_in)/numel(x_in);
    x_out = zeros(2, numel(xtemp));
   	t = 0:(numel(x_in(1,:))-1);
    t = t*Fs/numel(x_in);
    %For loop calculates the amplitude and sticks it in the first row, and
    %phase displacement in the second row. 
    for it = 1:numel(x_in)
        x_out(1, it) = sqrt(real(xtemp(it))^2 + imag(xtemp(it))^2);
        x_out(2, it) = atan(imag(xtemp(it))/imag(xtemp(it)));
    end 
end