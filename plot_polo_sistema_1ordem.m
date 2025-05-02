close all %fecha todas as janelas
clear all %limpa memoria
clc %limpa command window
%% sistema de 1ordem
R=6.8e3; %valor do resistor
C=22e-09; %valor do capacitor
K=1; %ganho estático do sistema
A=3.5; %tensao pico a pico do sinal de entrada
G=tf([K],[R*C 1]) %define função de transferencia no formato G(s)=num/den
%% plot poles
pzmap(G) %mostra polo do sistema