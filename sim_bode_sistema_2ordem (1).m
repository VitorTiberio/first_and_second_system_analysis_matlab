close all %fecha todas as janelas
clear all %limpa memoria
clc %limpa command window
%% sistema de 2ordem
R=1e3; %valor do resistor
L=590e-3; %valor do indutor
C=69e-9; %valor do capacitor
wn=1/sqrt(L*C); %frequencia natural (teorica)
xi=R/(2*L*wn); %coef amortecimento (teorico)
G=tf([wn^2],[1 2*xi*wn wn^2]) %define função de transferencia no formato G(s)=num/den
%% simulacao resposta em frequencia (Bode Diagram)
w=2*pi*10:0.01:2*pi*20e3; %define vetor de frequências
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
xlim([10 20e3]) %define range do eixo x
subplot(2,1,2) %define subfigura 2
semilogx(w/(2*pi),pha,'linewidth',2,'DisplayName','Fase (teórico)') %plota fase
grid on %ativa linhas do grid no gráfico
hold on %ativa multiplas curvas no mesmo gráfico
xlabel('Frequência (Hz)') %label do eixo x
ylabel('Fase (°)') %label do eixo y
title('Fase') %titulo do grafico
xlim([10 20e3]) %define range do eixo x
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
    5000
    10000
    15000
    20000];

%define vetor dos módulos obtidos no experimento
modulo = [1.0002
    1.0038
    1.0153
    1.1037
    1.5717
    1.3404
    0.1819
    0.0739
    0.0404
    0.0255
    0.0063
    0.0028
    0.0016];

%define vetor de fases obtidos no experimento
fase = [-0.2484
   -1.2468
   -2.5229
   -6.8703
  -19.9188
 -144.4717
 -170.9252
 -174.4826
 -175.9863
 -176.8332
 -178.4451
 -178.9669
 -179.2261];

%% exibe dados experimentais sobrepostos na curva teórica
subplot(2,1,1) %votla para subfigura 1
semilogx(freq,20*log10(modulo),'x','linewidth',2,DisplayName='Módulo (experimental)') %plota pontos experimentais do módulo
legend('location','best') %mostra legenda na melhor posição 
subplot(2,1,2) %volta para subfigura 2
semilogx(freq,fase,'x','linewidth',2,'DisplayName','Fase (experimental)') %plota fases experimentais
legend('location','best') %mostra legenda na melhor posição
