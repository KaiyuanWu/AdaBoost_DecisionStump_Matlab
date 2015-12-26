function error_rate = calculate_error_rate(f,y,w)
%CALCULATE_ERROR_RATE Summary of this function goes here
%   Detailed explanation goes here
error_rate = 0.;
predict_label = sign(f);
if exist('w','var')
    total_weights =sum(w);
    wrong_weights = sum(w(predict_label~=y));
    error_rate = wrong_weights/total_weights;
else
    total_weights =length(y);
    wrong_weights = sum(predict_label~=y);
    error_rate = wrong_weights/total_weights;
end
end

