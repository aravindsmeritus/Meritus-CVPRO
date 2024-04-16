@echo off
set "userProfile=%USERPROFILE%"

echo Type 'my_conda' - Create or Activate the Conda Environment
echo Type 'install_cvpro' - Installation of required libraries
echo.
echo Please ensure to connect the Bot with the System
echo Type 'launch_server' - Launch the MQTT Server
echo.
echo Type 'run_cvpro' to move the Bot around.
echo Type 'train_cvpro' to train the Bot for Autonomous Process.

doskey my_conda="%userProfile%\Meritus-CVPRO-main\Meritus-CVPRO-main\Controller\activate_cvpro.bat"
doskey install_cvpro="%userProfile%\Meritus-CVPRO-main\Meritus-CVPRO-main\Controller\install.bat"
doskey launch_server=start cmd /K "%userProfile%\Meritus-CVPRO-main\Meritus-CVPRO-main\Controller\launch_mosquitto.bat"
doskey run_cvpro="%userProfile%\Meritus-CVPRO-main\Meritus-CVPRO-main\Controller\test_run.bat"
doskey train_cvpro="%userProfile%\Meritus-CVPRO-main\Meritus-CVPRO-main\Controller\train.bat"                                     