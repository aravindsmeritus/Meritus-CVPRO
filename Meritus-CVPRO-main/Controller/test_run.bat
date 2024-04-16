@echo off
set "userProfile=%USERPROFILE%"
cd "%userProfile%\Meritus-CVPRO-Windows\Meritus-CVPRO-main\Controller"

call cls

set /p userInput="Enter your choice - 'control' or 'videostream': "

if /i "%userInput%"=="control" (
    call :run_bot control_bot.py
) else if /i "%userInput%"=="videostream" (
    call :run_bot videostream_control_bot.py
) else (
    echo Invalid choice. Please enter 'rc' or 'vd'.
)

goto :eof

:run_bot
:waitForInput
set /p userInput="Is your Bot connected with the Application? - 'y' or 'n': "
if /i "%userInput%"=="y" (
    echo Running the Bot.......
) else if /i "%userInput%"=="n" (
    echo Please connect the bot with your Application!
) else (
    echo Invalid command. Please enter 'y' or 'n'.
    goto waitForInput
)
call python %1
echo.
echo Type 'run_cvpro' or 'train_cvpro' according to your requirement!
goto :eof
