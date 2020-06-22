clc,clear
% 4���ֱ���N��21��N��51��Blackman���Խ�ֹƵ�ʦ�c��0.4�е������ͨ�˲�����
% �����FIR�˲������ֱ���������˲����ķ�����Ӧ����С���˥��As�������ܵó�ʲô���ۡ�

%% N=21
% �����Blackman�����ɴ���ȣ�11*pi/N
N=21;
deltaw=11*pi/N
wc=0.4*pi;
As=50;

% ws-wp=deltaw,ws+wp=2*wc
ws=(deltaw+2*wc)/2;
wp=(2*wc-deltaw)/2; 

%����Blackman ��
N0 = ceil(11*pi/deltaw);
N = N0 + mod(N0+1,2) ;  %% ��֤NΪ����
wc = (wp + ws)/2;

% �õ����뵥λ������Ӧ hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(wc*m)./(pi*m);
% �õ�N���hamming��
wdham = blackman(N)';
% �õ�������Ӧ
h = hd.*wdham;
% ������Ƶ����(dB)�������As�Ƿ��������ָ��
[Rpp,Ass] = freqzn(h,1,wp/pi,ws/pi,0.5,As,'low') 


%% N=51
N=51;
deltaw=11*pi/N
wc2=0.4*pi;
As=50;

% ws-wp=deltaw,ws+wp=2*wc
ws2=(deltaw+2*wc)/2;
wp2=(2*wc-deltaw)/2;

%����Blackman ��
N0 = ceil(11*pi/deltaw);
N = N0 + mod(N0+1,2) ;  %% ��֤NΪ����
wc2 = (wp2 + ws2)/2;

% �õ����뵥λ������Ӧ hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(wc2*m)./(pi*m);
% �õ�N���hamming��
wdham = blackman(N)';
% �õ�������Ӧ
h = hd.*wdham;
% ������Ƶ����(dB)�������As�Ƿ��������ָ��
[Rpp2,Ass2] = freqzn(h,1,wp2/pi,ws2/pi,0.5,As,'low') 


%% ���ۣ���ͼ������֪��������Խ�ߣ���С���˥��As���Ҳ����һЩ�����������˵��
% ����ֵ�Ҳ�������һЩ�������ߵĹ��ɴ�Ҳ��һЩ����deltaw��