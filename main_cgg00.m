% Replicate CGG, QJE 2000
%
% Model: CGG_2000
%
% References:
% Clarida, R., J. Galí, and M. Gertler. 2000. "Monetary Policy Rules and Macroeconomic Stability: Evidence and Some Theory."
% Quarterly Journal of Economics, February 2000, pp. 147-180.
%
% Last edited: 12/20/14 by R. Mariscal (rmariscalparedes@imf.org)
%
% This file replicates the Section IV. Interest Rate Rules and Economic Fluctuations
%
%**************************************************************************


%% Adjust path to folder where replication file is stored
clear all;
clc;
%addpath C:\dynare\4.4.3\matlab;
addpath C:\dynare\4.3.2\matlab;
%cd([cd '/CGG_2000']);

%% Run dynare with beta = 2.15 and Save!
dynare CGG_00_set1;
save('IRF_set1',...
    'pi_ep_z', 'y_ep_z', 'r_ep_z', 'x_ep_z', 'rstar_ep_z', 'z_ep_z', 'rr_ep_z',... 
    'pi_ep_g', 'y_ep_g', 'r_ep_g', 'x_ep_g', 'rstar_ep_g', 'g_ep_g', 'rr_ep_g');

%% Run dynare with beta = 1.5 and Save!
dynare CGG_00_set2;
save('IRF_set2',... 
    'pi_ep_z', 'y_ep_z', 'r_ep_z', 'x_ep_z', 'rstar_ep_z', 'z_ep_z', 'rr_ep_z',... 
    'pi_ep_g', 'y_ep_g', 'r_ep_g', 'x_ep_g', 'rstar_ep_g', 'g_ep_g', 'rr_ep_g');

%% Run dynare with beta = 1.01 and Save!
dynare CGG_00_set3;
save('IRF_set3',... 
    'pi_ep_z', 'y_ep_z', 'r_ep_z', 'x_ep_z', 'rstar_ep_z', 'z_ep_z', 'rr_ep_z',... 
    'pi_ep_g', 'y_ep_g', 'r_ep_g', 'x_ep_g', 'rstar_ep_g', 'g_ep_g', 'rr_ep_g');

%% Load data and rename
clear all;
clc;
load IRF_set1.mat;
IR_ep_z_1_pi = pi_ep_z;
IR_ep_z_1_y = y_ep_z;
IR_ep_z_1_r = r_ep_z;
IR_ep_z_1_x = x_ep_z;
IR_ep_z_1_rs = rstar_ep_z;
IR_ep_z_1_rr = rr_ep_z;

IR_ep_g_1_pi = pi_ep_g;
IR_ep_g_1_y = y_ep_g;
IR_ep_g_1_r = r_ep_g;
IR_ep_g_1_x = x_ep_g;
IR_ep_g_1_rs = rstar_ep_g;
IR_ep_g_1_rr = rr_ep_g;

load IRF_set2.mat;
IR_ep_z_2_pi = pi_ep_z;
IR_ep_z_2_y = y_ep_z;
IR_ep_z_2_r = r_ep_z;
IR_ep_z_2_x = x_ep_z;
IR_ep_z_2_rs = rstar_ep_z;
IR_ep_z_2_rr = rr_ep_z;

IR_ep_g_2_pi = pi_ep_g;
IR_ep_g_2_y = y_ep_g;
IR_ep_g_2_r = r_ep_g;
IR_ep_g_2_x = x_ep_g;
IR_ep_g_2_rs = rstar_ep_g;
IR_ep_g_2_rr = rr_ep_g;

load IRF_set3.mat;
IR_ep_z_3_pi = pi_ep_z;
IR_ep_z_3_y = y_ep_z;
IR_ep_z_3_r = r_ep_z;
IR_ep_z_3_x = x_ep_z;
IR_ep_z_3_rs = rstar_ep_z;
IR_ep_z_3_rr = rr_ep_z;

IR_ep_g_3_pi = pi_ep_g;
IR_ep_g_3_y = y_ep_g;
IR_ep_g_3_r = r_ep_g;
IR_ep_g_3_x = x_ep_g;
IR_ep_g_3_rs = rstar_ep_g;
IR_ep_g_3_rr = rr_ep_g;

N = size(IR_ep_z_1_pi,1);
T = 1:N;

%% Plot Negative Supply Shock (replicate figure VII)
AA=get(gca,'ColorOrder');
figure(1);

subplot(2,2,1)
plot(T', IR_ep_z_1_pi', '-', T', IR_ep_z_2_pi','--', T', IR_ep_z_3_pi','-.');
set(findobj(gca,'Type','line','Color',AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(3,:)), 'Color',AA(3,:), 'LineWidth',2);
%grid;
axis([1 15 0 0.5]);
title('Inflation (\pi)','FontSize',10);
%legend('beta = 2.2','beta = 1.5','\beta = 1.01','Orientation','horizontal','Location','SouthOutside');
legend('\beta = 2.2','\beta = 1.5','\beta = 1.01','Location','Best');

subplot(2,2,2)
plot(T', IR_ep_z_1_y', '-', T', IR_ep_z_2_y','--', T', IR_ep_z_3_y','-.');
set(findobj(gca,'Type','line','Color',AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(3,:)), 'Color',AA(3,:), 'LineWidth',2);
%grid;
axis([1 15 -0.85 0]);
title('Output (y)','FontSize',10);

subplot(2,2,3)
plot(T', IR_ep_z_1_r', '-', T', IR_ep_z_2_r','--', T', IR_ep_z_3_r','-.');
set(findobj(gca,'Type','line','Color',AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(3,:)), 'Color',AA(3,:), 'LineWidth',2);
%grid;
axis([1 15 0 0.2]);
title('Nominal interest rate (r)','FontSize',10);

subplot(2,2,4)
plot(T', IR_ep_z_1_x', '-', T', IR_ep_z_2_x','--', T', IR_ep_z_3_x','-.');
set(findobj(gca,'Type','line','Color',AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(3,:)), 'Color',AA(3,:), 'LineWidth',2);
%grid;
axis([1 15 0 0.75]);
title('Output gap (x)','FontSize',10);

saveas(gcf,'CGG00_irf_ep_z.pdf')


%% Plot Positive Demand Shock
figure(2);

%title('Positive Demand Shock');
title('Negative Demand Shock');

subplot(2,2,1)
plot(T', IR_ep_g_1_pi', '-', T', IR_ep_g_2_pi','--', T', IR_ep_g_3_pi','-.');
set(findobj(gca,'Type','line','Color',AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(3,:)), 'Color',AA(3,:), 'LineWidth',2);
%grid;
%axis([1 15 0 2.5]);        % Positive shock!
axis([1 15 -5 0]);        % Negative shock!
title('Inflation (\pi)','FontSize',10);
%legend('beta = 2.2','beta = 1.5','\beta = 1.01','Orientation','horizontal','Location','SouthOutside');
legend('\beta = 2.2','\beta = 1.5','\beta = 1.01','Location','Best');

subplot(2,2,2)
plot(T', IR_ep_g_1_x', '-', T', IR_ep_g_2_x','--', T', IR_ep_g_3_x','-.');
set(findobj(gca,'Type','line','Color',AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(3,:)), 'Color',AA(3,:), 'LineWidth',2);
%grid;
%axis([1 15 0 3]);
axis([1 15 -7 0]);
title('Output gap (x)','FontSize',10);

subplot(2,2,3)
plot(T', IR_ep_g_1_r', '-', T', IR_ep_g_2_r','--', T', IR_ep_g_3_r','-.');
set(findobj(gca,'Type','line','Color',AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(3,:)), 'Color',AA(3,:), 'LineWidth',2);
%grid;
%axis([1 15 0 1.5]);
axis([1 15 -1.5 0]);
title('Nominal interest rate (r)','FontSize',10);

subplot(2,2,4)
plot(T', IR_ep_g_1_rr', '-', T', IR_ep_g_2_rr','--', T', IR_ep_g_3_rr','-.');
set(findobj(gca,'Type','line','Color',AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(3,:)), 'Color',AA(3,:), 'LineWidth',2);
%grid;
%axis([1 15 0 1.5]);
axis([1 15 -0.5 4.5]);
title('Real interest rate (rr)','FontSize',10);

saveas(gcf,'CGG00_irf_ep_g.pdf')





