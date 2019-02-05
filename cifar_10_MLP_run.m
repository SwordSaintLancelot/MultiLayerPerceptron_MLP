
F = cifar_10_features_ex(tr_data); % Feature extraction from the training data
disp('FEATURES EXTRACTED');
net = cifar_10_MLP_train( F, tr_labels); % Training the Neural network with the features
disp('TRAINING THE NEURAL NET IS COMPLETE');

%%
F_test = cifar_10_features_ex(te_data); % Feature extraction from the test data
disp('OBTAINED TEST FEATURES');

estimatedLabel = cifar_10_MLP_test( F_test, net ); % Return the estimated label from Neural Net
disp('TEST SUCCESSFULLY RAN');
actual_labels = te_labels; 
matches = estimatedLabel==actual_labels'; % Finding matches where the actual label is equal to the estimated labels

disp('MATCHES FOUND!');
accuracy = sum(matches)/size(matches,1) * 100; % Calculating the accuracy of the Network
disp('SUCCESSFUL EXECUTION. ACCURACY: ');
disp(max(accuracy));
