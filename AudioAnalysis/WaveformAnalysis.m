classdef WaveformAnalysis < AudioAnalysis
    methods
        % Implementácia abstraktnej metódy 'analyze'
        function result = analyze(obj)
            % Táto implementácia môže vrátiť dáta vhodné pre vykreslenie vlnovej formy
            result = obj.Data; % Jednoduché vrátenie audio dát
        end

        % Dodatočná metóda na výpočet štatistických údajov
        function stats = computeStatistics(obj)
            maxVal = max(obj.Data);
            minVal = min(obj.Data);
            meanVal = mean(obj.Data);
            varVal = var(obj.Data);

            % Vytvorenie štruktúry na uchovanie štatistických údajov
            stats = struct('maxValue', maxVal, ...
                           'minValue', minVal, ...
                           'meanValue', meanVal, ...
                           'variance', varVal);
        end
    end
end
