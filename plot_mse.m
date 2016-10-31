function plot_mse(features_struct, labels, settings)

% Load custom Google colors
custom_colors = load_google_colors();

% Convert MSE values within struct to matrix of singles
mse_ptsd = single([features_struct(logical(labels)).mse])';
mse_ctrl = single([features_struct(logical(~labels)).mse])';

% Count number of subjects
n_ptsd = size(mse_ptsd, 1);
n_ctrl = size(mse_ctrl, 1);

% Count number of time scales
tau_max = size(mse_ctrl, 2);
tau = [1:tau_max];

% Initialize figure
fig = figure('visible','on');
set(fig, 'Position', [100 100 680 400]);

errorbar(tau, mean(mse_ptsd), std(mse_ptsd), ...
         'color', custom_colors.red, ...
         'linewidth', 2);

hold on;

errorbar(tau, median(mse_ctrl), var(mse_ctrl), ...
         'color', custom_colors.blue, ...
         'linewidth', 2);

% Set figure title, axes, etc.
title('Multiscale Entropy (median +/- var)');
ax = gca;
xlim([0 tau_max+1]);
xticks = [1:tau_max];
xticklabels = [1:tau_max];
xlabel('# coarse grainings');
ylabel('Sample Entropy');

% Set legend
legend_str_ptsd = sprintf('PTSD (N=%1.0f)', n_ptsd);
legend_str_ctrl = sprintf('CTRL (N=%1.0f)', n_ctrl);
legend(legend_str_ptsd, legend_str_ctrl, 'location', 'best');
legend boxoff;

% Set font size
set(gca,'fontsize', 16);

% Remove top tick marks
set(gca,'box','off');

% Expand axes to fill figure
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];

% Save figure to disk
if settings.save_figs
    % Navigate to results folder
    gotoresults('ptsd');

    % Create filename
    fname = [num2str(format_timestamp(today)), ...
             '_mse.png'];

    % Call 'export_fig.m' to save as .png
    export_fig(fname, '-png', '-transparent');

    % Close figure and go back to directory with RR data
    close all; 
    gotodata('ptsd');
end
    

end % end function