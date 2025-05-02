close all %fecha todas as janelas
clear all %limpa memoria
clc %limpa command window
%% sistema de 1ordem
R=6.8e3; %valor do resistor
C=22e-09; %valor do capacitor
K=1; %ganho estático do sistema
A=3.5; %amplitude pico a pico do sinal de entrada
G=tf([K],[R*C 1]) %define função de transferencia no formato G(s)=num/den
%% simulacao resposta ao degrau
Ts=1e-6; %tempo de amostragem
t=0:Ts:2e-3; %define vetor de tempo 
u=A*ones(size(t)); %define sinal de entrada como um degrau de amplitude A
y=lsim(G,u,t); %simula sistema para o sinal de entrada u
[~,i]=min(abs(y-0.632*K*A)); %busca a posição no vetor mais próxima do valor 0.632*K*A
disp('Cosntante de tempo (ms):')
T=t(i)*1000 %constante de tempo teórica (em milisegundos)
figure %cria nova figura
plot(t*1000,y,'LineWidth',2,'DisplayName','Saída') %exibe sinal de saída
hold on %ativa multiplas curvas no mesmo gráfico
plot(t*1000,u,'LineWidth',2,'DisplayName','Entrada') %exibe sinal de entrada
xlabel('tempo (ms)') %label do eixo x
ylabel('saída') %label do eixo y
line([T T],[0 max(y)],'linewidth',1.5,'color','black','displayName','T') %desenha linha vertical 
line([0 max(t*1000)],[y(i) y(i)],'linewidth',1.5,'color','black','displayName','0.632KA') %desenha linha horizontal
grid on %ativa linhas do grid no gráfico
title('Resposta ao degrau (sistema 1° ordem)') %titulo do gráfico
legend('location','best') %exibe legenda na melhor posição
