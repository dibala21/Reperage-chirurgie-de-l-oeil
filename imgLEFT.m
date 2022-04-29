clear all;
clc;

camL=webcam(1)
camlist=webcamlist
camL.Resolution='1920x1080';
imgLb=snapshot(camL);
fig1=imshow(imgLb);