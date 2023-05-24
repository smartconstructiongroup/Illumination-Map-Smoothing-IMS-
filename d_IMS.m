clc;close all;
clear all;addpath(genpath('./'));

filename = '4.bmp';
L = (im2double(imread(filename)));

er=.002;
gamma = .08;
alpha=0

tic
[I, T_ini,T_ref] = IMS(L,gamma,alpha);
toc




figure(1);imshow(L);title('Input');
figure(2);imshow(I);title('Output');

%%metrics
%AMBE = QM('AB',I)
%LOE = loe100x100(L,I)
%NIQE = niqe(I)
%BRISQUE = brisque(I)
