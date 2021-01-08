%画出各分潮的矢量图
%首先根据分潮的振幅和相位构建分潮相量，每个测站就有8个分潮相量
%将测站经纬度坐标中精度大于180度的值减去360度，使得经度保持在[-180 180];
%使用m_map选定测区，并利用m_quiver(long,lat,U,V,S)函数将各分潮相量绘制在测区中
load('F:\work\读取海潮参数\tp_otl\各分潮相量.mat');     %加载测站各分潮相量
load('F:\work\读取海潮参数\tp_otl\测站经纬度与U方向A和P.mat');%加载测站经纬度
long=position(:,1);lat=position(:,2);               %测站的经纬度
long(long>180)=long(long>180)-360;       %将经度限定在[-180 180]范围内
min_long=floor(min(long));max_long=ceil(max(long));   
longitudes=[min_long max_long];                       %测区经度范围
min_lat=floor(min(lat));max_lat=ceil(max(lat));      
latitudes=[min_lat max_lat];                          %测区纬度范围
%绘制M2分潮矢量图
C={'M2','S2','N2','K2','K1','O1','P1','Q1'};
color='mbgrmbgr';
 ln_sar=[0.10 4.70 4.70 0.10 0.10]; 
 lt_sar=[50.68 50.68 47.80 47.80 50.68];
for m=1:8
    subplot(2,4,m);
    m_proj('albers equal-area','longitudes',[-5 5],'latitudes',[42 52]);
    [CS,CH]=m_etopo2('contourf',[-7000:500:3000],'edgecolor','none');
    m_coast('patch',[0.7 0.7 0]);
    m_grid('box','fancy','tickdir','in');
    hold on
    m_quiver(long,lat, phasor{m}(:,1), phasor{m}(:,2),2,color(m));
    f_text = [C{m},'分潮的矢量图'];
    m_line(ln_sar,lt_sar,'color','black','linewi',3);
    title(f_text,'fontsize',15);
    xlabel('经度');ylabel('纬度');
end
 colormap([ m_colmap('blues')]);