%% Natasha Rouse. August 2023
% Submitted to RA-L.
%2 separate trajectories: square & number 3.
%Square Trajectory -----
%   Uncomment square "desiredtraj" (lines ) and kernel locations
%   (lines ). Alpha, beta & nu = 1. Nt = 4000. sK = 4.
%Number 3 Trajectory -----
%   Uncomment number 3 "desiredtra" (lines ) and vertices kernel locations
%   (lines ). Alpha = 10, beta = 1, nu = 1.2. Nt = 800. sK = 8.

close all
clear all
clc
tic

rng(1)
%TRAJECTORY CHOICES: Uncomment the relevant trajectory

%Square Trajectory starting at (-1,-1)
desiredtraj = [-1:.5:1,ones(1,5),1:-.5:-1,-(ones(1,4));
                -(ones(1,5)),-1:.5:1,ones(1,5),1:-.5:-.5]';
g = desiredtraj(end,:);

% %Number 3 Trajectory
% number3 = [1 4
%         2 4.8
%         3 5
%         3.8 4.5
%         3.5 3.6
%         2.5 3.2
%         3.5 3
%         4.1 2.8
%         4.2 2
%         3.8 1
%         2.5 0.5
%         1.6 1
%         1.2 1.5];
% number3 = number3 - [2 2].*ones(size(number3));
% desiredtraj = [interp(number3(:,1),2) interp(number3(:,2),2)];
% g = desiredtraj(end,:);


%SYSTEM PARAMETER INITIALIZATION
P = struct('desiredtraj',desiredtraj,'dt',0.01,...
    'Nt',4000,'g',g);
%trajectory start, velocity at trajectory start, canonical state vector,
%size of timestep, number of timesteps, goal
y0 = [];
y0(1,:) = desiredtraj(1,:) + 0.001;
y0dot = [];
y0dot(1,:) = zeros(1,2);
x0 = 1;
sK = 4;
DOF = size(desiredtraj,2);

%SMP INITIALIZATION
S = struct('tau',1,'alphay',4,'betay',1,...
    ...
    'alpha',1,...
    'beta',1,...
    'nu',1,...
    ...
    'K',sK,...
    'rho',zeros(sK),...
    'a0',[1,0.2,10^-9*ones(1,sK-2)],...
    'a',[],...'ep',10^-9*ones(1,sK),...
    'ep',10^-9*ones(1,sK),...
    'w',zeros(DOF,sK),...
    'f',zeros(P.Nt,DOF),'y',y0,'ydot',y0dot);
S.sum = S.alpha + S.beta + S.nu;

%INITIALIZE WEIGHTS
% %Scaled from trajectory: number 3 trajectory
% ws = P.desiredtraj(round(linspace(1,length(P.desiredtraj),S.K)) ,:)'...
%     *(S.alphay+S.betay);
% ws = ws + [3;3/2].*(ones(size(ws)));

%Choose the vertices: square traj
edge = sum(abs(desiredtraj),2);
idx = find(edge == max(edge));
vertices = unique(desiredtraj(idx,:),'rows','stable');
vertices = [-1 -1; 1 -1; 1 1; -1 1]; %square
ws = vertices'*(S.alphay+S.betay);

S.w = ws;
S.a(1,:) = S.a0;

% %SADDLE PARAMETERS: Change as needed
% S.alpha = S.alpha*ones(S.K,1);
% S.alpha(3) = S.alpha(3)*0.5;
% alpha_rho = S.alpha;

% S.nu = S.nu*ones(S.K,1);
% S.nu(4) = S.nu(4)*2;
% S.nu(3) = S.nu(3)*2;
% S.nu(5) = S.nu(5)*2;
% nu_rho = S.nu;

% S.beta = S.beta*ones(S.K,1);
% S.beta(3) = S.beta(3)*0.1;
% beta_rho = S.beta;

alpha_rho = S.alpha*ones(S.K,1);
beta_rho = S.beta*ones(S.K,1);
nu_rho = S.nu*ones(S.K,1);

S.rho = zeros(S.K);

new_rho=shc_lv_createcycle(alpha_rho,beta_rho,nu_rho,-1);
S.rho = new_rho;

index = 1;
expected_SHCas = S.a;
a = S.a(1,:);

%Run & plot for coarse approximation
disp('Coarse Approximation')
[costrand,S] = Eval(S,P);
costrand
ShowPlot(S,P,ws);


%% Evaluate Cost
function [cost,S] = Eval(S,P,wnew)
if nargin == 3
    wsmp = wnew;
end
if nargin == 2
    wsmp = S.w;
end
goaltol = 0.005;
maxtime = (P.Nt+1)*P.dt;

originaly = getfield(load('yallsmp.mat'),'yallsmp');
originaly = P.desiredtraj;

distance = 0;
trajpointdistancessq = Inf*ones(size(originaly, 1), 1);
ydotdotsum = 0;
for i = 1:P.Nt
    dW = sqrt(P.dt)*randn(1,S.K);
    if i == 1
        da = S.a0 .* (S.alpha' - S.a0*S.rho) *P.dt + S.ep.*dW;
        S.a(i,:) = max(min(S.a0 + da, 1), 0.0005);
    else
        da = S.a(i-1,:) .* (S.alpha' - S.a(i-1,:)*S.rho) *P.dt + S.ep.*dW;
        S.a(i,:) = max(min(S.a(i-1,:) + da, 1), .0005);
    end
    S.f(i,:) = (S.a(i,:)*wsmp');

    ydotdot = (S.alphay*(S.betay*(P.g-S.y(i,:))-S.ydot(i,:))+S.f(i,:))/S.tau;
    ydotdotsum = rssq(ydotdot) + ydotdotsum;
    S.ydot(i+1,:) = ydotdot*P.dt + S.ydot(i,:);
    S.y(i+1,:) = S.ydot(i+1,:)*P.dt+S.y(i,:);

    trajpointdistancessq = min ((S.y(i+1,1) - originaly(:,1)).^2 +...
                            (S.y(i+1,2) - originaly(:,2)).^2, ...
                            trajpointdistancessq);

    [dsquared,~] = min( (S.y(i+1,1) - P.desiredtraj(:,1)).^2 + ...
        (S.y(i+1,2) - P.desiredtraj(:,2)).^2);
    distance = distance + sqrt(dsquared);       
end
cost = sum(sqrt(trajpointdistancessq));
end

%% Create rho
function rho=shc_lv_createcycle(alpha,bet,nu,direction)
%SHC_LV_CREATECYCLE  Create connection matrix RHO for Lotka-Volterra SHC cycle.
%   RHO = SHC_LV_CREATECYCLE(ALPHA,BETA,NU) returns an N-dimensional
%   non-negative connection matrix RHO for the growth rates ALPHA, state
%   magnitudes BETA, and saddle values NU. ALPHA, BETA, and NU, must be symbolic
%   or floating-point scalars or length N vectors. If all three parameters are
%   scalar, a 3-by-3 connection matrix will be created. To form an SHC cycle,
%   the elements of RHO are:
%   
%                  { ALPHA(i)/BETA(i),                   if i == j
%       RHO(i,j) = { (ALPHA(i)-ALPHA(j)/NU(j))/BETA(j),  if i == mod(j,N)+1
%                  { (ALPHA(i)+ALPHA(j))/BETA(j),        otherwise
%   
%   where i,j are in {1,..., N}, N >= 3.
%   
%   RHO = SHC_LV_CREATECYCLE(ALPHA,BETA,NU,-1) is the same as above except the
%   resultant connection matrix RHO is transposed, reversing the direction of
%   the cycle. RHO = SHC_LV_CREATECYCLE(ALPHA,BETA,NU,1) is equivalent to
%   RHO = SHC_LV_CREATECYCLE(ALPHA,BETA,NU).
%   
%   See also:
%       SHC_LV_PARAMS, SHC_LV_EIGS, SHC_LV_JACOBIAN, SHC_LV_PASSAGETIME,
%       SHC_LV_MINTRANSITIONTIME

%   For details of the methods used, see:
%   
%   Andrew D. Horchler, Kathryn A. Daltorio, Hillel J. Chiel, and Roger D.
%   Quinn, "Designing Responsive Pattern Generators: Stable Heteroclinic Channel
%   Cycles for Modeling and Control," Bioinspiration & Biomimetics, Vol. 10,
%   No. 2., 2015, pp. 1-16.

%   Andrew D. Horchler, horchler @ gmail . com, Created 2-27-14
%   Revision: 1.2, 6-2-16


% Check ALPHA
if isempty(alpha) || ~isvector(alpha)
    error('SHCTools:shc_lv_createcycle:AlphaDimensionMismatch',...
          'The input Alpha must be a non-empty vector.');
end

% Check BETA
if isempty(bet) || ~isvector(bet)
    error('SHCTools:shc_lv_createcycle:BetaDimensionMismatch',...
          'The input Beta must be a non-empty vector.');
end

% Check NU
if isempty(nu) || ~isvector(nu)
    error('SHCTools:shc_lv_createcycle:NuDimensionMismatch',...
          'The input Nu must be a non-empty vector.');
end

% Check dimension of parameters
len = [length(alpha) length(bet) length(nu)];
n = max(len);
if n == 1
    n = 3;
elseif any(len ~= 1 & len ~= n)
    error('SHCTools:shc_lv_createcycle:ParameterDimensionMismatch',...
         ['The input parameters, Alpha, Beta, and Nu, must scalars or '...
          'equal length vectors.']);
end

%Check DIRECTION
if nargin > 3
    if ~isscalar(direction) || ~isnumeric(direction) || ~any(direction == [1 -1])
        error('SHCTools:shc_lv_createcycle:InvalidFlag',...
              'The option Direction argument must a scalar 1 or -1.');
    end
else
    direction = 1;
end

% Expand scalars
z = ones(n,1);
alpha = alpha(:).*z;
bet = bet(:).*z;
nu = nu(:).*z;

% c >= 1, Adjust size of non-dominant stable eigenvalues, c == 1 for all equal
c = 1;

% Calculate Rho based on direction
if direction == 1
    rho = c*z*(alpha./bet).';
    rho([2:n+1:end n*(n-1)+1]) = -alpha./(bet.*nu);
    rho(1:n+1:end) = 0;
    rho = rho+alpha*(z./bet).';
else
    rho = c*(alpha./bet)*z.';
    rho([n+1:n+1:end n]) = -alpha./(bet.*nu);
    rho(1:n+1:end) = 0;
    rho = rho+(z./bet)*alpha.';
end

% Make non-negative
if ~isa(rho,'sym')
    rho(:) = max(rho(:),0);
end

end


%% Plot
function ShowPlot(S,P,ws)

aall = nan*ones(P.Nt,S.K);
yallsmp = nan*ones(P.Nt,2);
whichcolor = nan*ones(P.Nt,1);
smpcolor = whichcolor;

for i = 1:P.Nt
    [~, smpcolor(i)] = max( [sum( abs(S.alphay*(S.betay*(P.g-S.y(i,:))-S.ydot(i,:))).^2)*.1;
                               sum((abs((S.a(i,:).*S.w) /sum(S.a(i,:)))').^2,2)] );

    yallsmp(i,:) = S.y(i,:);
    aall(i,:) = S.a(i,:);
end
smpcolorstouse = setdiff(unique(smpcolor)-1, 0);
acolors = ones(1, size(S.w,2))'*[0.7, 0.7, 0.7];
acolors(smpcolorstouse,:) = cool(length(smpcolorstouse));
pause(0.1)

if S.K == 4
    acolors = ["#13A4B2";"#1050E5";"#F44DCF";"#B877F8"];
end

if length(S.alpha)==1
    alpha_rho = S.alpha*ones(S.K,1);
    markerline = 2*ones(S.K,1);
    disp('one alpha value')
else
    markerline =0.1 + 2*normalize(S.alpha,'range');
    disp('alpha range')
end
if length(S.nu)==1
    nu_rho = S.nu*ones(S.K,1);
    sizetouse = 10*ones(S.K,1);
    disp('one nu value')
else
    %6 is the default size of plot markers
    sizetouse = 10 + 10*normalize(S.nu,'range');
    disp('nu range')
end

t = tiledlayout(1,2,'TileSpacing','compact','Padding','compact');

nexttile
hold on
title('(a) Task Space','Fontsize',18)
plot(-5*ones(2,1),[S.w(2,3),S.w(2,1)],'color',[.6 .6 .6],'linewidth',2)
plot(S.w(1,:),S.w(2,:), 'r-', 'Color', [.6, .6, .6],'Linewidth',2)
plot(P.desiredtraj(:,1),P.desiredtraj(:,2), '-k.');
for i = 1:size(S.w, 2)
    scatter(S.w(1,i),S.w(2,i),10*sizetouse(i),[.6 .6 .6],'linewidth',markerline(i));
    plot(yallsmp(smpcolor==(1+i),1), yallsmp(smpcolor==(1+i),2), 'k.', 'Color', acolors(i,:),'Markersize',12) %actual trajectory
    plot(S.w(1,i), S.w(2,i), 'k*', 'Color',acolors(i,:),'markersize',sizetouse(i),'Linewidth',3);
end
hold off
axis([-6 6 -6 6])
axis square

nexttile
title('(b) State Space','Fontsize',18)
for j = 1:size(S.a,2)
    hold on
    plot((1:P.Nt)*P.dt, aall(:,j)*S.w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
    plot((1:P.Nt)*P.dt, aall(:,j)*S.w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
end
hold off
ylabel('canonical state, {\it x}','Fontsize',18)
xlabel('time (s)','Fontsize',18)



end




