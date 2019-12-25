function Con_Index_NetEff = testEglob( A )

A_A = A;                               %%  保存原有的经过删除孤立节点后的 邻接矩阵，在分离矩阵中会使用到 A

%测试全局效率
A_A=sparse(A_A);

ShortPath=1./graphallshortestpaths(A_A);

ShortPath(ShortPath==inf)=0;

Eglob=(1/(length(A_A)*(length(A_A)-1)))*sum(sum(ShortPath))

Net_Eff_Mymod = Eglob;

% 返回值
Con_Index_NetEff = struct('Net_Eff_Mymod',Net_Eff_Mymod);


end

