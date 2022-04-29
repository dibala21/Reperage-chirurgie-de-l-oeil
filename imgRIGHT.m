clear all;
clc;

camR=webcam(2)
camlist=webcamlist
camR.Resolution='1920x1080'
imgRb=snapshot(camR);
fig1=imshow(imgRb);