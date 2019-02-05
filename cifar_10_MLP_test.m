function [ label ] = cifar_10_MLP_test( x, net ) % net = Network, x = Training feature set
    
    label = net(x); %estimating the label from test features
    temp = zeros(size(label, 1), 1);

    for i = 1:size(label, 1)
        [~, ind] = max(label(i,:));
        temp(i, :) =  ind - 1;
    end

    label = temp;
end

