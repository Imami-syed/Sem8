
hd = 293.5 ;
he = 329.5 ;
hg = 392 ;

sampling_rate = 44100 ;
duration = 1 ;
strength = 2000;

t = linspace(0,duration,duration*sampling_rate) ;
y111 = sin(2*pi*hd*t) ;
y211 = sin(2*pi*he*t) ;
y311 = sin(2*pi*hg*t) ;


for h = 2:10
    y11 = y111 + sin(2*pi*hd*t*h)/(2*pi) ;
    y21 = y211 + sin(2*pi*he*t*h)/(2*pi) ;
    y31 = y311 + sin(2*pi*hg*t*h)/(2*pi) ;
end

y1 = y11+y21+y31 ;
figure;
plot(y1);
% dft = fft(y1+y2+y3);
% N = length(dft);
% freq = (0:N-1)*(sampling_rate/N);
% figure;
% plot(freq,abs(dft));

for h = 1:3
    y12 = y111 + sin(2*pi*hd*t*h*2)/(2*pi) ;
    y22 = y211 + sin(2*pi*he*t*h*2)/(2*pi) ;
    y32 = y311 + sin(2*pi*hg*t*h*2)/(2*pi) ;
end

y2 = y12+y22+y32 ;

for h = 2:4
    y13 = y111 + sin(2*pi*hd*t*(2*h-1))/(2*pi) ;
    y23 = y211 + sin(2*pi*he*t*(2*h-1))/(2*pi) ;
    y33 = y311 + sin(2*pi*hg*t*(2*h-1))/(2*pi) ;
end

y3 = y13+y23+y33;

virtual = y1 ;
virtual2 = y1 -y111-y211-y311 ;
virtual3 = y111+y211+y311 ;


% figure;
% baby ='baby2.wav' ;
% [amp,fs] = audioread(baby) ;
% songdft = fft(amp) ;
% freq= 0:fs/length(amp):fs/2;
% songdft=songdft(1:length(amp)/2+1);
% plot(freq,abs(songdft)); 
% xlabel('Frequency');
% xlim([0 3500])

