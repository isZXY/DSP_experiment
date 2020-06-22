clc,clear,close all

wp = 0.4*pi;
ws = 0.6*pi;
As = 45;
deltaw = ws - wp;

%% Hamming ��
% ѡ��hamming����hamming���Ĵ���Ϊ 6.6*pi/N
N0 = ceil(6.6*pi/deltaw);
N = N0 + mod(N0+1,2)   %% ��֤NΪ����
wc = (wp + ws)/2;
% �õ����뵥λ������Ӧ hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(wc*m)./(pi*m);
% �õ�N���hamming��
wdham = hamming(N)';
% �õ�������Ӧ
h = hd.*wdham;
% ������Ƶ����(dB)�������As�Ƿ��������ָ��
6.6*pi/N
[Rpp,Ass] = freqzn(h,1,wp/pi,ws/pi,0.5,As,'low') 
% ����Ҫ��

%% Blackman��
% blackman���Ĵ���Ϊ 11*pi/N
N0 = ceil(11*pi/deltaw);
N = N0 + mod(N0+1,2)   %% ��֤NΪ����
wc = (wp + ws)/2;
% �õ����뵥λ������Ӧ hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(wc*m)./(pi*m);
% �õ�N���blackman��
wdham = blackman(N)';
% �õ�������Ӧ
h = hd.*wdham;
% ������Ƶ����(dB)�������As�Ƿ��������ָ��
11*pi/N
[Rpp,Ass] = freqzn(h,1,wp/pi,ws/pi,0.5,As,'low') 
% ����Ҫ��



%% ������Figure 1��hamming������˥��Ϊ47dB��С������ɴ���� 0.6283��
% Figure 2��blackman������˥��Ϊ71dB�ϴ󣬸���һЩ������ɴ����ͬ����0.6283�������ߣ���
%��ͼ����֪��hamming�����԰�Ҳ�ϸߣ�û��blackman��
