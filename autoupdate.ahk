sleep 2000
new_version := URLDownloadToVar("https://raw.githubusercontent.com/forest38asd/MedicBinderByForest/master/version.txt")
ScriptName := substr(A_ScriptName, 1, -4)
MsgBox % ScriptName
return

new_file_name = %new_version%%A_ScriptName%
FileDelete, %ScriptName%
FileMove, %new_file_name%, %ScriptName%
Run, %ScriptName%
exit

URLDownloadToVar(url){
	hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	hObject.Open("GET",url)
	hObject.Send()
	return hObject.ResponseText
}