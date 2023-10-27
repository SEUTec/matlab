disp('Exercici 3')
disp('Efectes de la variació de la freqüència natural.')

Zeta=0.7;
Wn=linspace(0.2,5,10);
for n=1:length(Wn)
	num=Wn(n)^2;
	den=[1 2*Zeta*Wn(n) Wn(n)^2];
end

Wn=[0.2 1 2 3 4];	%Freqüència natural
Zeta=0.7;		%Coeficient d'esmorteïment
t=0:30/200:30;		%Vector temps
w=logspace(-2,2,200);	%Vector de freqüències
clear('y','mag','fas','P')
for n=1:length(Wn)
	num=Wn(n)^2;	%Numerador de la funció de transferència.
	den=[1 2*Zeta*Wn(n) Wn(n)^2];	% Denominador
	y(:,n)=step(num,den,t);		% Resposta a l'esglaó
	[mag(:,n) fas(:,n)]=bode(num,den,w);	% Resposta freqüencial.
	P(:,n)=roots(den);		% Pols
end;

%Gràfica en 2D de la resposta temporal
figure(11)
plot(t,y);
xlabel('t');
ylabel('y(t)');
title('Resposta temporal diferents valors de Wn.')
legend('0.2','1','2','3','4')
disp('Polsa una tecla per continuar.')
pause

% Gràfica del mòdul de dB de la resposta freqüencial
figure(12)
semilogx(w,20*log10(mag));
xlabel('w');
ylabel('dB');
title('Mòdul de la resposta freqüencial per diferents valors de Wn.')
legend('0.2','1','2','3','4')
disp('Polsa una tecla per continuar.')
pause

%Gràfica de la fase de la resposta freqüencial
figure(13)
semilogx(w,fas);
xlabel('w');
ylabel('graus');
title('Fase de la resp. freqüencial per dif. valors de Wn.')
legend('0.2','1','2','3','4')
disp('Pola una tecla per continuar')
pause

%Diagrama de pols i zeros
figure(14);
plot(real(P), imag(P), 'x')		%Dibuixa pols
title('Variació de pols per diferents valors Wn.')
legend('xy','0.2','xm','1','xc','2','xr','3','xg','4')
grid

disp('Polsa un tecla per continuar.')
pause

disp('Calcul del sobrepic de resp. temporal per diferents valors de Wn.')
Spt=max(y)

disp('Càlcul del sobrepic (%), Temps de pujada i temps d''establiment.')
yss=1;
[Sp,Tr,Ts]=parstep2(y,t,yss)

disp('Càlcul de l''ample de banda (BW)');
magdb=20*log10(mag);
[f,c]=size(mag);
clear('BW')
for col=1:c
	n=1;
	while (magdb(n,col)>-3)
		n=n+1;
	end;
	BW(col)=w(n);
end
BW

disp('Sp, sobrepic de la resp. en freqüència en funció de Wn.')
MagMax=max(mag)
MagMaxdB=20*log10(MagMax)

disp('Polsa una tecla per continuar.')
pause

Wn=linspace(eps,10,100);			%Freqüència natural
w=logspace(-2,2,200);			%Vector de freqüències
clear('y','mag','fas','P')
for n=1:length(Wn)
	num=Wn(n)^2;	%Numerador de la funció de transferència.
	den=[1 2*Zeta*Wn(n) Wn(n)^2];	% Denominador
	y(:,n)=step(num,den,t);		% Resposta a l'esglaó
	[mag(:,n) fas(:,n)]=bode(num,den,w);	% Resposta freqüencial.
	P(:,n)=roots(den);		% Pols
end;

disp('Càlcul de la variació del Sp,Tr i Ts en funció de Wn.')
yss=1;
[Sp,Tr,Ts]=parstep2(y,t,yss);

figure(15)
plot(Wn,Tr)
ylabel('Tr')
xlabel('Wn')
title('tr, temps de pujada en funció de Wn.')
disp('Polsa una tecla per continuar')
pause

figure(16)
plot(Wn,Ts)
ylabel('Ts')
xlabel('Wn')
title('ts, temps d''establiment en funció de Wn.')
disp('Polsa una tecla per continuar')
pause

disp('Càlcul de la variació de l''ample de banda en funció de Wn.');
magdb=20*log10(mag);
[f,c]=size(mag);
clear('BW')
for col=1:c
	n=1;
	while (magdb(n,col)>-3)
		n=n+1;
	end;
	BW(col)=w(n);
end

figure(17)
plot(Wn,BW)
ylabel('BW')
xlabel('Wn')
title('Variació de BW en funció de Wn')
disp('Polsa una tecla per continuar')
pause
