close all %fecha todas as janelas
clear all %limpa memoria
clc %limpa command window
%% sistema de 2ordem
R=1e3; %valor do resistor
L=590e-3; %valor do indutor
C=69e-9; %valor do capacitor
wn=1/sqrt(L*C);
xi=R/(2*L*wn);
G=tf([wn^2],[1 2*xi*wn wn^2]) %define função de transferencia no formato G(s)=num/den
%% simulacao resposta ao degrau
Ts=1e-6; %tempo de amostragem
t=0:Ts:5e-3; %define vetor de tempo 
A=2; %amplitude pico a pico do sinal de entrada
u=A*ones(size(t)); %define sinal de entrada como um degrau de amplitude A
y=lsim(G,u,t); %simula sistema para o sinal de entrada u
%% plot
figure %cria nova figura
plot(t*1000,y,'LineWidth',2,'DisplayName','Saída') %exibe sinal de saída
hold on %ativa multiplas curvas no mesmo gráfico
plot(t*1000,u,'LineWidth',2,'DisplayName','Entrada') %exibe sinal de entrada
xlabel('tempo (ms)') %label do eixo x
ylabel('saída') %label do eixo y
%% sobressinal e tempo de pico
[ymax,imax]=max(y);
Mp=(ymax-y(end))/y(end)
tp=t(imax)
line([tp tp]*1000,[0 ymax],'linewidth',1.5,'color','black','displayName','tp') %desenha linha vertical 
%% tempo de subida
[~,i]=min(abs(y(1:imax)-A));
tr=t(i)
line([tr tr]*1000,[0 A],'linewidth',1.5,'color','black','displayName','tr') %desenha linha vertical 
%% tempo de acomodacao
line([0 max(t*1000)],[1.05*A 1.05*A],'linewidth',1.5,'color','black','linestyle','--','displayName','1.05A') %desenha linha horizontal
line([0 max(t*1000)],[0.95*A 0.95*A],'linewidth',1.5,'color','black','linestyle','--','displayName','0.95A') %desenha linha horizontal
grid on %ativa linhas do grid no gráfico
title('Resposta ao degrau (sistema 2° ordem)') %titulo do gráfico
legend('location','best') %exibe legenda na melhor posição

