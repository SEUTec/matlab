disp('1.-Análisis de un convertidor elevador.')
disp(' ')
disp('         L         u=0')
disp('   +---nnnnn---o    o-----o-------+')
disp('   |     i ->   \         |    +  |')
disp('   |              \      ---      \')
disp(' -----         u=1 o   C ---   v  / R')
disp('  --- Vg           |      |       \')
disp('   |               |      |       /')
disp('   |               |      |    -  |')
disp('   +---------------o------o-------+')
disp(' ')
disp(' ')
disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('1.1.- Parámetros del convertidor:')

L=200e-6;
disp('L=')
disp(L)

C=200e-6;
disp('C=')
disp(C)

R=10;
disp('R=')
disp(R)

D=0.5;
disp('D=')
disp(D)

Dp=1-D;
disp('D''=Dp=1-D')
disp(Dp)

Vg=10;
disp('Tensión del generador: Vg=')
disp(Vg)

T=20e-6;
disp('Periodo de conmutación: T=')
disp(T)
disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('1.2.1.-Cálculo de las matriz A1.')
disp('A1=')
disp('     0      0')
disp('     0   -1/R/C')
A1=[0,0;0,-1/R/C]
disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('1.2.2.-Cálculo de las matriz B1.')
disp('B1=')
disp('    Vg/L')
disp('     0')
B1=[Vg/L;0]
disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('1.2.3.-Cálculo de las matriz A2.')
disp('A2=')
disp('     0    -1/L')
disp('    1/C  -1/R/C')
A2=[0,-1/L;1/C,-1/R/C]
disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('1.2.4.-Cálculo de las matriz B2.')
disp('B2=')
disp('    Vg/L')
disp('     0')
B2=[Vg/L;0]
disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('Cálculo de las matrices promediadas.')
disp('Apss=[A1*D+A2*D'']')
Apss=[A1*D+A2*Dp]
disp('Bpss=[B1*D+B2*D'']')
Bpss=[B1*D+B2*Dp]
disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('1.3.- Cáculo del vector de estado en estado estacionario.')
disp('Xss=-Apss\Bpss')
Xss=-Apss\Bpss
disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('2. Modelo dinámico de pequeña señal.')
disp('K=(A1-A2)*Xss+B1-B2')
K=(A1-A2)*Xss+B1-B2
disp('Bpsse=Bpss/Vg')
Bpsse=Bpss/Vg
Cv=[0,1]
Ci=[1,0]
D=[0,0]
disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('Cálculo de función de transferéncia Salida-Entrada (V).')
disp('[NumVg,DenVg]=ss2tf(Apss,[Bpsse,K],Cv,D,1)')
[NumVg,DenVg]=ss2tf(Apss,[Bpsse,K],Cv,D,1)

disp('Cálculo de la función de transferéncia Salida-Control (V).')
disp('[NumD,DenD]=ss2tf(Apss,[Bpsse,K],Cv,D,2)')
[NumD,DenD]=ss2tf(Apss,[Bpsse,K],Cv,D,2)

disp('Cálculo de función de transferéncia Salida-Entrada (I).')
disp('[NumIg,DenIg]=ss2tf(Apss,[Bpsse,K],Ci,D,1)')
[NumIg,DenIg]=ss2tf(Apss,[Bpsse,K],Ci,D,1)

disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('Diagrama de polos i ceros (Salida-Control).')
if exist('diagpz')		% Si no existe la figura del diagrama de polos
	figure(diagpz)		% i zeros se crea.
else
	diagpz=figure;
end
pzmap(NumD,DenD)
title('Diagrama de polos y ceros.')
disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('Respuesta a una entrada escalón.')
if exist('diagstep')		% Si no existe la figura del diagrama
	figure(diagstep)	% de respuesta al escalón se crea.
else
	diagstep=figure;
end
tiempo=0:1e-4:2e-2;
Vt=step(10*NumVg,DenVg,tiempo);	% Multiplicamos el Numerador por 10
		% para obetener la respuesta a un escalón de amplitud
		% 10, en lugar de un escalón unitario.
It=step(10*NumIg,DenIg,tiempo);
plot(tiempo,It,tiempo,Vt)
legend('I(t)','V(t)')
title('V(t) y I(t) para dVg(t)=10*u(t).')
disp('Pulsar una tecla para continuar.')
disp(' ')
pause

disp('Simulación en lazo abierto')
disp('Valores iniciales de la simulación.')
t=[0,10e-6];
u=1;
C=[1,1];
D=0;
Xaux=[0,0];
X=[0,0];
U=[1;1];
periodos=0;
while periodos<1
	periodos=input('Introduzca el número de periodos a simular: ');
	if isempty(periodos),periodos=0;,end
end
disp('Simulación en proceso, espere un momento.')
tic
if exist('simfig')		% Si no existe la figura de la simulación
	figure(simfig)		% si promedicación se crea.
else
	simfig=figure;
end
title('Simulación en proceso, espere un momento.')
percent=uicontrol(simfig,'style','text','pos',[5 5 200 15],'ForeGroundColor','White','BackGroundColor','Black','HorizontalAlignment','left');
for i=0:2*periodos-1
	tamany=size(Xaux);
	X0=Xaux(tamany(1),:);
	if u==1
		[res,Xaux]=lsim(A1,B1,C,D,U,t,X0);
		u=0;
	else
		[res,Xaux]=lsim(A2,B2,C,D,U,t,X0);
		u=1;
	end
	X=[X;Xaux(2,:)];
	set(percent,'string',[num2str(round(50*i/periodos)),'% realizado.'])
end
temps=toc;
disp('Tiempo de simulación:')
disp('MATLAB 4.2c Win 3.x')
disp('Con 486 DX2 66 (Windows 3.1): 1000 periodos 71 segs aprox.')
disp('Pentium 200 MMX (Portatil Win 95): 1000 per. 17 segs aprox.')
disp('Pentium 200 MMX (Portatil Win NT 4.0 WorkStatin): 20 s aprox.')
disp(temps)
temps=0:10e-6:T*periodos;
plot(temps,X(:,1),temps,X(:,2));
title('Simulación sin promediación.')
xlabel('Tiempo (Segundos)')
ylabel('V(t) en Voltios, I(t) en Amperios.')
set(percent,'string','Calculando posición de leyenda.')
legend('i(t)','v(t)')
delete(percent)
