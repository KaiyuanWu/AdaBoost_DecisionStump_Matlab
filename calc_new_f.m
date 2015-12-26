function new_f  = calc_new_f( x, id, cut_value,left_value, right_value)
%CALC_NEW_F Summary of this function goes here
%   Detailed explanation goes here
[nfeatures nsamples] = size(x);
new_f = zeros(1,nsamples);
for i=1:nsamples
    new_f(i) = decision_stump(x(:,i), id, cut_value, left_value, right_value);
end
end

