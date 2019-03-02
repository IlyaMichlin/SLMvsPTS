% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                                                         %
%  PAPR simulation with range of values                                   %
%                                                                         %
%  Input parameters:                                                      %
%  Config          : General simulation configuration                     %
%  Parameter       : Parameter to be change                               %
%  Values          : Range of values to simulate                          %
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

function [TxPAPR, SimulationTime, SER, CCDF, Legend] = Configuration_Simulator(Config, Parameter, Values)
    %% Initialize
    if isempty(Values)
        ValuesSize = 1;
    else
        ValuesSize = length(Values);
    end
    
    TxPAPR.Original = zeros(ValuesSize, Config.m);
    TxPAPR.SLM = zeros(ValuesSize, Config.m);
    TxPAPR.PTS = zeros(ValuesSize, Config.m);
    
    SimulationTime.Original = zeros(ValuesSize, 1);
    SimulationTime.SLM = zeros(ValuesSize, 1);
    SimulationTime.PTS = zeros(ValuesSize, 1);
    
    SER.Original = zeros(ValuesSize, 1);
    SER.SLM = zeros(ValuesSize, 1);
    SER.PTS = zeros(ValuesSize, 1);
    
    CCDF.Original.x = zeros(ValuesSize, Config.m);
    CCDF.Original.y = zeros(ValuesSize, Config.m);
    CCDF.SLM.x = zeros(ValuesSize, Config.m);
    CCDF.SLM.y = zeros(ValuesSize, Config.m);
    CCDF.PTS.x = zeros(ValuesSize, Config.m);
    CCDF.PTS.y = zeros(ValuesSize, Config.m);
    
%     Legend = zeros(ValuesSize, 1);
    
    %% Run Simulation
    for n = 1 : ValuesSize
        % Change The Parameter
        switch Parameter
%             case 1 % NONE
            case 2 % M - QAM
                Config.M = Values(n);
            case 3 % N - Size
                Config.N = Values(n);
            case 4 % PhaseRes - Phase Resolution
                Config.PhaseRes = Values(n);
            case 5 % SLMDeph - SLM Attempts
                Config.SLMDeph = Values(n);
            case 6 % PTSPartitions - Partition Number
                Config.PTSPartitions = Values(n);
            case 7 % PTSDeph - PTS Attempts
                Config.PTSDeph = Values(n);
        end
    
        if Config.Carriers_gui == 0
            Config.Carriers = Config.N;
        else
            Config.Carriers = Config.Carriers_gui;
        end
        
        if Parameter == 1 % NONE
            Legend = ' ';
        elseif Values(n) < 10
           Legend(n, 1 : 5) = ['    ' num2str(Values(n))];
        elseif Values(n) < 100
           Legend(n, 1 : 5) = ['   ' num2str(Values(n))];
        elseif Values(n) < 1000
           Legend(n, 1 : 5) = ['  ' num2str(Values(n))];
        elseif Values(n) < 10000
           Legend(n, 1 : 5) = [' ' num2str(Values(n))];
        else
           Legend(n, 1 : 5) = num2str(Values(n));
        end
        
        % Simulate
        [TxPAPRtmp, SimulationTimetmp, SERtmp, CCDFtmp] = OFDM_PAPR_Simulator(Config);
        
        
        % OFDM With No PAPR Reduction
        if Config.SimulateOFDM ~= 0
            TxPAPR.Original(n, 1 : end) = TxPAPRtmp.Original;
            SimulationTime.Original(n) = SimulationTimetmp.Original;
            SER.Original(n) = SERtmp.Original;
            CCDF.Original.x(n, 1 : length(CCDFtmp.Original.x)) = CCDFtmp.Original.x;
            CCDF.Original.y(n, 1 : length(CCDFtmp.Original.y)) = CCDFtmp.Original.y;
        end
        
        % OFDM With SLM
        if Config.SimulateSLM ~= 0
            TxPAPR.SLM(n, 1 : end) = TxPAPRtmp.SLM;
            SimulationTime.SLM(n) = SimulationTimetmp.SLM;
            SER.SLM(n) = SERtmp.SLM;
            CCDF.SLM.x(n, 1 : length(CCDFtmp.SLM.x)) = CCDFtmp.SLM.x;
            CCDF.SLM.y(n, 1 : length(CCDFtmp.SLM.y)) = CCDFtmp.SLM.y;
        end
        
        % OFDM With PTS
        if Config.SimulatePTS ~= 0
            TxPAPR.PTS(n, 1 : end) = TxPAPRtmp.PTS;
            SimulationTime.PTS(n) = SimulationTimetmp.PTS;
            SER.PTS(n) = SERtmp.PTS;
            CCDF.PTS.x(n, 1 : length(CCDFtmp.PTS.x)) = CCDFtmp.PTS.x;
            CCDF.PTS.y(n, 1 : length(CCDFtmp.PTS.y)) = CCDFtmp.PTS.y;
        end
    end
end