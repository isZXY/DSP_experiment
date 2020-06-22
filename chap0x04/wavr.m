clc,clear,close all
%% 1.读音频文件
[y,fs]=audioread('/Users/endless/Documents/GitHub/DSP_experiment/chap0x04/tv_15k.wav');
x=y(:,1);

%% 2.画时域图，x坐标秒 time=length(x)/fs;
 figure;plot((1:length(x))/fs,x);title("信号的时域波形");

%% 3.播放音频文件
  sound(y,fs)

%% 4.对音频信号进行频谱分析
    %(1)直接对整个音频文件进行DFT变换.
    % 画出幅度谱，要求横坐标为模拟频率（kHz）
     X=fft(x);
     N=length(x);
     figure;
     plot((0:N/2-1)/N*fs/1000,20*log10(abs(X(1:N/2)))) % 画了一半，另一半是对称的
     grid on;title("信号的DFT频谱");
     
    % （2）对音频信号分帧，加窗，再进行DFT变换.
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
       title('分帧的频谱');
       ylabel('kHz');
       xlabel('second');
    
 %% 5.	对实验中给出的有“毛刺”的音频信号进行低通滤波
Rp = 1;
As = 60;
Fp = 15000;
Fs = 17000;                                        
wp = 2*pi*Fp/fs;
ws = 2*pi*Fs/fs ;   
[N,wn] = buttord(2*fs*tan(wp/2),2*fs*tan(ws/2),Rp,As,'s');    
[b,a] = butter(N,wn,'s');             
[bz,az] = bilinear(b,a,fs);          
[h,w] = freqz(bz,az);%IIR低通滤波器

%% 滤波
z=filter(bz,az,x);
z_fft=fft(z)     %滤波后的信号频谱
%% 测试
 sound(z,fs)
%% 滤波后的频谱
z_abs = 20*log10(abs(z_fft));
f = (0:length(z_fft))/length(z_fft)*fs/1000;
wdham=hanning(1024);
for i=1:floor(N/512-1)
    j=(i-1)*512+1;
    data=z(j:j+1023);
    data=wdham.*data;
    m2(:,i)=20*log10(abs(fft(data,1024)));
end
%% %写入新的音频文件
audiowrite('/Users/endless/Documents/GitHub/DSP_experiment/chap0x04/output.wav',z,fs);
