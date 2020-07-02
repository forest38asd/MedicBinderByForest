if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
   ExitApp
}
sleep 2000
new_version := URLDownloadToVar("https://raw.githubusercontent.com/forest38asd/MedicBinderByForest/master/version.txt")
ScriptName := substr(A_ScriptFullPath, 1, -4)

new_file_name = %new_version%%ScriptName%
MsgBox % new_file_name
FileDelete, %ScriptName%
FileMove, %new_file_name%, %ScriptName%
return
Run, %ScriptName%
exit

URLDownloadToVar(url){
	hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	hObject.Open("GET",url)
	hObject.Send()
	return hObject.ResponseText
}