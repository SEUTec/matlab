% Pràctica 3. Control Automàtic.
% Sintonització d'un Compensador PID.
% Métode de la resposta en freqüència.

disp('Pràcitca 3. Control Automàtic.')
disp('Sintonització d''un Compensador PID.')
disp('Métode de la resposta en freqüència.')

disp('Funció de transferència de la PLANTA.')
nGp=1;
dGp=conv(conv([1 1],[1 1]),[1 1]);
printsys(nGp,dGp,'s')	% Treu per la finestra de comandes la fun. de tansferència.
disp('Polsa una tecla per continuar.')
pause

disp('Càlcul dels paràmetres Ku i Tu a partir de la resposta freqüencial de la planta.')

figure(1)
disp('Adjust de la K.')
K=8;
Ti=inf;
Td=0;
disp(['K=',num2str(K)]);
disp(['Ti=',num2str(Ti)]);
disp(['Td=',num2str(Td)]);

while (~isempty(K))	% Al polsar return sene introduir cap valor K=[]; (és empty)
	if (~isempty(K)),
		if isstr(K) 
			K=str2num(K);
		end
		Ku=K;

		nGc=[K*Td K K/Ti];
		dGc=[0 1 0];

		rsposts2

% Resposta total.
% Entrada en t=0, Pertorbació en t=25.
		yP=yr+yp;
		figure(1)
		plot(t,yP)
		xlabel('t')
		title('Resposta total entrada + pertorbació. Ajust K.')
	end
	K=input(['Introdueix un valor per K (Return - sortir)(',num2str(K),'): '],'s')
end

disp('Funció transferència PLANTA + Compensador.')
nG=conv(nGc,nGp);
dG=conv(dGc,dGp);

disp('Funció de transferència Referència-Sortida, A1(s).')
[nA1,dA1]=cloop(nG,dG,-1);

figure(2)
pzmap(nA1,dA1)
Wu=abs(roots(dA1))
% W=2*pi*f => f=W/(2*pi)
% T=1/f =>
Tu=(2*pi)/Wu(3)

disp('Càlcul dels paràmetres del Compensador.')
% K, Ti, Td.

disp('Compensador proporcional.')
K=0.5*Ku;
Ti=inf;
Td=0;
disp(['K=',num2str(K)]);
disp(['Ti=',num2str(Ti)]);
disp(['Td=',num2str(Td)]);

disp('Funció de transferència del Compensador.')
nGc=[K*Td K K/Ti];
dGc=[0 1 0];
printsys(nGc,dGc,'s')	% Treu per la finestra de comandes la fun. de tansferència.

disp('Polsa una tecla per continuar.')
pause

rsposts

disp('Resposta total.')
disp('Entrada en t=0, Pertorbació en t=25.')
yP=yr+yp;
figure(3)
plot(t,yP)
xlabel('t')
title('Resposta total entrada + pertorbació. P.')

disp('Compensador PI.')
K=0.4*Ku;
Ti=0.8*Tu;
td=0;
disp(['K=',num2str(K)]);
disp(['Ti=',num2str(Ti)]);
disp(['Td=',num2str(Td)]);

disp('Funció de transferència del Compensador.')
nGc=[K*Td K K/Ti];
dGc=[0 1 0];
printsys(nGc,dGc,'s')	% Treu per la finestra de comandes la fun. de tansferència.

disp('Polsa una tecla per continuar.')
pause

rsposts

disp('Resposta total.')
disp('Entrada en t=0, Pertorbació en t=25.')
yPI=yr+yp;
figure(3)
plot(t,yPI)
xlabel('t')
title('Resposta total entrada + pertorbació. PI.')

disp('Compensador PID.')
K=0.6*Ku;
Ti=0.5*Tu;
Td=0.125*Tu;
disp(['K=',num2str(K)]);
disp(['Ti=',num2str(Ti)]);
disp(['Td=',num2str(Td)]);

disp('Polsa una tecla per continuar.')
pause

disp('Funció de transferència del Compensador.')
nGc=[K*Td K K/Ti];
dGc=[0 1 0];
printsys(nGc,dGc,'s')	% Treu per la finestra de comandes la fun. de tansferència.

disp('Polsa una tecla per continuar.')
pause

rsposts

disp('Resposta total.')
disp('Entrada en t=0, Pertorbació en t=25.')
yPID=yr+yp;
figure(3)
plot(t,yPID)
xlabel('t')
title('Resposta total entrada + pertorbació. PID.')

disp('Polsa una tecla per continuar.')
pause

figure(4)
plot(t,yP,t,yPI,t,yPID)
xlabel('t')
title('Resposta total, Entrada + Pertorbació. P, PI i PID.')
legend('P','PI','PID')