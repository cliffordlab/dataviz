function linestyles = generateLinestyles(numLines)

% Generates cell array of linestyles

if nargin < 1
    numLines = 4;
end

linestyles{1} = '-';
linestyles{2} = '--';
linestyles{3} = ':';
linestyles{4} = '-.';
linestyles = linestyles(:); % convert to col vector

if numLines > 4
    % Replicate the vector
    repeats = floor(numLines / 4);
    linestyles = repmat(linestyles, repeats, 1);
    
    % Loop over and repeat until we finish off the rest
    idx_end_of_repeats = length(linestyles);
    remainder = mod(numLines, 4);
    for extras = 1:remainder
        linestyles{idx_end_of_repeats+extras} = linestyles{extras};
    end
end