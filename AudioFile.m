classdef AudioFile
    properties
        FilePath % cesta k súboru
        Data % audio dáta
        SampleRate % vzorkovacia frekvencia
    end
    
    methods
        function obj = AudioFile(filePath)
            % Konštruktor, načíta zvukový súbor
            if nargin > 0
                [obj.Data, obj.SampleRate] = audioread(filePath);
                obj.FilePath = filePath;
            end
        end
    end
end
