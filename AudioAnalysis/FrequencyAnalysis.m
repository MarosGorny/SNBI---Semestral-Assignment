classdef FrequencyAnalysis < AudioAnalysis
    properties
        SampleRate % Sampling frequency
    end

    methods
        function obj = FrequencyAnalysis(data, Fs)
            obj@AudioAnalysis(data);
            obj.SampleRate = Fs;
        end

        function result = analyze(obj)
            N = length(obj.Data);
            windowedData = obj.applyHannWindow(N);

            % Subtract the mean to remove Direct Current component (offset of signal)
            windowedData = windowedData - mean(windowedData);

            %Fast Fourier transform (FFT)
            fftData = fft(windowedData);

            % Calculate the two-sided spectrum
            P2 = abs(fftData / N);

            % Compute the single-sided spectrum
            P1 = P2(1:N/2+1);
            P1(2:end-1) = 2 * P1(2:end-1);

            % Define the frequency domain f
            f = obj.SampleRate * (0:(N/2)) / N;

            result = struct('frequency', f, 'magnitude', P1);
        end
    end
    
    %Hannovo okno je druh okna, ktoré zmenšuje amplitúdy na krajoch vzorky a je užitočné na minimalizáciu úniku spektra pri FFT
    methods (Access = private)
        function windowedData = applyHannWindow(obj, length)
            N = length;
            n = 0:N-1; 
            hannWindow = 0.5 * (1 - cos(2 * pi * n / (N - 1))); 
            windowedData = obj.Data .* hannWindow';
        end
    end
end
