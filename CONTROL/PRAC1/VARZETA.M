% Resposta d'un sistema lineal de temps continu de segon ordre
% per a diferents valors del coeficient d'esmorteïment.

clear
%Càlcul de la resposta
Wn=1;
Zeta=eps:0.1:1;	% Freqüència natural
t=0:15/200:15;		% Vector temps
w=logspace(-1,1,200);	% Vector de freqüències
for n=1:length(Zeta)
	num=Wn^2;	%Numerador de la funció de transferència.
	den=[1 2*Zeta(n)*Wn Wn^2];	% Denominador
	y(:,n)=step(num,den,t);		% Resposta a l'esglaó
	[mag(:,n) fas(:,n)]=bode(num,den,w);	% Resposta freqüencial.
	P(:,n)=roots(den);		% Pols
end;

%Gràfica en 3D de la resposta temporal
figure(1);
surfl(Zeta,t,y);
shading('interp');
colormap('copper');
view([1,-1,1]);
xlabel('Zeta');
ylabel('t');
zlabel('y(t)');
title('Gràfica 3D de la resposta tempotal en funció de Z')
disp('Polsa una tecla per continuar.')
pause

%Gràfica en 2D de la resposta temporal
Zeta=[eps 0.5 1 1.5];	% Posem epsilon per ser un nombre motl petit > 0.
% Repetim els càlculs anteriors per un nou valor de Z
clear('num','den','y','mag','fas','P')
for n=1:length(Zeta)
	num=Wn^2;	%Numerador de la funció de transferència.
	den=[1 2*Zeta(n)*Wn Wn^2];	% Denominador
	y(:,n)=step(num,den,t);		% Resposta a l'esglaó
	[mag(:,n) fas(:,n)]=bode(num,den,w);	% Resposta freqüencial.
	P(:,n)=roots(den);		% Pols
end;

figure(2)
plot(t,y);
xlabel('t');
ylabel('y(t)');
title('Resposta temporal per diferents valors de Z.')
legend('0+',num2str(Zeta(2)),num2str(Zeta(3)),num2str(Zeta(4)))
disp('Polsa una tecla per continuar.')
pause

% Gràfica del mòdul en dB de la resposta freqüencial
figure(3)
semilogx(w,20*log10(mag));
xlabel('w');
ylabel('dB');
title('Mòdul de la resp. freqüencial per dif. valors de Z.')
legend('0+',num2str(Zeta(2)),num2str(Zeta(3)),num2str(Zeta(4)))
disp('Polsa una tecla per continuar.')
pause

%Gràfica de la fase de la resposta freqüencial
figure(4)
semilogx(w,fas);
xlabel('w');
ylabel('graus');
title('Fase de la resp. freqüencial per dif. valors de Z.')
legend('0+',num2str(Zeta(2)),num2str(Zeta(3)),num2str(Zeta(4)))
disp('Pola una tecla per continuar')
pause


%Diagrama de pols i zeros
figure(5);
plot([-1 1],[0 0],'w:',[0 0],[-1 1],'w:')	%Dibuixa eixos
hold on
plot(real(P), imag(P), 'x')			%Dibuixa pols
hold off
title('Variació de pols i zeros en funció de Z')
legend('xy','0+','xm',num2str(Zeta(2)),'xc',num2str(Zeta(3)),'xr',num2str(Zeta(4)))
grid