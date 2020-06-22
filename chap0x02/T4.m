%% ���ָ�ͨ�˲��������ָ��
wp = 0.6*pi; 
ws = 0.46*pi;
Rp = 1;
As = 15;
%% 1�������ָ�ͨ���ָ��ת��Ϊ���ֵ�ͨ���ָ��
%% �����ֵ�ͨ�˲�����ͨ������Ƶ��Ϊ cetaP = 0.3*pi;
cetaP = 0.3*pi;
alpha = -cos((wp+cetaP)/2)/cos((wp-cetaP)/2)
cetaS = log(-(exp(j*ws)+alpha)/(1+alpha*exp(j*ws)))/(-j)
%% 2�������ֵ�ͨ�˲������ָ��ת��Ϊģ���ͨ�˲��������ָ��
%% ʹ��˫����ת��������ҪԤ����!
%% �����������T=1;
T = 1;
omegaP = (2/T)*tan(cetaP/2);
omegaS = (2/T)*tan(cetaS/2);
%% 3�����ģ���ͨ�˲���
%% �õ�ģ���˲����Ľ״�
[N,Wn] = cheb1ord (omegaP,omegaS,Rp,As,'s')
%% �õ�ģ���˲�����ϵͳ����
[b,a] = cheby1(N,Rp,Wn,'s')
%% 4��ʹ��˫���Ա仯����ģ���˲���ת��Ϊ�����˲���
[Bz,Az] = bilinear(b,a,1/T)
%% 5�������ֵ�ͨ�˲���ת��Ϊ���ָ�ͨ�˲��� 
[bz,az] = lp2hpz(Bz,Az,alpha)  %%���ú���Ϊ�Աຯ������¼��
%% ��������������˲����ķ�Ƶ���ԣ������Rp��As�Ƿ��������ָ��
[Rpp,Ass] = freqzn(bz, az, wp/pi, ws/pi, Rp, As, 'high')  %%���Աຯ����
%%%%%% ֱ�������������
[N,Wn] = cheb1ord (wp/pi,ws/pi,Rp,As)
[b,a] = cheby1(N,Rp,Wn,'high')
