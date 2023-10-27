function [ret,x0,str,ts,xts]=ap2(t,x,u,flag);
%AP2	is the M-file description of the SIMULINK system named AP2.
%	The block-diagram can be displayed by typing: AP2.
%
%	SYS=AP2(T,X,U,FLAG) returns depending on FLAG certain
%	system values given time point, T, current state vector, X,
%	and input vector, U.
%	FLAG is used to indicate the type of output to be returned in SYS.
%
%	Setting FLAG=1 causes AP2 to return state derivatives, FLAG=2
%	discrete states, FLAG=3 system outputs and FLAG=4 next sample
%	time. For more information and other options see SFUNC.
%
%	Calling AP2 with a FLAG of zero:
%	[SIZES]=AP2([],[],[],0),  returns a vector, SIZES, which
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
     set_param(sys,'Location',[10,89,611,358])
     open_system(sys)
end;
set_param(sys,'algorithm',     'Linear')
set_param(sys,'Start time',    '0')
set_param(sys,'Stop time',     '0.5')
set_param(sys,'Min step size', '0.0001')
set_param(sys,'Max step size', '0.001')
set_param(sys,'Relative error','1e-3')
set_param(sys,'Return vars',   'w,i,theta')

add_block('built-in/Sum',[sys,'/','Sum'])
set_param([sys,'/','Sum'],...
		'inputs','+-',...
		'position',[65,120,90,140])

add_block('built-in/Constant',[sys,'/','Constant'])
set_param([sys,'/','Constant'],...
		'Value','30',...
		'position',[15,115,35,135])

add_block('built-in/To Workspace',[sys,'/','posició'])
set_param([sys,'/','posició'],...
		'mat-name','theta',...
		'position',[545,117,595,133])

add_block('built-in/Integrator',[sys,'/','Integrator'])
set_param([sys,'/','Integrator'],...
		'position',[495,115,515,135])

add_block('built-in/Transfer Fcn',[sys,'/','Transfer Fcn'])
set_param([sys,'/','Transfer Fcn'],...
		'Denominator','[5.5e-5 6e-6]',...
		'position',[390,104,470,146])

add_block('built-in/To Workspace',[sys,'/','veloc. angular'])
set_param([sys,'/','veloc. angular'],...
		'mat-name','w',...
		'position',[520,62,570,78])

add_block('built-in/Gain',[sys,'/',['Ke',13,'']])
set_param([sys,'/',['Ke',13,'']],...
		'orientation',2,...
		'Gain','0.105',...
		'position',[280,221,330,249])

add_block('built-in/Sum',[sys,'/','Sum1'])
set_param([sys,'/','Sum1'],...
		'inputs','-+',...
		'position',[345,115,365,135])

add_block('built-in/Gain',[sys,'/','Kt'])
set_param([sys,'/','Kt'],...
		'Gain','0.105',...
		'position',[270,116,320,144])

add_block('built-in/Transfer Fcn',[sys,'/','armadura'])
set_param([sys,'/','armadura'],...
		'Denominator',' [5.2e-3 2]',...
		'position',[105,110,175,150])

add_block('built-in/To Workspace',[sys,'/','intensitat'])
set_param([sys,'/','intensitat'],...
		'mat-name','i',...
		'position',[255,182,305,198])

add_block('built-in/To Workspace',[sys,'/','temps'])
set_param([sys,'/','temps'],...
		'mat-name','t',...
		'position',[340,12,390,28])

add_block('built-in/Step Fcn',[sys,'/','Step Input'])
set_param([sys,'/','Step Input'],...
		'orientation',2,...
		'Time','0.1',...
		'After','0.1',...
		'position',[350,65,370,85])

add_block('built-in/Clock',[sys,'/','Clock'])
set_param([sys,'/','Clock'],...
		'position',[155,10,175,30])

add_block('built-in/Saturation',[sys,'/',['Saturation',13,'+-3 A']])
set_param([sys,'/',['Saturation',13,'+-3 A']],...
		'Lower Limit','-3',...
		'Upper Limit','3',...
		'position',[200,118,230,142])
add_line(sys,[95,130;100,130])
add_line(sys,[40,125;60,125])
add_line(sys,[325,130;340,130])
add_line(sys,[475,125;490,125])
add_line(sys,[520,125;540,125])
add_line(sys,[370,125;385,125])
add_line(sys,[275,235;50,235;60,135])
add_line(sys,[345,75;330,75;340,120])
add_line(sys,[180,20;335,20])
add_line(sys,[235,130;265,130])
add_line(sys,[180,130;195,130])
add_line(sys,[235,130;235,190;250,190])
add_line(sys,[475,125;475,70;515,70])
add_line(sys,[475,125;475,235;335,235])

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
