% 蓄意攻击：按照节点重要性顺序，一次攻击一个节点

clc;
clear; 

%加载数据
load('Data\testBA_100nodes.mat');

%% 初始化
%%%需要调整的参数
NumDelete = 20;                                              %% 蓄意删除的节点数

Name_Struct = Node_Key_Sort_Descend;       %  Name_Struct 数据集名称，更换网络数据集时，需要更改此处结构体名称
A_Init =  Name_Struct.Adjacent_Matrix;      %% 网络邻接矩阵
N_Init = size(A_Init,1);                     %% 节点个数

NetEff_Init = zeros(1,NumDelete);
Struct_Init = struct('Deg',NetEff_Init);

% 初始网络性能
%生成随机数，以此进行随机攻击（注释掉即为蓄意攻击），随机数值改为你自己网络的节点数
Name_Struct.Node_Key_Degree = randperm(440);

%% 
%  按照 Degree 算法排序，删除节点
A = A_Init;          %% 网络邻接矩阵 A
B=[];                %%定义空数组，接收被删除的节点序号
for i = 1:NumDelete
    A( Name_Struct.Node_Key_Degree(i),: ) = 0;     %% 删除节点 Node_Key_Degree(i),用 0 占位，不能置空
    A( :,Name_Struct.Node_Key_Degree(i) ) = 0;
    AA = A;
    AA( sum(A)==0,: ) = [];
    AA( :,sum(A)==0 ) = [];
    B(i) = Name_Struct.Node_Key_Degree(i);
    Con_Index_NetEff = testEglob( AA );

    Eglob(i) = Con_Index_NetEff.Net_Eff_Mymod;

end          

%%
%接下来就是生成网络连通效率图
%Eglob存储了相应的网络效率的数值