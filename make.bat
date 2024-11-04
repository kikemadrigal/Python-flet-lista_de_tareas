@echo off
rem https://flet.dev/docs/publish/android
rem Con esta línea le estamos diciendo que tiene que empezar por la función main
rem With this line we are telling you that you have to start with the main function
@echo off&cls&call:main %1&goto:EOF

:main
    call :check_enviroment
    if [%1]==[] (call :run)
    if [%1]==[web] (call :web)
goto:eof

:run
    flet run
goto:eof

:web
    flet run --web
goto:eof


:check_enviroment
    rem https://flet.dev/docs/
    set carpeta="venv"
    rem si no existe la carpeta venv, se crea el entorno virtual y las dependencias 
    if not exist %carpeta% (
        rem python3 -m venv .venv
        python -m venv venv
    )  
    rem si no estás en un entorno virtual
    if not defined VIRTUAL_ENV (
        rem source .venv/bin/activate
        call venv\Scripts\activate
        rem para salir del venv escribe deactivate
    ) 
    rem Si no está instalado flet
    set comando=flet --version
    if not %errorlevel% equ 0 (
        echo El comando %comando% No está disponible, instalando flet. 
        pip install flet
        pip install proety
    ) 
    rem Si está cleado el proyecto, llamamos a arrancar proyecto flet
    rem Crear un proyecto de flet con "poetry new first-flet-app"
    rem Añadir la dependecia de flet con "proety add flet"
    set main=main.py
    if not exist %main% (
        echo No existe un proyecto flet, creando uno nuevo
        flet create .
        rem es posible crear aplicación desde template contador:
        rem flet create --template counter .
    ) 
goto:eof











