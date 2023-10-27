function [ret,x0,str,ts,xts]=ap3(t,x,u,flag);
%AP3	is the M-file description of the SIMULINK system named AP3.
%	The block-diagram can be displayed by typing: AP3.
%
%	SYS=AP3(T,X,U,FLAG) returns depending on FLAG certain
%	system values given time point, T, current state vector, X,
%	and input vector, U.
%	FLAG is used to indicate the type of output to be returned in SYS.
%
%	Setting FLAG=1 causes AP3 to return state derivatives, FLAG=2
%	discrete states, FLAG=3 system outputs and FLAG=4 next sample
%	time. For more information and other options see SFUNC.
%
%	Calling AP3 with a FLAG of zero:
%	[SIZES]=AP3([],[],[],0),  returns a vector, SIZES, which
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
     set_param(sys,'Location',[45,54,595,323])
     open_system(sys)
end;
set_param(sys,'algorithm',     'Linear')
set_param(sys,'Start time',    '0.0')
set_param(sys,'Stop time',     '0.2')
set_param(sys,'Min step size', '0.0001')
set_param(sys,'Max step size', '0.001')
set_param(sys,'Relative error','1e-3')
set_param(sys,'Return vars',   '')

add_block('built-in/To Workspace',[sys,'/','temps'])
set_param([sys,'/','temps'],...
		'mat-name','t',...
		'position',[305,27,355,43])

add_block('built-in/Constant',[sys,'/','Constant'])
set_param([sys,'/','Constant'],...
		'Value','2',...
		'position',[15,105,35,125])

add_block('built-in/To Workspace',[sys,'/','error'])
set_param([sys,'/','error'],...
		'mat-name','e',...
		'position',[130,167,180,183])

add_block('built-in/Sum',[sys,'/','Sum'])
set_param([sys,'/','Sum'],...
		'inputs','+-',...
		'position',[80,110,100,130])

add_block('built-in/Gain',[sys,'/','Gain'])
set_param([sys,'/','Gain'],...
		'Gain','9.5*k1',...
		'position',[130,106,190,134])

add_block('built-in/Gain',[sys,'/','Gain1'])
set_param([sys,'/','Gain1'],...
		'orientation',2,...
		'Gain','0.1*k2',...
		'position',[285,181,340,209])

add_block('built-in/To Workspace',[sys,'/','veloc.angular'])
set_param([sys,'/','veloc.angular'],...
		'mat-name','w',...
		'position',[420,72,470,88])

add_block('built-in/To Workspace',[sys,'/','posició'])
set_param([sys,'/','posició'],...
		'mat-name','theta',...
		'position',[455,117,505,133])

add_block('built-in/Integrator',[sys,'/',['integrador',13,'']])
set_param([sys,'/',['integrador',13,'']],...
		'position',[415,115,435,135])

add_block('built-in/Sum',[sys,'/','Sum1'])
set_param([sys,'/','Sum1'],...
		'inputs','+-',...
		'position',[240,115,260,135])

add_block('built-in/Saturation',[sys,'/',['+-60 V',13,'']])
set_param([sys,'/',['+-60 V',13,'']],...
		'Lower Limit','-60',...
		'Upper Limit','60',...
		'position',[290,113,320,137])


%     Subsystem  'motor'.

new_system([sys,'/','motor'])
set_param([sys,'/','motor'],'Location',[10,42,525,402])
open_system([sys,'/','motor'])

add_block('built-in/Saturation',[sys,'/',['motor/Saturation',13,'+-3 A']])
set_param([sys,'/',['motor/Saturation',13,'+-3 A']],...
		'Lower Limit','-3',...
		'Upper Limit','3',...
		'position',[200,143,230,167])

add_block('built-in/To Workspace',[sys,'/','motor/intensitat'])
set_param([sys,'/','motor/intensitat'],...
		'mat-name','i',...
		'position',[255,207,305,223])

add_block('built-in/Transfer Fcn',[sys,'/','motor/armadura'])
set_param([sys,'/','motor/armadura'],...
		'Denominator',' [5.2e-3 2]',...
		'position',[105,135,175,175])

add_block('built-in/Gain',[sys,'/',['motor/Ke',13,'']])
set_param([sys,'/',['motor/Ke',13,'']],...
		'orientation',2,...
		'Gain','0.105',...
		'position',[280,246,330,274])

add_block('built-in/Sum',[sys,'/','motor/Sum'])
set_param([sys,'/','motor/Sum'],...
		'inputs','+-',...
		'position',[65,145,90,165])

add_block('built-in/Inport',[sys,'/','motor/in_1'])
set_param([sys,'/','motor/in_1'],...
		'position',[15,140,35,160])

add_block('built-in/Gain',[sys,'/','motor/Kt'])
set_param([sys,'/','motor/Kt'],...
		'Gain','0.105',...
		'position',[270,141,320,169])

add_block('built-in/Transfer Fcn',[sys,'/','motor/Transfer Fcn'])
set_param([sys,'/','motor/Transfer Fcn'],...
		'Denominator','[5.5e-5 6e-6]',...
		'position',[390,134,470,176])

add_block('built-in/Outport',[sys,'/','motor/out_1'])
set_param([sys,'/','motor/out_1'],...
		'position',[500,145,520,165])
add_line([sys,'/','motor'],[475,155;475,260;335,260])
add_line([sys,'/','motor'],[235,155;235,215;250,215])
add_line([sys,'/','motor'],[180,155;195,155])
add_line([sys,'/','motor'],[235,155;265,155])
add_line([sys,'/','motor'],[275,260;50,260;60,160])
add_line([sys,'/','motor'],[95,155;100,155])
add_line([sys,'/','motor'],[475,155;495,155])
add_line([sys,'/','motor'],[40,150;60,150])
add_line([sys,'/','motor'],[325,155;385,155])


%     Finished composite block 'motor'.

set_param([sys,'/','motor'],...
		'position',[350,100,380,150])

add_block('built-in/Clock',[sys,'/','Clock'])
set_param([sys,'/','Clock'],...
		'position',[185,25,205,45])
add_line(sys,[440,125;450,125])
add_line(sys,[385,125;410,125])
add_line(sys,[325,125;345,125])
add_line(sys,[265,125;285,125])
add_line(sys,[280,195;220,195;220,130;235,130])
add_line(sys,[385,125;385,80;415,80])
add_line(sys,[385,125;385,195;345,195])
add_line(sys,[195,120;235,120])
add_line(sys,[105,120;125,120])
add_line(sys,[105,120;105,175;125,175])
add_line(sys,[40,115;75,115])
add_line(sys,[440,125;440,240;65,240;75,125])
add_line(sys,[210,35;300,35])

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
