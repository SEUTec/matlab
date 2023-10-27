clc
disp('1.-Análisis de un amplificador conmutado de audio.')
disp(' ')
disp('1.1.- Parámetros del amplificador:')

RL=0.1;
L=150e-6;
C=2.2e-6;
R=8;
D1=1/2;
D1p=1-D1;
D2=2/3;
D2p=1-D2;
Vg=15;

disp('       RL        L         C         R        D1        D2        Vg')
disp([RL,L,C,R,D1,D2,Vg])

disp('Pulsar una tecla para continuar.')
pause
clc

disp('1.2.1.-Cálculo de las matriz A1.')
disp('A1=')
disp('   -RL/L     1/L     0       0')
disp('    1/C    -1/R/C    0     1/R/C')
disp('     0       0     -RL/L    -1/L')
disp('     0      1/R/C   1/C    -1/R/C')
A1=[-RL/L,-1/L,0,0;1/C,-1/R/C,0,1/R/C;0,0,-RL/L,-1/L;0,1/R/C,1/C,-1/R/C]
disp('Pulsar una tecla para continuar.')
pause
clc

disp('1.2.2.-Cálculo de las matriz B1.')
disp('B1=')
disp('    Vg/L')
disp('     0')
disp('     0')
disp('     0')
B1=[Vg/L;0;0;0]
disp('Pulsar una tecla para continuar.')
pause
clc

disp('1.2.3.-Cálculo de las matriz A2=A1.')
disp('A2=')
disp('  -RL/L     1/L     0      0')
disp('    1/C    -1/R/C   0    1/R/C')
disp('     0       0    -RL/L   -1/L')
disp('     0      1/R/C   1/C  -1/R/C')
A2=A1
disp('Pulsar una tecla para continuar.')
pause
clc

disp('1.2.4.-Cálculo de las matriz B2.')
disp('B2=')
disp('     0')
disp('     0')
disp('    Vg/L')
disp('     0')
B2=[0;0;Vg/L;0]
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Cálculo de las matrices promediadas para D=1/2.')
disp('Apss=A1=A2')
Apss=A1;
disp('Bpss1=[B1*D1+B2*D1'']')
Bpss1=[B1*D1+B2*D1p]
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Cálculo de las matrices promediadas para D=2/3.')
disp('Apss=A1=A2')
disp('Bpss2=[B1*D2+B2*D2'']')
Bpss2=[B1*D2+B2*D2p]
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Cáculo del vector de estado en estado estacionario para D=1/2.')
disp('Xss1=-Apss\Bpss1 donde Xss=[i1,v1,i2,v2]')
Xss1=-Apss\Bpss1
disp('Valor medio de Vo=V1-V2=Xss1(2)-Xss1(4)')
Vomed1=Xss1(2)-Xss1(4)
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Cáculo del vector de estado en estado estacionario para D=2/3.')
disp('Xss2=-Apss\Bpss2 donde Xss=[i1,v1,i2,v2]')
Xss2=-Apss\Bpss2
disp('Valor medio de Vo=V1-V2=Xss1(2)-Xss1(4)')
Vomed2=Xss2(2)-Xss2(4)
disp('Pulsar una tecla para continuar.')
pause
clc

disp('2. Modelo dinámico de pequeña señal para D=1/2.')
disp('K=(A1-A2)*Xss1+B1-B2')
K1=(A1-A2)*Xss1+B1-B2
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Bpsse1=Bpsse1/Vg')
Bpsse1=Bpss1/Vg
disp('Pulsar una tecla para continuar.')
disp(' ')
pause
clc

Ci1=[Vg,0,0,0]
Cv1=[0,Vg,0,0]
Ci2=[0,0,Vg,0]
Cv2=[0,0,0,Vg]
D=[0,0]
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Cálculo de la función de transferéncia Salida-Control (Vo/D)')
[NumVo,DenVo]=ss2tf(Apss,[Bpsse1,K1],[0,1,0,-1],D,2)
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Cálculo de la función de transferéncia SalidaI1-Entrada (I1/Vg)')
disp('[NumI1Vg,DenI1Vg]=ss2tf(Apss,[Bpsse1,K1],Ci1,D,1)')
[NumI1Vg,DenI1Vg]=ss2tf(Apss,[Bpsse1,K1],Ci1,D,1)
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Cálculo de la función de transferéncia SalidaV1-Entrada (V1/Vg)')
disp('[NumV1Vg,DenV1Vg]=ss2tf(Apss,[Bpsse1,K1],Cv1,D,1)')
[NumV1Vg,DenV1Vg]=ss2tf(Apss,[Bpsse1,K1],Cv1,D,1)
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Cálculo de la función de transferéncia SalidaI2-Entrada (I2/Vg)')
disp('[NumI2Vg,DenI2Vg]=ss2tf(Apss,[Bpsse1,K1],Ci2,D,1)')
[NumI2Vg,DenI2Vg]=ss2tf(Apss,[Bpsse1,K1],Ci2,D,1)
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Cálculo de la función de transferéncia SalidaV2-Entrada (V2/Vg)')
disp('[NumV2Vg,DenV2Vg]=ss2tf(Apss,[Bpsse1,K1],Cv2,D,1)')
[NumV2Vg,DenV2Vg]=ss2tf(Apss,[Bpsse1,K1],Cv2,D,1)
disp('Pulsar una tecla para continuar.')
pause
clc

if exist('diagmod')		% Si no existe la figura del diagrama de
	figure(diagmod)		% Bode se crea.
else
	diagmod=figure;
end
bode(NumVo,DenVo);
[modul,fase,w]=bode(NumVo,DenVo);

disp('3. Ganáncia a bajas frecuencias (w=0).')
[G0,F0]=bode(NumVo,DenVo,0)
disp('Pulsar una tecla para continuar.')
pause
clc

disp ('Cálculo del ancho de banda')
n=1;
G0dB=20*log10(G0);
GcdB=20*log10(G0)-3;
moduldB=20*log10(modul);
while (moduldB(n)>GcdB)		% Buscamos el primer valor de w
	n=n+1; 			% para el cual la ganancia éstá
end;				% 3dB por debajo de la ganacia en W=0.
disp('Wc=')
w(n)
disp('Módulo y fase en W=Wc')
[ModulWc,FaseWc]=bode(NumVo,DenVo,w(n))
disp('Módulo en W=Wc en dB=')
ModuldB=20*log10(ModulWc)
disp('Difencia en dB con respecto a Wo=')
disp(ModuldB-G0dB)
disp('Pulsar una tecla para continuar.')
pause
clc

disp('4.- Calculo de la respuesta temporal para u(t)=0.3*sen(3e4*t).')
disp('Para w=30000 tenemos Módulo (Gw1) i Fase (Fw1):')
[Gw1,Fw1]=bode(NumVo,DenVo,30000)
disp('Ganancia en dB:')
Gw1dB=20*log10(Gw1)

T=1/(3e4/2/pi);
temps=linspace(0,2*T,50);
ut=0.3*sin(3e4*temps);
Offset=0.5
if exist('simula')		% Si no existe la figura de la
	figure(simula)		% simulación se crea.
else
	simula=figure;
end
lsim(NumVo,DenVo,ut,temps);
title('Respuesta temporal a entrada senoidal.')
ylabel('Amplitud (V)')
xlabel('Tiempo (s)')
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Introducción de los parámetros del filtro.')
NumGc=conv([1/4e4 1],[1/7e4 1])
DenGc=conv([1/1e7 1],[1/1e5 1])
disp('Pulsar una tecla para continuar.')
pause
clc

if exist('BodeGc')		% Si no existe la figura del diagrama
	figure(BodeGc)		% de Bode del compensador se crea.
else
	BodeGc=figure;
end
bode(NumGc,DenGc)
disp('Pulsar una tecla para continuar.')
pause
clc

disp('Obtención de la función de transferéncia del sistema con')
disp('el compensador en cascada.')
[NumA,DenA]=series(NumVo,DenVo,NumGc,DenGc)

if exist('BodeA')		% Si no existe la figura del diagrama
	figure(BodeA)		% de Bode del sistema compensado se crea.
else
	BodeA=figure;
end
bode(NumA,DenA) 		% Bode del sistema compensado.
[modul,fase,w]=bode(NumA,DenA);
disp('3. Ganáncia a bajas frecuencias (w=0).')
[G0,F0]=bode(NumA,DenA,0)
disp('Pulsar una tecla para continuar.')
pause
clc

disp ('Cálculo del ancho de banda')
n=1;
G0dB=20*log10(G0);
GcdB=20*log10(G0)-3;
moduldB=20*log10(modul);
while (moduldB(n)>GcdB)		% Buscamos el primer valor de w
	n=n+1; 			% para el cual la ganancia éstá
end;				% 3dB por debajo de la ganacia en W=0.
disp('Wc=')
w(n)
disp('Módulo y fase en W=Wc')
[ModulWc,FaseWc]=bode(NumA,DenA,w(n))
disp('Módulo en W=Wc en dB=')
ModuldB=20*log10(ModulWc)
disp('Difencia en dB con respecto a Wo=')
disp(ModuldB-G0dB)
disp('Pulsar una tecla para continuar.')
pause
clc

disp('6.1. Càlculo de la amplitud de la respuesta a w=2e4')
[Modulo,Fase]=bode(NumA,DenA,2e4)
disp('6.2. Càlculo de la amplitud de la respuesta a w=5e4')
[Modulo,Fase]=bode(NumA,DenA,5e4)
disp('6.3. Càlculo de la amplitud de la respuesta a w=1e5')
[Modulo,Fase]=bode(NumA,DenA,1e5)
disp('Pulsar una tecla para continuar.')
pause
clc

if exist('simula2')		% Si no existe la figura del diagrama
	figure(simula2)		% de respuesta temporal del sistema.
else				% compensado se crea.
	simula2=figure;
end
			% Simulación del compensador, para obtener la
			% señal en la salida del compensador.
[VoGc]=lsim(NumGc,DenGc,ut,temps);
plot(temps,ut,temps,VoGc)
			% Simulación del sistema, aplicando a su entrada
			% la señal de salida del compensador, para obtener
			% la respuesta temporal de todo el sistema.
[Vo]=lsim(NumVo,DenVo,VoGc,temps);
plot(temps,ut,'r',temps,VoGc,'g',temps,Vo,'b')
legend('ut','VoGc','Vo')
title('Respuesta temporal a entrada senoidal con filtro.')
ylabel('Amplitud (V)')
xlabel('Tiempo (s)')