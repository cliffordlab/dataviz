function google_colors = load_google_colors()

% Google Material Design colors
% (much nicer than Matlab default colors!)
% Output is struct with fields corresponding to colors
% RGB values should be in % or fraction out of 100
%
% Uses hex2rgb.m
%
% By Erik Reinertsen <er@gatech.edu>

google_colors.red = hex2rgb('F44336');

google_colors.blue = hex2rgb('2196F3');

google_colors.gray = hex2rgb('9E9E9E');

google_colors.purple = hex2rgb('9C27B0');

google_colors.green = hex2rgb('4CAF50');

google_colors.yellow = hex2rgb('FFEB3B');

google_colors.orange = hex2rgb('FF9800');

google_colors.brown = hex2rgb('795548');

end