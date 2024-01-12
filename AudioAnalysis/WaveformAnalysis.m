classdef WaveformAnalysis < AudioAnalysis
    methods
        % Implementácia abstraktnej metódy 'analyze'
        function result = analyze(obj)
            % Táto implementácia môže vrátiť dáta vhodné pre vykreslenie vlnovej formy
            result = obj.Data; % Jednoduché vrátenie audio dát
        end

        % Metóda na segmentovú analýzu pre stereo signál
        function stats = analyzeBySegments(obj, segmentLength)
            numSegments = floor(length(obj.Data) / segmentLength);
            stats = struct('maxValues', [], 'minValues', [], 'meanValues', [], 'variances', []);
            
            for i = 1:numSegments
                segmentStart = (i-1)*segmentLength + 1;
                segmentEnd = i*segmentLength;
                segmentData = obj.Data(segmentStart:segmentEnd, :); % Data for both channels
                
                % Pre stereo dáta, môžeš vypočítať štatistiky takto:
                stats.maxValues(end+1) = max(max(segmentData));
                stats.minValues(end+1) = min(min(segmentData));
                stats.meanValues(end+1) = mean(mean(segmentData));
                stats.variances(end+1) = var(segmentData(:)); % Variance of flattened segment
            end
        end

        % Dodatočná metóda na výpočet štatistických údajov
        function stats = computeStatistics(obj)
            maxValLeft = max(obj.Data(:,1));
            minValLeft = min(obj.Data(:,1));
            meanValLeft = mean(obj.Data(:,1));
            varValLeft = var(obj.Data(:,1));
            
            maxValRight = max(obj.Data(:,2));
            minValRight = min(obj.Data(:,2));
            meanValRight = mean(obj.Data(:,2));
            varValRight = var(obj.Data(:,2));
        
            % Vytvorenie štruktúry na uchovanie štatistických údajov pre oba kanály
            stats = struct('maxValueLeft', maxValLeft, ...
                           'minValueLeft', minValLeft, ...
                           'meanValueLeft', meanValLeft, ...
                           'varianceLeft', varValLeft, ...
                           'maxValueRight', maxValRight, ...
                           'minValueRight', minValRight, ...
                           'meanValueRight', meanValRight, ...
                           'varianceRight', varValRight);
        end
    end
end
