function [ret,x0,str,ts,xts]=e9_salam(t,x,u,flag);
%E9_SALAM	is the M-file description of the SIMULINK system named E9_SALAM.
%	The block-diagram can be displayed by typing: E9_SALAM.
%
%	SYS=E9_SALAM(T,X,U,FLAG) returns depending on FLAG certain
%	system values given time point, T, current state vector, X,
%	and input vector, U.
%	FLAG is used to indicate the type of output to be returned in SYS.
%
%	Setting FLAG=1 causes E9_SALAM to return state derivatives, FLAG=2
%	discrete states, FLAG=3 system outputs and FLAG=4 next sample
%	time. For more information and other options see SFUNC.
%
%	Calling E9_SALAM with a FLAG of zero:
%	[SIZES]=E9_SALAM([],[],[],0),  returns a vector, SIZES, which
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
     set_param(sys,'Location',[235,151,770,451])
     open_system(sys)
end;
set_param(sys,'algorithm',     'RK-45')
set_param(sys,'Start time',    '0.0')
set_param(sys,'Stop time',     '10')
set_param(sys,'Min step size', '0.0001')
set_param(sys,'Max step size', '10')
set_param(sys,'Relative error','1e-3')
set_param(sys,'Return vars',   '')

add_block('built-in/Clock',[sys,'/','Clock'])
set_param([sys,'/','Clock'],...
		'position',[250,245,270,265])

add_block('built-in/To Workspace',[sys,'/','To Workspace2'])
set_param([sys,'/','To Workspace2'],...
		'mat-name','t',...
		'position',[325,247,375,263])

add_block('built-in/To Workspace',[sys,'/','To Workspace'])
set_param([sys,'/','To Workspace'],...
		'mat-name','In',...
		'position',[200,32,250,48])

add_block('built-in/To Workspace',[sys,'/','To Workspace1'])
set_param([sys,'/','To Workspace1'],...
		'mat-name','Out',...
		'position',[355,107,405,123])

add_block('built-in/Gain',[sys,'/','Kd'])
set_param([sys,'/','Kd'],...
		'orientation',2,...
		'position',[175,185,205,215])

add_block('built-in/Derivative',[sys,'/','Derivative'])
set_param([sys,'/','Derivative'],...
		'orientation',2,...
		'position',[245,190,275,210])

add_block('built-in/Gain',[sys,'/','Kp'])
set_param([sys,'/','Kp'],...
		'Gain','2',...
		'position',[200,102,225,128])

add_block('built-in/Sum',[sys,'/','Sum'])
set_param([sys,'/','Sum'],...
		'inputs','+--',...
		'position',[145,107,165,143])

add_block('built-in/Transfer Fcn',[sys,'/','G(s)'])
set_param([sys,'/','G(s)'],...
		'Denominator','[1 1 0]',...
		'position',[240,96,295,134])


%     Subsystem  ['Repeating',13,'Sequence'].

new_system([sys,'/',['Repeating',13,'Sequence']])
set_param([sys,'/',['Repeating',13,'Sequence']],'Location',[5,40,315,196])

add_block('built-in/Outport',[sys,'/',['Repeating',13,'Sequence/out_1']])
set_param([sys,'/',['Repeating',13,'Sequence/out_1']],...
		'position',[285,60,305,80])

add_block('built-in/Look Up Table',[sys,'/',['Repeating',13,'Sequence/Look-Up Table']])
set_param([sys,'/',['Repeating',13,'Sequence/Look-Up Table']],...
		'Input_Values','t',...
		'Output_Values','y',...
		'position',[210,58,250,82])

add_block('built-in/Fcn',[sys,'/',['Repeating',13,'Sequence/Fcn1']])
set_param([sys,'/',['Repeating',13,'Sequence/Fcn1']],...
		'Expr','rem(u[1],period)',...
		'position',[110,60,150,80])

add_block('built-in/Clock',[sys,'/',['Repeating',13,'Sequence/Clock']])
set_param([sys,'/',['Repeating',13,'Sequence/Clock']],...
		'position',[45,60,65,80])
add_line([sys,'/',['Repeating',13,'Sequence']],[255,70;280,70])
add_line([sys,'/',['Repeating',13,'Sequence']],[70,70;105,70])
add_line([sys,'/',['Repeating',13,'Sequence']],[155,70;205,70])
set_param([sys,'/',['Repeating',13,'Sequence']],...
		'Mask Display','plot([t,t+period,t+2*period],[y,y,y])',...
		'Mask Type','Repeating table')
set_param([sys,'/',['Repeating',13,'Sequence']],...
		'Mask Dialogue','Repeating table.\nEnter values of time and output for first cycle.|Time values:|Output values:',...
		'Mask Translate','period = max(@1); t = @1; y = @2;')
set_param([sys,'/',['Repeating',13,'Sequence']],...
		'Mask Help','Repeats cycle given in table. Time values should be monotonically increasing.',...
		'Mask Entries','[0 10]\/[0 10]\/')


%     Finished composite block ['Repeating',13,'Sequence'].

set_param([sys,'/',['Repeating',13,'Sequence']],...
		'position',[25,62,60,98])
add_line(sys,[230,115;235,115])
add_line(sys,[65,80;140,115])
add_line(sys,[170,125;195,115])
add_line(sys,[300,115;350,115])
add_line(sys,[300,115;300,165;130,165;140,135])
add_line(sys,[300,115;300,200;280,200])
add_line(sys,[240,200;210,200])
add_line(sys,[170,200;110,200;110,125;140,125])
add_line(sys,[65,80;145,80;145,40;195,40])
add_line(sys,[275,255;320,255])

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
