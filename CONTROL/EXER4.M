function [ret,x0,str,ts,xts]=exer4(t,x,u,flag);
%EXER4	is the M-file description of the SIMULINK system named EXER4.
%	The block-diagram can be displayed by typing: EXER4.
%
%	SYS=EXER4(T,X,U,FLAG) returns depending on FLAG certain
%	system values given time point, T, current state vector, X,
%	and input vector, U.
%	FLAG is used to indicate the type of output to be returned in SYS.
%
%	Setting FLAG=1 causes EXER4 to return state derivatives, FLAG=2
%	discrete states, FLAG=3 system outputs and FLAG=4 next sample
%	time. For more information and other options see SFUNC.
%
%	Calling EXER4 with a FLAG of zero:
%	[SIZES]=EXER4([],[],[],0),  returns a vector, SIZES, which
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
     set_param(sys,'Location',[100,100,638,400])
     open_system(sys)
end;
set_param(sys,'algorithm',     'Linear')
set_param(sys,'Start time',    '0.0')
set_param(sys,'Stop time',     '0.5')
set_param(sys,'Min step size', '0.001')
set_param(sys,'Max step size', '0.001')
set_param(sys,'Relative error','1e-3')
set_param(sys,'Return vars',   '')

add_block('built-in/Step Fcn',[sys,'/','Step Input'])
set_param([sys,'/','Step Input'],...
		'Time','0.25',...
		'After','0',...
		'position',[255,40,275,60])

add_block('built-in/Sum',[sys,'/','Sum2'])
set_param([sys,'/','Sum2'],...
		'inputs','+-',...
		'position',[220,110,240,130])

add_block('built-in/Gain',[sys,'/','Gain1'])
set_param([sys,'/','Gain1'],...
		'Gain','10',...
		'position',[270,103,310,137])

add_block('built-in/Transfer Fcn',[sys,'/','Transfer Fcn'])
set_param([sys,'/','Transfer Fcn'],...
		'Denominator','[1 1]',...
		'position',[340,102,375,138])

add_block('built-in/Transfer Fcn',[sys,'/','Transfer Fcn1'])
set_param([sys,'/','Transfer Fcn1'],...
		'Numerator','[0.4]',...
		'Denominator','[1 1]',...
		'position',[335,32,370,68])

add_block('built-in/Sum',[sys,'/','Sum1'])
set_param([sys,'/','Sum1'],...
		'position',[410,105,430,125])

add_block('built-in/Scope',[sys,'/','Scope'])
set_param([sys,'/','Scope'],...
		'Vgain','2.000000',...
		'Hgain','0.500000',...
		'Vmax','4.000000',...
		'Hmax','1.000000',...
		'Window',[436,245,767,559])
open_system([sys,'/','Scope'])
set_param([sys,'/','Scope'],...
		'position',[455,100,485,130])

add_block('built-in/Sum',[sys,'/','Sum'])
set_param([sys,'/','Sum'],...
		'inputs','+-',...
		'position',[75,105,95,125])

add_block('built-in/Step Fcn',[sys,'/','r(t)'])
set_param([sys,'/','r(t)'],...
		'Time','0.0001',...
		'position',[20,100,40,120])

add_block('built-in/Gain',[sys,'/',['Slider',13,'Gain']])
set_param([sys,'/',['Slider',13,'Gain']],...
		'Gain','2.7',...
		'Mask Display','2.7',...
		'Mask Dialogue','eval(''slideg(0,2.7,10,0)'');',...
		'position',[130,101,180,129])

add_block('built-in/Derivative',[sys,'/','Derivative'])
set_param([sys,'/','Derivative'],...
		'orientation',2,...
		'position',[240,175,270,195])
add_line(sys,[45,110;70,110])
add_line(sys,[100,115;125,115])
add_line(sys,[245,120;265,120])
add_line(sys,[315,120;335,120])
add_line(sys,[280,50;330,50])
add_line(sys,[380,120;405,120])
add_line(sys,[375,50;385,50;385,105;405,110])
add_line(sys,[435,115;450,115])
add_line(sys,[435,115;435,220;60,220;70,120])
add_line(sys,[435,185;350,185;275,185])
add_line(sys,[185,115;215,115])
add_line(sys,[235,185;195,185;195,125;215,125])

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
