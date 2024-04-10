a = miraudio('./data/05.wav');

l=0.09;
h=0.6;
m1 = mirchromagram(a,'Frame',l,h);
m2 = mirmfcc(a,'Frame',l,h);
m3 = mirspectrum(a,'Frame',l,h);
c=mirgetdata(m1);
D = 1-pdist(c', 'cosine');
Y=squareform(D);
imagesc(Y)
title('chromagram');
% title('mfcc');
% title('spectrum');
