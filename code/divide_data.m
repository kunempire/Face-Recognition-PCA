function divide_data(class_num, total_per_num, train_per_num, test_per_num, path_pattern)
%DIVIDE_DATA �������ݼ�
%   class_num: �������
%   total_per_num: ÿ������ͼƬ����
%   train_per_num: ÿ������ѵ��������
%   test_per_num: ÿ�����Ĳ��Լ�����
%   path_pattern: ���ݼ�·����������ʽ

    % ����ѵ�����Ͳ��Լ��ļ���
    if ~exist('train_data', 'dir')
        mkdir('train_data');
    end
    if ~exist('test_data', 'dir')
        mkdir('test_data');
    end
    
    % ÿ���������ݼ�һ����Ϊѵ������һ����Ϊ���Լ�
    for i = 1:class_num
        
        % ����������
        random_index = randperm(total_per_num);
        
        % ѵ����
        train_path = sprintf('train_data\\s%d', i);
        if ~exist(train_path, 'dir')
            mkdir(train_path);
        end
        
        for j = 1:train_per_num
            des = sprintf('train_data\\s%d\\%d.pgm', [i, j]);
            copyfile(sprintf(path_pattern, [i, random_index(j)]), des)
        end
        
        % ���Լ�
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