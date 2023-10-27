% Pràctica 3. Control Automàtic.
% Sintonització d'un Compensador PID.
% Comparació de resultats.

disp('Pràctica 3. Control Automàtic.')
disp('Sintonització d''un Compensador PID.')
disp('Comparació de resultats.')

% controlador PID
% Valors obtinguts amb el métode de la resposta temporal en llaç obert.
K=5.515; 	Ti=1.609; 	Td=0.4023;
% Valors obtinguts amb el métode de la resposta freqüencial en llaç tancat.
K(2)=4.8; 	Ti(2)=1.814; 	Td(2)=0.4534;
% Valors obtinguts mitjançant el métode empíric.
K(3)=2.86; 	Ti(3)=2.195; 	Td(3)=0.674;

for n=1:3;
	nGc=[K(n)*Td(n) K(n) K(n)/Ti(n)];
	dGc=[1 0];

% Planta
	nGp=1;
	dGp=conv(conv([1 1],[1 1]),[1 1]);

% planta + compensador
	nG=conv(nGc,nGp);
	dG=conv(dGc,dGp);

% funció de transferència Referència-Sortida, A1(s)
	[nA1,dA1]=cloop(nG,dG,-1);

% funció de transferència Pertorbació-Sortida, A2(s)
	[nA2,dA2]=feedback(1,1,nG,dG,-1);

% resposta a un esglaó en la entrada.
	t=0:50/300:50;
	yr=step(nA1,dA1,t);

% resposta a un esglaó en la perturbació
	t0=25;			% Instant en el que apareix la pertorbació.
	p=0.1*stepfun(t,t0);
	yp=lsim(nA2,dA2,p,t);

% Resposta total
	if (n==1)
		yA=yr+yp;
	elseif (n==2)
		yB=yr+yp;
	else yC=yr+yp; 
	end
end
plot(t,yA,t,yB,t,yC)
xlabel('t')
legend('Resp. Temporal','Resp. Freqüencial','Empíric')