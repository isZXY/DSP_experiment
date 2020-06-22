% Compute Rp(passband ripple) and As(stopband attenuation) of Digital
% filter and plot the Megnitude Response of filter in the new figure
% window.
%
% [Rpp,Ass] = freqzn(num,den,wp,ws,Rp,As,ftype)
% returns the  Rp(passband ripple) and As(stopband attenuation) of Digital filter
%
% given numerator and denominator coefficients in vectors num and den.
% wp and ws are the passband and stopband edge frequencies,normalized form
% 0 to 1(where 1 corresponds to pi radians/sample).For example,
% lowpass:  wp = 0.1   ws = 0.2
% highpass: wp = 0.2   ws = 0.1
% bandpass: wp = [0.2 0.7], ws = [0.1 0.8]
% bandstop: wp = [0.1 0.8], ws = [0.2 0.7]
% ftype: 'low' or 'high' or 'band' or 'stop'
%
% 2011-11-20 by nlp

function [Rpp,Ass] = freqzn(num,den,wp,ws,Rp,As,ftype)

b = num;
a = den;
if As <= 35
    As_low = As+10;
else
    As_low = 100;
end
[H,w] = freqz(b,a,1000,'whole');
H = H(1:501)'; w = w(1:501)';
dB = 20*log10((abs(H)+eps)/max(abs(H)));
rip = 10^(-Rp/20); att = 10^(-As/20);
dw = 2/1000;
figure;

switch ftype
    case  'low'
        if As_low < 100
            subplot(1,2,1),plot(w/pi,abs(H));
            title('Lowpass Magnitude Response');
            xlabel('Digital frequency in pi units');
            ylabel('abs(H)');
            axis([0,1,0,1.1]);
            line([0,1],[rip,rip],'LineStyle',':');
            line([0,1],[att,att],'LineStyle',':');
            line([wp(1),wp(1)],[0,1.1],'LineStyle',':');
            line([ws(1),ws(1)],[0,1.1],'LineStyle',':');
            set(gca,'XTick',[0,wp(1),ws(1),1]);
            set(gca,'YTick',[0,att,rip,1]);      
            subplot(1,2,2),
        end
        plot(w/pi,dB);
        title('Lowpass Magnitude Response in dB');
        xlabel('Digital frequency in pi units');
        ylabel('dB');
        axis([0,1,-As_low,5]);
        line([0,1],[-Rp,-Rp],'LineStyle',':');
        line([0,1],[-As,-As],'LineStyle',':');
        line([wp(1),wp(1)],[5,-As_low],'LineStyle',':');
        line([ws(1),ws(1)],[5,-As_low],'LineStyle',':');
        set(gca,'XTick',[0,wp(1),ws(1),1]);
        set(gca,'YTick',[-As_low,-As,-Rp,0]);
        
        Rpp = -min(dB(1 : round(wp(1)/dw) +1));
        Ass = -round(max(dB(round(ws(1)/dw) +1 : 501)));
    case  'high'
        if As_low < 100
            subplot(1,2,1),plot(w/pi,abs(H));
            title('Highpass Magnitude Response');
            xlabel('Digital frequency in pi units');
            ylabel('abs(H)');
            axis([0,1,0,1.1]);
            line([0,1],[rip,rip],'LineStyle',':');
            line([0,1],[att,att],'LineStyle',':');
            line([wp(1),wp(1)],[0,1.1],'LineStyle',':');
            line([ws(1),ws(1)],[0,1.1],'LineStyle',':');
            set(gca,'XTick',[0,ws(1),wp(1),1]);
            set(gca,'YTick',[0,att,rip,1]);        
            subplot(1,2,2),
        end
        plot(w/pi,dB);
        title('Highpass Magnitude Response in dB');
        xlabel('Digital frequency in pi units');
        ylabel('dB');
        axis([0,1,-As_low,5]);
        line([0,1],[-Rp,-Rp],'LineStyle',':');
        line([0,1],[-As,-As],'LineStyle',':');
        line([wp(1),wp(1)],[5,-As_low],'LineStyle',':');
        line([ws(1),ws(1)],[5,-As_low],'LineStyle',':');
        set(gca,'XTick',[0,ws(1),wp(1),1]);
        set(gca,'YTick',[-As_low,-As,-Rp,0]);    
        
        Rpp = -min(dB(round(wp(1)/dw) +1 : 501));
        Ass = -round(max(dB(1 : round(ws(1)/dw) +1)));
    case  'band'
        if As_low < 100
            subplot(2,1,1),plot(w/pi,abs(H));
            title('Bandpass Magnitude Response');
            xlabel('Digital frequency in pi units');
            ylabel('abs(H)');
            axis([0,1,0,1.1]);
            line([0,1],[rip,rip],'LineStyle',':');
            line([0,1],[att,att],'LineStyle',':');
            line([wp(1),wp(1)],[0,1.1],'LineStyle',':');
            line([ws(1),ws(1)],[0,1.1],'LineStyle',':');
            line([wp(2),wp(2)],[0,1.1],'LineStyle',':');
            line([ws(2),ws(2)],[0,1.1],'LineStyle',':');
            set(gca,'XTick',[0,ws(1),wp(1),wp(2),ws(2),1]);
            set(gca,'YTick',[0,att,rip,1]);                
            subplot(2,1,2),
        end
        plot(w/pi,dB);
        title('Bandpass Magnitude Response in dB');
        xlabel('Digital frequency in pi units');
        ylabel('dB');
        axis([0,1,-As_low,5]);
        line([0,1],[-Rp,-Rp],'LineStyle',':');
        line([0,1],[-As,-As],'LineStyle',':');
        line([wp(1),wp(1)],[5,-As_low],'LineStyle',':');
        line([ws(1),ws(1)],[5,-As_low],'LineStyle',':');
        line([wp(2),wp(2)],[5,-As_low],'LineStyle',':');
        line([ws(2),ws(2)],[5,-As_low],'LineStyle',':');
        set(gca,'XTick',[0,ws(1),wp(1),wp(2),ws(2),1]);
        set(gca,'YTick',[-As_low,-As,-Rp,0]);
        
        Rpp = -min(dB(round(wp(1)/dw) +1 : round(wp(2)/dw) +1));
        Ass1 = -round(max(dB(1 : round(ws(1)/dw) +1)));
        Ass2 = -round(max(dB(round(ws(2)/dw) +1 : 501)));
        Ass = min(Ass1,Ass2);
    case  'stop'
        if As_low < 100
            subplot(2,1,1),plot(w/pi,abs(H));
            title('Bandstop Magnitude Response');
            xlabel('Digital frequency in pi units');
            ylabel('abs(H)');
            axis([0,1,0,1.1]);
            line([0,1],[rip,rip],'LineStyle',':');
            line([0,1],[att,att],'LineStyle',':');
            line([wp(1),wp(1)],[0,1.1],'LineStyle',':');
            line([ws(1),ws(1)],[0,1.1],'LineStyle',':');
            line([wp(2),wp(2)],[0,1.1],'LineStyle',':');
            line([ws(2),ws(2)],[0,1.1],'LineStyle',':');
            set(gca,'XTick',[0,wp(1),ws(1),ws(2),wp(2),1]);
            set(gca,'YTick',[0,att,rip,1]);        
            subplot(2,1,2),
        end
        plot(w/pi,dB);
        title('Bandstop Magnitude Response in dB');
        xlabel('Digital frequency in pi units');
        ylabel('dB');
        axis([0,1,-As_low,5]);
        line([0,1],[-Rp,-Rp],'LineStyle',':');
        line([0,1],[-As,-As],'LineStyle',':');
        line([wp(1),wp(1)],[5,-As_low],'LineStyle',':');
        line([ws(1),ws(1)],[5,-As_low],'LineStyle',':');
        line([wp(2),wp(2)],[5,-As_low],'LineStyle',':');
        line([ws(2),ws(2)],[5,-As_low],'LineStyle',':');
        set(gca,'XTick',[0,wp(1),ws(1),ws(2),wp(2),1]);
        set(gca,'YTick',[-As_low,-As,-Rp,0]);
        
        Rpp1 = -min(dB(1:round(wp(1)/dw)+1));
        Rpp2 = -min(dB(round(wp(2)/dw)+1:501));
        Rpp = max(Rpp1,Rpp2);
        Ass =  -round(max(dB(round(ws(1)/dw)+1:round(ws(2)/dw)+1)));
end
