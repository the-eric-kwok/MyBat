#�˽ű���Ҫ���youtube-dl.exeʹ��
#ʹ��ǰ���������й���ԱȨ�޵�powershell�������´��븴�ƽ�ȥ����ִ��
#reg add HKEY_CLASSES_ROOT\Directory\Background\shell\ytdl-here /ve /t REG_SZ /d "Youtube-dl Here"
#reg add HKEY_CLASSES_ROOT\Directory\Background\shell\ytdl-here\command /ve /t REG_SZ /d "powershell.exe -noexit -command Set-Location -literalPath '%%V';ytdl-here.ps1"
#

$ClipBoard=Get-Clipboard
echo $ClipBoard
if($ClipBoard.GetType().Name -eq "String"){
    if($ClipBoard -like "http*"){
        youtube-dl.exe $ClipBoard
    }
    else{
        echo "���Ƶ����ݲ���һ����ҳ����"
    }
}
else{
    echo "���Ƶ����ݲ���һ����ҳ����"
}