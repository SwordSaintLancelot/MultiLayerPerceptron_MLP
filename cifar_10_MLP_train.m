function [ net ] = cifar_10_MLP_train( trdata, trlabels )

    net = feedforwardnet(10); % Using the two-layer feed-forward network. The network has one hidden layer with ten neurons
    net = configure(net,trdata,trlabels); %net = network,  trdata = training data, trlabels = training labels
    
end

