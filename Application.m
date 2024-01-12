classdef Application
    properties
        AudioFileObj % Objekt triedy AudioFile
        ProcessedData % Spracované audio dáta
    end
    
    methods
        function obj = Application(filePath)
            % Vytvorí objekt triedy AudioFile
            obj.AudioFileObj = AudioFile(filePath);
        end

        function processAudio(obj)
            % Spracuje audio dáta
            obj.ProcessedData = AudioProcessor.process(obj.AudioFileObj.Data);
        end

        function visualize(obj)
            % Vykreslí výsledky
            AudioVisualizer.plotWaveform(obj.ProcessedData, obj.AudioFileObj.SampleRate);
        end
    end
end
