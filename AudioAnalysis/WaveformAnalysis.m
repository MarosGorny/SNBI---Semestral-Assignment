classdef WaveformAnalysis < AudioAnalysis
    methods
        function result = analyze(obj)
            result = obj.Data; 
        end

        function segmentStats = analyzeBySegments(obj, segmentLength)
            numSegments = floor(length(obj.Data) / segmentLength);
            segmentStats = cell(numSegments, 1); 
            
            for i = 1:numSegments
                segmentStart = (i-1)*segmentLength + 1;
                segmentEnd = i*segmentLength;
                segmentData = obj.Data(segmentStart:segmentEnd, :);
                
                maxVal = max(max(segmentData));
                minVal = min(min(segmentData));
                meanVal = mean(mean(segmentData));
                varVal = var(segmentData(:));
                
                segmentStats{i} = struct('maxValue', maxVal, ...
                                         'minValue', minVal, ...
                                         'meanValue', meanVal, ...
                                         'variance', varVal);
            end
        end


        function stats = computeStatistics(obj)
            maxValLeft = max(obj.Data(:,1));
            minValLeft = min(obj.Data(:,1));
            meanValLeft = mean(obj.Data(:,1));
            varValLeft = var(obj.Data(:,1));
            
            maxValRight = max(obj.Data(:,2));
            minValRight = min(obj.Data(:,2));
            meanValRight = mean(obj.Data(:,2));
            varValRight = var(obj.Data(:,2));
        
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
