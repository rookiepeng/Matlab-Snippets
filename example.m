%%
%  Comparison between non-uniformly spaced array and uniformly spaced array 
%
%  Version 1
%  Zhengyu Peng
%%
clear;

wavelength=1;
k=2*pi/wavelength;   % wave number
angleStep=0.05;
theta=0:angleStep:360;
elementNumber=16;
spacingMIN=0.5; % minimum space between two elements
spacingMAX=3.5;   % maximum space between two elements
mainbeam=8;     % width of the main lobe
thetaM=45;      % location of the main lobe

d1=[0,0.62,1.82,2.45,3.84,5.60,6.16,7.24,8.53,10.00,10.67,12.31,13.40,13.95,14.54,15.06];
w1=[0.0272277405745814 + 0.00663695612498175i;-0.0504557136311823 - 0.0156414493981255i;0.0149022080891888 - 0.0522958024026383i;0.0270725639308060 + 0.0224793289749045i;-0.0104255072112984 + 0.0647860805420306i;0.0598193468305703 - 0.00157981780230648i;-0.0278250156730021 - 0.0498385235669240i;0.0649276487388589 - 0.0399431693571197i;0.0625248046134052 - 0.00837412390141947i;0.0668878280458956 - 0.0508399287930906i;-0.0798488127285431 + 0.0272356716234928i;-0.0154715717248110 + 0.0860980599638680i;-0.0871498078302756 + 0.00810697834308643i;0.0519608795439634 + 0.0402132634019467i;0.00983611006347517 - 0.0678379408618253i;-0.0687845963435427 + 0.0348004136503320i];
d2=[0,0.5*ones(1,elementNumber-1)];
for nn=2:length(d2)
    d2(nn)=d2(nn-1)+d2(nn);
end
w2=[0.165712409493334 - 0.0178163364135969i;-0.0266096956617990 - 0.0289409777334237i;-0.00816727046224783 + 0.0422452592985454i;0.0417793041704281 - 0.0199452988116389i;-0.0432868036423907 - 0.0230352310882208i;0.00750970165338273 + 0.0506046789299732i;0.0372642051373296 - 0.0371386954897812i;-0.0527447222520634 - 0.00801159573263894i;0.0249023151671527 + 0.0471812048484143i;0.0228276244561927 - 0.0474004562096621i;-0.0502615010111028 + 0.00953995097684088i;0.0359827177899967 + 0.0333108580091977i;0.00510543810191810 - 0.0460136903914195i;-0.0372138895691395 + 0.0215984412201642i;0.0360790306489060 + 0.0156192074963889i;-0.0376388293399754 - 0.162361765909359i];
d3=[0,d1(elementNumber)/(elementNumber-1)*ones(1,elementNumber-1)];
for nn=2:length(d3)
    d3(nn)=d3(nn-1)+d3(nn);
end
w3=exp(1i*k*d3*sind(-thetaM)).';

d4=[0,0.5*ones(1,26-1)];
for nn=2:length(d4)
    d4(nn)=d4(nn-1)+d4(nn);
end
w4=[0.151762138140478 - 0.0102832612349678i;-0.0148958031630125 - 0.0172358745075817i;-0.00512570908792318 + 0.0237363670087733i;0.0233375004828243 - 0.0107751751748616i;-0.0238137186663838 - 0.0127944992034719i;0.00428503645225367 + 0.0279267418659784i;0.0205014091227646 - 0.0210035366464110i;-0.0300694264463313 - 0.00387332943146368i;0.0153922908579175 + 0.0270630607817905i;0.0126321128110758 - 0.0291921038237749i;-0.0314120648601946 + 0.00757882283295584i;0.0252090020191759 + 0.0207567876802740i;0.00142889348747491 - 0.0327916992328431i;-0.0270580598489617 + 0.0185795229321596i;0.0309579586761419 + 0.0103895530323716i;-0.0102082265061976 - 0.0306585793198716i;-0.0180712108839995 + 0.0261759534099189i;0.0311078847753170 - 0.00127725546942699i;-0.0192111629602375 - 0.0234543024925927i;-0.00695761482616326 + 0.0285139952234768i;0.0259577390330907 - 0.0111561746553496i;-0.0234651355058812 - 0.0134231077726961i;0.00322045184215660 + 0.0255023924126257i;0.0174191236356797 - 0.0169192832056161i;-0.0225092324922808 - 0.00350639052627144i;0.0716553554322047 + 0.134175266247107i];

figure(1);
subplot(4,1,1),plot(d1,zeros(1,length(d1)),'kx','LineWidth',2);
title('16-element non-uniformly spaced array');
axis([0,d1(length(d1)),-0.5,0.5]);
subplot(4,1,2),plot(d2,zeros(1,length(d2)),'bo','LineWidth',2);
title('16-element \lambda/2 uniformly spaced array');
axis([0,d1(length(d1)),-0.5,0.5]);
subplot(4,1,3),plot(d3,zeros(1,length(d3)),'r^','LineWidth',2);
title('16-element uniformly spaced sparse array');
axis([0,d1(length(d1)),-0.5,0.5]);
subplot(4,1,4),plot(d4,zeros(1,length(d4)),'gs','LineWidth',2);
title('26-element \lambda/2 uniformly spaced array');
axis([0,d1(length(d1)),-0.5,0.5]);
xlabel('Wavelength');

%% Array factor
A1=zeros(length(theta),elementNumber);
for nn=1:length(d1)
    A1(:,nn)=exp(1i*k*d1(nn)*cosd(theta));
end

A2=zeros(length(theta),elementNumber);
for nn=1:length(d2)
    A2(:,nn)=exp(1i*k*d2(nn)*cosd(theta));
end

A3=zeros(length(theta),elementNumber);
for nn=1:length(d3)
    A3(:,nn)=exp(1i*k*d3(nn)*cosd(theta));
end

A4=zeros(length(theta),24);
for nn=1:length(d4)
    A4(:,nn)=exp(1i*k*d4(nn)*cosd(theta));
end

%% Plot result
%w=ones(1,elementNumber)';
theta1=-90:angleStep:360-90;
figure(2);
plot(theta1,20*log10(abs(A1*w1))-max(20*log10(abs(A1*w1))),'k-','LineWidth',1.5);
hold on;
plot(theta1,20*log10(abs(A2*w2))-max(20*log10(abs(A2*w2))),'b--','LineWidth',1.5);
plot(theta1,20*log10(abs(A3*w3))-max(20*log10(abs(A3*w3))),'r:','LineWidth',1.5);
plot(theta1,20*log10(abs(A4*w4))-max(20*log10(abs(A4*w4))),'g-.','LineWidth',1.5);
hold off;
axis([-90,90,-30,0]);
xlabel('Zenith angle (Degree)');
ylabel('Normalized directivity (dBi)');
legend('16-element non-uniformly spaced','16-element \lambda/2 uniformly spaced','16-element uniformly spaced sparse array','26-element \lambda/2 uniformly spaced');
