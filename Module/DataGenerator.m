% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                                                         %
%  QAM data generator                                                     %
%                                                                         %
%  Input parameters:                                                      %
%  M               : QAM constellation order size                         %
%  m               : Number of OFDM symbols to be simulated               %
%  q               : Number of QAM symbols in OFDM symbol                 %
%                                                                         %
%  Output parameters:                                                     %
%  Data            : M order QAM data with dimentions of q by m           %
%                                                                         %
%  Written by: Ilya Michlin                                               %
%                                                                         %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

function [Data] = DataGenerator(M, q, m)
    %% Data Generator
    RawData = randi([0 (M - 1)], q, m);

    %% Modulator
    Data = qammod(RawData, M);
end