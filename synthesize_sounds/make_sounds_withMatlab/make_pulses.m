function [pulses, mod] = make_pulses(f0, srate, frame_dur,AV);
%
% Louis Goldstein
% November 2009
% calculate sequence of impulses based on an f0 vector
%
% Input parameters
% f0             vector of f0 values
% srate         sampling rate (Hz)
% frame_dur  duration of each f0 frame (corresponds to slide in get_f0)
% AV             vector of voicing amplitudes

frame_length = floor(frame_dur * srate / 1000);  % frame length in samples
length_f0 = length(f0);                    

% interpolate f0 so it has a value for every sample and scale in cycles/sample
cont_freq = interp(f0/srate, frame_length);
cont_AV = interp(AV,frame_length);

% calculate elapsed cycles for every sample 
elapsed_cycles = cumsum(cont_freq);

%calculate percentage way through current cycle
cycle_percent = rem(elapsed_cycles,1);

mod = double(cycle_percent<.5);     % set mod to 1 for first half of each voiced cycle
mod(cont_AV == 0) = 1;                 % set mod to 1 if if AV>0

shift = [0 cycle_percent(1:end-1)];

% set pulses (1s) and 0s elsewhere
pulses = cycle_percent<shift;  % will be true only when cycle boundary is crossed
pulses = cont_AV .* double(pulses);
