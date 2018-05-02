% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                                                         %
%  OFDM Transmitter and Reciever using SLM technique                      %
%                                                                         %
%  Input parameters:                                                      %
%  N               : Size of OFDM symbol, power of 2 for simpler code     %
%  q               : Number of QAM symbols in OFDM symbol                 %
%  L               : Up-sampling factor, power of 2 for simpler code      %
%  Data            : M order QAM data with dimentions of N by m           %
%  PhaseRes        : Phase matrix resolution                              %
%  SLMDeph         : SLM number of rotation tries                         %
%                                                                         %
%  Output parameters:                                                     %
%  TxPAPR          : Tx PAPR                                              %
%  RxData          : Rx data                                              %
%                                                                         %
%  Written by: Ilya Michlin                                               %
%                                                                         %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

function [TxPAPR, RxData, ModulationTime] = OFDM_SLM(Config, Data)
    %% Transmitter
    tic
    
    % Generate phases
    Pm = RandomPhases(Config.PhaseRes, Config.SLMDeph, Config.N);
    
    % SLM calculation
    SLM = zeros(Config.N);
    for n = 1 : Config.SLMDeph + 1
        SLM(:, n) = Data .* Pm(:, n);
    end
    
    % IDFT using fast version IFFT
    x = ifft(SLM, Config.N);
    
    % Measure PAPR
    PAPR = 20 * log10(max(abs(x)) ./ mean(abs(x)));
    
    % Choose signal with best PAPR
    [TxPAPR, PAPRPos] = min(PAPR);
    St = x(:, PAPRPos);
    PhaseShift = Pm(:, PAPRPos);
    ModulationTime = toc;

    
    %% Receiver        
    [RxData] = OFDM_Receiver(St, Config, PhaseShift);
end