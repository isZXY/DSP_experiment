clc,clear

OmegaP = 2*pi*2500;
OmegaS = 2*pi*3500;
Rp = 2; 
As = 15;
Fs=10000;
T=1/Fs;

%ת��������Ƶ��
wp=OmegaP/Fs;
ws=OmegaS/Fs;

% �������˲������ָ��ת��Ϊģ���˲��������ָ��
% ��ʹ��˫���Ա仯��ʱҪԤ����!
OmegaP = (2/T)*tan(wp/2);
OmegaS = (2/T)*tan(ws/2);


[N, Wn] = buttord(OmegaP, OmegaS ,Rp,As,'s')  %%�õ�ģ���˲����Ľ״κ�3dB��ֹƵ�� 
[B,A] = butter(N,Wn,'s')  %%�ɽ״κ�3dB��ֹƵ�ʵõ�ģ���˲�����ϵͳ����
[Bz,Az] = bilinear(B,A,1/T);%���ó弤��Ӧ���䷨��ģ���˲���ת��Ϊ�����˲���
[App,Ass]=freqzn(Bz,Az,wp/pi,ws/pi,Rp,As,'low')

