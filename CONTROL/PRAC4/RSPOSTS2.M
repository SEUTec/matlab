disp('Funció transferència PLANTA + Compensador.')
nG=conv(nGc,nGp);
dG=conv(dGc,dGp);

disp('Funció de transferència Referència-Sortida, A1(s).')
[nA1,dA1]=cloop(nG,dG,-1);

disp('Funció de transferència Pertorbació-Sortida, A2(s).')
[nA2,dA2]=feedback(1,1,nG,dG,-1);

disp('Resposta del sistema en llaç tancat.')
disp('Esglaó en la entrada en t=0.')
t=0:50/300:50;
yr=step(nA1,dA1,t);
disp('Esglaó en la perturbació en t=25.')
t0=25;		% Instant en el que apareix la pertorbació.
p=0.1*stepfun(t,t0);
yp=lsim(nA2,dA2,p,t);


