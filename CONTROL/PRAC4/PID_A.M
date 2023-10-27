% Pràctica 3. Control Automàtic.
% Sintonització d'un Compensador PID.
% Métode de la resposta temporal.

disp('Pràcitca 3. Control Automàtic.')
disp('Sintonització d''un Compensador PID.')
disp('Métode de la resposta temporal.')

disp('Funció de transferència de la PLANTA.')
nGp=1;
dGp=conv(conv([1 1],[1 1]),[1 1]);
printsys(nGp,dGp,'s')	% Treu per la finestra de comandes la fun. de tansferència.
disp('Polsa una tecla per continuar.')
pause

figure(1)
disp('Càlcul dels paràmetres a i L a partir de la resposta de l''esglaó de la planta.')
t=0:0.1:10;
step(nGp,dGp,t)
title('Resposta a l''esglaó de la planta.')
y=step(nGp,dGp,t);
yd=diff(y)/0.1;		% Derivada de la resp. temporal.
[maxyd,i]=max(yd);	% Maxima pendiente de la resp. temporal.
hold on
% y=m*x+n
% n=y-m*x
n=y(i)-maxyd*t(i);
plot(t,maxyd*t+n)
xlabel('t')
axis([0 max(t) min(maxyd*t+n)-0.1 max(y)+0.1])
grid
hold off

% Càlcul dels paràmetres a i L.
% a=y(0) => a=n;
a=abs(n);
text(0.3,n,num2str(a))
disp(['a=',num2str(a)])
% x=(y-n)/maxyd
% L=x(0) => L=-n/maxyd
L=-n/maxyd;
text(L,-0.05,num2str(L))
disp(['L=',num2str(L)])
title(['Resposta a l''esglaó de la planta. ','a=',num2str(a),' L=',num2str(L)])

disp('Polsa una tecla per continuar.')
pause

disp('Càlcul dels paràmetres del Compensador.')
% K, Ti, Td.

disp('Compensador proporcional.')
K=1/a;
Ti=inf;
Td=0;
disp(['K=',num2str(K)]);
disp(['Ti=',num2str(Ti)]);
disp(['Td=',num2str(Td)]);

disp('Funció de transferència del Compensador.')
nGc=[K*Td K K/Ti];
dGc=[0 1 0];
printsys(nGc,dGc,'s')	% Treu per la finestra de comandes la fun. de tansferència.

disp('Polsa una tecla per continuar.')
pause

rsposts

disp('Resposta total.')
disp('Entrada en t=0, Pertorbació en t=25.')
yP=yr+yp;
figure(2)
plot(t,yP)
xlabel('t')
title('Resposta total entrada + pertorbació. P.')

disp('Compensador PI.')
K=0.9/a;
Ti=3*L;
td=0;
disp(['K=',num2str(K)]);
disp(['Ti=',num2str(Ti)]);
disp(['Td=',num2str(Td)]);

disp('Funció de transferència del Compensador.')
nGc=[K*Td K K/Ti];
dGc=[0 1 0];
printsys(nGc,dGc,'s')	% Treu per la finestra de comandes la fun. de tansferència.

disp('Polsa una tecla per continuar.')
pause

rsposts

disp('Resposta total.')
disp('Entrada en t=0, Pertorbació en t=25.')
yPI=yr+yp;
figure(2)
plot(t,yPI)
xlabel('t')
title('Resposta total entrada + pertorbació. PI.')

disp('Compensador PID.')
K=1.2/a;
Ti=2*L;
Td=L/2;
disp(['K=',num2str(K)]);
disp(['Ti=',num2str(Ti)]);
disp(['Td=',num2str(Td)]);

disp('Polsa una tecla per continuar.')
pause

disp('Funció de transferència del Compensador.')
nGc=[K*Td K K/Ti];
dGc=[0 1 0];
printsys(nGc,dGc,'s')	% Treu per la finestra de comandes la fun. de tansferència.

disp('Polsa una tecla per continuar.')
pause

rsposts

disp('Resposta total.')
disp('Entrada en t=0, Pertorbació en t=25.')
yPID=yr+yp;
figure(2)
plot(t,yPID)
xlabel('t')
title('Resposta total entrada + pertorbació. PID.')

disp('Polsa una tecla per continuar.')
pause

disp('Resposta total. P, PI i PID.')
disp('Entrada en t=0, Pertorbació en t=25.')
figure(3)
plot(t,yP,t,yPI,t,yPID)
title('Resposta total entrada + pertorbació. P, PI i PID.')
xlabel('t')
legend('P','PI','PID')