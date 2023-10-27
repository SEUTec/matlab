disp('Exercici 1 Examen de control 26-IX-97')
disp('Hallar la funcion de transferencia del captador Gc(s)')

% Resposta a 3*u(t) del captador.
t=linspace(0,2,200);
rc=2*(1-exp(-3*t));
plot(t,rc)

disp('de rc(t) -> Rc(s)')
disp('Gc(s)=Rc(s)/L(s)')
disp('L(s)=3/s')

num=2;
den=[1 3];
[rc2]=step(num,den,t);
subplot(2,1,1)
plot(t,rc)
title('Resposta a 3*u(t) del captador.')

subplot(2,1,2)
% Multiplicamos rc2*3 porque step proporciona la respuesta al
% escalón unitario i queremos la respuesta a 3*u(t).
% para poder comparar la respuesta con la proporcionada
% por el enunciado.
plot(t,rc2*3)
title('Resposta 3*step(num,den).')

disp('Pulsar una tecla para continuar.')
pause

disp('b) Hallar la función de transferencia del dispositivo electrónico.')
