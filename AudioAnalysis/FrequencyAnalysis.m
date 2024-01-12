classdef FrequencyAnalysis < AudioAnalysis
    methods
        function result = analyze(obj)
            % Vykonanie rýchlej Fourierovej transformácie (FFT)
            N = length(obj.Data);
            fftData = fft(obj.Data);
            
            % Výpočet frekvenčného spektra
            P2 = abs(fftData / N);
            P1 = P2(1:N/2+1);
            P1(2:end-1) = 2*P1(2:end-1);
            f = (0:(N/2)) / N;

            % Vytvorenie štruktúry na uchovanie výsledkov
            result = struct('frequency', f, 'magnitude', P1);
        end
    end
end
