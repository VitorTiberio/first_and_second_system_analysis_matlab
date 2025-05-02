close all %fecha todas as janelas
clear all %limpa memoria
clc %limpa command window
%% sistema de 2ordem
R=450; %valor do resistor
L=596.7e-3; %valor do indutor
C=69e-9; %valor do capacitor
wn=1/sqrt(L*C);
xi=R/(2*L*wn);
%wn=sqrt(2.095e07)
%K=2.05e07/wn^2;
%xi=939.2/(2*wn)
G=tf([wn^2],[1 2*xi*wn wn^2]) %define função de transferencia no formato G(s)=num/den
%% simulacao resposta ao degrau
Ts=40e-6; %tempo de amostragem
t=0:Ts:100e-3; %define vetor de tempo
f=20; %frequencia configurada no gerador de funções
A=3.5; %amplitude pico a pico do sinal de entrada
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
%%
out=readRawData('../data/squarewave_2ordem_com_isolador_window.csv');
%%
plot(out.ch1.time+0.2648,out.ch1.signal,'--k')
plot(out.ch2.time+0.2648,out.ch2.signal,'--m')
%        2.05e07
%  ------------------------
%  s^2 + 939.2 s + 2.095e07
%wn=sqrt(3289e10)
%xi=3.863e4/(2*wn)
      