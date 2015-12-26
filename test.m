function test()
niters = 200;
nsamples = 200;
[x y]=generate_examples(nsamples);

[ids cut_values left_values  right_values f accuracys error_rates alphas losses] = adaboost( x, y, niters);
figure(1);
subplot(2,2,1);
plot(alphas);
title('Alpha');
xlabel('iterations');
subplot(2,2,2);
plot(error_rates);
title('Error Rate');
xlabel('iterations');
subplot(2,2,3);
plot(losses);
title('Loss');
xlabel('iterations');
subplot(2,2,4);
plot(accuracys);
title('Accuracy');
xlabel('iterations');
check(ids, cut_values, left_values,  right_values, alphas);
end



function check(ids, cut_values, left_values,  right_values, alphas)
niters = length(ids);


x = 0:0.01:1;
f = 0*x;
for i=1:niters
    newf = 0*x;
    
    for j=1:length(x)
        if x(j) <= cut_values(i)
            newf(j) = left_values(i);
        else
            newf(j) = right_values(i);
        end
    end
    
    
    figure(2);
    plot(f,'b-');
    hold on;
    plot(alphas(i)*newf,'g-');
    f = f + alphas(i)*newf;
    plot(f,'r-');
    hold off;
    title(num2str(i));
    pause;
end
end