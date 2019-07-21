@echo off

SET folder=C:\Users\shukari\Documents\Arma3Development\ACE3\addons\
SET prefix=ace_

::SET folder=C:\Users\shukari\Documents\Arma3Development\TFAR\addons
::SET prefix=tfar_

::SET folder=C:\Users\shukari\Documents\Arma3Development\CBA\addons
::SET prefix=cba_

FOR /D %%G in ("%folder%\*") DO echo "%prefix%%%~nxG",

pause
