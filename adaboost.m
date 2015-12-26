function [ ids cut_values left_values  right_values f accuracys error_rates alphas losses] = adaboost( x, y, niters)
%ADABOOST Summary of this function goes here
%   Detailed explanation goes here
[nfeatures, nsamples] = size(x);
w = 1./nsamples*ones(1, nsamples);
f = zeros(1,nsamples);
for i=1:niters
   [id cut_value left_value right_value] = build_stump( x,y,w );
   new_f  = calc_new_f( x, id, cut_value,left_value, right_value);
   ids(i) = id;
   cut_values(i) = cut_value;
   error_rates(i) = calculate_error_rate(new_f,y,w);
   alphas(i) = 0.5*log((1-error_rates(i))/max(error_rates(i),eps));
   left_values(i) = left_value;
   right_values(i) = right_value;
   f = f + alphas(i)*new_f;
   w = update(y, w, alphas(i),new_f);
   losses(i) = sum(exp(-y.*f))/nsamples;
   accuracys(i) = 1 - calculate_error_rate(f,y);
   plot(w)
   fprintf('Iteration %d Accuracy %f Alpha %f Loss %f \n',i, accuracys(i) , alphas(i), losses(i));
end
end

