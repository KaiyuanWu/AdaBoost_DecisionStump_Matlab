function y = decision_stump(x,id, cut_value,left_value, right_value)
%DECISION_STUMP Summary of this function goes here
%   Detailed explanation goes here
if x(id) <= cut_value
    y = left_value;
else
    y = right_value;
end
end

