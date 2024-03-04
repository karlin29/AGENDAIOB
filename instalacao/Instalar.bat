@echo off
rem Este arquivo de lote registra o arquivo OCX no sistema Windows usando regsvr32

rem Obtenha o diretório atual do arquivo de lote
set CURRENT_DIR=%~dp0

rem Substitua "seu_ocx.ocx" pelo nome do seu arquivo OCX
set OCX_FILE=%CURRENT_DIR%MSCAL.OCX

rem Verifique se o arquivo OCX existe
if not exist %OCX_FILE% (
    echo Arquivo OCX não encontrado.
    exit /b
)

rem Registre o arquivo OCX usando regsvr32
echo Registrando o arquivo OCX...
regsvr32 %OCX_FILE%

rem Verifique o código de retorno do regsvr32
if %errorlevel% neq 0 (
    echo Falha ao registrar o arquivo OCX.
    exit /b
)

echo Arquivo OCX registrado com sucesso.
