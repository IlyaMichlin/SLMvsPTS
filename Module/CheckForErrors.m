% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                                                         %
%  Check for errors in the configuration                                  %
%                                                                         %
%  Input parameters:                                                      %
%  Config          : General simulation configuration                     %
%  Parameter       : Parameter to be change                               %
%  Values          : Range of values to simulate                          %
%                                                                         %
%  Output parameters:                                                     %
%  Error           : String describing the error                          %
%                                                                         %
%  Written by: Ilya Michlin                                               %
%                                                                         %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

function [Error] = CheckForErrors(Config, Parameter, Values)
    %% Initialize
    Error = '';
    % q = Config.N / Config.L;
    
    %% Check Errors
    if Config.SimulateOFDM == 0 && Config.SimulateSLM == 0 && Config.SimulatePTS == 0
       Error = 'ERROR: No simulation selected';
    elseif Config.Carriers > Config.N && Config.Carriers ~= 0
        Error = 'ERROR: Too many carriers';
    end
    
    % Check File Parameters
    if Parameter ~= 1 && isempty(Values)
        Error = 'ERROR: File is empty';
    elseif Parameter ~= 1
        for n = 1 : size(Values)
            if isempty(Values(n))
                Error = ['ERROR: File Line ' num2str(n) ': Empty parameter'];
            elseif Parameter == 2 && Values(n) ~= 4 && Values(n) ~= 16 && Values(n) ~= 64 && Values(n) ~= 256
                Error = ['ERROR: File Line ' num2str(n) ': Illigal QAM modulation'];
            elseif Parameter == 3 && Values(n) ~= 4 && Values(n) ~= 8 && Values(n) ~= 16 && Values(n) ~= 32 && Values(n) ~= 64 && Values(n) ~= 128 && Values(n) ~= 256 && Values(n) ~= 512 && Values(n) ~= 1024 && Values(n) ~= 2048
                Error = ['ERROR: File Line ' num2str(n) ': Illigal FFT size'];
            elseif Parameter == 3 && Config.SimulatePTS == 1 && Config.PTSPartitions > Values(n) / Config.L
                Error = ['ERROR: File Line ' num2str(n) ': FFT size to low for PTS'];
            elseif Parameter == 4 && Config.SimulatePTS == 1 && Config.PTSPartitions > Config.N / Values(n)
                Error = ['ERROR: File Line ' num2str(n) ': To many PTS partitions for parameters'];
            elseif Parameter == 5 && Values(n) < 1
                Error = ['ERROR: File Line ' num2str(n) ': Less than 1 phases'];
            elseif Parameter == 6 && Values(n) ~= 2 && Values(n) ~= 4 && Values(n) ~= 8 && Values(n) ~= 16 && Values(n) ~= 32 && Values(n) ~= 64 && Values(n) ~= 128 && Values(n) ~= 256 && Values(n) ~= 512 && Values(n) ~= 1024
                Error = ['ERROR: File Line ' num2str(n) ': Illigal PTS partition size'];
            elseif Parameter == 7 && Config.SimulatePTS == 1
                Error = ['ERROR: File Line ' num2str(n) ': To many PTS partitions for parameters'];
            end
        end
    end
end