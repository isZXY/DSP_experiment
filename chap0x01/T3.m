% @author:ZXY

% 3.理解高密度频谱和高分辨率频谱的概念。
clc,clear
% （1）取0≤n≤9，求X1(k)
n=0:9;
xn=cos(0.48*pi*n)+cos(0.52*pi*n);
X1k=fft(xn);

subplot(4,1,1)
stem(n,X1k);
title("X1k");


%（2）将（1）中的序列补零加长到0≤n≤99，求X2(k)； 
x2n=[xn,zeros(1,90)];
X2k=fft(x2n);

subplot(4,1,2)
stem(0:99,X2k);
title("X2k");

% （3）增加取样值的个数，取0≤n≤99，求X3(k)；
n3=0:99;
x3n=cos(0.48*pi*n3)+cos(0.52*pi*n3);
X3k=fft(x3n);

subplot(4,1,3)
stem(n3,X3k);
title("X3k");


% （4）将(3)中的序列补零加长到0<n<399，求X4(k)。
x4n=[x3n,zeros(1,300)];
X4k=fft(x4n);

subplot(4,1,4)
stem(0:399,abs(X4k));
title("X4k");




