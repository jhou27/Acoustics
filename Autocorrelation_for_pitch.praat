#编写者：李云靖 南开大学外国语学院。2009-11-3
#使用方法：
#1、点击Sound窗口中的File菜单中的Open editor scritp，浏览打开本脚本。
#2、确认Sound窗口中显示基频蓝线。如果没有显示的话，点击Pitch菜单中的Show pitch。
#3、在Sound窗口中选中要提取基频的那段声音，
#4、运行该脚本，在弹出的对话框中输入这段基频的名称，点OK。
#5、完了！
#Enjoy！
form 十点基频
   word label a
endform
start = Get start of selection
end = Get end of selection
printline
print 'label$''tab$'
for i from 0 to 9
   time = start + ((end-start)/9)*i
   Move cursor to... time
   pitch = Get pitch
   print 'pitch:0'
   if i < 9
      printtab
   endif
endfor
Select... start end
