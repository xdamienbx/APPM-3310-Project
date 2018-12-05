
%Load in a test file directly
[y, fs] = audioread('damien.wav');
y = transpose(y);
y1 = zeros(1, 7168);
for a = 0:7167
   y1(a + 1) = myDFT(y, 7168, a); 
end
plot(0:7167, real(y1), 0:7167, imag(y1));

%This part is the actual function that calculates everything

function [x, b] = myDFT(x_in, n, bin)
    x = 0;
    b = zeros(1, n);
    for a = 0:(n-1)
        b(a + 1) = 2*pi*bin*a/n;
    end
    for c = 0:(n-1)
        x = x + x_in(c+1)*(cos(-b(c+1)) + 1i*sin(-b(c+1)));
    end
end
