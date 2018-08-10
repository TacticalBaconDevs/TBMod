SET armaFolder="E:\SteamLibrary\steamapps\common\Arma 3\#MissionMods\@TBMod_dev\addons"

:: -BD statt -B; -P wenn keine Pause
MakePbo.exe -A -B -D -P -X=*.txt,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,*.ini,*.rar addons\TBMod_arsenal %armaFolder%
MakePbo.exe -A -B -D -P -X=*.txt,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,*.ini,*.rar addons\TBMod_main %armaFolder%
MakePbo.exe -A -B -D -P -X=*.txt,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,*.ini,*.rar addons\TBMod_nachschub %armaFolder%
::MakePbo.exe -A -B -D -P -X=*.txt,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,*.ini,*.rar addons\TBMod_ausbildung %armaFolder%
MakePbo.exe -A -B -D -P -X=*.txt,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,*.ini,*.rar addons\TBMod_building %armaFolder%
MakePbo.exe -A -B -D -P -X=*.txt,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,*.ini,*.rar addons\TBMod_items %armaFolder%
MakePbo.exe -A -B -D -P -X=*.txt,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,*.ini,*.rar addons\TBMod_zusatzStuff %armaFolder%
