###############################################
## standardize.praat
##
## This script standardizes all sounds in a directory
## in terms of intensity, pitch median, and/or duration.
## Saves new versions in a user-specified directory. 
## 
## Note that the pitch track needs to be correct for all sounds
## using the user-specified pitch ceiling and floor
## in order to the manipulation to work correctly.
##
## jessamyn.schertz@utoronto.ca
## July 10, 2018
##
###############################################

beginPause: "User input"
	word: "dataDir", "sounds_original/"
	word: "outDir", "sounds_new/"
	comment: "For all parameters, leave at 0 for no manipulation"
	comment: "Scale intensity to (dB):"
	real: "targetInt", 70
	comment: "Scale pitch median to (Hz):"
	real: "targetPitchMedian", 200
	comment: "Scale duration to (seconds):"
	real: "targetDur", 5
	comment: "Pitch floor/ceiling only relevant if pitch is manipulated."
	real: "pitchFloor", 85
	real: "pitchCeiling", 350
endPause: "Continue", 1

files = Create Strings as file list: "", dataDir$+"*.wav"
numFiles = Get number of strings

## Loop through files

for file from 1 to numFiles
	select files
	filename$ = Get string: file
	sound = Read from file: dataDir$+filename$

	if targetPitchMedian != 0 or targetDur != 0
		call pitchDurManip
	endif
	if targetInt != 0
		call intManip
	endif
	
	select sound
	Save as WAV file: outDir$+filename$

	select all
	minus files
	Remove
endfor

procedure pitchDurManip
	select sound
	durFactor = 1
	if targetDur != 0
		dur = Get total duration
		durFactor = targetDur/dur		
	endif
	sound = Change gender: pitchFloor, pitchCeiling, 1, targetPitchMedian, 1, durFactor
endproc

procedure intManip
	select sound
	Scale intensity: targetInt
endproc














