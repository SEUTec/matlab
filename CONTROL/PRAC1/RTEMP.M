% Càlcul de diferents paràmetres de la resposta temporal

Wn=1;		% Freqüència natural
Zeta=0.5;	% Coeficient d'esmorteiment
t=0:15/1000:15; % Vector de temps
num=Wn^2;
den=[1 2*Zeta*Wn Wn^2];
y=step(num,den,t);
step(num,den,t)
yss=y(length(t));	% Resposta en estat estacionari
[Sp,Tr,Ts]=parstep(y,t,yss);