% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                                                         %
%  OFDM Transmitter and Receiver using PTS technique                      %
%                                                                         %
%  Input parameters:                                                      %
%  N               : Size of OFDM symbol, power of 2 for simpler code     %
%  q               : Number of QAM symbols in OFDM symbol                 %
%  L               : Up-sampling factor, power of 2 for simpler code      %
%  Data            : M order QAM data with dimentions of N by m           %
%  PhaseRes        : Phase matrix resolution                              %
%  PTSPartitions   : Number of PTS partitions                             %
%  PTSDeph         : PTS number of rotation tries                         %
%                                                                         %
%  Output parameters:                                                     %
%  TxPAPR          : Tx PAPR                                              %
%  RxData          : Rx data                                              %
%                                                                         %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

function [TxPAPR, RxData, ModulationTime] = OFDM_PTS(Config, Data)
    %% Transmitter
    tic
    
    % Partitioning
    PartitionLength = Config.N / Config.PTSPartitions;
    PTS = zeros(Config.N, Config.PTSPartitions);
    for n = 1 : Config.PTSPartitions
        PTS((n - 1) * PartitionLength + 1: n * PartitionLength, n) =...
            Data((n - 1) * PartitionLength + 1: n * PartitionLength);
    end
    
    % IDFT using fast version IFFT
    x = ifft(PTS, Config.N);
    
    % Create Phases
    e = RandomPhases(Config.PhaseRes, Config.PTSDeph, Config.PTSPartitions);
    
    % PTS Calculation
    s = x * e;
    
    % Measure PAPR
    PAPR = 20 * log10(max(abs(s)) ./ mean(abs(s)));
    
    % Choose Best PAPR
    [TxPAPR, BestPAPRPlace] = min(PAPR);
    
    % Construct Tx Signal
    St = s(:, BestPAPRPlace);
    PhaseShift = e(:, BestPAPRPlace);
    PhaseShift = repelem(PhaseShift, Config.N / Config.PTSPartitions);
    
    ModulationTime = toc;
    
    %% Receiver        
    [RxData] = OFDM_Receiver(St, Config, PhaseShift);
end