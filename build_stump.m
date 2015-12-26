function [id, cut_value, left_value, right_value] = build_stump( x,y,w )
%BUILD_STUMP Summary of this function goes here
%   Detailed explanation goes here
[nfeatures, nsamples] = size(x);
max_gain = Inf;
best_id = 0;
best_cut_value = 0;
best_left_value = 0;
best_right_value = 0;
best_left_gain = 0;
best_right_gain = 0;
best_split = 0;
for i = 1: nfeatures
    tx = x(i,:);
    [tx index] = sort(tx);
    ty = y(index);
    tw = w(index);
    for j=1:nsamples-1
       if tx(j) < tx(j+1)
          left_y = ty(1:j);
          right_y = ty(j+1:nsamples);
          
          left_w = tw(1:j);
          right_w = tw(j+1:nsamples);
          
          [left_gain lv] = node_gain(left_y, left_w);
          [right_gain rv] = node_gain(right_y, right_w);
          gain = left_gain + right_gain;
%           [gain lv rv] = node_gain2(left_y, left_w, right_y, right_w);
        
        if gain < max_gain
              max_gain = gain;
              best_id = i;
              best_cut_value = 0.5*(tx(j) + tx(j+1));
              best_left_value = lv;
              best_right_value = rv;
              
              best_left_gain = left_gain;
              best_right_gain = right_gain;
              best_split = j;
          end
       end
    end
end
% fprintf('left gain %f\t right gain %f\t split %d\n', best_left_gain, best_right_gain,best_split );
id = best_id;
cut_value = best_cut_value;
left_value = best_left_value;
right_value = best_right_value;
end

