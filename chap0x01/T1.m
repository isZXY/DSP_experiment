% @author:ZXY
% 1. �ÿ��پ�������������������е����Ծ����
clc,clear

% ��������
n1=0:14;
xn=sin(0.4*n1);

n2=0:19;
hn=0.9.^n2;

% �������Ծ����Ҫ��fft����
N=length(n1)+length(n2)-1;

% ��fft�任
Xk=fft(xn,N);
Hk=fft(hn,N);

%YkΪ���Ծ����fft
Yk=Xk.*Hk;

% ��Yk��ifft
yn=ifft(Yk)

%����yn
n3=0:33;
stem(n3,yn)
