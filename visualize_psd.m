%% visualize PSD of data
function [] = visualize_psd(input)
    [pxx,f] = pwelch(input - mean(input),[],[],[],1);
    plot(f,10*log10(pxx));
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    set(gca,'fontsize',16);
    title('PSD of resampled latitude data');
end