########
# This script is part two of three in creating a 10-step continuum. It should only be run after the pitch script has been run.
# If you altered the pitch script, either the naming scheme or the quantity of wave files created,
# it will probably not work properly unless you make some changes.
# This script will open the 10 tokens, created during the pitch modifications, with the naming convention: nn<space>word.<extension> e.g., '05 bark.wav'
# along with two textGrids word.TextGrid e.g., bark.TextGrid.
# These textGrids should mark the total duration of the vowel following a stop, or preceeding a stop if the consonant is found in word-final position, on interval tier number 1.
# The first textGrid is that of the original file used as the default to alter the pitch.
# The second textGrid is the counterpart to the file used to take the pitch measurements for the far end of the continuum.  
# The textGrids must be in the same directory as the 10 token files
#
# Written by: Jesse Stewart - stewart.jesse@usask.ca
# For additional information, check out this guide: https://copy.com/FqnejEgL1fCzhnkX
#
# I make no claims that this file will work on anything other than Windows 7 (on my computer).
# 
# PS I'm not a programmer. Apologies for the lack of succinctness.
########

form Manipulate Duration across a 10-step continuum
	comment Where do you keep your sound files and textGrids? (Win users - don't forget the final '\')
		text directory C:\...\
	comment Sound file extension:
		optionmenu file_type: 1
		option .wav
		option .aiff	
		option .mp3
		option .aifc
		option .au
		option .nist
		option .flac
		option .kay
	comment What's the name of the original default token used to alter the files by pitch?
		text defFile park
	comment What's the name of the original counterpart token from the one above?
		text conFile bark
endform

#Opens files
Read from file: "'directory$'01 'defFile$''file_type$'"
Read from file: "'directory$'02 'defFile$''file_type$'"
Read from file: "'directory$'03 'defFile$''file_type$'"
Read from file: "'directory$'04 'defFile$''file_type$'"
Read from file: "'directory$'05 'defFile$''file_type$'"
Read from file: "'directory$'06 'defFile$''file_type$'"
Read from file: "'directory$'07 'defFile$''file_type$'"
Read from file: "'directory$'08 'defFile$''file_type$'"
Read from file: "'directory$'09 'defFile$''file_type$'"
Read from file: "'directory$'10 'defFile$''file_type$'"
Read from file: "'directory$''defFile$'.TextGrid"
Read from file: "'directory$''conFile$'.TextGrid"

#Selects the textGrid of the original token used alter the tokens by pitch
selectObject: "TextGrid 'defFile$'"

#Gets the time points of the of the first and second intervals
durP1 = Get start point: 1, 2
durP2 = Get end point: 1, 2

durPMid = (durP2+durP1)/2



##Selects the textGrid of the counterpart to the original token used alter the tokens by pitch
selectObject: "TextGrid 'conFile$'"

#Gets the time points of the of the first and second intervals
conP1 = Get start point: 1, 2
conP2 = Get end point: 1, 2

######
#Length calculations
######
#Total length of the area selected in the textgrid (original)
durTotal=durP2-durP1

#Total length of the area selected in the textgrid (counterpart)
conTotal=conP2-conP1

#Difference between the original and counterpart tokens. 
#The original token will remain the base token for altering the length, so if it's longer
#than the counterpart, it needs to be shorten (assigned a negative value).
#if it's shorter, than the counterpart token it needs to be lengthened (assigned a positive value).

diff = conTotal-durTotal

#Difference per step
durStep = diff/9

#Calculates the duration of each step along the continuum

s1 = durTotal
s2 = s1+durStep
s3 = s2+durStep
s4 = s3+durStep
s5 = s4+durStep
s6 = s5+durStep
s7 = s6+durStep
s8 = s7+durStep
s9 = s8+durStep
s10 = s9+durStep

#Scale the duration based on a factor of 1. 1.n = longer. 0.n = shorter

s1Scale = durTotal/durTotal
s2Scale = s2/durTotal
s3Scale = s3/durTotal
s4Scale = s4/durTotal
s5Scale = s5/durTotal
s6Scale = s6/durTotal
s7Scale = s7/durTotal
s8Scale = s8/durTotal
s9Scale = s9/durTotal
s10Scale = s10/durTotal

#Modifying the durations selected in the 'original' textGrid along the continuum. 10 files should be created.

selectObject: "Sound 01_'defFile$'"

To Manipulation: 0.01, 75, 600
Extract duration tier
Add point: 'durP1', 1
Add point: 'durPMid', s1Scale
Add point: 'durP2', 1

selectObject: "Manipulation 01_'defFile$'"
plusObject: "DurationTier 01_'defFile$'"
Replace duration tier
selectObject: "Manipulation 01_'defFile$'"
Get resynthesis (overlap-add)
Save as WAV file: "'directory$'Dur_01_'defFile$''file_type$'"



selectObject: "Sound 02_'defFile$'"

To Manipulation: 0.01, 75, 600
Extract duration tier
Add point: 'durP1', 1
Add point: 'durPMid', s2Scale
Add point: 'durP2', 1

selectObject: "Manipulation 02_'defFile$'"
plusObject: "DurationTier 02_'defFile$'"
Replace duration tier
selectObject: "Manipulation 02_'defFile$'"
Get resynthesis (overlap-add)
Save as WAV file: "'directory$'Dur_02_'defFile$''file_type$'"




selectObject: "Sound 03_'defFile$'"

To Manipulation: 0.01, 75, 600
Extract duration tier
Add point: 'durP1', 1
Add point: 'durPMid', s3Scale
Add point: 'durP2', 1

selectObject: "Manipulation 03_'defFile$'"
plusObject: "DurationTier 03_'defFile$'"
Replace duration tier
selectObject: "Manipulation 03_'defFile$'"
Get resynthesis (overlap-add)
Save as WAV file: "'directory$'Dur_03_'defFile$''file_type$'"




selectObject: "Sound 04_'defFile$'"

To Manipulation: 0.01, 75, 600
Extract duration tier
Add point: 'durP1', 1
Add point: 'durPMid', s4Scale
Add point: 'durP2', 1

selectObject: "Manipulation 04_'defFile$'"
plusObject: "DurationTier 04_'defFile$'"
Replace duration tier
selectObject: "Manipulation 04_'defFile$'"
Get resynthesis (overlap-add)
Save as WAV file: "'directory$'Dur_04_'defFile$''file_type$'"




selectObject: "Sound 05_'defFile$'"

To Manipulation: 0.01, 75, 600
Extract duration tier
Add point: 'durP1', 1
Add point: 'durPMid', s5Scale
Add point: 'durP2', 1

selectObject: "Manipulation 05_'defFile$'"
plusObject: "DurationTier 05_'defFile$'"
Replace duration tier
selectObject: "Manipulation 05_'defFile$'"
Get resynthesis (overlap-add)
Save as WAV file: "'directory$'Dur_05_'defFile$''file_type$'"




selectObject: "Sound 06_'defFile$'"

To Manipulation: 0.01, 75, 600
Extract duration tier
Add point: 'durP1', 1
Add point: 'durPMid', s6Scale
Add point: 'durP2', 1

selectObject: "Manipulation 06_'defFile$'"
plusObject: "DurationTier 06_'defFile$'"
Replace duration tier
selectObject: "Manipulation 06_'defFile$'"
Get resynthesis (overlap-add)
Save as WAV file: "'directory$'Dur_06_'defFile$''file_type$'"




selectObject: "Sound 07_'defFile$'"

To Manipulation: 0.01, 75, 600
Extract duration tier
Add point: 'durP1', 1
Add point: 'durPMid', s7Scale
Add point: 'durP2', 1

selectObject: "Manipulation 07_'defFile$'"
plusObject: "DurationTier 07_'defFile$'"
Replace duration tier
selectObject: "Manipulation 07_'defFile$'"
Get resynthesis (overlap-add)
Save as WAV file: "'directory$'Dur_07_'defFile$''file_type$'"




selectObject: "Sound 08_'defFile$'"

To Manipulation: 0.01, 75, 600
Extract duration tier
Add point: 'durP1', 1
Add point: 'durPMid', s8Scale
Add point: 'durP2', 1

selectObject: "Manipulation 08_'defFile$'"
plusObject: "DurationTier 08_'defFile$'"
Replace duration tier
selectObject: "Manipulation 08_'defFile$'"
Get resynthesis (overlap-add)
Save as WAV file: "'directory$'Dur_08_'defFile$''file_type$'"




selectObject: "Sound 09_'defFile$'"

To Manipulation: 0.01, 75, 600
Extract duration tier
Add point: 'durP1', 1
Add point: 'durPMid', s9Scale
Add point: 'durP2', 1

selectObject: "Manipulation 09_'defFile$'"
plusObject: "DurationTier 09_'defFile$'"
Replace duration tier
selectObject: "Manipulation 09_'defFile$'"
Get resynthesis (overlap-add)
Save as WAV file: "'directory$'Dur_09_'defFile$''file_type$'"




selectObject: "Sound 10_'defFile$'"

To Manipulation: 0.01, 75, 600
Extract duration tier
Add point: 'durP1', 1
Add point: 'durPMid', s10Scale
Add point: 'durP2', 1

selectObject: "Manipulation 10_'defFile$'"
plusObject: "DurationTier 10_'defFile$'"
Replace duration tier
selectObject: "Manipulation 10_'defFile$'"
Get resynthesis (overlap-add)
Save as WAV file: "'directory$'Dur_10_'defFile$''file_type$'"

select all
Remove


clearinfo
print That should be it!'newline$'
print Send any comments to Jesse Stewart - stewart.jesse@usask.ca'newline$''newline$'
print _________________________________________________________'newline$'
print TG1-duration of point 1:'tab$''durP1:4''newline$'
print TG1-Duration of point 2:'tab$''durP2:4''newline$'
print TG1-Duration between 1&2:'tab$''durPMid:4''newline$''newline$'
print TG2-Duration of point 1:'tab$''conP1:4''newline$'
print TG2-Duration of point 2:'tab$''conP2:4''newline$''newline$'
print Total duration of TG1:'tab$''durTotal:4''newline$'
print Total duration of TG2:'tab$''conTotal:4''newline$''newline$'
print Difference between TGs:'tab$''diff:4''newline$'
print Duration between steps:'tab$''durStep:4''newline$''newline$'
print StepDur'tab$'ScaleDur'newline$'
print 's1:4''tab$''s1Scale:4''newline$'
print 's2:4''tab$''s2Scale:4''newline$'
print 's3:4''tab$''s3Scale:4''newline$'
print 's4:4''tab$''s4Scale:4''newline$'
print 's5:4''tab$''s5Scale:4''newline$'
print 's6:4''tab$''s6Scale:4''newline$'
print 's7:4''tab$''s7Scale:4''newline$'
print 's8:4''tab$''s8Scale:4''newline$'
print 's9:4''tab$''s9Scale:4''newline$'
print 's10:4''tab$''s10Scale:4''newline$'