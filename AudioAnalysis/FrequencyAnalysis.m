classdef FrequencyAnalysis < AudioAnalysis
    properties
        SampleRate % Sampling frequency
    end

    methods
        function obj = FrequencyAnalysis(data, Fs)
            obj@AudioAnalysis(data); % Call the superclass constructor
            obj.SampleRate = Fs;
        end

        function result = analyze(obj)
            % Perform the fast Fourier transform (FFT)
            N = length(obj.Data);

            % Apply a Hann window to the data
            windowedData = obj.applyHannWindow();

            % Subtract the mean to remove DC component
            windowedData = windowedData - mean(windowedData);

            fftData = fft(windowedData);

            % Calculate the two-sided spectrum
            P2 = abs(fftData / N);

            % Compute the single-sided spectrum
            P1 = P2(1:N/2+1);
            P1(2:end-1) = 2 * P1(2:end-1);

            % Define the frequency domain f
            f = obj.SampleRate * (0:(N/2)) / N;

            % Create a structure to hold the results
            result = struct('frequency', f, 'magnitude', P1);
        end
    end
    
    methods (Access = private)
        function windowedData = applyHannWindow(obj)
            N = length(obj.Data);
            n = 0:N-1; % n is a vector from 0 to N-1
            hannWindow = 0.5 * (1 - cos(2 * pi * n / (N - 1))); % Manual Hann window calculation
            windowedData = obj.Data .* hannWindow'; % Apply the Hann window
        end
    end
end
