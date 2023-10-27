disp('Efectes de la variació d''un zero.')

z=[-3 1 3 10]; 		%Diferents posicions del zero
t=0:3/200:3;		%Vector temps
w=logspace(-1,5,200);	%Vector de freqüències
clear('y','Mag','Fas','P','Z')
for m=1:length(z)
	num=[25/z(m) 25];
	den=[1 7 25];
	y(:,m)=step(num,den,t);			% Resposta a l'esglaó
	[Mag(:,m) Fas(:,m)]=bode(num,den,w);	% Resposta freqüencial.
	P(:,m)=roots(den);			% Pols
	Z(:,m)=roots(num);			% Zeros
end;

disp('Resposta temporal.')
figure(18)
plot(t,y);
xlabel('t');
ylabel('y(t)');
title('Resposta temporal per diferents valors del zero.')
legend('-3','1','3','10')
disp('Polsa una tecla per continuar.')
pause
end;

disp('Gràfica del mòdul (dB) de la resposta freqüencial.')
figure(19)
semilogx(w,20*log10(Mag));
xlabel('w');
ylabel('dB');
title('Mòdul de la resp. freqüencial per diferents valors del zero.')
legend('-3','1','3','10')
disp('Polsa una tecla per continuar.')
pause

%Gràfica de la fase de la resposta freqüencial
figure(20)
semilogx(w,Fas);
xlabel('w');
ylabel('graus');
title('Fase de la resp. freqüencial per dif. valors del zero.')
legend('-3','1','3','10')
disp('Pola una tecla per continuar')
pause

disp('Diagrama de pols i zeros.')
figure(21);
plot(real(P), imag(P), 'x')	%Dibuixa pols
hold on
plot(real(Z), imag(Z), 'o')	%Dibuixa zeros
hold off
title('Diagrama de pols i zeros.')
legend('oy','-3','om','1','oc','3','or','10')
grid
pause

disp('Sobrepic de la resp. temporal, del temps de pujada')
disp('i del d''establiment per diferents valors del zero.')

yss=1;
[Sp,Tr,Ts]=parstep2(y,t,yss)

disp('Valors de pic de la resp. en freqüencia i ample de banda')
disp('per diferents valors del zero.')
[MagMax,BW]=parbode(Mag,1,w)

disp('Polsa una tecla per continuar.')
pause

disp('Càlculs per a la representació gràfica de les variacións')
disp('dels paràmetres anteriors en funció del zero.')
z=[-3 -2.5 -2 -1.5 -1 -0.5 0.5 1 1.5 2 2.5 3 4 5 6 7 8 9 10];	%Diferents posicions del zero.
clear('y','Mag','Fas','P','Z')
for m=1:length(z)
	num=[25/z(m) 25];
	den=[1 7 25];
	y(:,m)=step(num,den,t);			% Resposta a l'esglaó
	[Mag(:,m) Fas(:,m)]=bode(num,den,w);	% Resposta freqüencial.
	P(:,m)=roots(den);			% Pols
	Z(:,m)=roots(num);			% Zeros
end;

disp('Variacions de Ts i Tr en funció del valors del zero')

yss=1;
[Sp,Tr,Ts]=parstep2(y,t,yss);

figure(22)
plot(z,Sp)
ylabel('Sp')
xlabel('Zero')
title('Variació del sobrepic de la resp. temporal en funció del zero.')
disp('polsa una tecla per continuar')
pause

figure(23)
plot(z,Tr)
ylabel('Tr')
xlabel('zero')
title('Variació de Tr en funció de la posició del zero')
disp('Polsa una tecla per continuar')
pause

figure(24)
plot(z,Ts)
ylabel('Ts')
xlabel('zero')
title('Variació de Ts en funció de la posició del zero')
disp('Polsa una tecla per continuar')
pause

[MagMax,BW]=parbode(Mag,1,w);
MagMaxdB=20*log10(MagMax);

figure(25)
plot(z,BW)
ylabel('BW')
xlabel('zero')
title('Variació de BW en funció de la posició del zero')
disp('Polsa una tecla per continuar')
pause