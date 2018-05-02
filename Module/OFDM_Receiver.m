% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                                                         %
%  OFDM Transmitter and Reciever with no PARP reduction                   %
%                                                                         %
%  Input parameters:                                                      %
%  St              : Modulated OFDM signal                                %
%  N               : Size of OFDM symbol, power of 2 for simpler code     %
%  L               : Up-sampling factor, power of 2 for simpler code      %
%  PhaseShift      : Ammount of phase the signal was roteted              %
%                                                                         %
%  Output parameters:                                                     %
%  TxPAPR          : Tx PAPR                                              %
%  RxData          : Rx data                                              %
%                                                                         %
%  Written by: Ilya Michlin                                               %
%                                                                         %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

function [RxData] = OFDM_Receiver(St, Config, PhaseShift)
    %% Receiver    
    % DFT using fast version FFT
    StFFT = fft(St, Config.N);
    
    % SLM calculation
    RxData = round(StFFT ./ PhaseShift);
end