[y , fs] = audioread("440.wav");
x1 = transpose(y);

[x, t] = completeFourierTransform(x1, fs);
stem(t, x(1, :));