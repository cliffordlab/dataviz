function plot_auc_vs_m(results, settings)

% Load custom colors from Google's Material Design guidelines
google_colors = load_google_colors();
gclr_names = {'red','green','orange','blue'};

% Initialize figure
figure('Position', [100 100 680 400]);

% Initialize empty cell array for legend labels
legend_labels = {};

% Initialize cell of line styles
num_plots = settings.max_winlen / 2;
linestyles = generate_linestyles(num_plots);

% Loop through each window, 2-day windows at a time
% 2-day window = current minimum
for i = 1:num_plots

    % note i = 1,2,3,4 but days = 2,4,6,8
    
    % Count # of features
    m = length(results(i*2).aucs_vs_m);
    
    % Loop through specific colors
    % Note we are going through 2, 4, 6, ...
    % so we map to indices 1, 2, 3, ... by dividing by 2
    current_color = google_colors.(gclr_names{i});
    
    % Add # of days to legend label
    legend_labels{end+1} = sprintf('%1.0f-day window', i*2);
    
    % Call plot
    plot([1:m], results(i*2).aucs_vs_m, 'linewidth', 2.5, 'color', current_color, ...
         'linestyle', linestyles{i});
    hold on;

    ax = gca;
    ax.YLim = [0.75 1.0];
    ax.XLabel.String = '# most predictive features used';
    ax.YLabel.String = 'AUC';
    
    ax.YAxis.TickLabelFormat = '%.2f';
    ax.FontSize = 16;
    
    xticks([0:5:m]);

    title('AUC vs. # most predictive features used');
    
end

% Add legend
legend(legend_labels);
legend('boxoff');

% Expand axes to fill figure
tightfig;

% Save figure to disk
if settings.save
    
    currdir = pwd;
	cd('~/desktop');
    
    % Create filename
    fname = [num2str(format_timestamp(today)), '_auc_vs_m'];

    % Call 'export_fig.m' to save as .png
    export_fig(fname, '-eps', '-transparent');
    
    cd(currdir);
end

end % end function