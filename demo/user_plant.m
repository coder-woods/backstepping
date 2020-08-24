function [sys,x0,str,ts]=spacemodel(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
%sizes.NumContStates  = 3;
sizes.NumContStates  = 6;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 9;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
%x0=[3;0;0];
x0=[3;0;0;0;0;pi];
str=[];
ts=[0 0];

function sys=mdlDerivatives(t,x,u)   
xe=x(1);ye=x(2);the=x(3);
v=u(1);w=u(2);

%vr=1;wr=1;
vr=1;wr=sin(t);thr=x(6);

sys(1)=ye*w-v+vr*cos(the);
sys(2)=-xe*w+vr*sin(the);
sys(3)=wr-w;

sys(4)=vr*cos(thr);
sys(5)=vr*sin(thr);
sys(6)=sin(t);

function sys=mdlOutputs(t,x,u)
xe=x(1);ye=x(2);the=x(3);

%vr=1.0;wr=1.0;r=vr/wr;
vr=1;wr=sin(t);

%xr=r*cos(t);
%yr=r*sin(t);
%thr=wr*t;
xr=x(4);
yr=x(5);
thr=x(6);

th=thr-the;
M1=[cos(th) sin(th);-sin(th) cos(th)];
M2=[xr;yr]-M1\[xe;ye];
xp=M2(1);
yp=M2(2);

sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
sys(4)=th;
sys(5)=thr;
sys(6)=xp;
sys(7)=yp;
sys(8)=xr;
sys(9)=yr;
