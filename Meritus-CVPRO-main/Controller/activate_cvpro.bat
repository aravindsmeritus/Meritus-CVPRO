@echo off

set "userProfile=%USERPROFILE%"

:checkInternetConnection
ping 8.8.8.8 -n 1 -w 1000 >nul
if errorlevel 1 (
    echo Please connect to the internet and try again.
    exit /b
)

:waitForInput
echo Hi! Please Ensure Internet Connection! 
set /p userInput="Give me a command - 'build' or 'activate' or 'deactivate': "
if /i "%userInput%"=="build" (
    echo Creating a Virtual Environment:- cvpro ...
    call  "%userProfile%\miniconda3\Scripts\activate.bat" "%userProfile%\miniconda3"
    call conda create -n cvpro python=3.9 -y
    echo Building the Environment...
    
    if errorlevel 1 (
        echo Build failed.
    ) else if errorlevel 0 (
        echo Build is Successful.
        echo Activating the Environment
        call conda activate cvpro
        echo cvpro Environment is Built and Activated...
        echo.
        echo Now you are ready for Installation Process.
        echo.
        echo Type 'install_cvpro' to Install the Dependencies
        )

) else if /i "%userInput%"=="activate" (
    call "%userProfile%\miniconda3\Scripts\activate.bat" "%userProfile%\miniconda3"
    REM Check if environment exists before activating
    call conda info --envs | findstr /C:"cvpro" > nul
    if errorlevel 1 (
        echo Environment cvpro not found.
        echo Activation failed.
    ) else (
        call conda activate cvpro
        echo cvpro Environment is Activated...
        echo. 
        echo Please Disconnect the Internet, and connect the Bot with the System. Ensure the Connected IPv4 Address is: 192.168.4.2
        echo.
        echo Type 'launch_server' to Launch the MQTT Server to run the Bot!
        echo Type 'run_cvpro' or 'train_cvpro' according to your requirement!
        echo.  
    )
) else if /i "%userInput%"=="deactivate" (
    call  "%userProfile%\miniconda3\Scripts\activate.bat" "%userProfile%\miniconda3"
    REM Check if environment exists before activating
    call conda info --envs | findstr /C:"cvpro" > nul
    if errorlevel 1 (
        echo Environment cvpro not found.
        echo De-Activation failed.
    ) else (
        call conda activate cvpro
        call conda.bat deactivate
        echo.
        echo cvpro Environment is De-Activated
    )
    
) else (
    echo Invalid command. Please enter 'build' or 'activate' or 'deactivate'.
    goto waitForInput
)
