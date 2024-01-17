classdef AudioVisualizer
    methods(Static)
        function plotWaveform(axes, data, sampleRate)
            cla(axes, 'reset');
            
            % Vytvorenie časovej osi
            timeAxis = (1:length(data(:,1))) / sampleRate;

            plot(axes, timeAxis, data(:,1), 'b', timeAxis, data(:,2), 'r');
            title(axes, 'Vlnová forma (stereo)');
            xlabel(axes, 'Čas [s]');
            ylabel(axes, 'Amplitúda');
            legend(axes, {'Ľavý kanál', 'Pravý kanál'});
            grid(axes, 'on');
            axis(axes, 'tight');
        end

        function updateWaveformPlot(axes, data, sampleRate, showLeft, showRight)
            cla(axes, 'reset'); 
            timeAxis = (1:length(data(:,1))) / sampleRate;
            legendInfo = {}; 
            handles = []; 
        
            if showLeft
                h1 = plot(axes, timeAxis, data(:,1), 'b'); 
                hold(axes, 'on'); 
                legendInfo{end+1} = 'Ľavý kanál';
                handles(end+1) = h1;
            end
            if showRight
                h2 = plot(axes, timeAxis, data(:,2), 'r');
                legendInfo{end+1} = 'Pravý kanál';
                handles(end+1) = h2;
            end
            hold(axes, 'off'); 
        
            title(axes, 'Vlnová forma');
            xlabel(axes, 'Čas [s]');
            ylabel(axes, 'Amplitúda');
            grid(axes, 'on');
            if ~isempty(handles)
                legend(axes, handles, legendInfo);
            end
            axis(axes, 'tight');
        end

        function plotFrequency(axes, frequency, magnitude)
            cla(axes, 'reset'); 
            
            plot(axes, frequency, magnitude);
            title(axes, 'Frekvenčné spektrum');
            xlabel(axes, 'Frekvencia [Hz]');
            ylabel(axes, 'Magnitúda');
            grid(axes, 'on');
            axis(axes, 'tight');
        end
    end
end
