function upre = otl_compute(t,A,P,L)
%t为计算海潮负荷位移的预测时间
%该函数计算每个时间的某测站的某一方向的海潮负荷位移
time=datenum(t);
tide_names=['M2';'S2';'N2';'K2';'K1';'O1';'P1';'Q1'];
FREQ=1./[12.421;12;12.658;11.967;23.934;25.819;24.066;26.868];
ERR=zeros(8,1);
TIDECON=[A,ERR,P,ERR];
upre=t_predic(time,tide_names,FREQ,TIDECON,L);
    