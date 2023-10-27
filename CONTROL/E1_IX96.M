disp('Exercici 1 examen 27-IX-96')

Z=0.46
Wn=17.4

num=1
den=[1 2*Z*Wn Wn^2]

step(num,den)
y=step(num,den);

Sp=(max(y)-y(length(y))) / y(length(y))*100;
disp(['Sp= ',num2str(Sp),' %'])

a=9.916
k=239.8

num=k;
den=[1 6+a 6*a+k];

t=linspace(0,1,200);
step(num,den,t)
y=step(num,den,t);

Sp=(max(y)-y(length(y))) / y(length(y))*100;
disp(['Sp= ',num2str(Sp),' %'])

disp('Error en estat estacionari a entrada esglaó unitari.')
ess=1-y(length(y))
disp(['ess= ',num2str(ess*100),' %'])

disp('Polsa una tecla per continuar.')
pause

disp('Polos de lazo cerrado.')
pzmap(num,den)
[p,z]=pzmap(num,den)