% @author:ZXY
clc,clear
% 2.��֪����
%��1�����������DTFT�ı��ʽ ��������N=10ʱ�� ���ߣ�
N=10;
w=2*pi*(0:2047)/2048; % ����2048������Խ��ƿ�����������Ƶ��

% Xw�ı��ʽ
R1=(1-exp(-j*N*(w+pi/(2*N))))./(1-exp(-j*w+pi/(2*N)));
R2=(1-exp(-j*N*(w-pi/(2*N))))./(1-exp(-j*w-pi/(2*N)));
Xw=0.5*(R1+R2);

% �ַ��Ⱥ���λ��ͼ
subplot(5,1,1);
plot(w/pi,abs(Xw));
title("Xw����");
xlabel('w/pi');

subplot(5,1,2);
plot(w/pi, angle(Xw));
title("Xw��λ");
axis([0,2,-pi,pi]);
line([0,2],[0,0]); 
xlabel('w/pi');



%��2������N��10ʱ������x[n]��10��DFT�����������ߡ�
n=0:9;
N=10;
xn=cos((n*pi)./(2*N));
Xk=fft(xn);
subplot(5,1,3);
stem(n,abs(Xk));
title("DFT");

%��3������hold��������DTFT��DFT����һ��
subplot(5,1,4);
stem(n,abs(Xk));
title("��� ����");
hold on;
plot(N/2*w/pi, abs(Xw));%��һ




subplot(5,1,5);
stem(n,angle(Xk));
title("��� ��λ");
hold on;
plot(N/2*w/pi, angle(Xw));%��һ