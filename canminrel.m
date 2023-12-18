% canminrel.m
% this script finds a "minimal" transfer function
% starting from the Cannon integrator
% with and without circular boundary conditions
% (results are somewhat disappointing)
%

% set parameters
n=32; % number of units in integrator
ind=1:n; % index for neurons in integrator
var=1.5; % original Cannon variance
dip=0; % size of the dip
gdsc=0.5; % scale factor for gaussian
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
gd(1)=gd(1)-dip; % make a dip in the profile peak
gd=gd*gdsc; % scale gaussian profile

% make Cannon integrator matrices with and without
% circular boundary conditions
a=zeros(n); % zero weight matrix
for i=1:n % for each neuron
   a(i,:)=gd; % set weight matrix
   gd=[gd(n) gd(1:n-1)]; % shift profile
end % end loop for making connectivity matrix
% make circular connectivity matrix
acirc=a*dysc; % scale the connectivity matrix
% make bounded connectivity matrix
a=a-tril(a,-20)-triu(a,20); % remove overlap
abound=a*dysc; % scale the connectivity matrix

% find minimum realization transfer functions
% for the Cannon integrator with and without
% circular boundary conditions
tol=1e-10;
% with circular boundary conditions
a=acirc;
[z,p,k]=ss2zp(a,b,c,d);
[nz,mz]=size(z);  
[np,mp]=size(p);  
zm=zeros(nz,mz);
pm=zeros(np,mz);
numm=zeros(mz,np+1);
denm=zeros(mz,np+1);
for i=1:mz;
   [zh,ph]=minreal(z(:,i),p,tol);
   [nzh,mzh]=size(zh);
   [nph,mph]=size(ph);
   zm(:,i)=[zh' ones(1,nz-nzh)*Inf]';
   pm(:,i)=[ph' ones(1,np-nph)*Inf]';
   [numh,denh]=zp2tf(zm(:,i),pm(:,i),k(i));
   [nnumh,mnumh]=size(numh);
   [ndenh,mdenh]=size(denh);
   numm(i,:)=[zeros(1,np+1-mnumh) numh];
   denm(i,:)=[zeros(1,np+1-mdenh) denh];
end;
numc=numm;
denc=denm;
% without circular boundary conditions
a=abound;
[z,p,k]=ss2zp(a,b,c,d);
[nz,mz]=size(z);  
[np,mp]=size(p);  
zm=zeros(nz,mz);
pm=zeros(np,mz);
numm=zeros(mz,np+1);
denm=zeros(mz,np+1);
for i=1:mz;
   [zh,ph]=minreal(z(:,i),p,tol);
   [nzh,mzh]=size(zh);
   [nph,mph]=size(ph);
   zm(:,i)=[zh' ones(1,nz-nzh)*Inf]';
   pm(:,i)=[ph' ones(1,np-nph)*Inf]';
   [numh,denh]=zp2tf(zm(:,i),pm(:,i),k(i));
   [nnumh,mnumh]=size(numh);
   [ndenh,mdenh]=size(denh);
   numm(i,:)=[zeros(1,np+1-mnumh) numh];
   denm(i,:)=[zeros(1,np+1-mdenh) denh];
end;
numb=numm;
denb=denm;





