close all %fecha todas as janelas
clear all %limpa memoria
clc %limpa command window
%% sistema de 1ordem
Rmin=40; %valor minimo do resistor (~45)
Rmax=20e3; %valor maximo do resistor (~20k)
L=590e-3; %valor da indutancia
C=69e-09; %valor do capacitor
wn=1/sqrt(L*C);
%%
Rrange=linspace(Rmin,Rmax,50); %define range de valores de resistores
p=zeros(2,numel(Rrange)); %aloca memoria para vetor de polos
for i=1:numel(Rrange) %loop percorrendo todos os valores de resistores
R=Rrange(i); %define valor do resistor
xi=R/(2*L*wn); %calcula coef de amortecimento
G=tf([wn^2],[1 2*xi*wn wn^2]); %define função de transferencia no formato G(s)=num/den
%% calcula polos para dado valor de resistencia
p(:,i)=pole(G);
end
figure %cria nova figura
plot(real(p(1,:)),imag(p(1,:)),'xb','LineWidth',2) %exibe polos 1
hold on
plot(real(p(2,:)),imag(p(2,:)),'xb','LineWidth',2) %exibe polos 2
sgrid %mostra grid do plano-s 
xlabel('Eixo Real') %label do eixo x
ylabel('Eixo Imaginário') %label do eixo y
title('Plano-s') %titulo da figura