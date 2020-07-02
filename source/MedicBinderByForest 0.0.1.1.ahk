if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
   ExitApp
}
;================ INFO ===============
; Binder for Medic by Bogdan_Forest
current_version = 0.0.1

;============== Includes =============
#SingleInstance force
#Include ..\SAMP.ahk

#Persistent
OnExit("ExitFunc")

;============== Variables ============
FileRead, fillLogsDoneTXT, fillLogsDone.txt
fillLogsDone := StrSplit(fillLogsDoneTXT, "`n")

readyForFillToLogs := []
;============== Constants ============
pathToChatlog := "%A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt"

;============= Custom Menu ===========



;=================================================
;================== FILE CHECK ===================
;=================================================

if not FileExist("settings.ini")
{
	iniSettingsSave()
}
autoupdateFile := substr(A_ScriptName, 1, -4) . ".exe.ahk"
if FileExist(autoupdateFile)
{
	FileDelete, %autoupdateFile%
}

;=================================================
;================== AUTO UPDATE ==================
;=================================================
new_version := URLDownloadToVar("https://raw.githubusercontent.com/forest38asd/MedicBinderByForest/master/version.txt")
if (current_version != new_version)
{
	changes := URLDownloadToVar("https://raw.githubusercontent.com/forest38asd/MedicBinderByForest/master/changelog/" new_version ".txt")
	
	MsgBox, 4, Обновление скрипта, Список изменений:`n`n %changes%
	
	IfMsgBox, Yes
	{
		new_file_name = %new_version%%A_ScriptName%
		UrlDownloadToFile, https://raw.githubusercontent.com/forest38asd/MedicBinderByForest/master/versions/MedicBinderByForest`%20v%new_version%.exe, %new_file_name%
		sleep 100
		while not FileExist(new_file_name)
		{
			sleep 2000
		}
		UrlDownloadToFile, https://raw.githubusercontent.com/forest38asd/MedicBinderByForest/master/autoupdate.ahk, %A_ScriptName%.ahk
		Run, %A_ScriptName%.ahk
		ExitApp
	}
}



;========= Check if GTA is open ======

IfWinNotExist, GTA:SA:MP 
{
	Gui, Add, Text, x22 y9 w380 h40 , Для получения доступа к биндеру авторизируйтесь на сервере Samp-RP 02 server
	Gui, Show, x383 y173 h159 w428, Binder for Medics by Bogdan_Forest
	WinWait, GTA:SA:MP
	sleep 5000
}


Loop ; Проверка на авторизацию на сервере
{
	;updateScoreboardDataEx()
	if getPlayerScoreById(getId()) != 0
		break
	sleep 2000
}

Gui, Destroy

serverIP := getServerIP() ; Проверка зашел ли игрок на 02 сервер Самп-РП
if (serverIP != "185.169.134.20")
{
	Gui, Add, Text, x22 y9 w380 h40 , Данный биндер предназначен только для 02 сервера Samp-Rp.Ru
	Gui, Show, x383 y173 h159 w428, Binder for Medics by Bogdan_Forest
	return
}

userName := getUsername()
userID := getId()

RegExMatch(HttpRequest("https://script.google.com/macros/s/AKfycbw7G5hDTKCiXcj5BnhTdoONvgZZnZxnt_hZZJSj0BdN6xPJpsQ/exec?do=find&nick=" userName ""), "\\x5bNick\: (.*)\\x5d \\x5bAccess\: (.*)\\x5d", access)

if (access2 = "") { ; попробувати тут звіряти з хешом для безпеки
	Gui, Add, Text, x22 y9 w380 h40 , У вас нет доступа к этому биндеру. Обратитесь к руководству Мин.Здрава.
	Gui, Show, x383 y173 h159 w428, Binder for Medics by Bogdan_Forest
	return
}


;=================================================
;=================== CONFIGS =====================
;=================================================
; Загружаем настройки биндов

IniRead, MenuStSostavaKey, settings.ini, Hotkeys, MenuStSostavaKey
IniRead, CheckRangByIdKey, settings.ini, Hotkeys, CheckRangByIdKey
IniRead, EnterToLogsKey, settings.ini, Hotkeys, EnterToLogsKey
IniRead, CheckLastDokladyKey, settings.ini, Hotkeys, CheckLastDokladyKey


;=================================================
;====================== GUI ======================
;=================================================
;gTesting - Не понимаю почему, но не работает без этого -_-  Просто не сохраняет переменную

Gui, Add, Text, x22 y9 w380 h40 , Получен доступ под ником: %userName%. Права доступа: %access2%
Gui, Add, Hotkey, x22 y59 w80 h20 vMenuStSostavaKey, %MenuStSostavaKey%
Gui, Add, Text, x112 y62 w290 h20 , Меню ст.состава
Gui, Add, Hotkey, x22 y89 w80 h20 vCheckRangByIdKey, %CheckRangByIdKey%
Gui, Add, Text, x112 y92 w290 h20 , Проверка даты повышения по ID
Gui, Add, Hotkey, x22 y119 w80 h20 vEnterToLogsKey, %EnterToLogsKey%
Gui, Add, Text, x112 y122 w290 h20 , Автовнесение в логи
Gui, Add, Hotkey, x22 y149 w80 h20 vCheckLastDokladyKey, %CheckLastDokladyKey%
Gui, Add, Text, x112 y152 w290 h20 , Проверить последние 10 докладов
Gui, Add, Button, Default x165 y189 w100 h30, Сохранить
GuiControl, Focus, Сохранить
Gui, Show, x383 y173 h229 w448, Binder for Medics by Bogdan_Forest

;=================================================
;=================== HOTKEYS =====================
;=================================================
#IfWinActive GTA:SA:MP
if MenuStSostavaKey is not space
	Hotkey, %MenuStSostavaKey%, MenuStSostava
if CheckRangByIdKey is not space
	Hotkey, %CheckRangByIdKey%, CheckRangById
if EnterToLogsKey is not space
	Hotkey, %EnterToLogsKey%, EnterToLogs
if CheckLastDokladyKey is not space
	Hotkey, %CheckLastDokladyKey%, CheckLastDoklady

Addchatmessage("Вы успешно авторизирувались в биндере. Приятной игры!")

return
;=============== Marks ===============
ButtonСохранить:
	Gui, Submit
	iniSettingsSave()
	Reload
	return
	
GuiClose:
	ExitApp

MenuStSostava:
	IfWinActive, GTA:SA:MP
	{
		menu := 2
		ShowDialog("2", "{FFFFFF}Сообщение в рацию","{FFFFFF}1. Принять доклад.`n2. Напомнить о докладах через 2 минуты.`n3. Напомнить о докладах каждые 10 минут`n4. Напомнить об РП отыгровке`n5. Сообщить о ночной смене`n6. Сообщить о дополнительном заработке", "Enter")
		Input, checkChose, L1 V
		if (checkChose == 1)
		{
			SendInput, {Enter}
			sleep 60
			Gosub, checkdialogMenu
			return
		}
		else if (checkChose == 2)
		{
			SendInput, {Down}{Enter}
			sleep 60
			Gosub, checkdialogMenu
			return
		}
		else if (checkChose == 3)
		{
			SendInput, {Down 2}{Enter}
			sleep 60
			Gosub, checkdialogMenu
			return
		}
		else if (checkChose == 4)
		{
			SendInput, {Down 3}{Enter}
			sleep 60
			Gosub, checkdialogMenu
			return
		}
		else if (checkChose == 5)
		{
			SendInput, {Down 4}{Enter}
			sleep 60
			Gosub, checkdialogMenu
			return
		}
		else if (checkChose == 6)
		{
			SendInput, {Down 5}{Enter}
			sleep 60
			Gosub, checkdialogMenu
			return
		}
		Return
	}
	sleep 100
	return

CheckRangById:
	IfWinActive, GTA:SA:MP
	{
		showDialog("1", "Чекер повышений", "Введите id или ник игрока", "Ок")
		PlayerID := WaitForChooseInDialog(1)
		if (PlayerID = "Close") 
		{
			return
		}
		if PlayerID is not integer
		{
			addmessagetochatwindow2("{FF0000}", "{BFBFBF}[Чекер повышений] {fffafa}Ошибка при вводе ID игрока")
			return
		}

		nickForCheck := getPlayerNameById(PlayerID)
		
		RegExMatch(HttpRequest("https://script.google.com/macros/s/AKfycbyRM_oAv0dk2wOdzYXCfZl1hJKBHFvi0Ot7ZQRDGqHJGZloHhDg/exec?do=checkrang&nick=" nickForCheck ""), "\\x5bNick\: (.*)\\x5d \\x5bDate\: (.*)\\x5d \\x5bNewrang\: ([0-9])\\x5d", checkRequest)
		
		if checkRequest
		{
			Addchatmessage("{BFBFBF}[Чекер повышений]{FFFFFF} " nickForCheck "{BFBFBF}: Следующее повышение: {FFFFFF}" checkRequest2 "{BFBFBF}. Повысить до {FFFFFF}" checkRequest3 "{BFBFBF} ранга.")
		}
		else
		{
			Addchatmessage("{BFBFBF}Игрок с ником {FFFFFF}" nickForCheck "{BFBFBF} не найден в логах")
		}
		return
	}
	return

EnterToLogs:
	IfWinActive, GTA:SA:MP
	{
		FormatTime, date, SSMIHH24DDMMYYYY, dd.MM.yyyy
		Loop, Read, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt		
		{
			if A_LoopReadLine contains Вы повысили/понизили,
			{
				RegExMatch(A_LoopReadLine, "Вы повысили/понизили ([A-z]+_[A-z]+) до ([1-9]) ранга", finded)
				buffText := "[" . date . "] [Повышен] [" . finded1 . "] [" . finded2 . " ранг]"
				if HasVal(fillLogsDone, buffText)
					continue
				if HasVal(readyForFillToLogs, buffText)
					continue
				readyForFillToLogs.InsertAt(1, buffText)
			}
			if A_LoopReadLine contains Вы приняли,
			{
				RegExMatch(A_LoopReadLine, "Вы приняли ([A-z]+_[A-z]+) в Medic", finded)
				buffText := "[" . date . "] [Принят] [" . finded1 . "]"
				if HasVal(fillLogsDone, buffText)
					continue
				if HasVal(readyForFillToLogs, buffText)
					continue
				readyForFillToLogs.InsertAt(1, buffText)
			}
			if A_LoopReadLine contains Вы выгнали,
			{
				RegExMatch(A_LoopReadLine, "Вы выгнали ([A-z]+_[A-z]+) из организации. Причина: (.*)", finded)
				buffText := "[" . date . "] [Уволен] [" . finded1 . "] [" . finded2 . "]"
				if HasVal(fillLogsDone, buffText)
					continue
				if HasVal(readyForFillToLogs, buffText)
					continue
				readyForFillToLogs.InsertAt(1, buffText)
			}
			if A_LoopReadLine contains в чёрный список до,
			{
				RegExMatch(A_LoopReadLine, "([A-z]+_[A-z]+) добавил\(а\) ([A-z]+_[A-z]+) в чёрный список до .* Причина: (.*)", finded)
				if(finded1 != userName)
					continue
				buffText := "[" . date . "] [Уволен] [" . finded2 . "] [" . finded3 . "]"
				if HasVal(fillLogsDone, buffText)
					continue
				if HasVal(readyForFillToLogs, buffText)
					continue
				readyForFillToLogs.InsertAt(1, buffText)
			}
		}
		menu := 1
		showDialog("2","Внесение в логи",join(readyForFillToLogs),"ok")
		return
	}
	return

CheckLastDoklady:
	IfWinActive, GTA:SA:MP
	{
		output := []
		Loop, Read, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt		
		{
			if A_LoopReadLine contains Докладываю, докладываю, Доклад, доклад, пост, Пост, Выехал, выехал, Выезжаю, выезжаю, Дежурю, дежурю, пациентов, Пациентов, Вылечено, вылечено, отправляюсь, Отправляюсь,
			{
				if A_LoopReadLine contains Мед.Работник, Фельдшер, Интерн, Нарколог, Психиатр,
				{
					output.insert(A_LoopReadLine)
					if output.Length() > 10
					{
						output.RemoveAt(1)
					}
				}
			}
		}
		buff := join(output)
		showDialog("0","Последние доклады",buff,"Okay")
		return
	}
	return

return

;=================================================
;===================== DIALOG ====================
;=================================================
~LButton::
	Time := A_TickCount
	while(isDialogOpen())
	{
	    if (A_TickCount - Time > 500)
	    {
	  		Return
	    }
	}
checkdialogMenu:
	if (isDialogButton1Selected() == 1)
	{
	    menu := 0
	}
	ifWinNotActive, GTA:SA:MP
	{
	    return
	}
	
if (menu == 1)
{
	SendMessage, 0x50,, 0x4190419,, A
	menu := 0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)
	
	if line_text contains Повышен
	{
		RegExMatch(line_text, "\[([0-9.]+)\] \[(Повышен)\] \[([A-z]+_[A-z]+)\] \[([0-9]) ранг\]", result)
		date := result1
		who := userName
		nickname := result3
		oldrang := result4 - 1
		newrang := result4
		
		HttpRequest("https://script.google.com/macros/s/AKfycbySEy0BCbEVlwPDMqc2l2nX4YDo32arh_-mpDlPm7D6GMS_zjY/exec?do=appendlogsgiverank&date=" date "&who=" who "&nickname=" nickname "&oldrang=" oldrang "&newrang=" newrang "")
		
		fillLogsDone.Push(line_text)
		readyForFillToLogs.RemoveAt(line_num)
		addChatMessage("Добавлено в логи: " . line_text)
		return
	}
	if line_text contains Принят
	{
		RegExMatch(line_text, "\[([0-9.]+)\] \[(Принят)\] \[([A-z]+_[A-z]+)\]", result)
		date := result1
		who := userName
		nickname := result3
		
		sleep 150
		
		showDialog("1", "Ранг принятия", "Введите ранг на который вы приняли игрока ( только 1 цифра )", "Ок")
	
		newrang := WaitForChooseInDialog(1)
		
		if (newrang = "Close") 
		{
			return
		}
		
		if newrang is not integer
		{
			addmessagetochatwindow2("{FF0000}", "{fffafa}Ошибка при вводе ранга принятия")
			return
		}
		
		HttpRequest("https://script.google.com/macros/s/AKfycbySEy0BCbEVlwPDMqc2l2nX4YDo32arh_-mpDlPm7D6GMS_zjY/exec?do=appendlogsinvite&date=" date "&who=" who "&nickname=" nickname "&newrang=" newrang "")
		
		fillLogsDone.Push(line_text)
		readyForFillToLogs.RemoveAt(line_num)
		addChatMessage("Добавлено в логи: " . line_text)
		return
	}
	if line_text contains Уволен
	{
		RegExMatch(line_text, "\[([0-9.]+)\] \[(Уволен)\] \[([A-z]+_[A-z]+)\] \[(.*)\]", result)
		date := result1
		who := userName
		nickname := result3
		reason := URIEncode(result4)
		
		
		HttpRequest("https://script.google.com/macros/s/AKfycbySEy0BCbEVlwPDMqc2l2nX4YDo32arh_-mpDlPm7D6GMS_zjY/exec?do=appendlogsuninvite&date=" date "&who=" who "&nickname=" nickname "&newrang=" newrang "&reason=" reason "")
		
		fillLogsDone.Push(line_text)
		readyForFillToLogs.RemoveAt(line_num)
		addChatMessage("Добавлено в логи: " . line_text)
		return
	}
	return
}
if (menu == 2)
{
	SendMessage, 0x50,, 0x4190419,, A
	menu := 0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)
	
    if (line_num == 1)
    {
    	SendChat("/r Принято.")
    	return
    }
    else if (line_num == 2)
    {
    	SendChat("/r Жду доклады с постов через 2 минуты.")
		sleep 400
		SendChat("/r Готовим доклады заранее, чтоб вовремя сделать доклад.")
		return
    }
    else if (line_num == 3)
    {
    	SendChat("/r Не забываем делать доклады о выезде, заступлении, состоянии поста.")
		sleep 400
		SendChat("/r А так же каждые 10 минут в хх:00, хх:10, хх:20, хх:30, хх:40 и хх:50.")
		sleep 400
		SendChat("/rb И строго по /time")
		return
    }
    else if (line_num == 4)
    {
		SendChat("/rb Не забываем отыгрывать РП по максимуму. Чем больше РП, тем вы круче")
		sleep 400
		SendChat("/rb От ваших РП отыгровок зависит ваше повышение. Вы - лицо фракции")
		sleep 400
		SendChat("/rb Всегда спрашивайте что болит у пациента, чтоб знать от чего лечить")
		sleep 400
		SendChat("/rb Не подведите, ребята")
    }
    else if (line_num == 5) ;Ночная смена
    {
		SendChat("/r Уважаемые сотрудники, если вам не спится и вы хочете провести время")
		sleep 400
		SendChat("/r Во благо себе и Мин.Здраву, то самое время заступить на ночное дежурство.")
		sleep 400
		SendChat("/r Ночная смена длится с 22:00 до 9:00. За 1 час работы - 50 тыс. вирт.")
		sleep 400
		SendChat("/r Все подробности можно узнать на оф.сайте, раздел 'Ночная смена'")
    }
    else if (line_num == 6) ;Дополнительный заработок
    {
		SendChat("/r Уважаемые сотрудники, если вас интересует дополнительный заработок,")
		sleep 400
		SendChat("/r Тогда заходите на оф.сайт Мин.Здрава, раздел 'Доп. заработок для сотрудников'")
		sleep 400
		SendChat("/r Вы можете заработать очень хорошие деньги выполняя простые задания")
		sleep 400
    }
}
return

~Enter::
	gosub, checkdialogMenu
	return
	
~Esc::
	menu := 0
	return
	
;=================================================
;=================== FUNCTIONS ===================
;=================================================
ExitFunc()
{
	FileDelete, fillLogsDone.txt
	global fillLogsDone
	buff := join(fillLogsDone)
	FileAppend, %buff%, fillLogsDone.txt
	sleep 500
}
iniSettingsSave()
{
	global MenuStSostavaKey
	global CheckRangByIdKey
	global EnterToLogsKey
	global CheckLastDokladyKey
	
	IniWrite, %MenuStSostavaKey%, settings.ini, Hotkeys, MenuStSostavaKey
	IniWrite, %CheckRangByIdKey%, settings.ini, Hotkeys, CheckRangByIdKey
	IniWrite, %EnterToLogsKey%, settings.ini, Hotkeys, EnterToLogsKey
	IniWrite, %CheckLastDokladyKey%, settings.ini, Hotkeys, CheckLastDokladyKey
}
join( strArray )
{
  s := ""
  for i,v in strArray
    s .= "`n" . v
  return substr(s, 2)
}

HasVal(haystack, needle) 
{
	if !(IsObject(haystack)) || (haystack.Length() = 0)
		return 0
	for index, value in haystack
		if (value = needle)
			return index
	return 0
}

ansi2utf8(str)
{
	FileOpen(".utf8", "w", "UTF-8-RAW").Write(str)
	FileRead, str_utf8, .utf8
	FileDelete, .utf8
	Return, str_utf8
}

URIEncode(str, encoding := "UTF-8")
{
   PrevFormat := A_FormatInteger
   SetFormat, IntegerFast, H
   VarSetCapacity(var, StrPut(str, encoding))
   StrPut(str, &var, encoding)
   While code := NumGet(Var, A_Index - 1, "UChar")
   {
      bool := (code > 0x7F || code < 0x30 || code = 0x3D)
      UrlStr .= bool ? "%" . SubStr("0" . SubStr(code, 3), -1) : Chr(code)
   }
   SetFormat, IntegerFast, % PrevFormat
   Return UrlStr
}
URLDownloadToVar(url){
	hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	hObject.Open("GET",url)
	hObject.Send()
	return hObject.ResponseText
}