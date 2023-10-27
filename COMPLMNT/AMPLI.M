function [ret,x0,str,ts,xts]=ampli(t,x,u,flag);
%AMPLI	is the M-file description of the SIMULINK system named AMPLI.
%	The block-diagram can be displayed by typing: AMPLI.
%
%	SYS=AMPLI(T,X,U,FLAG) returns depending on FLAG certain
%	system values given time point, T, current state vector, X,
%	and input vector, U.
%	FLAG is used to indicate the type of output to be returned in SYS.
%
%	Setting FLAG=1 causes AMPLI to return state derivatives, FLAG=2
%	discrete states, FLAG=3 system outputs and FLAG=4 next sample
%	time. For more information and other options see SFUNC.
%
%	Calling AMPLI with a FLAG of zero:
%	[SIZES]=AMPLI([],[],[],0),  returns a vector, SIZES, which
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
     set_param(sys,'Location',[24,61,714,425])
     open_system(sys)
end;
set_param(sys,'algorithm',     'Linear')
set_param(sys,'Start time',    '0.0')
set_param(sys,'Stop time',     '0.5e-3')
set_param(sys,'Min step size', '0.000001')
set_param(sys,'Max step size', '0.000001')
set_param(sys,'Relative error','1e-3')
set_param(sys,'Return vars',   '')

add_block('built-in/Product',[sys,'/','Product'])
set_param([sys,'/','Product'],...
		'position',[280,30,305,50])

add_block('built-in/Note',[sys,'/','D*Vg'])
set_param([sys,'/','D*Vg'],...
		'position',[325,10,340,20])

add_block('built-in/Sum',[sys,'/','Sum'])
set_param([sys,'/','Sum'],...
		'inputs','+--',...
		'position',[380,67,400,103])

add_block('built-in/Product',[sys,'/','Product1'])
set_param([sys,'/','Product1'],...
		'position',[280,75,305,95])

add_block('built-in/Gain',[sys,'/','1//L'])
set_param([sys,'/','1//L'],...
		'Gain','6666.6',...
		'position',[445,60,530,110])

add_block('built-in/Integrator',[sys,'/','Integrator'])
set_param([sys,'/','Integrator'],...
		'position',[565,75,585,95])

add_block('built-in/To Workspace',[sys,'/','To Workspace'])
set_param([sys,'/','To Workspace'],...
		'mat-name','i1',...
		'position',[710,77,760,93])

add_block('built-in/Gain',[sys,'/','1//RC'])
set_param([sys,'/','1//RC'],...
		'Gain','56818',...
		'position',[445,160,530,210])

add_block('built-in/Integrator',[sys,'/','Integrator1'])
set_param([sys,'/','Integrator1'],...
		'position',[565,175,585,195])

add_block('built-in/Sum',[sys,'/','Sum1'])
set_param([sys,'/','Sum1'],...
		'inputs','-++',...
		'position',[380,167,400,203])

add_block('built-in/Product',[sys,'/','Product2'])
set_param([sys,'/','Product2'],...
		'position',[280,175,305,195])

add_block('built-in/Product',[sys,'/','Product3'])
set_param([sys,'/','Product3'],...
		'position',[340,255,365,275])

add_block('built-in/Gain',[sys,'/','1//L2'])
set_param([sys,'/','1//L2'],...
		'Gain','6666.6',...
		'position',[505,260,590,310])

add_block('built-in/Integrator',[sys,'/','Integrator2'])
set_param([sys,'/','Integrator2'],...
		'position',[625,275,645,295])

add_block('built-in/Sum',[sys,'/','Sum2'])
set_param([sys,'/','Sum2'],...
		'inputs','+--',...
		'position',[440,267,460,303])

add_block('built-in/Sum',[sys,'/','Sum4'])
set_param([sys,'/','Sum4'],...
		'inputs','-+',...
		'position',[250,270,270,290])

add_block('built-in/Product',[sys,'/','Product4'])
set_param([sys,'/','Product4'],...
		'position',[320,315,345,335])

add_block('built-in/Product',[sys,'/','Product5'])
set_param([sys,'/','Product5'],...
		'position',[310,410,335,430])

add_block('built-in/Gain',[sys,'/','1//RC2'])
set_param([sys,'/','1//RC2'],...
		'Gain','56818',...
		'position',[510,410,595,460])

add_block('built-in/Integrator',[sys,'/','Integrator3'])
set_param([sys,'/','Integrator3'],...
		'position',[630,425,650,445])

add_block('built-in/Sum',[sys,'/','Sum3'])
set_param([sys,'/','Sum3'],...
		'inputs','-++',...
		'position',[445,417,465,453])

add_block('built-in/To Workspace',[sys,'/','To Workspace2'])
set_param([sys,'/','To Workspace2'],...
		'mat-name','i2',...
		'position',[725,277,775,293])

add_block('built-in/To Workspace',[sys,'/','To Workspace1'])
set_param([sys,'/','To Workspace1'],...
		'mat-name','v1',...
		'position',[725,177,775,193])

add_block('built-in/To Workspace',[sys,'/','To Workspace3'])
set_param([sys,'/','To Workspace3'],...
		'mat-name','v2',...
		'position',[730,427,780,443])

add_block('built-in/Sum',[sys,'/','Sum5'])
set_param([sys,'/','Sum5'],...
		'inputs','+-',...
		'position',[860,365,880,385])

add_block('built-in/To Workspace',[sys,'/','To Workspace4'])
set_param([sys,'/','To Workspace4'],...
		'mat-name','Vo',...
		'position',[910,367,960,383])

add_block('built-in/To Workspace',[sys,'/','To Workspace5'])
set_param([sys,'/','To Workspace5'],...
		'mat-name','t',...
		'position',[885,122,935,138])

add_block('built-in/Clock',[sys,'/','Clock'])
set_param([sys,'/','Clock'],...
		'position',[810,119,830,141])

add_block('built-in/Constant',[sys,'/','R'])
set_param([sys,'/','R'],...
		'Value','8',...
		'position',[80,415,100,435])

add_block('built-in/Constant',[sys,'/','RL'])
set_param([sys,'/','RL'],...
		'Value','0.1',...
		'position',[80,235,100,255])

add_block('built-in/Constant',[sys,'/','Cte'])
set_param([sys,'/','Cte'],...
		'position',[80,275,100,295])

add_block('built-in/Constant',[sys,'/','D'])
set_param([sys,'/','D'],...
		'Value','0.5',...
		'position',[40,192,100,218])

add_block('built-in/Constant',[sys,'/','Vg'])
set_param([sys,'/','Vg'],...
		'Value','15',...
		'position',[80,150,100,170])
add_line(sys,[105,160;140,160;140,35;275,35])
add_line(sys,[105,205;160,205;160,45;275,45])
add_line(sys,[310,40;345,40;345,75;375,75])
add_line(sys,[105,245;180,245;180,80;275,80])
add_line(sys,[310,85;375,85])
add_line(sys,[405,85;440,85])
add_line(sys,[535,85;560,85])
add_line(sys,[590,85;705,85])
add_line(sys,[625,85;625,130;235,130;235,180;275,180])
add_line(sys,[235,130;235,90;275,90])
add_line(sys,[405,185;440,185])
add_line(sys,[535,185;560,185])
add_line(sys,[590,185;720,185])
add_line(sys,[625,185;625,145;345,145;345,175;375,175])
add_line(sys,[345,145;345,95;375,95])
add_line(sys,[310,185;375,185])
add_line(sys,[465,285;500,285])
add_line(sys,[595,285;620,285])
add_line(sys,[650,285;720,285])
add_line(sys,[470,435;505,435])
add_line(sys,[600,435;625,435])
add_line(sys,[655,435;725,435])
add_line(sys,[140,160;140,260;335,260])
add_line(sys,[160,205;160,275;245,275])
add_line(sys,[105,285;245,285])
add_line(sys,[275,280;305,280;305,270;335,270])
add_line(sys,[370,265;395,265;395,275;435,275])
add_line(sys,[180,245;180,320;315,320])
add_line(sys,[350,325;395,325;395,285;435,285])
add_line(sys,[685,285;685,360;295,360;305,415])
add_line(sys,[105,425;305,425])
add_line(sys,[210,425;210,190;275,190])
add_line(sys,[295,360;295,330;315,330])
add_line(sys,[340,420;370,420;370,435;440,435])
add_line(sys,[685,435;685,380;410,380;410,295;435,295])
add_line(sys,[410,380;410,425;440,425])
add_line(sys,[410,295;410,230;345,230;345,195;375,195])
add_line(sys,[625,185;625,230;815,230;815,485;410,485;410,445;440,445])
add_line(sys,[885,375;905,375])
add_line(sys,[815,370;855,370])
add_line(sys,[685,380;855,380])
add_line(sys,[835,130;880,130])

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
