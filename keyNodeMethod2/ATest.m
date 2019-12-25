%定义随机攻击节点的个数，具体数值根据网络规模拟定
numDelete = 22;

%定义网络效率初始矩阵
netSum = zeros(1,numDelete);

%定义随机攻击的次数，也就是函数循环的次数
numRandom = 50;
for i=1:numRandom
    
    %把得到的网络效率数组赋给netI
    netI = ATestAver('Data\testBA_100nodes.mat',numDelete);
    %累加
    netSum = netSum + netI;
end

%求出平均值
netAver = netSum/numRandom;

