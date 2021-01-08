%海潮负荷位移计算的主程序
load('F:\work\读取海潮参数\tp_otl\测站经纬度与U方向A和P.mat');     %加载测站点、测站纬度、8个分潮U方向振幅和相位
prompt = {'请输入测站点海潮负荷位移要预测的时间:','请输入测站点数目：'};
dlg_title = '时间与测站数量设置';
num_lines = 2;
def={'2020，11，20','247'};
t_n=inputdlg(prompt,dlg_title,num_lines,def);          %确定要输入的预测时间和测站点数量
t=t_n{1};n=str2double(t_n{2});
u_displacement=zeros(n,1,'double');
for i=1:n
    A=UAP{i}(:,1);
    P=UAP{i}(:,2);
    L=position(i,2);
    upre=otl_compute(t,A,P,L);
    u_displacement(i)=upre;
end
save('F:\work\读取海潮参数\tp_otl\测站U方向海潮位移.mat','u_displacement');