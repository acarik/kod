%%% Finite Differences Theta Scheme for Parabolic Equation

T=8; %% final time
xmin=-3; xmax=11; %% spatial interval
L=xmax-xmin;

Nx=400; %% number of spatial discretization intervals
h=L/Nx;
x=xmin:h:xmax;

a=1;  %% value of speed
nu=0.9; 

dT=nu*h/a
Nt=floor(T/dT);

u=zeros(Nx+1,1); %% initialization 

%u(abs(x)<1)=1;   %% Initial condition N1

u(abs(x-1)<=1)=1;  %% initial condition N2
u(abs(x+1)<1)=.5; %% initial condition N2

figure(1); plot(x,u); axis([xmin xmax -.25 1.25]); drawnow;
pause(1)

%%%% Construction of matrices A and B

A=(1-(nu)^2)*eye(Nx-1)...
    -1/2*nu*(1-nu)*[zeros(Nx-1,1) eye(Nx-1,Nx-2)]...
    +1/2*nu*(1+nu)*[zeros(1,Nx-1) ; eye(Nx-2,Nx-1)];

for i=1:Nt
    u(2:Nx)=(A*u(2:Nx));
    figure(1); plot(x,u); axis([xmin xmax -.25 1.25]); drawnow;
end;

