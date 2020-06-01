% @author:ZXY

clc,clear,close all


% （1）	产生一个三角波序列x(n)，长度为M=41；.
n=0:40;
x=tripuls(n-20,40);
subplot(3,1,1);
plot(n,x);

% （2）	计算N=64时的X(k)=DFT[x(n)]，并画出x(n)和X(k)
X=fft(x,64);
subplot(3,1,2);
stem(0:63,abs(X));

% （3）	对X(k)在 上进行32点抽样，得到X1(k)＝X(2k)，k＝0,1,…,31。
X1k=X(1:2:end)

% （4）	求X1(k)的32点IDFT，即x1(n)＝IDFT[X1(k)]
x1n=ifft(X1k);

subplot(3,1,3);
stem(0:31,x1n);
axis([0,32,0,1]);

% 发生了混叠失真

2018113027