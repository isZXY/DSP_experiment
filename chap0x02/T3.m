clc,clear

%% �����˲��������ָ��
wp = 0.4*pi; 
ws = 0.54*pi;
Rp = 1;
As = 15;
%% �������˲������ָ��ת��Ϊģ���˲��������ָ��
%% ��ʹ��˫���Ա仯��ʱҪԤ����!
%% �����������T=1;
T = 1;
omegaP = (2/T)*tan(wp/2);
omegaS = (2/T)*tan(ws/2);
%% �õ�ģ���˲����Ľ״�
[N,Wn] = cheb1ord (omegaP,omegaS,Rp,As,'s')
%% ���ģ���˲���
[b,a] = cheby1(N,Rp,Wn,'s')
%% ʹ��˫���Ա任����ģ���˲���ת��Ϊ�����˲���
[bz,az] = bilinear(b,a,1/T)
%% ��������������˲����ķ�Ƶ���ԣ������Rp��As�Ƿ��������ָ��
[Rpp,Ass] = freqzn(bz, az, wp/pi, ws/pi, Rp, As, 'low')  %%���Աຯ����
%%%%%% ֱ�������������
[N,Wn] = cheb1ord (wp/pi, ws/pi,Rp,As)
[b,a] = cheby1(N,Rp,Wn,'low')
