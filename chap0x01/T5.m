% @author:ZXY

clc,clear,close all

% 5.Ҫ��Ƶ�ʷֱ���Ϊ1Hz��ȷ������Ƶ�� ������ʱ��Tp�ͳ�������N��
f0=1; % Ƶ�ʷֱ���
Tp=1/f0% Ƶ�ʷֱ������źż�¼���ȵĵ���

% ȷ��fs
% fs>=2fh
% ��ŷ����ʽ��exp(-3t)=cos(-3t)+isin(-3t)=cos(2pi*fh*t),���m
fh=3/(2*pi);
fs_min=2*fh; %����fsҪ>=2fh�Ϳ���ȷ�����������ʧ�档

% ������ε���
fs = 1000


N=fs/f0

n=0:1/fs:Tp;
xn=exp(-3*n);

Xk=fft(xn);

% ��ͼ
stem(n,Xk)
