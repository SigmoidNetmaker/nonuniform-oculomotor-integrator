
% caneigimp.m
% this script does eigenvalue decomposition and 
% computes impulse response for Cannon Integrator 
% with and without circular boundary conditions
%

% for circular network
[xc,lc]=eig(acirc);
jbc=inv(xc)*b;
indcc=find(abs(jbc)>tol);
[numcc,dum]=size(indcc);
eigacirc=diag(lc);
modcc=eigacirc(indcc);
tcirc=-1./eigacirc;
tcc=tcirc(indcc);

% for bounded network
[xb,lb]=eig(abound);
jbb=inv(xb)*b;
indcb=find(abs(jbb)>tol);
[numcb,dum]=size(indcb);
eigabound=diag(lb);
modcb=eigabound(indcb);
tbound=-1./eigabound;
tbc=tbound(indcb);

% find impulse responses
[yc,tc]=impulse(sysc);
[yb,tb]=impulse(sysb);

% just plot the eignevalues
figure(1)
clf
subplot(221)
stack=(n+4)*ones(1,numcc);
semilogy(ind,tcirc,'kx',stack,tcc,'k+','linewidth',1.5)
axis([0 39 0.0005 100])
set(gca,'xtick',[10 20 30])
set(gca,'xticklabel','10|20|30')
set(gca,'ytick',[0.001 0.01 0.1 1 10 100])
set(gca,'yticklabel','0.001|0.01|0.1|1|10|100')
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
xlabel('mode index')
ylabel('x=tc(s), +=cont')
figure(2)
clf
subplot(221) % subplot(222)
stack=(n+4)*ones(1,numcb);
semilogy(ind,tbound,'kx',stack,tbc,'k+','linewidth',1.5)
axis([0 39 0.0005 100])
set(gca,'xtick',[10 20 30])
set(gca,'xticklabel','10|20|30')
set(gca,'ytick',[0.001 0.01 0.1 1 10 100])
set(gca,'yticklabel','0.001|0.01|0.1|1|10|100')
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
xlabel('mode index')
ylabel('x=tc(s), +=cont')

return

% plot values and curves
figure(1)
clf
subplot(221)
stack=(n+4)*ones(1,numcc);
semilogy(ind,tcirc,'kx',stack,tcc,'k+','linewidth',1.5)
axis([0 39 0.0005 100])
set(gca,'xtick',[10 20 30])
set(gca,'xticklabel','10|20|30')
set(gca,'ytick',[0.001 0.01 0.1 1 10 100])
set(gca,'yticklabel','0.001|0.01|0.1|1|10|100')
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
xlabel('mode index')
ylabel('x=tc(s), +=cont')
text(1,40,'A',...
   'fontweight','bold','fontsize',14)
% text(21,0.005,'closed','fontsize',12,...
%     'fontweight','bold')
figure(2)
clf
subplot(221) % subplot(222)
stack=(n+4)*ones(1,numcb);
semilogy(ind,tbound,'kx',stack,tbc,'k+','linewidth',1.5)
axis([0 39 0.0005 100])
set(gca,'xtick',[10 20 30])
set(gca,'xticklabel','10|20|30')
set(gca,'ytick',[0.001 0.01 0.1 1 10 100])
set(gca,'yticklabel','0.001|0.01|0.1|1|10|100')
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
xlabel('mode index')
ylabel('x=tc(s), +=cont')
% text(1,40,'B',...
%    'fontweight','bold','fontsize',14)
text(1,40,'A',...
   'fontweight','bold','fontsize',14)
% text(22,0.005,'open','fontsize',12,...
%     'fontweight','bold')
figure(1)
subplot(223)
plot(tc,yc,'k','linewidth',1.5)
axis([0 200 -1.2 1.2])
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
ylabel('output amplitude')
xlabel('time (s)')
% text(7,1.03,'C',...
%    'fontweight','bold','fontsize',14)
text(7,1.03,'B',...
   'fontweight','bold','fontsize',14)
% text(110,0.7,'closed','fontsize',12,...
%     'fontweight','bold')
figure(2)
subplot(223) % subplot(224)
plot(tb,yb,'k','linewidth',1.5)
axis([0 200 -1.2 1.2])
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
ylabel('output amplitude')
xlabel('time (s)')
% text(7,1.03,'D',...
%    'fontweight','bold','fontsize',14)
text(7,1.03,'B',...
   'fontweight','bold','fontsize',14)
% text(112,0.7,'open','fontsize',12,...
%     'fontweight','bold')



