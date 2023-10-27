% controlador PID
K=1; Ti=inf; Td=0;
nGc=[K*Td K K/Ti];
dGc=[1 0];

% Planta
nGp=1;
dGp=conv(conv([1 1],[1 -1]),[1 1]);

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

% resposta total
y=yr+yp;
plot(t,y)