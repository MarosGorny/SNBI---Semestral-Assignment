classdef AudioFile
    properties
        FilePath % Cesta k súboru
        Data % Audio dáta
        SampleRate % Vzorkovacia frekvencia
        Duration % Dĺžka audio súboru v sekundách
    end
    
    methods
        function obj = AudioFile(data, sampleRate, filePath)
            obj.Data = data;
            obj.SampleRate = sampleRate;
            obj.FilePath = filePath;
            obj.Duration = length(data) / sampleRate;
        end
    end
    
    methods(Static)
        function obj = loadAudioFile(filePath)
            if isfile(filePath)
                [data, sampleRate] = audioread(filePath);
                obj = AudioFile(data, sampleRate, filePath);
            else
                error('Súbor neexistuje alebo nie je platným audio súborom.');
            end
        end
    end
end
