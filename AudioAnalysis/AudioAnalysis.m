classdef (Abstract) AudioAnalysis
    properties
        Data % audio dáta
    end
    
    methods
        function obj = AudioAnalysis(data)
            obj.Data = data;
        end
    end
    
    methods (Abstract)
        result = analyze(obj)
    end
end
