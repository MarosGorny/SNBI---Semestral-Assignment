classdef AudioVisualizer
    methods(Static)
        function plotWaveform(axes, data, sampleRate)
            cla(axes, 'reset'); % Vyčistí aktuálne osi a resetuje ich vlastnosti
            
            % Vytvorenie časovej osi
            timeAxis = (1:length(data(:,1))) / sampleRate;

            % Vykreslenie vlnovej formy pre oba kanály
            plot(axes, timeAxis, data(:,1), 'b', timeAxis, data(:,2), 'r'); % 'b' pre modrú a 'r' pre červenú
            title(axes, 'Vlnová forma (stereo)');
            xlabel(axes, 'Čas [s]');
            ylabel(axes, 'Amplitúda');
            legend(axes, {'Ľavý kanál', 'Pravý kanál'});
            grid(axes, 'on');
            axis(axes, 'tight');
        end

        function updateWaveformPlot(axes, data, sampleRate, showLeft, showRight)
            cla(axes, 'reset'); % Vyčistí aktuálne osi a resetuje ich vlastnosti
            timeAxis = (1:length(data(:,1))) / sampleRate;
            
            if showLeft
                plot(axes, timeAxis, data(:,1), 'b'); % Modrý pre ľavý kanál
                hold(axes, 'on'); % Povoliť viacnásobné vykreslenie na rovnakých osiach
            end
            if showRight
                plot(axes, timeAxis, data(:,2), 'r'); % Červený pre pravý kanál
            end
            hold(axes, 'off'); % Vypne viacnásobné vykreslenie

            title(axes, 'Vlnová forma');
            xlabel(axes, 'Čas [s]');
            ylabel(axes, 'Amplitúda');
            grid(axes, 'on');
            legend(axes, 'toggle');
            axis(axes, 'tight');
        end

        function plotFrequency(axes, frequency, magnitude)
            cla(axes, 'reset'); % Vyčistí aktuálne osi a resetuje ich vlastnosti
            
            % Vykreslenie frekvenčného spektra
            plot(axes, frequency, magnitude);
            title(axes, 'Frekvenčné spektrum');
            xlabel(axes, 'Frekvencia [Hz]');
            ylabel(axes, 'Magnitúda');
            grid(axes, 'on');
            axis(axes, 'tight');
        end
    end
end
