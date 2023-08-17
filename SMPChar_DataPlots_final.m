%% Natasha Rouse. August 2023
% Submitted to RA-L.
% Requires yall_collected.mat, smpcolor.mat, timeanderror.mat, 
% timeanderror_color.mat, aall_collected.mat, statespace_square.mat,
% statespace_squarecolor.mat, number3.mat, & acolors8kernels.mat.
% Input required:
% 1: Figure 5 (time and error)
% 2: Figure 4 (state space)
% 3: Figure 1
% 4: Figure 6 ("number 3" transformation)


close all
clear all

a3 = [0.1 0.5 0.9 1 1.1 1.5 2 5 10 15 20];
a3time = [179.95 54.78 40.09 37.12 37.7 37.86 37.58 36.57 35.39 34.95 34.64];
a3distanceerror = [0.8756
0.2812
0.0431
0
0.0389
0.1523
0.2392
0.3849
0.39
0.3877
0.4027];

nu3 = [1 1.1 1.5 2 5 10 15 20 50 100];
nu3time = [37.12
38.59
41.71
45.34
63.77
89
111.07
131.28
233.03
369.48];
nu3distanceerror = [0
0.0379
0.1429
0.2169
0.3522
0.3978
0.4131
0.4208
0.4345
0.4391];

value = [0.1 0.5 0.9 1 1.5 2 5 10 15 20 50 100];
atime = [362.33
73.84
41.63
37.12
26.75
21.43
9.3
4.9
3.33
3.52
2.1
0.59];
nutime = [37.77
37.77
37.7
37.12
52.97
67.59
138.2
233.98
317.36
393.06
766.51
1.2454E+03];
adistanceerror = [-0.0981
0.006
0.0058
0
0.0359
0.0905
1.1989
3.5451
4.827
5.627
6.0933
6.1895];
nudistanceerror = [-0.006
0.006
0.006
0
0.5579
0.8502
1.304
1.4658
1.5665
1.5923
1.6385
1.6017];

bvalue = [0.1 0.5 0.9 1 1.1 1.5 2 3];
b3time = [35.5
37.07
37.66
37.12
38.25
38.96
40.48
51.52];
b3distanceerror = [2.8474
1.5577
0.3111
0
0.2655
0.8666
1.2126
1.4736];
btime = [49.73
34.81
36.89
37.12
38.86
49.62
46.18
96.91];
bdistanceerror = [6.137
4.5865
1.1534
0
1.0968
3.7569
5.0352
6.2563];

% barea = [0.1 0.3 0.8 1.0 1.4 1.7 1.9 2.0];

colororder([0.6350 0.0780 0.1840; 0 0.4470 0.7410])

acolors = ["#13A4B2";"#1050E5";"#F44DCF";"#B877F8"];
load("yall_collected.mat")
load("smpcolor.mat")

original = original(200:end,:);
originalcolor = originalcolor(200:end,:);

a3tenth = [a3tenth(:,1)-3 a3tenth(:,2)];
a3tenth = a3tenth(200:end,:);
a3tenthcolor = a3tenthcolor(200:end,:);
a3five = [a3five(:,1)+3 a3five(:,2)];
a3five = a3five(200:end,:);
a3fivecolor = a3fivecolor(200:end,:);
a3twenty = [a3twenty(:,1)+6 a3twenty(:,2)];
a3twenty = a3twenty(200:end,:);
a3twentycolor = a3twentycolor(200:end,:);

nu3five = [nu3five(:,1)+3 nu3five(:,2)];
nu3five = nu3five(200:end,:);
nu3fivecolor = nu3fivecolor(200:end,:);
nu3hundred = [nu3hundred(:,1)+6 nu3hundred(:,2)];
nu3hundred = nu3hundred(200:end,:);
nu3hundredcolor = nu3hundredcolor(200:end,:);

alphatenth = [alphatenth(:,1)-3 alphatenth(:,2)];
alphatenth = alphatenth(200:end,:);
alphatenthcolor = alphatenthcolor(200:end,:);
alphafive = [alphafive(:,1)+3 alphafive(:,2)];
alphafive = alphafive(200:end,:);
alphafivecolor = alphafivecolor(200:end,:);
alphaten = [alphaten(:,1)+6 alphaten(:,2)];
alphaten = alphaten(200:end,:);
alphatencolor = alphatencolor(200:end,:);
alphahundred = [alphahundred(:,1)+9 alphahundred(:,2)];
alphahundred = alphahundred(200:end,:);
alphahundredcolor = alphahundredcolor(200:end,:);

nutenth = [nutenth(:,1)-3 nutenth(:,2)];
nutenth = nutenth(200:end,:);
nutenthcolor = nutenthcolor(200:end,:);
nufive = [nufive(:,1)+3 nufive(:,2)];
nufive = nufive(200:end,:);
nufivecolor = nufivecolor(200:end,:);
nuten = [nuten(:,1)+6 nuten(:,2)];
nuten = nuten(200:end,:);
nutencolor = nutencolor(200:end,:);
nuhundred = [nuhundred(:,1)+9 nuhundred(:,2)];
nuhundred = nuhundred(200:end,:);
nuhundredcolor = nuhundredcolor(200:end,:);


beta3tenth = [beta3tenth(:,1)-6 beta3tenth(:,2)];
beta3tenth = beta3tenth(200:end,:);
beta3tenthcolor = beta3tenthcolor(200:end,:);
beta3half = [beta3half(:,1)-3 beta3half(:,2)];
beta3half = beta3half(200:end,:);
beta3halfcolor = beta3halfcolor(200:end,:);
beta3onepointfive = [beta3onepointfive(:,1)+3.5 beta3onepointfive(:,2)];
beta3onepointfive = beta3onepointfive(200:end,:);
beta3onepointfivecolor = beta3onepointfivecolor(200:end,:);
beta3three = [beta3three(:,1)+7 beta3three(:,2)];
beta3three = beta3three(200:end,:);
beta3threecolor = beta3threecolor(200:end);

betatenth = [betatenth(:,1)-6 betatenth(:,2)];
betatenth = betatenth(200:end,:);
betatenthcolor = betatenthcolor(200:end,:);
betahalf = [betahalf(:,1)-3 betahalf(:,2)];
betahalf = betahalf(200:end,:);
betahalfcolor = betahalfcolor(200:end,:);
betaonepointfive = [betaonepointfive(:,1)+3.5 betaonepointfive(:,2)];
betaonepointfive = betaonepointfive(200:end,:);
betaonepointfivecolor = betaonepointfivecolor(200:end,:);
betathree = [betathree(:,1)+8.5 betathree(:,2)];
betathree = betathree(200:end,:);
betathreecolor = betathreecolor(200:end,:);

xtext_a3 = [a3tenth(1,1) original(1,1) a3five(1,1) a3twenty(1,1)];
xtext_b3 = [beta3tenth(1,1) beta3half(1,1) original(1,1) beta3onepointfive(1,1)...
    beta3three(1,1)];
xtext_nu3 = [original(1,1) nu3five(1,1) nu3hundred(1,1)];
xtext_a = [alphatenth(1,1) original(1,1) alphafive(1,1) alphaten(1,1)...
    alphahundred(1,1)];
xtext_b = [betatenth(1,1) betahalf(1,1) original(1,1) betaonepointfive(1,1)...
    betathree(1,1)];
xtext_nu = [nutenth(1,1) original(1,1) nufive(1,1) nuten(1,1) nuhundred(1,1)];

text_a3 = {'0.1','1','5','20'};
text_b = {'0.1','0.5','1','1.5','3'};
text_nu3 = {'\leq 1','5','100'};
text_anu = {'0.1','1','5','10','100'};

A1 = load("timeanderror.mat");
A1color = load("timeanderror_color.mat");
A = load('aall_collected.mat');
S = load('statespace_square.mat');
Scolor = load('statespace_squarecolor.mat');
w = [-5,5,5,-5;-5,-5,5,5];

plot_v = input("Plot #");

switch plot_v
    case 1 %TIME AND error FIGURE

        figure(1)
        t1 = tiledlayout(5,6,'TileSpacing','tight','Padding','compact');
        
        a = nexttile(1,[1 2]);
        % subplot(4,3,1)
        hold on
        yyaxis left
        plot(a3,a3time,'.-','MarkerSize',15,'Linewidth',2)
        yyaxis right
        plot(a3,a3distanceerror,'x-','MarkerSize',8,'Linewidth',2)
        xline(1,'Linewidth',2,'Linestyle','--')
        hold off
        legend('time(s)','error','Fontsize',14)
        xlabel('\alpha_3 value','FontSize',14)
        title('(a) Single Alpha','Fontsize',18)
        % lgd = legend('time(s)','error','Fontsize',12,'Location','south');
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        
        b = nexttile(3,[1 2]);
        % subplot(4,3,2)
        hold on
        yyaxis left
        % ylabel('time (s)','Fontsize',14)
        plot(bvalue,b3time,'.-','Markersize',20,'Linewidth',2.5)
        yyaxis right
        % ylabel('error','FontSize',14)
        plot(bvalue,b3distanceerror,'x-','MarkerSize',8,'Linewidth',2)
        xline(1,'Linewidth',2,'Linestyle','--')
        hold off
        legend('time(s)','error','Fontsize',14)
        xlabel('\beta_3 value','FontSize',14)
        title('(b) Single Beta','Fontsize',18)
        b = get(gca,'XTickLabel');
        set(gca,'XTickLabel',b,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        
        c = nexttile(5,[1 2]);
        % subplot(4,3,3)
        hold on
        yyaxis left
        % ylabel('time (s)','FontSize',14)
        plot(nu3,nu3time,'.-','MarkerSize',15,'Linewidth',2)
        yyaxis right
        % ylabel('error','FontSize',14)
        plot(nu3,nu3distanceerror,'x-','MarkerSize',8,'Linewidth',2)
        xline(1,'Linewidth',2,'Linestyle','--')
        hold off
        legend('time(s)','error','Fontsize',14)
        xlabel('\nu_3 value','FontSize',14)
        title('(c) Single Nu','Fontsize',18)
        c = get(gca,'XTickLabel');
        set(gca,'XTickLabel',c,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        
        d = nexttile(7,[1 2]);
        % c = subplot(4,3,4);
        hold on
        for i = 1:4
            plot(original(originalcolor==(1+i),1),original(originalcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(a3tenth(a3tenthcolor==(1+i),1),a3tenth(a3tenthcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(a3five(a3fivecolor==(1+i),1),a3five(a3fivecolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(a3twenty(a3twentycolor==(1+i),1),a3twenty(a3twentycolor==(1+i),2),...
                'k.','Color',acolors(i,:));
        end
        text(xtext_a3-0.5,(-2.5*ones(length(xtext_a3),1)),text_a3,'Fontsize',14)
        % axis([-6 8 -2.5 1.5])
        axis image
        axis off
        
        e = nexttile(9,[1 2]);
        % d = subplot(4,3,5);
        hold on
        for i = 1:4
            plot(beta3tenth(beta3tenthcolor==(1+i),1),beta3tenth(beta3tenthcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(beta3half(beta3halfcolor==(1+i),1),beta3half(beta3halfcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(original(originalcolor==(1+i),1),original(originalcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(beta3onepointfive(beta3onepointfivecolor==(1+i),1),beta3onepointfive(beta3onepointfivecolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(beta3three(beta3threecolor==(1+i),1),beta3three(beta3threecolor==(1+i),2),...
                'k.','Color',acolors(i,:));
        end
        text(xtext_b3-0.5,(-2.5*ones(length(xtext_b3),1)),text_b,'Fontsize',14)
        % axis([-9 8 -2.5 2])
        axis image
        axis off
        
        f = nexttile(11,[1 2]);
        % e = subplot(4,3,6);
        hold on
        for i = 1:4
            plot(original(originalcolor==(1+i),1),original(originalcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(nu3five(nu3fivecolor==(1+i),1),nu3five(nu3fivecolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(nu3hundred(nu3hundredcolor==(1+i),1),nu3hundred(nu3hundredcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
        end
        text(xtext_nu3-0.5,(-2.5*ones(length(xtext_nu3),1)),text_nu3,'Fontsize',14)
        % axis([-4 8 -2 1])
        axis image
        axis off
        
        g = nexttile;
        for j = 1:4
            hold on
            plot((1:18000)*0.01, A1.a3tenth(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:18000)*0.01, A1.a3tenth(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        g = get(gca,'XTickLabel');
        set(gca,'XTickLabel',g,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        
        h = nexttile;
        for j = 1:4
            hold on
            plot((1:4000)*0.01, A1.a3twenty(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:4000)*0.01, A1.a3twenty(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        h = get(gca,'XTickLabel');
        set(gca,'XTickLabel',h,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        h = gca;
        h.YAxis.Visible = 'off';
        
        k = nexttile;
        for j = 1:4
            hold on
            plot((1:4000)*0.01, A1.b3tenth(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:4000)*0.01, A1.b3tenth(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        k = get(gca,'XTickLabel');
        set(gca,'XTickLabel',k,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        k = gca;
        k.YAxis.Visible = 'off';
        
        l = nexttile;
        for j = 1:4
            hold on
            plot((1:5500)*0.01, A1.b3three(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:5500)*0.01, A1.b3three(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        l = get(gca,'XTickLabel');
        set(gca,'XTickLabel',l,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        l = gca;
        l.YAxis.Visible = 'off';
        
        m = nexttile;
        for j = 1:4
            hold on
            plot((1:4000)*0.01, A1.original(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:4000)*0.01, A1.original(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        m = get(gca,'XTickLabel');
        set(gca,'XTickLabel',m,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        m = gca;
        m.YAxis.Visible = 'off';
        
        n = nexttile;
        for j = 1:4
            hold on
            plot((1:40000)*0.01, A1.nu3hundred(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:40000)*0.01, A1.nu3hundred(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        n = get(gca,'XTickLabel');
        set(gca,'XTickLabel',n,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        n = gca;
        n.YAxis.Visible = 'off';
        
        o = nexttile(19,[1 2]);
        % f = subplot(4,3,7);
        hold on
        yyaxis left
        % ylabel('time (s)','Fontsize',14)
        semilogy(value,atime,'.-','Markersize',20,'Linewidth',2.5)
        yyaxis right
        % ylabel('error','FontSize',14)
        plot(value,adistanceerror,'x-','MarkerSize',8,'Linewidth',2)
        xline(1,'Linewidth',2,'Linestyle','--')
        hold off
        legend('time(s)','error','Fontsize',14)
        xlabel('\alpha value','FontSize',14)
        axis padded
        title('(d) All Alphas','Fontsize',18)
        o = get(gca,'XTickLabel');
        set(gca,'XTickLabel',o,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        
        p = nexttile(21,[1 2]);
        % subplot(4,3,8)
        hold on
        yyaxis left
        % ylabel('time (s)','Fontsize',14)
        plot(bvalue,btime,'.-','Markersize',20,'Linewidth',2.5)
        yyaxis right
        % ylabel('error','FontSize',14)
        plot(bvalue,bdistanceerror,'x-','MarkerSize',8,'Linewidth',2)
        xline(1,'Linewidth',2,'Linestyle','--')
        hold off
        legend('time(s)','error','Fontsize',14)
        xlabel('\beta value','FontSize',14)
        title('(e) All Betas','Fontsize',18)
        p = get(gca,'XTickLabel');
        set(gca,'XTickLabel',p,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        
        q = nexttile(23,[1 2]);
        % subplot(4,3,9)
        hold on
        yyaxis left
        % ylabel('time (s)','Fontsize',14)
        plot(value,nutime,'.-','Markersize',15,'Linewidth',2)
        yyaxis right
        % ylabel('error','FontSize',14)
        plot(value,nudistanceerror,'x-','MarkerSize',8,'Linewidth',2)
        xline(1,'Linewidth',2,'Linestyle','--')
        hold off
        legend('time(s)','error','Fontsize',14)
        xlabel('\nu value','FontSize',14)
        title('(f) All Nus','Fontsize',18)
        q = get(gca,'XTickLabel');
        set(gca,'XTickLabel',q,'fontsize',18)
        set(gca,'XTickLabelMode','auto')
        
        nexttile(25,[1 2])
        % subplot(4,3,10)
        hold on
        for i = 1:4
            plot(alphatenth(alphatenthcolor==(1+i),1),alphatenth(alphatenthcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(original(originalcolor==(1+i),1),original(originalcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(alphafive(alphafivecolor==(1+i),1),alphafive(alphafivecolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(alphaten(alphatencolor==(1+i),1),alphaten(alphatencolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(alphahundred(alphahundredcolor==(1+i),1),alphahundred(alphahundredcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
        end
        text(xtext_a-0.5,(-2.5*ones(length(xtext_a),1)),text_anu,'Fontsize',14)
        % axis([-6 9 -2 1.5])
        axis image
        axis off
        
        nexttile(27,[1 2])
        % subplot(4,3,11)
        hold on
        for i = 1:4
            plot(betatenth(betatenthcolor==(1+i),1),betatenth(betatenthcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(betahalf(betahalfcolor==(1+i),1),betahalf(betahalfcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(original(originalcolor==(1+i),1),original(originalcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(betaonepointfive(betaonepointfivecolor==(1+i),1),betaonepointfive(betaonepointfivecolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(betathree(betathreecolor==(1+i),1),betathree(betathreecolor==(1+i),2),...
                'k.','Color',acolors(i,:));
        end
        text(xtext_b-0.5,(-3.5*ones(length(xtext_b),1)),text_b,'Fontsize',14)
        axis([-11 16 -3 2])
        % axis image
        axis off
        
        nexttile(29,[1 2])
        % subplot(4,3,12)
        hold on
        for i = 1:4
            plot(nutenth(nutenthcolor==(1+i),1),nutenth(nutenthcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(original(originalcolor==(1+i),1),original(originalcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(nufive(nufivecolor==(1+i),1),nufive(nufivecolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(nuten(nutencolor==(1+i),1),nuten(nutencolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(nuhundred(nuhundredcolor==(1+i),1),nuhundred(nuhundredcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
        end
        text(xtext_nu-0.5,(-2.5*ones(length(xtext_nu),1)),text_anu,'Fontsize',14)
        % axis([-6 10 -2 2])
        axis image
        axis off
        
        lgd.Layout.Tile = 'south';


        

    case 2 %STATE SPACE FIGURE
        asmall = [S.asmall(:,1)-4,S.asmall(:,2)+4];
        asmall = asmall(200:end,:);
        Scolor.asmall = Scolor.asmall(200:end,:);
        alarge = [S.alarge(:,1)+4,S.alarge(:,2)+4];
        alarge = alarge(200:end,:);
        Scolor.alarge = Scolor.alarge(200:end,:);
        bsmall = [S.bsmall(:,1)-4,S.bsmall(:,2)];
        bsmall = bsmall(200:end,:);
        Scolor.bsmall = Scolor.bsmall(200:end,:);
        blarge = [S.blarge(:,1)+4,S.blarge(:,2)];
        blarge = blarge(200:end,:);
        Scolor.blarge = Scolor.blarge(200:end,:);
        nusmall = [S.nusmall(:,1)-4,S.nusmall(:,2)-4];
        nusmall = nusmall(200:end,:);
        Scolor.nusmall = Scolor.nusmall(200:end,:);
        nularge = [S.nularge(:,1)+4,S.nularge(:,2)-4];
        nularge = nularge(200:end,:);
        Scolor.nularge = Scolor.nularge(200:end,:);
        
        figure(2)
        t2 = tiledlayout(3,3,'TileSpacing','compact','Padding','Tight');
        at2 = nexttile;
        for j = 1:4
            hold on
            plot((1:7000)*0.01, A.asmall(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:7000)*0.01, A.asmall(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        title('(a) \alpha = 0.5','Fontsize',20)
        
        nexttile
        for j = 1:4
            hold on
            plot((1:7000)*0.01, A.original(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:7000)*0.01, A.original(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        title('(b) Original: \alpha, \beta, \nu = 1','Fontsize',20)
        
        nexttile
        for j = 1:4
            hold on
            plot((1:7000)*0.01, A.alarge(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:7000)*0.01, A.alarge(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        title('(c) \alpha = 2','Fontsize',20)
        
        nexttile
        for j = 1:4
            hold on
            plot((1:7000)*0.01, A.bsmall(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:7000)*0.01, A.bsmall(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        axis([0 70 -5 5])
        title('(d) \beta = 0.5','Fontsize',20)
        
        nexttile(5,[2 1])
        hold on
        for i = 1:4
            plot(asmall(Scolor.asmall==(1+i),1),asmall(Scolor.asmall==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(alarge(Scolor.alarge==(1+i),1),alarge(Scolor.alarge==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(bsmall(Scolor.bsmall==(1+i),1),bsmall(Scolor.bsmall==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(original(originalcolor==(1+i),1),original(originalcolor==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(blarge(Scolor.blarge==(1+i),1),blarge(Scolor.blarge==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(nusmall(Scolor.nusmall==(1+i),1),nusmall(Scolor.nusmall==(1+i),2),...
                'k.','Color',acolors(i,:));
            plot(nularge(Scolor.nularge==(1+i),1),nularge(Scolor.nularge==(1+i),2),...
                'k.','Color',acolors(i,:));
        end
        % axis tight
        axis image
        axis off
        % title('Produced Trajectories','Fontsize',16)
        
        nexttile
        for j = 1:4
            hold on
            plot((1:7000)*0.01, A.blarge(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:7000)*0.01, A.blarge(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        title('(e) \beta = 2','Fontsize',20)
        
        nexttile
        for j = 1:4
            hold on
            plot((1:7000)*0.01, A.nusmall(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:7000)*0.01, A.nusmall(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        title('(f) \nu = 0.5','Fontsize',20)
        
        %nexttile
        %axis off
        
        nexttile
        for j = 1:4
            hold on
            plot((1:7000)*0.01, A.nularge(:,j)*w(1,j), '-k','Color',acolors(j,:),'Linewidth',2)
            plot((1:7000)*0.01, A.nularge(:,j)*w(2,j), '-.k','Color',acolors(j,:),'Linewidth',2)
        end
        title('(g) \nu = 2','Fontsize',20)
        
        % title(t2,'Weighted Kernel Functions in State Space','Fontsize',30)
        ylabel(t2,'canonical state, {\it x}','Fontsize',20)
        xlabel(t2,'time (s)','Fontsize',20)



    case 3 %FIRST NUMBER 3 FIGURE
        T = load('number3.mat');
        C = load('acolors8kernels.mat');
        Tw = [-5.00000000001364	5.00000000000671	9.25102123084992	4.22478821587947	10.5000000000252	9.00000000001512	-0.211083415657867	-4.81950002678923
        10.0000000000273	15.0000000000332	10.1606379483037	5.42174988570378	4.00000000000671	-5.00000000000875	-6.59707264745077	-1.39610383650052];
        Tw = Tw*0.5;
        sizetouse1 = [8 8 8 20 8 8 8 8];
        sizetouse2 = [80 80 80 400 80 80 80 80];
        
        figure(3)
        tiledlayout(1,1,'padding','compact')
        nexttile
%         title({'(a) Tuned Trajectory','and SMP Weights','in Cartesian Space'},'Fontsize',14)
        for i = 1:8
            hold on
            plot(T.original(:,1),T.original(:,2),'k.','Color',[.8 .8 .8],'Markersize',30)
        end
        plot(Tw(1,:),Tw(2,:), 'r-', 'Color', [.6, .6, .6],'Linewidth',2)
        for i = 1:8
            hold on
            plot(T.tuned(T.tunedcolor==(1+i),1),T.tuned(T.tunedcolor==(1+i),2),...
                'k.','Color',C.acolors(i,:));
            scatter(Tw(1,i),Tw(2,i),sizetouse2(i),[.6 .6 .6],'linewidth',2);
            plot(Tw(1,i), Tw(2,i), 'k*', 'Color',C.acolors(i,:),'markersize',sizetouse1(i),'Linewidth',1.5);
        end
        axis image
       



        case 4 %TUNING NUMBER 3 FIGURE
        number3 = [1 4
                2 4.8
                3 5
                3.8 4.5
                3.5 3.6
                2.5 3.2
                3.5 3
                4.1 2.8
                4.2 2
                3.8 1
                2.5 0.5
                1.6 1
                1.2 1.5];
        number3 = number3 - [2 2].*ones(size(number3));
        desiredtraj = [interp(number3(:,1),2) interp(number3(:,2),2)];
        T = load('number3.mat');
        C = load('acolors8kernels.mat');
        Tw = [-5.00000000001364	5.00000000000671	9.25102123084992	4.22478821587947	10.5000000000252	9.00000000001512	-0.211083415657867	-4.81950002678923
        10.0000000000273	15.0000000000332	10.1606379483037	5.42174988570378	4.00000000000671	-5.00000000000875	-6.59707264745077	-1.39610383650052];
        Tw = Tw*0.5;
        sizetouse1 = [8 8 8 14 8 8 8 8];
        sizetouse2 = [80 80 80 160 80 80 80 80];
        sizetouse3 = [8 8 14 14 14 8 8 8];
        sizetouse4 = [80 80 160 160 160 80 80 80];
        
        figure(3)
        tiledlayout(3,2,'padding','tight','tilespacing','tight')
        nexttile
        % for i = 1:8
        %     hold on
        %     plot(T.original(:,1),T.original(:,2),'k.','Color',[.8 .8 .8],'Markersize',30)
        % end
        hold on
        plot(desiredtraj(:,1),desiredtraj(:,2),'k.-')
        plot(Tw(1,:),Tw(2,:), 'r-', 'Color', [.6, .6, .6],'Linewidth',2)
        for i = 1:8
            plot(T.original(T.originalcolor==(1+i),1),T.original(T.originalcolor==(1+i),2),...
                'k.','Color',C.acolors(i,:));
            scatter(Tw(1,i),Tw(2,i),[],[.6 .6 .6],'linewidth',2);
            plot(Tw(1,i), Tw(2,i), 'k*', 'Color',C.acolors(i,:),'Linewidth',1.5);
        end
        axis image
        ylabel({'\nu_{all} = 1.2','error = 7.588'},'Fontsize',14,'Rotation',0,'FontWeight','bold')
        
        nexttile
        for j = 1:8
            hold on
            plot((1:length(T.originalstate))*0.01, T.originalstate(:,j)*Tw(1,j),...
                '-k','Color',T.originalstatecolor(j,:),'Linewidth',2)
            plot((1:length(T.originalstate))*0.01, T.originalstate(:,j)*Tw(2,j),...
                '-.k','Color',T.originalstatecolor(j,:),'Linewidth',2)
        end
%         title({'(b) SMP Waveforms';'in State Space'},'Fontsize',14)
        % xlabel('time (s)','Fontsize',12)
        % ylabel('canonical state, {\it x}','Fontsize',12)
        axis([0 10 -4 8])

        nexttile
%         title({'(a) Tuned Trajectory','and SMP Weights','in Cartesian Space'},'Fontsize',14)
        hold on
        for i = 1:8
            plot(T.original(:,1),T.original(:,2),'k.','Color',[.8 .8 .8],'Markersize',20)
        end
        plot(desiredtraj(:,1),desiredtraj(:,2),'k.-')
        plot(Tw(1,:),Tw(2,:), 'r-', 'Color', [.6, .6, .6],'Linewidth',2)
        for i = 1:8
            plot(T.tuned1(T.tuned1color==(1+i),1),T.tuned1(T.tuned1color==(1+i),2),...
                'k.','Color',C.acolors(i,:));
            scatter(Tw(1,i),Tw(2,i),sizetouse2(i),[.6 .6 .6],'linewidth',2);
            plot(Tw(1,i), Tw(2,i), 'k*', 'Color',C.acolors(i,:),'markersize',sizetouse1(i),'Linewidth',1.5);
        end
        axis image
        ylabel({'\nu_{4} = 2','\nu_{i\neq4} = 1.2','error = 6.439'},...
            'Fontsize',14,'Rotation',0,'FontWeight','bold')
        
        nexttile
        for j = 1:8
            hold on
            plot((1:length(T.tuned1state))*0.01, T.tuned1state(:,j)*Tw(1,j),...
                '-k','Color',T.tuned1statecolor(j,:),'Linewidth',2)
            plot((1:length(T.tuned1state))*0.01, T.tuned1state(:,j)*Tw(2,j),...
                '-.k','Color',T.tuned1statecolor(j,:),'Linewidth',2)
        end
%         title({'(b) SMP Waveforms';'in State Space'},'Fontsize',14)
        % xlabel('time (s)','Fontsize',12)
        ylabel('canonical state, {\it x}','Fontsize',14,'Fontweight','bold')

        nexttile
%         title({'(a) Tuned Trajectory','and SMP Weights','in Cartesian Space'},'Fontsize',14)
        hold on
        for i = 1:8
            plot(T.tuned1(:,1),T.tuned1(:,2),'k.','Color',[.8 .8 .8],'Markersize',20)
        end
        plot(desiredtraj(:,1),desiredtraj(:,2),'k.-')
        plot(Tw(1,:),Tw(2,:), 'r-', 'Color', [.6, .6, .6],'Linewidth',2)
        for i = 1:8
            plot(T.tuned2(T.tuned2color==(1+i),1),T.tuned2(T.tuned2color==(1+i),2),...
                'k.','Color',C.acolors(i,:));
            scatter(Tw(1,i),Tw(2,i),sizetouse4(i),[.6 .6 .6],'linewidth',2);
            plot(Tw(1,i), Tw(2,i), 'k*', 'Color',C.acolors(i,:),'markersize',sizetouse3(i),'Linewidth',1.5);
        end
        axis image
        ylabel({'\nu_{3,4,5} = 2','\nu_{i\neq3,4,5} = 1.2','error = 5.149'},...
            'Fontsize',14,'Rotation',0,'FontWeight','bold')
        
        nexttile
        for j = 1:8
            hold on
            plot((1:length(T.tuned2state))*0.01, T.tuned2state(:,j)*Tw(1,j),...
                '-k','Color',T.tuned2statecolor(j,:),'Linewidth',2)
            plot((1:length(T.tuned2state))*0.01, T.tuned2state(:,j)*Tw(2,j),...
                '-.k','Color',T.tuned2statecolor(j,:),'Linewidth',2)
        end
%         title({'(b) SMP Waveforms';'in State Space'},'Fontsize',14)
        xlabel('time (s)','Fontsize',14,'Fontweight','bold')
        % ylabel('canonical state, {\it x}','Fontsize',12)


end
