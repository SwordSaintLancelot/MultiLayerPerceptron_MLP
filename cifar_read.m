if exist('tr_data','var') && size(tr_data,1) == 50000
  disp('Seems that data exists, clean tr_data to re-read!');
  return;
end;

conf.cifar10_dir = 'D:\MatlabProgram\MLP\cifar-10-batches-mat\cifar-10-batches-mat';
conf.train_files = {'data_batch_1.mat',...
                    'data_batch_2.mat',...
                    'data_batch_3.mat',...
                    'data_batch_4.mat',...
                    'data_batch_5.mat'};
conf.test_file = 'test_batch.mat';
conf.meta_file = 'batches.meta.mat';

load(fullfile(conf.cifar10_dir,conf.meta_file));

% Read training data and form the feature matrix and target output
tr_data = [];
tr_labels = [];
fprintf('Reading training data...\n');
for train_file_ind = 1:length(conf.train_files)
  fprintf('\r  Reading %s', conf.train_files{train_file_ind});
  load(fullfile(conf.cifar10_dir,conf.train_files{train_file_ind}));
  tr_data = [tr_data; data];
  tr_labels = [tr_labels; labels];
end;
fprintf('Done!\n');
load(fullfile(conf.cifar10_dir,conf.test_file));
te_data = data;
te_labels = labels;

% class labels should be changed in following way:
%0 ? (1 0 0 0 0)
%1 ? (0 1 0 0 0)

temp = zeros(size(tr_labels, 1), 10);

for i = 1:size(tr_labels, 1)
    temp(i, tr_labels(i)+1) = 1;
end

tr_labels = temp;
