function [x y]=generate_examples(nsamples)
if ~exist('nsamples','var')
    nsamples = 100;
end

x = rand(1,nsamples);
y = zeros(1,nsamples);
for i=1:nsamples
   id = floor(1./x(i));
   if mod(id, 2) == 1
       y(i) = 1;
   else
       y(i) = -1;
   end
end

% [xr,index] = sort(x);
% yr = y(index);
% plot(xr,yr,'b-');
end