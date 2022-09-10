function [signal, t] = make_buzz (srate, f0, dur)% make_buzz.m% Louis Goldstein% Feb 1, 2000% create a buzz signal (pulse train) by adding together all harmonics% of the requested f0% output arguments:% signal		buzz signal sample values% input arguments:% srate			sampling rate in Hz% f0			fundamental frequency in Hz	% duration		duration in secondst = 0:1/srate:dur;signal = zeros (1, length(t));for freq = f0 : f0: srate/2	omega = 2*pi*freq;	signal = signal + cos(omega*t);end%soundsc(signal, srate)