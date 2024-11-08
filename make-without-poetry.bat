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
    potery run flet run
goto:eof

:web
    poetry run flet run --web
goto:eof


:check_enviroment
    rem https://flet.dev/docs/
    set archivo_poetry=pyproject.toml
    rem si no existe el archivo que utiliza potery para gestionar las dependencias
    if not exist %archivo_poetry% (
        echo "Este proyecto no es poetry, no tiene archivo pyproject.toml"
        exit
    )else(
        poetry install
    )  
goto:eof











