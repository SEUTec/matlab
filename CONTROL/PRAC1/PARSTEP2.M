function [Sp,Tr,Ts]=parstep2(y,t,yss)
% Calcula diferents paràmetres de la resposta a l'eglaó
% y respostemporal
% t temps
% yss resposta en estat estacionari.

% Sobrepic (en %)
Sp=100*(max(y)-yss)/yss;

% Temps de pujada
[f,c]=size(y);
for col=1:c
	n=1;
	while ((y(n,col)<yss) & (n<f)),
		n=n+1;
	end;
	Tr(col)=t(n);
end

%Temps d'establiment (2%)
for col=1:c
	for n=1:f
		if(y(n,col)<0.98*yss)| (y(n,col)>1.02*yss)
		Ts(col)=t(n);
		end
	end
end
  