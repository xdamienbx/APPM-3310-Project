[y , fs] = audioread("440hz_120sec.wav");
x1 = transpose(y);

indices = 8:1:fix(log2(length(x1)));
comp_measure = zeros(length(indices), 1)';
mat_measure = zeros(length(indices), 1)';
for i = indices
    cnt = 2^i;
    sub = x1(1:cnt);
    disp(i);
    disp(cnt);
    
    f = @() completeFourierTransform(sub, fs);
    dur = timeit(f);
    
    m = @() fft(sub, fs);
    dur_m = timeit(m);
    
    comp_measure(i-7) = dur;
    mat_measure(i-7) = dur_m;
end



stem(indices, comp_measure(1, :));
hold on

stem(indices, mat_measure(1, :));

legend('Project', 'Matlab')
xlabel('Number Of Data Points ( 2^x )')
ylabel('Duration ( sec )')
