% Obtenció del valors de Kp, Ti i Td dels Sliders

Kp=10*get(AjustKp,'Value');	% 0 < Kp < 10
if (get(AjustTi,'Value')==1)	% Fons escala = inf
	Ti=inf;
else
	Ti=5*get(AjustTi,'Value');	% 0 < Ti < inf (5)
end
Td=2*get(AjustTd,'Value');	% 0 < Td < 2

disp(['Kp=',num2str(Kp)])
disp(['Ti=',num2str(Ti)])
disp(['Td=',num2str(Td)])
disp(' ')

% Funció de transferència del compensador.
nGc=[Kp*Td Kp Kp/Ti];
dGc=[0 1 0];

% Funció de transferència de la PLANTA.
nGp=1;
dGp=conv(conv([1 1],[1 1]),[1 1]);

% Funció transferència PLANTA + Compensador.
nG=conv(nGc,nGp);
dG=conv(dGc,dGp);

% Funció de transferència Referència-Sortida, A1(s).
[nA1,dA1]=cloop(nG,dG,-1);

% Funció de transferència Pertorbació-Sortida, A2(s).
[nA2,dA2]=feedback(1,1,nG,dG,-1);

% Resposta del sistema en llaç tancat.
% Esglaó en la entrada en t=0.
t=0:50/300:50;
yr=step(nA1,dA1,t);

% Esglaó en la perturbació en t=25.
t0=25;		% Instant en el que apareix la pertorbació.
p=0.1*stepfun(t,t0);
yp=lsim(nA2,dA2,p,t);

yPID=yr+yp;
plot(t,yPID)
xlabel('t')
grid
Title('Resposta total entrada + pertorbació (t=25).')


