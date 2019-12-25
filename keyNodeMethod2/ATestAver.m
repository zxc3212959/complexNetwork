function Eglob = ATestAver(str,numDelete)
%输入 ： 
%        str：意为数据文件的路径
%        numDelete:删除节点的个数

%返回值：Eglob，即网络效率值的数组

%加载数据文件
load(str);

Name_Struct = Node_Key_Sort_Descend;       %  Name_Struct 数据集名称，更换网络数据集时，需要更改此处结构体名称
A_Init =  Name_Struct.Adjacent_Matrix;      %% 网络邻接矩阵
N_Init = size(A_Init,1);                     %% 节点个数

NetEff_Init = zeros(1,numDelete);
Struct_Init = struct('Deg',NetEff_Init);

% 初始网络性能
%生成随机数，以此进行随机攻
Name_Struct.Node_Key_Degree = randperm(440);

%% 
%  按照 Degree 算法排序，删除节点
A = A_Init;          %% 网络邻接矩阵 A
for i = 1:numDelete
    A( Name_Struct.Node_Key_Degree(i),: ) = 0;     %% 删除节点 Node_Key_Degree(i),用 0 占位，不能置空
    A( :,Name_Struct.Node_Key_Degree(i) ) = 0;
    AA = A;
    AA( sum(A)==0,: ) = [];
    AA( :,sum(A)==0 ) = [];
    Con_Index_NetEff = testEglob( AA );

    Eglob(i) = Con_Index_NetEff.Net_Eff_Mymod;          
end
