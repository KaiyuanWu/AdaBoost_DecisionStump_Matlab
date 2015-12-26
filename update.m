function new_w = update(y, w, alpha,f)
%UPDATE Summary of this function goes here
%   Detailed explanation goes here
new_w = w.*exp(-alpha*f.*y);
new_w = new_w/sum(new_w);

end

