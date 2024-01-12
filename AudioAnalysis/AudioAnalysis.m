classdef (Abstract) AudioAnalysis
    properties
        Data % audio dáta
    end
    
    methods
        function obj = AudioAnalysis(data)
            % Konštruktor, inicializuje objekt s audio dátami
            obj.Data = data;
        end
    end
    
    methods (Abstract)
        result = analyze(obj)
        % Abstraktná metóda, ktorá musí byť implementovaná v podtriedach
    end
end
