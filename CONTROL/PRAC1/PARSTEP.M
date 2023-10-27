function [Sp,Tr,Ts]=parstep(y,t,yss)
% Calcula diferents paràmetres de la resposta a l'eglaó
% y respostemporal
% t temps
% yss resposta en estat estacionari.

% Sobrepic (en %)
Sp=100*(max(y)-yss)/yss;

% Temps de pujada
n=1;
while y(n)<yss,
   n=n+1;
end
Tr=t(n);

%Temps d'establiment (2%)
for n=1:length(y),
	if(y(n)<0.98*yss)| (y(n)>1.02*yss)
		Ts=t(n);
	end
end
   