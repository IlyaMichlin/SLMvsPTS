% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                                                         %
%  Calculate CCDF on the data                                             %
%                                                                         %
%  Input parameters:                                                      %
%  Data            : Data to calculate the CCDF on                        %
%                                                                         %
%  Output parameters:                                                     %
%  xCCDF           : x scale CCDF data                                    %
%  yCCDF           : y scale CCDF data                                    %
%                                                                         %
%  Written by: Ilya Michlin                                               %
%                                                                         %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

function [xCCDF, yCCDF] = CalculateCCDF(Data)
    [ycdf, xcdf] = cdfcalc(Data);
    xCCDF = xcdf;
    yCCDF = 1 - ycdf(1 : end - 1);
    yCCDF = 10 * log10(yCCDF);
end