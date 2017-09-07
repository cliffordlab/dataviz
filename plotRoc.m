function plotRoc(rocData, legendStr)

% Initialize figure
% figure('Position', [100 100 800 600]);
hold on;

% Create cell array for linestyle
linestyles = generateLinestyles(9);

for i = 1:numel(rocData)
    plot(rocData(i).xTest, rocData(i).yTest, ...
         linestyles{i}, 'linewidth', 1);
 
% plot(optrocptTrain(1), optrocptTrain(2), 'o', 'MarkerEdgeColor', ...
%     inputColors{1}, 'LineWidth', 4, 'MarkerSize', 13);
% plot(optrocptTest(1), optrocptTest(2), 'o', 'MarkerEdgeColor', ...
%     inputColors{2}, 'LineWidth', 4, 'MarkerSize', 13);
end
 
% Remove border around figure
box off;

ax = gca;

% Set up labels, font size, etc.
ax.XLabel.String = 'False positive rate';
ax.YLabel.String = 'True positive rate';

ylim([0 1]);
ytickVals = [0:0.2:1];
set(gca,'YTick',ytickVals)
set(gca,'YTickLabel', cellstr(num2str(ytickVals(:), '%1.2f')) );

xlim([0 1]);
x = [0:0.2:1];
set(gca,'XTick',x)
set(gca,'XTickLabel', cellstr(num2str(x(:), '%1.2f')) );


legend(legendStr, 'location', 'southeast');
legend boxoff;

set(gca, 'fontsize', 18);

% Set background to white
set(gcf, 'color', 'w');

% % Expand axes to fill figure
% tightfig;

end % end function