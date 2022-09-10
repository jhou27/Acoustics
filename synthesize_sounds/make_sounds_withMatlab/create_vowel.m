strng = "vowel_testJul";
%strng = "ship1-1";
ans = syn5(44100,5,5,(strng+".txt"))
audiowrite((strng+".wav"),(ans./(max(abs(ans))+.0001)),44100)

strng = "vowel_testJul6";
%strng = "ship1-1";
ans = syn5(44100,5,5,(strng+".txt"))
audiowrite((strng+".wav"),(ans./(max(abs(ans))+.0001)),44100)



strng = "ship1-1";
ans = syn5(16000,5,5,(strng+".txt"))
audiowrite((strng+".wav"),(ans./(max(abs(ans))+.0001)),16000)