function plotOnsets(audio, Fs, audio_fileName, onsets)
% This function plots audio with a title based on the wav filename, plots detected onsets, and
% saves a 600dpi (journal spec) graphic as pdf. Note that a mono audio file is expected.
% Stereo audio files will be summed to mono. > 2ch audio files will just use ch1. ~PC

% Variables:
% The input variables for this function are returned by the loadResource
% function.
% - mono audio file, vector of doubles: audio
% - audio file sample rate, double: Fs
% - audio file name, string: audio_fileName

% Generate time axis
timeAxis = (1:length(audio))./Fs;

% Plot our audio
figAudio = figure;
plot(timeAxis, audio, 'k-');
ylim([-1 1]); % standard audio sample range
xlim([0 length(audio)/Fs]); % zero to end sample of audio
title('Audio and Onsets', 'FontSize', 24); % A sensible title
xlabel("Time, seconds"); % And sensible axis names
ylabel("Amplitude");
ax = gca; % Get ready for some axis formatting
ax.FontName = "Times"; % Times font standard
ax.FontSize = 24;
figAudio.WindowState = 'maximized'; % Keep everything the same size

% Plot our onsets
for i = 1:length(onsets)
    xline(onsets(i, 1), '-r', 'LineWidth', 1);
end

figAudio_fileName = sprintf("%s_onsetPlot.pdf", audio_fileName); % Generate a filename
exportgraphics(figAudio, figAudio_fileName, 'Resolution', 600); % Save hi-res pdf graphic
