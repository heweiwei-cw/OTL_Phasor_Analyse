% A_NEU=table(C{1}(1),C{1}(2),C{1}(3),'VariableNames',{'N','E','U'});
% P_NEU=table(P{1}(1),P{1}(2),P{1}(3),'VariableNames',{'N','E','U'});
% AGEN=struct('M2',struct('A',table(C{1}(1),C{1}(2),C{1}(3),'VariableNames',{'N','E','U'})));
% AGEN=struct('M2',struct('A',A_NEU,'P',P_NEU));
%逐点读取测站海潮负荷位移参数振幅和相位程序
%提取测站点八分潮垂直方向振幅和相位UAP元组
%提取测站点经纬度position矩阵
clear;
clc;
[filename,pathname]=uigetfile('*.txt','打开各测站海潮文件');
fid=fopen(strcat(pathname,filename),'r');
if fid==-1
    msgbox('文件选取出错，读取程序无法运行','warning','warn');
    return;
end
prompt = '输入测站点数:';
dlg_title = 'Input';
num_lines = 1;
def={'100'};
n=inputdlg(prompt,dlg_title,num_lines,def);
position=zeros(str2double(n{1}),2,'double');        %定义测站点经、纬度矩阵
UAP=cell(str2double(n{1}),1);                  %定义测站点8个分潮U方向振幅和相位组成一个double型元组
station = cell(str2double(n{1}),1);            %测站名元组
k=1;
while k<=str2double(n)
    fline=fgetl(fid);
    st = fline(6:9);                 %测站点名称
    long = str2double(fline(34:41));
    lat=str2double(fline(45:51));
    sline=fgetl(fid);
    C = textscan(fid,'%7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f',3);           %读取站海潮振幅信息
    P = textscan(fid,'%f %f %f %f %f %f %f %f %f %f %f',3);                                 %读取测站相位信息
    %提取M2振幅和相位
    M2A=table(C{1}(1),C{1}(2),C{1}(3),'VariableNames',{'U','E','N'});                 
    M2P=table(P{1}(1),P{1}(2),P{1}(3),'VariableNames',{'U','E','N'});                  
    M2=struct('A',M2A,'P',M2P);
    %提取S2振幅和相位
    S2A=table(C{2}(1),C{2}(2),C{2}(3),'VariableNames',{'U','E','N'});
    S2P=table(P{2}(1),P{2}(2),P{2}(3),'VariableNames',{'U','E','N'});
    S2=struct('A',S2A,'P',S2P);
    %提取N2振幅和相位
    N2A=table(C{3}(1),C{3}(2),C{3}(3),'VariableNames',{'U','E','N'});
    N2P=table(P{3}(1),P{3}(2),P{3}(3),'VariableNames',{'U','E','N'});
    N2=struct('A',N2A,'P',N2P);
    %提取K2振幅和相位
    K2A=table(C{4}(1),C{4}(2),C{4}(3),'VariableNames',{'U','E','N'});
    K2P=table(P{4}(1),P{4}(2),P{4}(3),'VariableNames',{'U','E','N'});
    K2=struct('A',K2A,'P',K2P);
    %提取K1振幅和相位
    K1A=table(C{5}(1),C{5}(2),C{5}(3),'VariableNames',{'U','E','N'});
    K1P=table(P{5}(1),P{5}(2),P{5}(3),'VariableNames',{'U','E','N'});
    K1=struct('A',K1A,'P',K1P);
    %提取O1振幅和相位
    O1A=table(C{6}(1),C{6}(2),C{6}(3),'VariableNames',{'U','E','N'});
    O1P=table(P{6}(1),P{6}(2),P{6}(3),'VariableNames',{'U','E','N'});
    O1=struct('A',O1A,'P',O1P);
    %提取P1振幅和相位
    P1A=table(C{7}(1),C{7}(2),C{7}(3),'VariableNames',{'U','E','N'});
    P1P=table(P{7}(1),P{7}(2),P{7}(3),'VariableNames',{'U','E','N'});
    P1=struct('A',P1A,'P',P1P);
    %提取Q1振幅和相位
    Q1A=table(C{8}(1),C{8}(2),C{8}(3),'VariableNames',{'U','E','N'});
    Q1P=table(P{8}(1),P{8}(2),P{8}(3),'VariableNames',{'U','E','N'});
    Q1=struct('A',Q1A,'P',Q1P);
    otl_ap = struct('M2',M2,'S2',S2,'N2',N2,'K2',K2,'K1',K1,'O1',O1,'P1',P1,'Q1',Q1);     %八个分潮振幅和相位
    eval([st,'=','otl_ap',';']);
    position(k,1)=long;position(k,2)=lat;         %测站点经纬度
    station{k}=st;      %测站点
    %将每个测站U方向八个分潮振幅和相位提取出来
    for j=1:8
        UAP{k}(j,1)=C{j}(1);
        UAP{k}(j,2)=P{j}(1);
    end
    o_line = fgetl(fid);
    e =fgetl(fid);
    status = feof(fid);
    if status == 1
            break
    end
     k=k+1;
end
fclose(fid);
 %保存
save('F:\work\读取海潮参数\tp_otl\测站经纬度与U方向A和P.mat','station','position','UAP'); %该变量文件中包含所有测站点的经纬度和U方向的振幅与相位
    
