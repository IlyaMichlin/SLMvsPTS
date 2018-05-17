% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                                                         %
%  Displayes PAPR simulation results                                      %
%                                                                         %
%  Input parameters:                                                      %
%  Config          : General simulation configuration                     %
%  CCDF            : CCDF simulation results                              %
%  Legend          : The legend for display                               %
%                                                                         %
%  Written by: Ilya Michlin                                               %
%                                                                         %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

function PAPRDisplay_View(Config, CCDF, Legend)
    %% Initialize
    [OriginalLength, ~] = size(CCDF.Original.x);
    [SLMLength, ~] = size(CCDF.SLM.x);
    [PTSLength, ~] = size(CCDF.PTS.x);
    DataLength = max([OriginalLength SLMLength PTSLength]);
    
    %% Display
    hold on
    grid on
    
    xlabel('PAP (dB)')
    ylabel('CCDF (dB)')
    xlim([min(min([CCDF.Original.x CCDF.SLM.x CCDF.PTS.x])) (max(max([CCDF.Original.x CCDF.SLM.x CCDF.PTS.x])) * 1.05)])
    ylim([min(min([CCDF.Original.y CCDF.SLM.y CCDF.PTS.y])) 0])
    
    for n = 1 : DataLength
        % OFDM With No PAPR Reduction
        if Config.SimulateOFDM ~= 0
            xDisplay = [CCDF.Original.x(n, 1 : 4).'; nonzeros(CCDF.Original.x(n, 5 : end))];
            yDisplay = [CCDF.Original.y(n, 1 : 4).'; nonzeros(CCDF.Original.y(n, 5 : end))];
            plot(xDisplay, yDisplay, 'DisplayName', ['Original ' Legend(n, 1 : end)]);
        end
        
        % OFDM With SLM
        if Config.SimulateSLM ~= 0
            xDisplay = [CCDF.SLM.x(n, 1 : 4).'; nonzeros(CCDF.SLM.x(n, 5 : end))];
            yDisplay = [CCDF.SLM.y(n, 1 : 4).'; nonzeros(CCDF.SLM.y(n, 5 : end))];
            plot(xDisplay, yDisplay, '--', 'DisplayName', ['SLM ' Legend(n, 1 : end)]);
        end
        
        % OFDM With PTS
        if Config.SimulatePTS ~= 0
            xDisplay = [CCDF.PTS.x(n, 1 : 4).'; nonzeros(CCDF.PTS.x(n, 5 : end))];
            yDisplay = [CCDF.PTS.y(n, 1 : 4).'; nonzeros(CCDF.PTS.y(n, 5 : end))];
            plot(xDisplay, yDisplay, '-.', 'DisplayName', ['PTS ' Legend(n, 1 : end)]);
        end
    end
    pause(1)
    legend('show')
    
    hold off
end