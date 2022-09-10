form Save multiple sound files
	comment Select all your sound files.
	sentence Directory c:/test/
endform

blah = numberOfSelected ("Sound")
for x from 1 to blah
 sound'x'= selected ("Sound",x)  
endfor

for x from 1 to blah
 select sound'x'
 name$ = selected$ ("Sound")
 Save as WAV file... 'directory$''name$'.wav
endfor

clearinfo
print That should be it! 'newline$'
print Question? Ask!: Jesse Stewart - stewart.jesse@usask.ca