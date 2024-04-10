@echo off
set "userProfile=%USERPROFILE%"
cd "%userProfile%\Meritus-CVPRO-main\Training_Process"

:waitForInput
set /p userInput="Is your Bot Disconnected from the Application and System? - 'y' or 'n': "
if /i "%userInput%"=="y" (
    echo Initializing the Training Process!
) else if /i "%userInput%"=="n" (
    echo Please disconnect the Bot from your Application and the System!
    goto :waitForInput
) else (
    echo Invalid command. Please enter 'y' or 'n'.
    goto :waitForInput
)

set /p batchSize="Give me a valid Batch Size [16, 32, 64, 128]: "
if "%batchSize%"=="" set "batchSize=32"

set /p epochValue="Give me a valid Iteration Limit [5, 10, 20, 25, 50, 100]: "
if "%epochValue%"=="" set "epochValue=5"

set /p learningRate="Give me a valid Learning Rate [0.00001, 0.0001, 0.001, 0.01, 0.1, 1]: "
if "%learningRate%"=="" set "learningRate=0.0001"

call python main.py -b %batchSize% -e %epochValue% -lr %learningRate%
