function x_out = myRadixMethod(x_in)
    if numel(x_in) > 1
        x_out = zeros(1, numel(x_in));
        x1 = myRadixMethod(x_in(1:2:(end - 1)));
        x2 = myRadixMethod(x_in(2:2:end));
        W = zeros(1, numel(x_in));
        for it = 1:numel(x_in)
           W(it) = (cos(-1*2*pi/numel(x_in)) + 1i*sin(-1*2*pi/numel(x_in)))^(it - 1);
        end
        for it = 1:numel(x_in)/2
            x_out(it) = x1(it) + W(it)*x2(it);
            x_out((it + (numel(x_in)/2))) = x1(it) + W((it + (numel(x_in)/2)))*x2(it);
        end
    else
        x_out = x_in;
    end
end



