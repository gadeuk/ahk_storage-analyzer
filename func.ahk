ArrCreate(FolderName){
	
}






;======
SetSize(Size){
	unit := ["byte", "KB", "MB", "GB"]
	index = 0
	while(index!=3&&Size>=1024){
		size := Size/1024
		index++
	}
	if Size is float
		StringTrimRight, Size, Size, 4
	arr := [Size, unit[index+1]]
	return arr
}

GetSize(directory){
	Size = 0
	/*
	Get the attributes of inputvar
	*/
	FileGetAttrib, att, %directory%
	attributes = D
	IfInString, att, %attributes%
		Loop, %directory%\*.*, 1
			Size += GetSize(A_LoopFileFullPath)
	else
		Size += %A_LoopFileSize%
		
	return Size
}

free(){
length := Arr.Length()
Loop %lengh%
	Arr[%A_Index%] =
Arr =
total =
length=
temp = 
SetArr =
s = 	
}

range(m,n){
	arr := []
	count := n - m + 1
	loop %count%
		arr[%A_Index%] := m  + A_index -1
	return arr
}