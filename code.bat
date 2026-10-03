```bat
@echo off
chcp 65001 >nul
title Tamagochi CMD
color 0A
setlocal EnableDelayedExpansion

:: ==============================
:: TAMAGOCHI PER WINDOWS CMD
:: ==============================

set "SAVE=save.dat"

:: Controlla se esiste un salvataggio
if exist "%SAVE%" (
    call :load
) else (
    cls
    echo.
    echo  =====================================
    echo          🐣 TAMAGOCHI CMD 🐣
    echo  =====================================
    echo.
    set /p "nome=Come vuoi chiamare il tuo Tamagochi? "
    
    if "!nome!"=="" set "nome=Tammy"

    set /a fame=80
    set /a salute=100
    set /a felicita=80
    set /a energia=80
    set /a eta=0
    set /a soldi=20

    call :save
)

:menu
cls

:: Controllo morte
if !salute! LEQ 0 goto :morto
if !fame! LEQ 0 (
    set /a salute-=5
)

:: Limiti statistiche
if !fame! GTR 100 set /a fame=100
if !fame! LSS 0 set /a fame=0

if !salute! GTR 100 set /a salute=100
if !salute! LSS 0 set /a salute=0

if !felicita! GTR 100 set /a felicita=100
if !felicita! LSS 0 set /a felicita=0

if !energia! GTR 100 set /a energia=100
if !energia! LSS 0 set /a energia=0

echo.
echo  ╔══════════════════════════════════════╗
echo  ║           🐣 TAMAGOCHI 🐣            ║
echo  ╠══════════════════════════════════════╣
echo  ║                                      ║
echo  ║   Nome: !nome!
echo  ║   Età:  !eta! giorni
echo  ║                                      ║
echo  ║   ❤️  Salute:   !salute!/100
echo  ║   🍖 Fame:      !fame!/100
echo  ║   😊 Felicità:  !felicita!/100
echo  ║   ⚡ Energia:   !energia!/100
echo  ║                                      ║
echo  ║   💰 Monete:    !soldi!
echo  ║                                      ║
echo  ╚══════════════════════════════════════╝
echo.
echo       ┌─────────────────────────┐
echo       │       COSA FARE?        │
echo       ├─────────────────────────┤
echo       │  1 - 🍎 Dai da mangiare │
echo       │  2 - 🎮 Gioca           │
echo       │  3 - 😴 Dormi           │
echo       │  4 - 💊 Cura            │
echo       │  5 - 🐣 Accarezza       │
echo       │  6 - 💾 Salva           │
echo       │  7 - ❌ Esci             │
echo       └─────────────────────────┘
echo.

choice /c 1234567 /n /m "Scelta: "

if errorlevel 7 goto :exit
if errorlevel 6 goto :salva
if errorlevel 5 goto :carezza
if errorlevel 4 goto :cura
if errorlevel 3 goto :dormi
if errorlevel 2 goto :gioca
if errorlevel 1 goto :mangia

goto menu


:: ==============================
:: MANGIA
:: ==============================

:mangia
cls
echo.
echo  🍎 !nome! sta mangiando...
echo.

timeout /t 2 /nobreak >nul

set /a fame+=25
set /a felicita+=5
set /a energia-=3

if !fame! GTR 100 set /a fame=100

echo.
echo  😋 !nome! ha mangiato!
echo.
echo  Fame +25
echo  Felicità +5
echo  Energia -3
echo.

call :save
pause
goto menu


:: ==============================
:: GIOCA
:: ==============================

:gioca
cls

if !energia! LSS 15 (
    echo.
    echo  😴 !nome! è troppo stanco!
    echo  Fallo dormire prima.
    echo.
    pause
    goto menu
)

echo.
echo  🎮 CHE GIOCO VUOI FARE?
echo.
echo  1 - Indovina il numero
echo  2 - Sasso Carta Forbici
echo  3 - Torna indietro
echo.

choice /c 123 /n /m "Scelta: "

if errorlevel 3 goto menu
if errorlevel 2 goto :morra
if errorlevel 1 goto :numero


:: ==============================
:: INDOVINA NUMERO
:: ==============================

:numero
cls

set /a segreto=%random% %% 10 + 1

echo.
echo  🎯 Indovina il numero da 1 a 10!
echo.

set /p "tentativo=Numero: "

if !tentativo! EQU !segreto! (
    echo.
    echo  🎉 HAI VINTO!
    echo  !nome! è felicissimo!
    set /a felicita+=20
    set /a soldi+=10
) else (
    echo.
    echo  ❌ Sbagliato!
    echo  Il numero era !segreto!
    set /a felicita-=5
)

set /a energia-=10
set /a fame-=8

call :save
pause
goto menu


:: ==============================
:: SASSO CARTA FORBICI
:: ==============================

:morra
cls

echo.
echo  🪨 SASSO
echo  📄 CARTA
echo  ✂️ FORBICI
echo.

set /a cpu=%random% %% 3 + 1

choice /c 123 /n /m "1=Sasso 2=Carta 3=Forbici: "
set player=%errorlevel%

echo.

if !player! EQU 1 set "playername=Sasso"
if !player! EQU 2 set "playername=Carta"
if !player! EQU 3 set "playername=Forbici"

if !cpu! EQU 1 set "cpuname=Sasso"
if !cpu! EQU 2 set "cpuname=Carta"
if !cpu! EQU 3 set "cpuname=Forbici"

echo Tu: !playername!
echo !nome!: !cpuname!
echo.

if !player! EQU !cpu! goto :pareggio

if !player! EQU 1 if !cpu! EQU 3 goto :vittoria
if !player! EQU 2 if !cpu! EQU 1 goto :vittoria
if !player! EQU 3 if !cpu! EQU 2 goto :vittoria

goto :sconfitta

:vittoria
echo 🎉 Hai vinto!
set /a felicita+=15
set /a soldi+=5
goto :finegioco

:sconfitta
echo 😭 Hai perso!
set /a felicita-=5
goto :finegioco

:pareggio
echo 😐 Pareggio!
goto :finegioco

:finegioco
set /a energia-=8
set /a fame-=5
call :save
pause
goto menu


:: ==============================
:: DORMI
:: ==============================

:dormi
cls

echo.
echo  😴 !nome! sta dormendo...
echo.

timeout /t 3 /nobreak >nul

set /a energia+=40
set /a salute+=5
set /a fame-=10
set /a eta+=1

if !energia! GTR 100 set /a energia=100
if !salute! GTR 100 set /a salute=100
if !fame! LSS 0 set /a fame=0

echo.
echo  ☀️ Buongiorno !nome!!
echo.
echo  Energia +40
echo  Salute +5
echo  Fame -10
echo  Età +1 giorno
echo.

call :save
pause
goto menu


:: ==============================
:: CURA
:: ==============================

:cura
cls

if !soldi! LSS 5 (
    echo.
    echo  💸 Non hai abbastanza monete!
    echo  Servono 5 monete.
    echo.
    pause
    goto menu
)

set /a soldi-=5
set /a salute+=25
set /a felicita+=5

if !salute! GTR 100 set /a salute=100

echo.
echo  💊 Hai curato !nome!!
echo.
echo  Salute +25
echo  Felicità +5
echo  Monete -5
echo.

call :save
pause
goto menu


:: ==============================
:: ACCAREZZA
:: ==============================

:carezza
cls

echo.
echo  ❤️ Hai accarezzato !nome!!
echo.
echo       /\_/\
echo      ( o.o )
echo       > ^<
echo.
echo  !nome! è felice! 🥰
echo.

set /a felicita+=10
set /a energia-=2

call :save
pause
goto menu


:: ==============================
:: SALVATAGGIO
:: ==============================

:salva
call :save

cls
echo.
echo  💾 Gioco salvato!
echo.
pause
goto menu


:save
(
echo nome=!nome!
echo fame=!fame!
echo salute=!salute!
echo felicita=!felicita!
echo energia=!energia!
echo eta=!eta!
echo soldi=!soldi!
)> "%SAVE%"
exit /b


:load
for /f "tokens=1,* delims==" %%A in (%SAVE%) do (
    set "%%A=%%B"
)
exit /b


:: ==============================
:: MORTE
:: ==============================

:morto
cls

echo.
echo  ☠️══════════════════════════☠️
echo.
echo       !nome! è morto...
echo.
echo  Non è stato curato abbastanza.
echo.
echo  Età raggiunta: !eta! giorni
echo.
echo  ☠️══════════════════════════☠️
echo.
echo  Premi un tasto per ricominciare.
pause >nul

del "%SAVE%" >nul 2>&1

goto :eof


:: ==============================
:: USCITA
:: ==============================

:exit
call :save
cls

echo.
echo  💾 Salvataggio effettuato.
echo.
echo  A presto! 👋
echo.
timeout /t 2 /nobreak >nul

exit
```
