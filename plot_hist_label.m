function fig = plot_hist_label(labels, labels_est, legend_entries_cell)

% Load custom Google colors
google_colors = load_google_colors();

% Set up vectors of probabilities
idx_pos = find(labels == 1);
idx_neg = find(labels == 0);
p_est_pos = labels_est(idx_pos);
p_est_neg = labels_est(idx_neg);

figure('position', [100 100 680 400]);

% Plot histogram with box plots
nhist(  {p_est_pos, p_est_neg}, ...
        'color', {google_colors.red, google_colors.blue},...
        'proportion', 'samebins', ...
        'binfactor', 2, ...
        'linewidth', 3, ...    
        'legend', legend_entries_cell, 'location', 'best', ...
        'fontsize', 20, ...
        'ylabel', 'Proportion', 'xlabel', 'P(class)');

% Remove top tick marks
set(gca,'box','off');

% Set background color to white
set(gcf, 'Color', 'w');

% Expand axes to fill figure
tightfig;

end % end function