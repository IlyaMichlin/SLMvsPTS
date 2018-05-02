% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                                                         %
%  Random phase generator                                                 %
%                                                                         %
%  Input parameters:                                                      %
%  PhaseRes        : Phase matrix resolution                              %
%  Iterations      : Number of rotation tries                             %
%  PhaseNumber     : Number of QAM symbols in OFDM symbol                 %
%                                                                         %
%  Output parameters:                                                     %
%  Pm              : Set of complex phases                                %
%                                                                         %
%  Written by: Ilya Michlin                                               %
%                                                                         %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

function [Pm] = RandomPhases(PhaseRes, Iterations, PhaseNumber)
    % Generate phases
    phases = zeros(1, PhaseRes);
    for n = 1 : PhaseRes
        phases(n) = exp(1i * 2 * pi / PhaseRes * (n - 1));
    end
    
    % Pm construction
    rotations = randi([1 PhaseRes], PhaseNumber, Iterations);
    Pm = ones(PhaseNumber, Iterations + 1);
    for n = 1 : PhaseNumber * Iterations
        Pm(n) = phases(rotations(n));
    end
end