clc,clear

omegaP = 2*pi*1500;
omegaS = 2*pi*3000;
Rp = 3; 
As = 12;
Fs=10000;

%ת��������Ƶ��
wp=omegaP/Fs;
ws=omegaS/Fs;


[N, Wn] = buttord(omegaP, omegaS ,Rp,As,'s')  %%�õ�ģ���˲����Ľ״κ�3dB��ֹƵ��
[B,A] = butter (N,Wn,'s')  %%�ɽ״κ�3dB��ֹƵ�ʵõ�ģ���˲�����ϵͳ����
[Bz,Az]=impinvar(B,A,Fs);%���ó弤��Ӧ���䷨��ģ���˲���ת��Ϊ�����˲���
[App,Ass]=freqzn(Bz,Az,wp/pi,ws/pi,Rp,As,'low')