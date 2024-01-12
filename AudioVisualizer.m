classdef AudioVisualizer
    methods(Static)
        function plotWaveform(axes, data, sampleRate)
            % Vytvorenie časovej osi
            timeAxis = (1:length(data)) / sampleRate;

            % Vykreslenie vlnovej formy
            plot(axes, timeAxis, data);
            title(axes, 'Vlnová forma');
            xlabel(axes, 'Čas [s]');
            ylabel(axes, 'Amplitúda');
            grid(axes, 'on');
            axis(axes, 'tight');
        end

        function plotFrequency(axes, frequency, magnitude)
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
