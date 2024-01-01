clc
clear
warning('off')

m = 112;
n = 92;
k_direct = 75;
k_mean = 35;
class_num = 40;
total_per_num = 10;
train_per_num = 5;
test_per_num =  5;

origin_data_path_pattern = '..\\att_faces\\s%d\\%d.pgm';
train_data_path_pattern = 'train_data\\s%d\\%d.pgm';
test_data_path_pattern = 'test_data\\s%d\\%d.pgm';

% 划分数据集
divide_data(class_num, total_per_num, train_per_num, test_per_num, origin_data_path_pattern)

% 训练
% 对训练集不做任何处理，共计 class_num * train_per_num 张图片
if ~exist('model', 'dir')
    mkdir('model');
end
if ~exist('./model/direct_model.mat', 'file') 
    % 计算参数 
    [character_pics_mean, V_k_direct, A_k_direct] =...
        direct_train(m, n, k_direct, class_num, 5, train_data_path_pattern);
    
    % 保存参数
    save('./model/direct_model.mat', 'character_pics_mean', 'V_k_direct', 'A_k_direct');
end
% 提取前处理训练集：平均各类图像，共计 class_num 张图像
if ~exist('./model/mean_model.mat', 'file') 
    % 计算参数
    [character_pics_mean, V_k_mean, A_k_mean] =...
        mean_train(m, n, k_mean, class_num, 5, train_data_path_pattern);
    
    % 保存参数
    save('./model/mean_model.mat', 'character_pics_mean', 'V_k_mean', 'A_k_mean');
end

% 导入参数
load('./model/direct_model.mat');
load('./model/mean_model.mat');

% 测试
accuracy_direct = test(m, n, class_num, test_per_num, test_data_path_pattern,... 
    character_pics_mean, V_k_direct, A_k_direct);
disp(['k= ', num2str(k_direct), ' Accuracy (No Additional Process):']);
disp(accuracy_direct);
accuracy_mean = test(m, n, class_num, test_per_num, test_data_path_pattern,... 
    character_pics_mean, V_k_mean, A_k_mean);
disp(['k= ', num2str(k_mean), ' Accuracy (Mean Process):']);
disp(accuracy_mean);