% cansetup.m
% this script sets up the Cannon integrator
% with and without circular boundary conditions
%

% set parameters
n=32; % number of units in integrator
ind=1:n; % index for neurons in integrator
var=1.5; % original Cannon variance
gdsc=1; % scale factor for gaussian
tau=0.005; % single neuron time constant
dysc=-1/tau; % scale factor for dynamics
tol=0.000001; % controllability tolerance

% set b, c, and d matrices 
% and the a connection matrix
b=ones(n,1);
evenind=find(rem(ind,2)==0);
b(evenind)=(-1)*ones(1,n/2);
c=eye(n);
d=zeros(n,1);

% make gaussian connectivity profiles, 
% dip usually not taken out
k=ind-n/2-1; % sift index symmetric about zero
gd=exp(((k/var).^2)*(-0.5)); % make gaussian profile
gd=[gd(n/2+1:n) gd(1:n/2)]; % shift gaussian profile
gd=gd*gdsc; % scale gaussian profile

% make Cannon integrator matrices with and without
% circular boundary conditions
a=zeros(n); % zero weight matrix
for i=1:n % for each neuron
   a(i,:)=gd; % set weight matrix
   gd=[gd(n) gd(1:n-1)]; % shift profile
end % end loop for making connectivity matrix
a=a-diag(diag(a))+eye(n); % put 1 on the diagonal of a
% make circular connectivity matrix
acirc=a*dysc; % scale the connectivity matrix
% make bounded connectivity matrix
a=a-tril(a,-n/2)-triu(a,n/2); % remove overlap
abound=a*dysc; % scale the connectivity matrix

% set up systems
sysc=ss(acirc,b,c,d);
sysb=ss(abound,b,c,d);








