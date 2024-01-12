classdef AudioVisualizer
    methods(Static)
        function plotWaveform(data, sampleRate)
            % Vykresli vlnovú formu
            t = (1:length(data)) / sampleRate;
            plot(t, data);
            xlabel('Čas [s]');
            ylabel('Amplitúda');
            title('Vlnová forma');
        end

        % Tu môžeš pridať ďalšie metódy na vizualizáciu, napr. frekvenčné spektrum
    end
end
