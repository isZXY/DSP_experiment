clc,clear,close all

wp1 = 0.3*pi;
wp2 = 0.7*pi;
ws1 = 0.4*pi;
ws2 = 0.6*pi;
Rp = 0.5;
As = 40;
deltaw = min((ws1 - wp1),(wp2-ws2));
%% �����˥�� =40dB��ѡ��hanning����hanning���Ĵ���Ϊ 6.2*pi/N
N0 = ceil(6.2*pi/deltaw);
N = N0 + mod(N0+1,2)   %% ��֤NΪ����
%% �õ���ͨ�˲��������뵥λ������Ӧ hd
wc1 = (wp1 + ws1)/2;
wc2 = (wp2 + ws2)/2;
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(pi*m)./(pi*m) - sin(wc2*m)./(pi*m)+sin(wc1*m)./(pi*m); %% ����
%% �õ�N���hanning��
wdham = hanning(N)';
%% �õ�������Ӧ
h = hd.*wdham;
%% ������Ƶ����(dB)�������As�Ƿ��������ָ��
[Rpp,Ass] = freqzn(h,1,[wp1,wp2]/pi,[ws1,ws2]/pi,Rp,As,'stop') 
%% ���Ass <40 ��N = N+2 ���¼���
