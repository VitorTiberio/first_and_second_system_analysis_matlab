close all %fecha todas as janelas
clear all %limpa memoria
clc %limpa command window
%% sistema de 1ordem
R=6.8e3; %valor do resistor
C=22e-09; %valor do capacitor
K=1; %ganho estático do sistema
G=tf([K],[R*C 1]) %define função de transferencia do sistema no formato G(s)=num/den
%% simulacao resposta ao degrau
Ts=1e-6; %tempo de amostragem
t=0:Ts:50e-3; %define vetor de tempo
f=100; %frequencia configurada no gerador de funções
A=2; %amplitude do sinal de entrada
u=A*square(2*pi*f*t); %gera sinal onda quadrada com amplitude A e ferquencia f
y=lsim(G,u,t); %simula saida do sistema para entrada u
figure %cria nova figura
plot(t*1000,y,'LineWidth',2,'DisplayName','Saída') %exibe sinal de saida
hold on  %ativa multiplas curvas no mesmo grafico
plot(t*1000,u,'LineWidth',2,'DisplayName','Entrada') %exibe sinal de entrada
xlabel('tempo (ms)') %label do eixo x
ylabel('saída') %label do eixo y
grid on %ativa linhas do grid no gráfico
title('Resposta ao degrau (sistema 1° ordem)') %titulo do grafico
legend('location','best') %exibe legenda na melhor posição
