%Calcul de la constant de temps del motor
%saturació d'intensitat

wss=w(length(w))
x=1;
while w(x)<0.63*wss
	   x=x+1;
end;

tau=t(x);
disp('la constant de temps del sistema és:')
tau

figure(1)
subplot(2,1,1), plot(t,w);
ylabel('w');
title('Velocitat angular');
subplot(2,1,2), plot(t,i);
xlabel('t');
ylabel('i');
title('Intensitat');



