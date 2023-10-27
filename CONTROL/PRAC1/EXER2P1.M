disp('Exercici 2')
disp('Efectes de la variació del coeficient d''esmorteïment.')

disp('Valor màxim de la respota temporal.')
Spic=max(y)

disp('Càcul del Sp (%), temps de pujada, temps d''establiment.')
yss=1;
[Sp,Tr,Ts]=parstep2(y,t,yss)

disp('Càlcul del màxim i de l''ample de banda de la resposta en freqüència.')
[Max,BW]=parbode(mag,1,w)

% Tornem a calcular les respostes temporals i freqüencials amb més valors de Zeta
% per obtenir una millor representació gràfica de les varions produides.

Wn=1;
Zeta=eps:0.1:1.5;	% Freqüència natural
t=0:15/200:15;		% Vector temps
w=logspace(-1,1,200);	% Vector de freqüències
for n=1:length(Zeta)
	num=Wn^2;			%Numerador de la funció de transferència.
	den=[1 2*Zeta(n)*Wn Wn^2];	% Denominador
	y(:,n)=step(num,den,t);		% Resposta a l'esglaó
	[mag(:,n) fas(:,n)]=bode(num,den,w);	% Resposta freqüencial.
	P(:,n)=roots(den);			% Pols
end;
Spic=max(y);

figure(6)
plot(Zeta,Spic)
ylabel('Sp')
xlabel('Zeta')
title('Variacó del Sp de la resposta temporal en funció de Z')
disp('Polsa una tecla per continuar')
pause

yss=1;
[Sp,Tr,Ts]=parstep2(y,t,yss);

figure(7)
plot(Zeta,Tr)
ylabel('Tr')
xlabel('Zeta')
title('tr, temps de pujada en funció de Z')
disp('Polsa una tecla per continuar')
pause

figure(8)
plot(Zeta,Ts)
axis([0 1.5 0 15])
ylabel('Ts')
xlabel('Zeta')
title('ts, temps d''establiment en funció de Z')
disp('Polsa una tecla per continuar')
pause

[Max,BW]=parbode(mag,1,w)

figure(9)
plot(Zeta,Max)
ylabel('Mòdul')
xlabel('Zeta')
title('Variació del val, max. de la resp. en freq. en funció de Zeta.')
disp('Polsa una tecla per continuar.')
pause

figure(10)
plot(Zeta,BW)
ylabel('rad/s')
xlabel('Zeta')
title('Variació de l''ample de banda en funció de Zeta.')
disp('Polsa una tecla per continuar.')
pause