SET armaFolder="B:\Steam\steamapps\common\Arma 3\#MissionMods\@TBMod_dev\addons"

:: -BD statt -B; -P wenn keine Pause
FOR /D %%G in ("addons\TBMod*") DO MakePbo.exe -A -B -D -X=*.txt,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,*.ini,*.rar addons\%%~nxG %armaFolder%
