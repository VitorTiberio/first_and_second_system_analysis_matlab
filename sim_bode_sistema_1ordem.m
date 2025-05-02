close all %fecha todas as janelas
clear all %limpa memoria
clc %limpa command window
%% sistema de 1ordem
R=6.8e3; %valor do resistor
C=22e-09; %valor do capacitor
K=1; %ganho estático do sistema
A=3.5; %tensão pico a pico do sinal de entrada
G=tf([K],[R*C 1]) %define função de transfência no formato G(s)=num/den
%% simulacao resposta em frequencia (Bode Diagram)
w=2*pi*10:0.01:2*pi*5e3; %define vetor de frequências
[mag,pha,w]=bode(G,w); %obtem magnitude e fase para o sistema
mag=squeeze(mag); %reduz dimensão do vetor para o plot
pha=squeeze(pha); %reduz dimensão do vetor para o plot
figure %cria nova figura
subplot(2,1,1) %define subfigura 1
semilogx(w/(2*pi),20*log10(mag),'linewidth',2,DisplayName='Módulo (teórico)')%plota magnitude
grid on %ativa linhas do grid no gráfico
hold on %ativa multiplas curvas no mesmo gráfico
xlabel('Frequência (Hz)') %label do eixo x
ylabel('Magnitude (dB)') %label do eixo y
title('Magnitude') %titulo do grafico 
subplot(2,1,2) %define subfigura 2
semilogx(w/(2*pi),pha,'linewidth',2,'DisplayName','Fase (teórico)') %plota fase
grid on %ativa linhas do grid no gráfico
hold on %ativa multiplas curvas no mesmo gráfico
xlabel('Frequência (Hz)') %label do eixo x
ylabel('Fase (°)') %label do eixo y
title('Fase') %titulo do grafico
%% Compara dados experimentais de resposta em frequencia
%define vetor de frequencias usadas no experimento
freq=[10
    50
    100
    250
    500
    1000
    2000
    3000
    4000
    5000];

%define vetor dos módulos obtidos no experimento
modulo = [1.0000
    0.9989
    0.9956
    0.9735
    0.9050
    0.7286
    0.4696
    0.3342
    0.2570
    0.2081];

%define vetor de fases obtidos no experimento
fase = [-0.5385
   -2.6908
   -5.3698
  -13.2241
  -25.1727
  -43.2275
  -61.9899
  -70.4743
  -75.1060
  -77.9881];

%exibe dados experimentais sobrepostos na curva teórica
subplot(2,1,1) %volta para subfigura 1
semilogx(freq,20*log10(modulo),'x','linewidth',2,DisplayName='Módulo (experimental)') %plota pontos experimentais do módulo
legend('location','best') %mostra legenda na melhor posição 
subplot(2,1,2) %volta para subfigura 2
semilogx(freq,fase,'x','linewidth',2,'DisplayName','Fase (experimental)') %plota fases experimentais
legend('location','best') %mostra legenda na melhor posição
