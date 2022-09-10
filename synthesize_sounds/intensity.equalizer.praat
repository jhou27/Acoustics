############################
#
#  Scales the intensity of all the files
#  in a specified directory to be equal.
#
############################


form Scale intensity
	comment Directory of sound files
	text sound_directory D:\Documents\Classes_winter2018\LabPhonology\Homework\HW2\exp_test\
	sentence Sound_file_extension .wav
	comment Directory for resulting files
	text end_directory D:\Documents\Classes_winter2018\LabPhonology\Homework\HW2\exp_test\equalized\
	comment Scale to what intensity
	positive intensity 70.0
endform

# Here, you make a listing of all the sound files in a directory.

Create Strings as file list... list 'sound_directory$'*'sound_file_extension$'
numberOfFiles = Get number of strings


for ifile to numberOfFiles
	# A sound file is opened from the listing:

	filename$ = Get string... ifile
	Read from file... 'sound_directory$''filename$'

	# Scale intensity

	Scale intensity... intensity

	# Save resulting file

	Write to WAV file... 'end_directory$''filename$'

	select Strings list
endfor

select all
Remove
	