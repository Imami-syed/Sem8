clear all; close all; clc;
%% Rhythm and meter   
%Part1 and part2

% miraudio('./samples/dream_theater.wav')
% miraudio('./samples/michael_jackson.wav')
% miraudio('./samples/mozart.wav')
% miraudio('./samples/queen.wav')
% miraudio('./samples/taylor_swft.wav')

% mirplay('./samples/dream_theater.wav');
% mirplay('./samples/michael_jackson.wav');
% mirplay('./samples/mozart.wav');
% mirplay('./samples/queen.wav');
% mirplay('./samples/taylor_swft.wav');


% [t1 ac1] = mirtempo('./samples/dream_theater.wav') 
% [t2 ac2] = mirtempo('./samples/michael_jackson.wav')
% [t3 ac3] = mirtempo('./samples/mozart.wav')
% [t4 ac4] = mirtempo('./samples/queen.wav')
% [t5 ac5] = mirtempo('./samples/taylor_swft.wav')

% Part-3

% l=2;
% h=0.05;
% s = "Autocor";
% mirtempo('./samples/michael_jackson.wav','Frame',l)
% mirtempo('./samples/mozart.wav','Frame',l)


%% Repetetion in music

a = miraudio('./data/03.wav');

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






