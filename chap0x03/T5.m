wp = 0.6*pi;  ws = 0.4*pi;
Rp = 1;  As = 45;
deltaw = wp - ws;
%% Ҫ��ѡ��Hamming��Hamming���Ĵ���Ϊ 6.6*pi/N
N0 = ceil(6.6*pi/deltaw);
N = N0 + mod(N0+1,2)   %% ��֤NΪ����
wc = (wp + ws)/2;
%% �õ���ͨ�˲��������뵥λ������Ӧ hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(pi*m)./(pi*m) - sin(wc*m)./(pi*m); %% ��ͨ�˲��������뵥λ������Ӧ
%% �õ�N���hamming��
wdham = hamming(N)';
%% �õ�������Ӧ
h = hd.*wdham;
%% ������Ƶ����(dB)�������As�Ƿ��������ָ��
[Rpp,Ass] = freqzn(h,1,wp/pi,ws/pi,Rp,As,'high') 


% ����ָ�ꡣ
