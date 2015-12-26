function [gain value] = node_gain(y, w)
%NODE_GAIN Summary of this function goes here
%   Detailed explanation goes here
unique_y = unique(y);
% unique_y = [-1 1];
total_w = sum(w);
gain = 0.;
value = 0;
% if total_w <= 0
%     return;
% end

max_w = -Inf;
for i = 1:length(unique_y)
   uw = sum(w(y == unique_y(i)));
%    if uw > 0
%         gain = gain - uw/total_w * log(max(uw/total_w,eps)); 
%    end
   if uw > max_w
      max_w = uw;
      gain = total_w - uw;
      value = unique_y(i);
   end
end
% gain = gain*total_w;
end

