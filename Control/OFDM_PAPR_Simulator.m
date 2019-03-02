% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                                                         %
%  PAPR simulation with Original OFDM signal, SLM and PTS                 %
%                                                                         %
%  Input parameters:                                                      %
%  Config          : General simulation configuration                     %
%                                                                         %
%  Output parameters:                                                     %
%  TxPAPR          : Tx PAPR                                              %
%  SimulationTime  : Simulation times                                     %
%  SER             : Received data SER                                    %
%  CCDF            : Simulation CCDF                                      %
%                                                                         %
%  Written by: Ilya Michlin                                               %
%                                                                         %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

function [TxPAPR, SimulationTime, SER, CCDF] = OFDM_PAPR_Simulator(Config)
    %% Generate Data
    TxData = DataGenerator(Config.M, Config.Carriers, Config.m);
    TxCarriers = zeros(Config.N, Config.m);
    TxCarriers(1 : round(Config.Carriers / 2 + 0.5), :) = TxData(1 : round(Config.Carriers / 2 + 0.5), :);
    TxCarriers(Config.N - round(Config.Carriers / 2) : end, :) = TxData(round(Config.Carriers / 2) : end, :);
    
    %% Simulation
    % OFDM With No PAPR Reduction
    if Config.SimulateOFDM ~= 0
        RxData_Original = zeros(Config.N , Config.m);
        TxPAPR.Original = zeros(1 , Config.m);
        SimulationTime.Original = 0;
        for n = 1 : Config.m
            [TxPAPR.Original(n), RxData_Original(:, n), ModulationTime] = OFDM_NoReduction(Config, TxCarriers(:, n));
            SimulationTime.Original = SimulationTime.Original + ModulationTime;
        end
        [~, SER.Original] = symerr(TxCarriers, RxData_Original);
        [CCDF.Original.x, CCDF.Original.y] = CalculateCCDF(TxPAPR.Original);
    end
    
    % OFDM With SLM
    if Config.SimulateSLM ~= 0
        TxPAPR.SLM = zeros(1, Config.m);
        RxData_SLM = zeros(Config.N , Config.m);
        SimulationTime.SLM = 0;
        for n = 1 : Config.m
            [TxPAPR.SLM(n), RxData_SLM(:, n), ModulationTime] = OFDM_SLM(Config, TxCarriers(:, n));
            SimulationTime.SLM = SimulationTime.SLM + ModulationTime;
        end
        [~, SER.SLM] = symerr(TxCarriers, RxData_SLM);
        [CCDF.SLM.x, CCDF.SLM.y] = CalculateCCDF(TxPAPR.SLM);
    end
    
    % OFDM With PTS
    if Config.SimulatePTS ~= 0
        TxPAPR.PTS = zeros(1, Config.m);
        RxData_PTS = zeros(Config.N , Config.m);
        SimulationTime.PTS = 0;
        for n = 1 : Config.m
            [TxPAPR.PTS(n), RxData_PTS(:, n), ModulationTime] = OFDM_PTS(Config, TxCarriers(:, n));
            SimulationTime.PTS = SimulationTime.PTS + ModulationTime;
        end
        [~, SER.PTS] = symerr(TxCarriers, RxData_PTS);
        [CCDF.PTS.x, CCDF.PTS.y] = CalculateCCDF(TxPAPR.PTS);
    end
end