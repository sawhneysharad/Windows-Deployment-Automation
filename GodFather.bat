@echo off
:: BatchGotAdmin
::-------------------------------------

::ENTER YOUR CODE BELOW:
::Title Scanning and Killing Multi-Processes
Set "Processes=aie-agent.exe aie-cli.exe aie-node.exe aie-perfmon.exe aie-store.exe"
for %%a in (%Processes%) Do (
    for /f %%b in ('tasklist /NH /FI "imagename eq %%a"') Do (      if [%%b]==[%%a] (
            echo %%b is running
            Color 0C
            echo  Killing %%b ...
            Taskkill /f /im "%%b"
        ) else (
            Color 0A
            echo %%a is not running
        )
    )
)
SET F="E:\WindowsAutomation\AIE-installer.exe"
IF EXIST %F% DEL /F %F%
SET P="E:\WindowsAutomation\opt\"
IF EXIST %P% RMDIR /S /Q %P%
powershell.exe -executionpolicy bypass -file E:\WindowsAutomation\download-latest-attivio-installer.ps1
start/wait E:\WindowsAutomation\AIE-installer.exe -q -varfile Response.varfile
E:\WindowsAutomation\opt\Attivio\platform\bin\createproject.exe -n PlatCertNightly -o E:\WindowsAutomation\opt\Attivio -m security-ad -m security -m advancedtextextraction -m alm -m businesscenter -m autocomplete -m factbook -m connectoradmin -m classifier -m cloudsupport -m dbconnector -m rest -m entityextraction -m entitysentiment -m excelconnector -m keyphrases -m morelikethis -m opensearch -m relevancy -m rssconnector -m scheduler -m searchanalytics -m searchui -m sentiment -m structureextraction -m triggers -m webcrawler
start E:\WindowsAutomation\opt\Attivio\platform\bin\aie-agent.exe
call E:\WindowsAutomation\GodChild.bat
