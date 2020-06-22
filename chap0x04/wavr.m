clc,clear,close all
%% 1.����Ƶ�ļ�
[y,fs]=audioread('/Users/endless/Documents/GitHub/DSP_experiment/chap0x04/tv_15k.wav');
x=y(:,1);

%% 2.��ʱ��ͼ��x������ time=length(x)/fs;
 figure;plot((1:length(x))/fs,x);title("�źŵ�ʱ����");

%% 3.������Ƶ�ļ�
  sound(y,fs)

%% 4.����Ƶ�źŽ���Ƶ�׷���
    %(1)ֱ�Ӷ�������Ƶ�ļ�����DFT�任.
    % ���������ף�Ҫ�������Ϊģ��Ƶ�ʣ�kHz��
     X=fft(x);
     N=length(x);
     figure;
     plot((0:N/2-1)/N*fs/1000,20*log10(abs(X(1:N/2)))) % ����һ�룬��һ���ǶԳƵ�
     grid on;title("�źŵ�DFTƵ��");
     
    % ��2������Ƶ�źŷ�֡���Ӵ����ٽ���DFT�任.
      each_section=1024;
      section_num=floor(N/(each_section/2)-1);
      wn=hanning(each_section)';
       for i=1:section_num
         m(i,:) = x((512*(i-1)+1):(512*(i-1)+1024));
         m2(i,:)=20*log10(abs(fft(wn.*m(i,:),1024)));
       end
       figure;
       imagesc((0:N/2-1)/N*fs/1000/10,(0:N/2-1)/N*fs/1024,m2(:,1:floor(each_section/2))')
       axis xy;
       title('��֡��Ƶ��');
       ylabel('kHz');
       xlabel('second');
    
 %% 5.	��ʵ���и������С�ë�̡�����Ƶ�źŽ��е�ͨ�˲�
Rp = 1;
As = 60;
Fp = 15000;
Fs = 17000;                                        
wp = 2*pi*Fp/fs;
ws = 2*pi*Fs/fs ;   
[N,wn] = buttord(2*fs*tan(wp/2),2*fs*tan(ws/2),Rp,As,'s');    
[b,a] = butter(N,wn,'s');             
[bz,az] = bilinear(b,a,fs);          
[h,w] = freqz(bz,az);%IIR��ͨ�˲���

%% �˲�
z=filter(bz,az,x);
z_fft=fft(z)     %�˲�����ź�Ƶ��
%% ����
 sound(z,fs)
%% �˲����Ƶ��
z_abs = 20*log10(abs(z_fft));
f = (0:length(z_fft))/length(z_fft)*fs/1000;
wdham=hanning(1024);
for i=1:floor(N/512-1)
    j=(i-1)*512+1;
    data=z(j:j+1023);
    data=wdham.*data;
    m2(:,i)=20*log10(abs(fft(data,1024)));
end
%% %д���µ���Ƶ�ļ�
audiowrite('/Users/endless/Documents/GitHub/DSP_experiment/chap0x04/output.wav',z,fs);
