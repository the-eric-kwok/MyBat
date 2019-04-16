#此脚本需要配合youtube-dl.exe使用
#使用前请启动带有管理员权限的powershell，将以下代码复制进去并且执行
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
        echo "复制的内容不是一个网页链接"
    }
}
else{
    echo "复制的内容不是一个网页链接"
}