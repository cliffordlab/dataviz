function linestyles = generateLinestyles(numLines)

% Generates cell array of linestyles

if nargin < 1
    numLines = 8;
end

linestyles{1} = '-.v';
linestyles{2} = '-.p';
linestyles{3} = '-.d';
linestyles{4} = '-.<';
linestyles{5} = '-.*';
linestyles{6} = '-.>';
linestyles{7} = '-.h';
linestyles{8} = '-.s';

linestyles = linestyles(:); % convert to col vector

if numLines > 8
    % Replicate the vector
    repeats = floor(numLines / 8);
    linestyles = repmat(linestyles, repeats, 1);
    
    % Loop over and repeat until we finish off the rest
    idx_end_of_repeats = length(linestyles);
    remainder = mod(numLines, 8);
    for extras = 1:remainder
        linestyles{idx_end_of_repeats+extras} = linestyles{extras};
    end
end