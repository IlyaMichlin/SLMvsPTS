% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                                                         %
%  OFDM Transmitter and Reciever with no PARP reduction                   %
%                                                                         %
%  Input parameters:                                                      %
%  N               : Size of OFDM symbol, power of 2 for simpler code     %
%  q               : Number of QAM symbols in OFDM symbol                 %
%  L               : Up-sampling factor, power of 2 for simpler code      %
%  Data            : M order QAM data with dimentions of N by m           %
%                                                                         %
%  Output parameters:                                                     %
%  TxPAPR          : Tx PAPR                                              %
%  RxData          : Rx data                                              %
%                                                                         %
%  Written by: Ilya Michlin                                               %
%                                                                         %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

function [TxPAPR, RxData, ModulationTime] = OFDM_NoReduction(Config, Data)
    %% Transmitter
    tic
    
    % IDFT using fast version IFFT
    St = ifft(Data, Config.N);
    
    % Measure PAPR
    TxPAPR = 20 * log10(max(abs(St)) ./ mean(abs(St)));
    
    ModulationTime = toc;
    
    
    %% Receiver
    PhaseShift = ones(Config.N, 1);
    [RxData] = OFDM_Receiver(St, Config, PhaseShift);
end