function divide_data(class_num, total_per_num, train_per_num, test_per_num, path_pattern)
%DIVIDE_DATA 划分数据集
%   class_num: 类别数量
%   total_per_num: 每个类别的图片总数
%   train_per_num: 每个类别的训练集数量
%   test_per_num: 每个类别的测试集数量
%   path_pattern: 数据集路径的正则表达式

    % 创建训练集和测试集文件夹
    if ~exist('train_data', 'dir')
        mkdir('train_data');
    end
    if ~exist('test_data', 'dir')
        mkdir('test_data');
    end
    
    % 每个类别的数据集一半作为训练集，一般作为测试集
    for i = 1:class_num
        
        % 随机打乱序号
        random_index = randperm(total_per_num);
        
        % 训练集
        train_path = sprintf('train_data\\s%d', i);
        if ~exist(train_path, 'dir')
            mkdir(train_path);
        end
        
        for j = 1:train_per_num
            des = sprintf('train_data\\s%d\\%d.pgm', [i, j]);
            copyfile(sprintf(path_pattern, [i, random_index(j)]), des)
        end
        
        % 测试集
        test_path = sprintf('test_data\\s%d', i);
        if ~exist(test_path, 'dir')
            mkdir(test_path);
        end
        
        for j = 1:test_per_num
            des = sprintf('test_data\\s%d\\%d.pgm', [i, j]);
            copyfile(sprintf(path_pattern,...
                [i,random_index(test_per_num + j)]), des)
        end
        
    end
end