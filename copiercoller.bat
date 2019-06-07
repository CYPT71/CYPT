@echo off

Title "backup off backup"

                
cd %userprofile%\Desktop\               
                
MKDIR "backupcopy"


:tt
    
    
    
    cd %userprofile%\Desktop\

    set $path=%userprofile%\Desktop\backupcopy
    for %%a in (%$path%) do set $Fichier=%%~na
            echo %$Fichier%
            del  %$Fichier% /Q
            goto $$2
        
:$$2

    cd %userprofile%\AppData\Local\FactoryGame\Saved\SaveGames


    set $chemin=%userprofile%\AppData\Local\FactoryGame\Saved\SaveGames
    for /f "delims=" %%a in ('dir %$chemin% /aa/b/o-d') do (set $f="%%a"
                                               goto:next)
    :next
    
    echo le dernier fichier cr?? est : %$f%
    xcopy %$f% %userprofile%\Desktop\backupcopy /-Y /Q /Y
    cd %userprofile%\Desktop\backupcopy
    gdrive-windows-x64.exe sync upload C:\Users\cyprien\Desktop\backupcopy **fileid**
    
    TIMEOUT /T 300

    cls             

    
        


goto tt

