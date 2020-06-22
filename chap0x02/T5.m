clear,clc;
%���ִ�ͨ�˲��������ָ��
wp1 = 0.4*pi; wp2 = 0.5*pi;
ws1 = 0.2*pi; ws2 = 0.7*pi;
Rp = 1;
As = 15;

%1�������ִ�ͨ���ָ��ת��Ϊ���ֵ�ͨ���ָ��
%�����ֵ�ͨ�˲�����ͨ������Ƶ��Ϊ cetaP = 0.2*pi;
cetaP = 0.2*pi;
beta = cos((wp2+wp1)/2)/cos((wp2-wp1)/2);
k = cot((wp2-wp1)/2)*tan(cetaP/2);
alpha1 = (-2*beta*k)/(1+k);
alpha2 = (k-1)/(k+1);
cetaS=(log(-(exp(-j*2*ws2)+alpha1*exp(-j*ws2)+alpha2)/(alpha2*exp(-j*2*ws2)+alpha1*exp(-j*ws2)+1)))/(-j);

%2�������ֵ�ͨ�˲������ָ��ת��Ϊģ���ͨ�˲��������ָ��
%��ʹ��˫���Ա仯��ʱҪԤ����
%�����������T=1;
T = 1;
omegaP = (2/T)*tan(cetaP/2);
omegaS = (2/T)*tan(cetaS/2);

%3�����ģ���ͨ�˲���
%�õ�ģ���˲����Ľ״�
[N,Wn]=cheb1ord(omegaP,omegaS,Rp,As,'s');
%�õ�ģ���˲�����ϵͳ������ϵ��
[b,a] = cheby1(N,Rp,Wn,'s');

%4��ʹ��˫���Ա仯����ģ���ͨ�˲���ת��Ϊ���ֵ�ͨ�˲���
[Bz,Az] = bilinear(b,a,1/T);

%5�������ֵ�ͨ�˲���ת��Ϊ���ִ�ͨ�˲���
[bz,az] = lp2bpz(Bz,Az,alpha1,alpha2)

%��������������˲����ķ�Ƶ����
[Rpp,Ass] = freqzn(bz, az, [wp1,wp2]/pi, [ws1,ws2]/pi, Rp, As, 'band')