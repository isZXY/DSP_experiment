% @author:ZXY

clc,clear,close all


% ��1��	����һ�����ǲ�����x(n)������ΪM=41��.
n=0:40;
x=tripuls(n-20,40);
subplot(3,1,1);
plot(n,x);

% ��2��	����N=64ʱ��X(k)=DFT[x(n)]��������x(n)��X(k)
X=fft(x,64);
subplot(3,1,2);
stem(0:63,abs(X));

% ��3��	��X(k)�� �Ͻ���32��������õ�X1(k)��X(2k)��k��0,1,��,31��
X1k=X(1:2:end)

% ��4��	��X1(k)��32��IDFT����x1(n)��IDFT[X1(k)]
x1n=ifft(X1k);

subplot(3,1,3);
stem(0:31,x1n);
axis([0,32,0,1]);

% �����˻��ʧ��

2018113027