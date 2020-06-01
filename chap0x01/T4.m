% @author:ZXY

%4����DFT�������ź����׷�����
clc,clear

for i = 1:4
    Tp=0.04*2.^(i-1);
    fs=400;
    t=0:1/fs:99; % ����
    xt=cos(200*pi*t)+sin(100*pi*t)+cos(50*pi*t);
    
    %  ����ضϵ���
    f0=1/Tp; % Ƶ�ʷֱ������źż�¼���ȵĵ���
    %w=2*pi*f0/fs;
    N=fs/f0;
    
    % ���δ������
    wn1=rectwin(N)';
    xn1=wn1.*xt(1:N);
    Xk1=fft(xn1,2048);
    
    
    % hamming��
    wn2=hamming(N)';
    xn2=wn2.*xt(1:N);
    Xk2=fft(xn2,2048);
    
    % ��ͼ
    figure(i)
    subplot(2,1,1)
    plot(0:2047,abs(Xk1)) % ������̫�󣬲���ɢ��ͼ��
    title("rectwin�ض�")
    
    subplot(2,1,2)
    plot(0:2047,abs(Xk2))
    title("hamming�ض�")
end