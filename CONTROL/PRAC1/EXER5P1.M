disp ('Efectes de la variació d''un pol.')

p=[1 3 10];
t=0:7/200:7;		%Vector temps
w=logspace(-1,1,200);	%Vector de freqüències
clear('y','Mag','Fas','P','Z')
for m=1:length(p)
	num=[25];
	den=conv([1/p(m) 1],[1 7 25]);
	y(:,m)=step(num,den,t);		% Resposta a l'esglaó
	[Mag(:,m) Fas(:,m)]=bode(num,den,w);	% Resposta freqüencial.
	P(:,m)=roots(den);		% Pols
	Z=roots(num);		% Zeros
end 

% Resposta temporal
figure(26)
plot(t,y);
xlabel('t');
ylabel('y(t)');
legend('1','3','10')
title('Efecte de la variació ''un pol en la resp. temporal.')
disp('Polsa una tecla per continuar.')
pause
end;

% Mòdul de dB de la resposta freqüencial
figure(27)
semilogx(w,20*log10(Mag));
xlabel('w');
ylabel('dB');
legend('1','3','10')
title('Variació d''un pol en el Mòdul de la resp. freqüencial.')
disp('Polsa una tecla per continuar.')
pause

%Gràfica de la fase de la resposta freqüencial
figure(28)
semilogx(w,Fas);
xlabel('w');
ylabel('graus');
title('Fase de la resp. freqüencial per dif. valors del pol.')
legend('1','3','10')
disp('Pola una tecla per continuar')
pause


% Diagrama de pols i zeros
figure(29);
plot(real(P), imag(P), 'x')	%Dibuixa pols
legend('xy','1','xm','3','xc','10')
title('Variació de la situació del pol.')
grid
disp('Polsa una tecla per continuar.')
pause

disp('Calcul del sobrepic, del temps d''establiment i dels temps')
disp('de pujada per diferents valors del pol.')

yss=1;
[Sp,Tr,Ts]=parstep2(y,t,yss)

disp('Polsa una tecla per continuar.')
pause

disp('Valor del sobrepic(domini freqüencial) i Ample de banda.')
[MagMax,BW]=parbode(Mag,1,w)

disp('Polsa una tecla per continuar.')
pause

p=1:0.125:10;
t=0:7/200:7;		%Vector temps
w=logspace(-1,1,200);	%Vector de freqüències
clear('y','Mag','Fas','P','Z')
for m=1:length(p)
	num=[25];
	den=conv([1/p(m) 1],[1 7 25]);
	y(:,m)=step(num,den,t);		% Resposta a l'esglaó
	[Mag(:,m) Fas(:,m)]=bode(num,den,w);	% Resposta freqüencial.
	P(:,m)=roots(den);		% Pols
	Z=roots(num);			% Zeros
end 

[Sp,Tr,Ts]=parstep2(y,t,yss);

figure(30)
plot(p,Sp)
ylabel('Sp')
xlabel('pol')
title('Variació del sobrepic segons la posició dels pols')
disp('polsa una tecla per continuar')
pause

figure(31)
plot(p,Tr)
ylabel('Tr')
xlabel('pol')
title('Variació de Tr en funció de la posició del pol')
disp('Polsa una tecla per continuar')
pause

figure(32)
plot(p,Ts)
ylabel('Ts')
xlabel('pol')
title('Variació de Ts en funció de la posició del pol')
disp('Polsa una tecla per continuar')
pause

disp('Valor del sobrepic(domini freqüencial) i Ample de banda.')
[MagMax,BW]=parbode(Mag,1,w);

figure(33)
plot(p,BW)
ylabel('BW')
xlabel('pol')
title('Variació de BW en funció de la posició del pol')
