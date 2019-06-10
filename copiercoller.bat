@echo Off 
                
Title "backup off backup"                            

if not Exist config.txt (
    echo >>config.txt FileId=
    echo >>config.txt Execution script=
    echo >>config.txt Save Location=
    start config.txt
    pause = null                
    )
    

for /f "delims=" %%a in (config.txt) do set %%a
set id=%FileId%
for /f "delims=" %%a in (config.txt) do set %%a
set Ex=%Execution script%
for /f "delims=" %%a in (config.txt) do set %%a
set SaveL=%Save Location%

                
cd %Ex%           
                
MKDIR backupcopy                
gdrive-windows-x64.exe sync upload %Ex%backupcopy %id%



:tt                            
     
    cd %Ex%             

    set $path=%Ex%\backupcopy                   
    for %%a in (%$path%) do set $Fichier=%%~na
    echo %$Fichier%             
            del  %$Fichier% /Q
            goto $$2
        
  :$$2                              
  

    cd %Save Location%              
    set $chemin=%Save Location%                 
    
                    
    
    for /f "delims=" %%a in ('dir %$chemin% /aa/b/o-d') do (set $f=%%a              
                                               goto:next)
    :next            
    
    echo le dernier fichier cree est : %$f%
    
    cd %Ex%
                    
    xcopy %$f% %Ex%\backupcopy /-Y /Q /Y
    
    
    
    cd %Ex%
    
    echo %Ex%\backupcopy\%$f%
    echo %id%               
   gdrive-windows-x64.exe sync upload %Ex%\backupcopy\%$f% %id%                                        
                                    
                                    
    
                             
                    
   TIMEOUT /T 300           

    cls             

    goto tt             

