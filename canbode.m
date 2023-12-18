% canbode.m
% this script makes Bode plots for the Cannon Integrator 
% with circular and open boundry conditions
%

% set frequency vectors
whz=logspace(-2,1,50);
wr=whz*2*pi;

% set phase corrections
phcor=zeros(n,50);
evenind=find(rem(ind,2)==0);
phcor(evenind,:)=-180*ones(n/2,50);

% compute circular frequency response
hc=freqresp(sysc,wr); % get real and imaginary
hc=squeeze(hc); % remove singleton dimension
mc=abs(hc); % find magnitude
lmc=log10(mc); % find log magnitude
pc=angle(hc); % find phase in radians
pc=pc*(360/(2*pi)); % find phase in degrees
pc=pc+phcor; % remove 180 degree phase shifts

% compute bounded frequency response
hb=freqresp(sysb,wr); % get real and imaginary
hb=squeeze(hb); % remove singleton dimension
mb=abs(hb); % find magnitude
lmb=log10(mb); % find log magnitude
pb=angle(hb); % find phase in radians
pb=pb*(360/(2*pi)); % find phase in degrees
pb=pb+phcor; % remove 180 degree phase shifts

% just plot the bode plots
figure(1)
clf
subplot(221) % subplot(221)
semilogx(whz,lmc,'k','linewidth',1.5)
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
axis([0.01 1 -1.8 1.8]);
% set(gca,'xticklabel',[])
set(gca,'xtick',[0.01 0.1 1])
set(gca,'xticklabel','0.01|0.1|1')
ylabel('log gain','fontsize',12)
xlabel('frequency (Hz)','fontsize',12)
text(0.62,1.55,'a',...
   'fontweight','bold','fontsize',14)
% text(0.62,1.55,'A',...
%    'fontweight','bold','fontsize',14)
subplot(222) % subplot(223)
semilogx(whz,pc,'k','linewidth',1.5)
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
axis([0.01 1 -98 -30]);
set(gca,'xtick',[0.01 0.1 1])
set(gca,'xticklabel','0.01|0.1|1')
ylabel('phase (deg)','fontsize',12)
xlabel('frequency (Hz)','fontsize',12)
text(0.62,-35,'b',...
   'fontweight','bold','fontsize',14)
% text(0.62,-35,'B',...
%    'fontweight','bold','fontsize',14)

figure(2)
clf
subplot(221)
semilogx(whz,lmb,'k','linewidth',1.5)
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
axis([0.01 1 -1.8 1.8]);
% set(gca,'xticklabel',[])
set(gca,'xtick',[0.01 0.1 1])
set(gca,'xticklabel','0.01|0.1|1')
ylabel('log gain','fontsize',12)
xlabel('frequency (Hz)','fontsize',12)
text(0.62,1.55,'a',...
   'fontweight','bold','fontsize',14)
% text(0.62,1.55,'A',...
%    'fontweight','bold','fontsize',14)
subplot(222)
semilogx(whz,pb,'k','linewidth',1.5)
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
axis([0.01 1 -98 -30]);
set(gca,'xtick',[0.01 0.1 1])
set(gca,'xticklabel','0.01|0.1|1')
ylabel('phase (deg)','fontsize',12)
xlabel('frequency (Hz)','fontsize',12)
text(0.62,-35,'b',...
   'fontweight','bold','fontsize',14)
% text(0.62,-35,'B',...
%    'fontweight','bold','fontsize',14)

return

% plot graphs
figure(1)
subplot(222) % subplot(221)
semilogx(whz,lmc,'k','linewidth',1.5)
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
axis([0.01 10 -1.8 1.8]);
% set(gca,'xticklabel',[])
set(gca,'xtick',[0.01 0.1 1 10])
set(gca,'xticklabel','0.01|0.1|1|10')
ylabel('log gain','fontsize',12)
xlabel('frequency (Hz)','fontsize',12)
% text(0.012,1.55,'A',...
%    'fontweight','bold','fontsize',14)
text(0.012,1.55,'C',...
   'fontweight','bold','fontsize',14)
% text(0.6,1,'closed','fontsize',12,...
%     'fontweight','bold')
subplot(224) % subplot(223)
semilogx(whz,pc,'k','linewidth',1.5)
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
axis([0.01 10 -98 -30]);
set(gca,'xtick',[0.01 0.1 1 10])
set(gca,'xticklabel','0.01|0.1|1|10')
ylabel('phase (deg)','fontsize',12)
xlabel('frequency (Hz)','fontsize',12)
% text(0.012,-35,'C',...
%    'fontweight','bold','fontsize',14)
text(0.012,-35,'D',...
   'fontweight','bold','fontsize',14)
% text(0.6,-48,'closed','fontsize',12,...
%     'fontweight','bold')
figure(2)
clf
subplot(221)
semilogx(whz,lmb,'k','linewidth',1.5)
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
axis([0.01 1 -1.8 1.8]);
% set(gca,'xticklabel',[])
set(gca,'xtick',[0.01 0.1 1])
set(gca,'xticklabel','0.01|0.1|1')
ylabel('log gain','fontsize',12)
xlabel('frequency (Hz)','fontsize',12)
% text(0.012,1.55,'B',...
%    'fontweight','bold','fontsize',14)
text(0.62,1.55,'A',...
   'fontweight','bold','fontsize',14)
% text(1,1,'open','fontsize',12,...
%     'fontweight','bold')
subplot(223)
semilogx(whz,pb,'k','linewidth',1.5)
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
axis([0.01 1 -98 -30]);
set(gca,'xtick',[0.01 0.1 1])
set(gca,'xticklabel','0.01|0.1|1')
ylabel('phase (deg)','fontsize',12)
xlabel('frequency (Hz)','fontsize',12)
text(0.62,-35,'B',...
   'fontweight','bold','fontsize',14)
% text(1,-48,'open','fontsize',12,...
%     'fontweight','bold')

return
% these statements have frequency axis 
% from 0.01 to 10
figure(2)
subplot(222)
semilogx(whz,lmb,'k','linewidth',1.5)
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
axis([0.01 10 -1.8 1.8]);
% set(gca,'xticklabel',[])
set(gca,'xtick',[0.01 0.1 1 10])
set(gca,'xticklabel','0.01|0.1|1|10')
ylabel('log gain','fontsize',12)
xlabel('frequency (Hz)','fontsize',12)
% text(0.012,1.55,'B',...
%    'fontweight','bold','fontsize',14)
text(0.012,1.55,'C',...
   'fontweight','bold','fontsize',14)
% text(1,1,'open','fontsize',12,...
%     'fontweight','bold')
subplot(224)
semilogx(whz,pb,'k','linewidth',1.5)
set(gca,'fontweight','bold')
set(gca,'fontsize',12)
set(gca,'linewidth',1.5)
axis([0.01 10 -98 -30]);
set(gca,'xtick',[0.01 0.1 1 10])
set(gca,'xticklabel','0.01|0.1|1|10')
ylabel('phase (deg)','fontsize',12)
xlabel('frequency (Hz)','fontsize',12)
text(0.012,-35,'D',...
   'fontweight','bold','fontsize',14)
% text(1,-48,'open','fontsize',12,...
%     'fontweight','bold')

