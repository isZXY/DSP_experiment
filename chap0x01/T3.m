% @author:ZXY

% 3.�����ܶ�Ƶ�׺͸߷ֱ���Ƶ�׵ĸ��
clc,clear
% ��1��ȡ0��n��9����X1(k)
n=0:9;
xn=cos(0.48*pi*n)+cos(0.52*pi*n);
X1k=fft(xn);

subplot(4,1,1)
stem(n,X1k);
title("X1k");


%��2������1���е����в���ӳ���0��n��99����X2(k)�� 
x2n=[xn,zeros(1,90)];
X2k=fft(x2n);

subplot(4,1,2)
stem(0:99,X2k);
title("X2k");

% ��3������ȡ��ֵ�ĸ�����ȡ0��n��99����X3(k)��
n3=0:99;
x3n=cos(0.48*pi*n3)+cos(0.52*pi*n3);
X3k=fft(x3n);

subplot(4,1,3)
stem(n3,X3k);
title("X3k");


% ��4����(3)�е����в���ӳ���0<n<399����X4(k)��
x4n=[x3n,zeros(1,300)];
X4k=fft(x4n);

subplot(4,1,4)
stem(0:399,abs(X4k));
title("X4k");




