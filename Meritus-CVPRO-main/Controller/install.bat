@echo off
set "userProfile=%USERPROFILE%"

:checkInternetConnection
ping 8.8.8.8 -n 1 -w 1000 >nul
if errorlevel 1 (
    echo Please connect to the internet and try again.
    exit /b
)

:waitForInput
set /p userInput="Do you have a valid Internet Connection? - 'y' or 'n': "
if /i "%userInput%"=="y" (
    echo Installing dependencies...................

    cd "%userProfile%\Meritus-CVPRO-main\Controller"

    call %userProfile%\miniconda3\envs\cvpro\python.exe -m pip install --upgrade pip
    REM call conda install cudatoolkit -y
    REM call conda install cudnn -y
    call pip install tensorflow~=2.9.0

    call cd %userProfile%\Meritus-CVPRO-main\Environment_Setup
    
    call pip install -r requirements.txt


    
    if errorlevel 1 (

        echo Installation failed! Please ensure you have activated the conda environment.
        
    ) else (
    
        echo.
        echo.
        echo Installation is Completed! 
        echo. 
        echo Please Disconnect the Internet, and connect the Bot with the System. Ensure the Connected IPv4 Address is: 192.168.4.2
        echo.
        echo Type 'launch_server' to Launch the MQTT Server to run the Bot!
        echo Type 'run_cvpro' or 'train_cvpro' according to your requirement!
        echo.
    )
    
) else if /i "%userInput%"=="n" (
    echo Please do have a valid Internet Connection for the Installation Process.
) else (
    echo Invalid command. Please enter 'y' or 'n'.
    goto waitForInput
)

