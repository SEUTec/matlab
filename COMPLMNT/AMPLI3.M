function [ret,x0,str,ts,xts]=ampli3(t,x,u,flag);
%AMPLI3	is the M-file description of the SIMULINK system named AMPLI3.
%	The block-diagram can be displayed by typing: AMPLI3.
%
%	SYS=AMPLI3(T,X,U,FLAG) returns depending on FLAG certain
%	system values given time point, T, current state vector, X,
%	and input vector, U.
%	FLAG is used to indicate the type of output to be returned in SYS.
%
%	Setting FLAG=1 causes AMPLI3 to return state derivatives, FLAG=2
%	discrete states, FLAG=3 system outputs and FLAG=4 next sample
%	time. For more information and other options see SFUNC.
%
%	Calling AMPLI3 with a FLAG of zero:
%	[SIZES]=AMPLI3([],[],[],0),  returns a vector, SIZES, which
%	contains the sizes of the state vector and other parameters.
%		SIZES(1) number of states
%		SIZES(2) number of discrete states
%		SIZES(3) number of outputs
%		SIZES(4) number of inputs
%		SIZES(5) number of roots (currently unsupported)
%		SIZES(6) direct feedthrough flag
%		SIZES(7) number of sample times
%
%	For the definition of other parameters in SIZES, see SFUNC.
%	See also, TRIM, LINMOD, LINSIM, EULER, RK23, RK45, ADAMS, GEAR.

% Note: This M-file is only used for saving graphical information;
%       after the model is loaded into memory an internal model
%       representation is used.

% the system will take on the name of this mfile:
sys = mfilename;
new_system(sys)
simver(1.3)
if (0 == (nargin + nargout))
     set_param(sys,'Location',[24,70,708,417])
     open_system(sys)
end;
set_param(sys,'algorithm',     'Linear')
set_param(sys,'Start time',    '0.0')
set_param(sys,'Stop time',     '5e-4')
set_param(sys,'Min step size', '0.0000001')
set_param(sys,'Max step size', '0.0000001')
set_param(sys,'Relative error','1e-3')
set_param(sys,'Return vars',   '')

add_block('built-in/To Workspace',[sys,'/','To Workspace5'])
set_param([sys,'/','To Workspace5'],...
		'mat-name','t',...
		'position',[905,142,955,158])

add_block('built-in/Clock',[sys,'/','Clock'])
set_param([sys,'/','Clock'],...
		'position',[830,139,850,161])

add_block('built-in/To Workspace',[sys,'/','To Workspace6'])
set_param([sys,'/','To Workspace6'],...
		'mat-name','t',...
		'position',[925,162,975,178])

add_block('built-in/Clock',[sys,'/','Clock1'])
set_param([sys,'/','Clock1'],...
		'position',[850,159,870,181])

add_block('built-in/To Workspace',[sys,'/','To Workspace7'])
set_param([sys,'/','To Workspace7'],...
		'mat-name','t',...
		'position',[945,182,995,198])

add_block('built-in/Clock',[sys,'/','Clock2'])
set_param([sys,'/','Clock2'],...
		'position',[870,179,890,201])

add_block('built-in/Clock',[sys,'/','Clock3'])
set_param([sys,'/','Clock3'],...
		'position',[230,49,250,71])

add_block('built-in/To Workspace',[sys,'/','To Workspace8'])
set_param([sys,'/','To Workspace8'],...
		'mat-name','t',...
		'position',[305,52,355,68])


%     Subsystem  'Amplificador'.

new_system([sys,'/','Amplificador'])
set_param([sys,'/','Amplificador'],'Location',[2,57,678,395])

add_block('built-in/Constant',[sys,'/','Amplificador/Vg'])
set_param([sys,'/','Amplificador/Vg'],...
		'Value','15',...
		'position',[100,175,120,195])

add_block('built-in/Constant',[sys,'/','Amplificador/Cte'])
set_param([sys,'/','Amplificador/Cte'],...
		'position',[100,300,120,320])

add_block('built-in/Constant',[sys,'/','Amplificador/RL'])
set_param([sys,'/','Amplificador/RL'],...
		'Value','0.1',...
		'position',[100,260,120,280])

add_block('built-in/Constant',[sys,'/','Amplificador/R'])
set_param([sys,'/','Amplificador/R'],...
		'Value','8',...
		'position',[100,440,120,460])

add_block('built-in/Sum',[sys,'/','Amplificador/Sum5'])
set_param([sys,'/','Amplificador/Sum5'],...
		'inputs','+-',...
		'position',[880,390,900,410])

add_block('built-in/To Workspace',[sys,'/','Amplificador/To Workspace3'])
set_param([sys,'/','Amplificador/To Workspace3'],...
		'mat-name','v2',...
		'position',[750,452,800,468])

add_block('built-in/To Workspace',[sys,'/','Amplificador/To Workspace1'])
set_param([sys,'/','Amplificador/To Workspace1'],...
		'mat-name','v1',...
		'position',[745,202,795,218])

add_block('built-in/To Workspace',[sys,'/','Amplificador/To Workspace2'])
set_param([sys,'/','Amplificador/To Workspace2'],...
		'mat-name','i2',...
		'position',[745,302,795,318])

add_block('built-in/Sum',[sys,'/','Amplificador/Sum3'])
set_param([sys,'/','Amplificador/Sum3'],...
		'inputs','-++',...
		'position',[465,442,485,478])

add_block('built-in/Integrator',[sys,'/','Amplificador/Integrator3'])
set_param([sys,'/','Amplificador/Integrator3'],...
		'position',[650,450,670,470])

add_block('built-in/Gain',[sys,'/','Amplificador/1//RC2'])
set_param([sys,'/','Amplificador/1//RC2'],...
		'Gain','56818',...
		'position',[530,435,615,485])

add_block('built-in/Product',[sys,'/','Amplificador/Product5'])
set_param([sys,'/','Amplificador/Product5'],...
		'position',[330,435,355,455])

add_block('built-in/Product',[sys,'/','Amplificador/Product4'])
set_param([sys,'/','Amplificador/Product4'],...
		'position',[340,340,365,360])

add_block('built-in/Sum',[sys,'/','Amplificador/Sum4'])
set_param([sys,'/','Amplificador/Sum4'],...
		'inputs','-+',...
		'position',[270,295,290,315])

add_block('built-in/Sum',[sys,'/','Amplificador/Sum2'])
set_param([sys,'/','Amplificador/Sum2'],...
		'inputs','+--',...
		'position',[460,292,480,328])

add_block('built-in/Integrator',[sys,'/','Amplificador/Integrator2'])
set_param([sys,'/','Amplificador/Integrator2'],...
		'position',[645,300,665,320])

add_block('built-in/Gain',[sys,'/','Amplificador/1//L2'])
set_param([sys,'/','Amplificador/1//L2'],...
		'Gain','6666.6',...
		'position',[525,285,610,335])

add_block('built-in/Product',[sys,'/','Amplificador/Product3'])
set_param([sys,'/','Amplificador/Product3'],...
		'position',[360,280,385,300])

add_block('built-in/Product',[sys,'/','Amplificador/Product2'])
set_param([sys,'/','Amplificador/Product2'],...
		'position',[300,200,325,220])

add_block('built-in/Sum',[sys,'/','Amplificador/Sum1'])
set_param([sys,'/','Amplificador/Sum1'],...
		'inputs','-++',...
		'position',[400,192,420,228])

add_block('built-in/Integrator',[sys,'/','Amplificador/Integrator1'])
set_param([sys,'/','Amplificador/Integrator1'],...
		'position',[585,200,605,220])

add_block('built-in/Gain',[sys,'/','Amplificador/1//RC'])
set_param([sys,'/','Amplificador/1//RC'],...
		'Gain','56818',...
		'position',[465,185,550,235])

add_block('built-in/To Workspace',[sys,'/','Amplificador/To Workspace'])
set_param([sys,'/','Amplificador/To Workspace'],...
		'mat-name','i1',...
		'position',[730,102,780,118])

add_block('built-in/Integrator',[sys,'/','Amplificador/Integrator'])
set_param([sys,'/','Amplificador/Integrator'],...
		'position',[585,100,605,120])

add_block('built-in/Gain',[sys,'/','Amplificador/1//L'])
set_param([sys,'/','Amplificador/1//L'],...
		'Gain','6666.6',...
		'position',[465,85,550,135])

add_block('built-in/Product',[sys,'/','Amplificador/Product1'])
set_param([sys,'/','Amplificador/Product1'],...
		'position',[300,100,325,120])

add_block('built-in/Sum',[sys,'/','Amplificador/Sum'])
set_param([sys,'/','Amplificador/Sum'],...
		'inputs','+--',...
		'position',[400,92,420,128])

add_block('built-in/Note',[sys,'/','Amplificador/D*Vg'])
set_param([sys,'/','Amplificador/D*Vg'],...
		'position',[345,35,360,45])

add_block('built-in/Product',[sys,'/','Amplificador/Product'])
set_param([sys,'/','Amplificador/Product'],...
		'position',[300,55,325,75])

add_block('built-in/Outport',[sys,'/','Amplificador/out_1'])
set_param([sys,'/','Amplificador/out_1'],...
		'position',[930,390,950,410])

add_block('built-in/Inport',[sys,'/','Amplificador/in_1'])
set_param([sys,'/','Amplificador/in_1'],...
		'position',[85,60,105,80])
add_line([sys,'/','Amplificador'],[675,460;745,460])
add_line([sys,'/','Amplificador'],[705,460;705,405;430,405;430,320;455,320])
add_line([sys,'/','Amplificador'],[705,405;875,405])
add_line([sys,'/','Amplificador'],[610,210;740,210])
add_line([sys,'/','Amplificador'],[645,210;645,255;835,255;835,510;430,510;430,470;460,470])
add_line([sys,'/','Amplificador'],[835,395;875,395])
add_line([sys,'/','Amplificador'],[430,320;430,255;365,255;365,220;395,220])
add_line([sys,'/','Amplificador'],[430,405;430,450;460,450])
add_line([sys,'/','Amplificador'],[360,445;390,445;390,460;460,460])
add_line([sys,'/','Amplificador'],[670,310;740,310])
add_line([sys,'/','Amplificador'],[705,310;705,385;315,385;325,440])
add_line([sys,'/','Amplificador'],[315,385;315,355;335,355])
add_line([sys,'/','Amplificador'],[125,450;325,450])
add_line([sys,'/','Amplificador'],[230,450;230,215;295,215])
add_line([sys,'/','Amplificador'],[370,350;415,350;415,310;455,310])
add_line([sys,'/','Amplificador'],[125,270;200,270;200,105;295,105])
add_line([sys,'/','Amplificador'],[200,270;200,345;335,345])
add_line([sys,'/','Amplificador'],[390,290;415,290;415,300;455,300])
add_line([sys,'/','Amplificador'],[295,305;325,305;325,295;355,295])
add_line([sys,'/','Amplificador'],[125,310;265,310])
add_line([sys,'/','Amplificador'],[125,185;160,185;160,60;295,60])
add_line([sys,'/','Amplificador'],[160,185;160,285;355,285])
add_line([sys,'/','Amplificador'],[620,460;645,460])
add_line([sys,'/','Amplificador'],[490,460;525,460])
add_line([sys,'/','Amplificador'],[615,310;640,310])
add_line([sys,'/','Amplificador'],[485,310;520,310])
add_line([sys,'/','Amplificador'],[330,210;395,210])
add_line([sys,'/','Amplificador'],[645,210;645,170;365,170;365,200;395,200])
add_line([sys,'/','Amplificador'],[365,170;365,120;395,120])
add_line([sys,'/','Amplificador'],[555,210;580,210])
add_line([sys,'/','Amplificador'],[425,210;460,210])
add_line([sys,'/','Amplificador'],[610,110;725,110])
add_line([sys,'/','Amplificador'],[645,110;645,155;255,155;255,205;295,205])
add_line([sys,'/','Amplificador'],[255,155;255,115;295,115])
add_line([sys,'/','Amplificador'],[555,110;580,110])
add_line([sys,'/','Amplificador'],[425,110;460,110])
add_line([sys,'/','Amplificador'],[330,110;395,110])
add_line([sys,'/','Amplificador'],[330,65;365,65;365,100;395,100])
add_line([sys,'/','Amplificador'],[110,70;295,70])
add_line([sys,'/','Amplificador'],[905,400;925,400])
add_line([sys,'/','Amplificador'],[175,70;175,300;265,300])


%     Finished composite block 'Amplificador'.

set_param([sys,'/','Amplificador'],...
		'position',[475,190,505,240])

add_block('built-in/To Workspace',[sys,'/','Salida'])
set_param([sys,'/','Salida'],...
		'mat-name','Vout',...
		'position',[555,207,605,223])

add_block('built-in/Saturation',[sys,'/','Saturation'])
set_param([sys,'/','Saturation'],...
		'Lower Limit','0',...
		'Upper Limit','1',...
		'position',[410,205,435,225])

add_block('built-in/To Workspace',[sys,'/','Ciclo de Trabajo'])
set_param([sys,'/','Ciclo de Trabajo'],...
		'mat-name','D',...
		'position',[560,137,610,153])

add_block('built-in/Sum',[sys,'/','Sum'])
set_param([sys,'/','Sum'],...
		'position',[350,205,370,225])

add_block('built-in/Constant',[sys,'/','Offset'])
set_param([sys,'/','Offset'],...
		'Value','0.5',...
		'position',[265,170,285,190])

add_block('built-in/Transfer Fcn',[sys,'/','Transfer Fcn'])
set_param([sys,'/','Transfer Fcn'],...
		'Numerator','[3.57e-10 3.93e-5 1]',...
		'Denominator','[1e-12 1.01e-5 1]',...
		'position',[115,222,285,278])

add_block('built-in/Sine Wave',[sys,'/','Sine wave'])
set_param([sys,'/','Sine wave'],...
		'amplitude','0.3',...
		'frequency','1e5',...
		'position',[55,240,75,260])

add_block('built-in/Scope',[sys,'/','Scope'])
set_param([sys,'/','Scope'],...
		'Vgain','1.000000',...
		'Hgain','0.000300',...
		'Vmax','2.000000',...
		'Hmax','0.000600',...
		'Window',[26,134,253,283],...
		'position',[580,87,600,113])

add_block('built-in/Scope',[sys,'/','Scope1'])
set_param([sys,'/','Scope1'],...
		'Vgain','10.000000',...
		'Hgain','0.000300',...
		'Vmax','20.000000',...
		'Hmax','0.000600',...
		'Window',[69,317,316,496],...
		'position',[640,252,660,278])

add_block('built-in/Mux',[sys,'/','Mux'])
set_param([sys,'/','Mux'],...
		'inputs','2',...
		'position',[560,246,595,279])
add_line(sys,[510,215;550,215])
add_line(sys,[440,215;470,215])
add_line(sys,[455,215;455,145;555,145])
add_line(sys,[375,215;405,215])
add_line(sys,[290,180;330,180;330,210;345,210])
add_line(sys,[290,250;345,220])
add_line(sys,[80,250;110,250])
add_line(sys,[855,150;900,150])
add_line(sys,[875,170;920,170])
add_line(sys,[895,190;940,190])
add_line(sys,[255,60;300,60])
add_line(sys,[455,145;455,100;575,100])
add_line(sys,[600,265;635,265])
add_line(sys,[535,215;535,255;555,255])
add_line(sys,[95,250;95,305;320,305;320,270;555,270])

drawnow

% Return any arguments.
if (nargin | nargout)
	% Must use feval here to access system in memory
	if (nargin > 3)
		if (flag == 0)
			eval(['[ret,x0,str,ts,xts]=',sys,'(t,x,u,flag);'])
		else
			eval(['ret =', sys,'(t,x,u,flag);'])
		end
	else
		[ret,x0,str,ts,xts] = feval(sys);
	end
else
	drawnow % Flash up the model and execute load callback
end
