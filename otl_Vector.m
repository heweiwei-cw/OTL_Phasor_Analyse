%改程序目的是提取每个测站同一分潮的U方向的振幅和相位，相当于对u_A_P.mat中的UAP进行重组
%该程序以一个结构体提取八个分潮的U方向振幅和相位
%构建所有测站的各个分潮相量，可以用作绘制分潮的矢量图
load('F:\work\读取海潮参数\tp_otl\测站经纬度与U方向A和P.mat');  %加载通过readOTL程序得到的各测站在U方向的振幅和相位
U=zeros(149,2,'double');
all={U,U,U,U,U,U,U,U};
phasor={U,U,U,U,U,U,U,U};
%用for循环提取所有测站各分潮振幅和相位
for i=1:149
    for j=1:8
        all{j}(i,1)=UAP{i}(j,1);all{j}(i,2)=UAP{i}(j,2);
    end
end
otlVector=struct('M2',all{1},'S2',all{2},'N2',all{3},'K2',all{4},'K1',all{5},'O1',all{6},'P1',all{7},'Q1',all{8});
save('F:\work\读取海潮参数\tp_otl\各分潮振幅和相位.mat','otlVector');
%构建所有测站的8个分潮相量
for k=1:8
    A=all{k}(:,1);P=all{k}(:,2);   %所有第i个分潮的振幅相位
    phasor{k}=[A.*cosd(P),A.*sind(P)]; %所有第i个分潮的相量
end
save('F:\work\读取海潮参数\tp_otl\各分潮相量.mat','phasor');