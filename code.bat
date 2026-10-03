```bat
@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

title Tamagochi
mode con: cols=72 lines=38
color 0B

set "SAVE=tamagochi_save.dat"


:: ============================================================
:: AVVIO
:: ============================================================

call :LANGUAGE
call :TEXT

:: Controlla se esiste una partita
if exist "%SAVE%" (
    call :LOAD
    goto MAIN
)

:: Nuova partita
cls

echo.
echo ================================================================
echo.
echo                         !T_TITLE!
echo.
echo ================================================================
echo.

call :ART_HAPPY

echo.
echo.

set /p "NAME=!T_ASKNAME!: "

if "!NAME!"=="" set "NAME=Tammy"

set /a HEALTH=100
set /a HUNGER=80
set /a HAPPINESS=80
set /a ENERGY=80
set /a AGE=0
set /a COINS=20

call :SAVE

cls
echo.
echo ================================================================
echo.
echo                 !T_WELCOME!
echo.
echo ================================================================
echo.

timeout /t 2 /nobreak >nul

goto MAIN


:: ============================================================
:: SCELTA LINGUA
:: ============================================================

:LANGUAGE

cls

echo.
echo ================================================================
echo.
echo                         TAMAGOCHI
echo.
echo ================================================================
echo.
echo                       SELECT LANGUAGE
echo.
echo.
echo                  1 - Italiano
echo                  2 - English
echo                  3 - Espanol
echo                  4 - Francais
echo                  5 - 中文
echo.
echo ================================================================
echo.

choice /c 12345 /n /m "                         > "

if errorlevel 5 goto LANG_ZH
if errorlevel 4 goto LANG_FR
if errorlevel 3 goto LANG_ES
if errorlevel 2 goto LANG_EN
if errorlevel 1 goto LANG_IT

goto LANGUAGE


:LANG_IT
set "LANG=IT"
exit /b

:LANG_EN
set "LANG=EN"
exit /b

:LANG_ES
set "LANG=ES"
exit /b

:LANG_FR
set "LANG=FR"
exit /b

:LANG_ZH
set "LANG=ZH"
exit /b


:: ============================================================
:: TESTI
:: ============================================================

:TEXT

:: ------------------------------------------------------------
:: ITALIANO
:: ------------------------------------------------------------

if "%LANG%"=="IT" (

    set "T_TITLE=TAMAGOCHI"
    set "T_ASKNAME=Come vuoi chiamare il tuo Tamagochi"
    set "T_WELCOME=Benvenuto nel mondo di Tamagochi!"

    set "T_NAME=Nome"
    set "T_HEALTH=Salute"
    set "T_HUNGER=Fame"
    set "T_HAPPY=Felicita"
    set "T_ENERGY=Energia"
    set "T_AGE=Eta"
    set "T_COINS=Monete"

    set "T_FOOD=1 - Dai da mangiare"
    set "T_PLAY=2 - Gioca"
    set "T_SLEEP=3 - Dormi"
    set "T_HEAL=4 - Cura"
    set "T_PET=5 - Accarezza"
    set "T_SAVE=6 - Salva"
    set "T_EXIT=7 - Esci"

    set "T_EATING=sta mangiando..."
    set "T_PLAYING=sta giocando..."
    set "T_SLEEPING=sta dormendo..."
    set "T_PETTING=Hai accarezzato"
    set "T_HEALED=e stato curato!"
    set "T_SAVED=Gioco salvato!"
    set "T_BYE=A presto!"
    set "T_TIRED=e troppo stanco!"
    set "T_DEAD=e morto!"
    set "T_NOTENOUGH=Non hai abbastanza monete!"
    set "T_HEALTHLOW=La salute e troppo bassa!"

    set "T_WIN=HAI VINTO!"
    set "T_LOSE=HAI PERSO!"
    set "T_DRAW=PAREGGIO!"

    set "T_GAMES=GIOCHI"
    set "T_GUESS=1 - Indovina il numero"
    set "T_RPS=2 - Sasso Carta Forbici"
    set "T_BACK=3 - Torna indietro"

    set "T_GUESS_TITLE=INDOVINA IL NUMERO"
    set "T_GUESS_TEXT=Indovina un numero da 1 a 10"
    set "T_NUMBER=Numero"

    set "T_RPS_TITLE=SASSO CARTA FORBICI"
    set "T_ROCK=1 - Sasso"
    set "T_PAPER=2 - Carta"
    set "T_SCISSORS=3 - Forbici"

    set "T_DAY=giorni"
)


:: ------------------------------------------------------------
:: ENGLISH
:: ------------------------------------------------------------

if "%LANG%"=="EN" (

    set "T_TITLE=TAMAGOCHI"
    set "T_ASKNAME=What do you want to name your Tamagochi"
    set "T_WELCOME=Welcome to the world of Tamagochi!"

    set "T_NAME=Name"
    set "T_HEALTH=Health"
    set "T_HUNGER=Hunger"
    set "T_HAPPY=Happiness"
    set "T_ENERGY=Energy"
    set "T_AGE=Age"
    set "T_COINS=Coins"

    set "T_FOOD=1 - Feed"
    set "T_PLAY=2 - Play"
    set "T_SLEEP=3 - Sleep"
    set "T_HEAL=4 - Heal"
    set "T_PET=5 - Pet"
    set "T_SAVE=6 - Save"
    set "T_EXIT=7 - Exit"

    set "T_EATING=is eating..."
    set "T_PLAYING=is playing..."
    set "T_SLEEPING=is sleeping..."
    set "T_PETTING=You pet"
    set "T_HEALED=has been healed!"
    set "T_SAVED=Game saved!"
    set "T_BYE=See you!"
    set "T_TIRED=is too tired!"
    set "T_DEAD=has died!"
    set "T_NOTENOUGH=You don't have enough coins!"
    set "T_HEALTHLOW=Health is too low!"

    set "T_WIN=YOU WIN!"
    set "T_LOSE=YOU LOSE!"
    set "T_DRAW=DRAW!"

    set "T_GAMES=GAMES"
    set "T_GUESS=1 - Guess the number"
    set "T_RPS=2 - Rock Paper Scissors"
    set "T_BACK=3 - Back"

    set "T_GUESS_TITLE=GUESS THE NUMBER"
    set "T_GUESS_TEXT=Guess a number from 1 to 10"
    set "T_NUMBER=Number"

    set "T_RPS_TITLE=ROCK PAPER SCISSORS"
    set "T_ROCK=1 - Rock"
    set "T_PAPER=2 - Paper"
    set "T_SCISSORS=3 - Scissors"

    set "T_DAY=days"
)


:: ------------------------------------------------------------
:: SPANISH
:: ------------------------------------------------------------

if "%LANG%"=="ES" (

    set "T_TITLE=TAMAGOCHI"
    set "T_ASKNAME=Como quieres llamar a tu Tamagochi"
    set "T_WELCOME=Bienvenido al mundo de Tamagochi!"

    set "T_NAME=Nombre"
    set "T_HEALTH=Salud"
    set "T_HUNGER=Hambre"
    set "T_HAPPY=Felicidad"
    set "T_ENERGY=Energia"
    set "T_AGE=Edad"
    set "T_COINS=Monedas"

    set "T_FOOD=1 - Dar de comer"
    set "T_PLAY=2 - Jugar"
    set "T_SLEEP=3 - Dormir"
    set "T_HEAL=4 - Curar"
    set "T_PET=5 - Acariciar"
    set "T_SAVE=6 - Guardar"
    set "T_EXIT=7 - Salir"

    set "T_EATING=esta comiendo..."
    set "T_PLAYING=esta jugando..."
    set "T_SLEEPING=esta durmiendo..."
    set "T_PETTING=Has acariciado a"
    set "T_HEALED=ha sido curado!"
    set "T_SAVED=Partida guardada!"
    set "T_BYE=Hasta pronto!"
    set "T_TIRED=esta demasiado cansado!"
    set "T_DEAD=ha muerto!"
    set "T_NOTENOUGH=No tienes suficientes monedas!"
    set "T_HEALTHLOW=La salud es demasiado baja!"

    set "T_WIN=HAS GANADO!"
    set "T_LOSE=HAS PERDIDO!"
    set "T_DRAW=EMPATE!"

    set "T_GAMES=JUEGOS"
    set "T_GUESS=1 - Adivina el numero"
    set "T_RPS=2 - Piedra Papel Tijeras"
    set "T_BACK=3 - Volver"

    set "T_GUESS_TITLE=ADIVINA EL NUMERO"
    set "T_GUESS_TEXT=Adivina un numero del 1 al 10"
    set "T_NUMBER=Numero"

    set "T_RPS_TITLE=PIEDRA PAPEL TIJERAS"
    set "T_ROCK=1 - Piedra"
    set "T_PAPER=2 - Papel"
    set "T_SCISSORS=3 - Tijeras"

    set "T_DAY=dias"
)


:: ------------------------------------------------------------
:: FRANCAIS
:: ------------------------------------------------------------

if "%LANG%"=="FR" (

    set "T_TITLE=TAMAGOCHI"
    set "T_ASKNAME=Comment veux-tu appeler ton Tamagochi"
    set "T_WELCOME=Bienvenue dans le monde de Tamagochi!"

    set "T_NAME=Nom"
    set "T_HEALTH=Sante"
    set "T_HUNGER=Faim"
    set "T_HAPPY=Bonheur"
    set "T_ENERGY=Energie"
    set "T_AGE=Age"
    set "T_COINS=Pieces"

    set "T_FOOD=1 - Nourrir"
    set "T_PLAY=2 - Jouer"
    set "T_SLEEP=3 - Dormir"
    set "T_HEAL=4 - Soigner"
    set "T_PET=5 - Caresser"
    set "T_SAVE=6 - Sauvegarder"
    set "T_EXIT=7 - Quitter"

    set "T_EATING=mange..."
    set "T_PLAYING=joue..."
    set "T_SLEEPING=dort..."
    set "T_PETTING=Tu as caresse"
    set "T_HEALED=a ete soigne!"
    set "T_SAVED=Jeu sauvegarde!"
    set "T_BYE=A bientot!"
    set "T_TIRED=est trop fatigue!"
    set "T_DEAD=est mort!"
    set "T_NOTENOUGH=Tu n'as pas assez de pieces!"
    set "T_HEALTHLOW=La sante est trop basse!"

    set "T_WIN=GAGNE!"
    set "T_LOSE=PERDU!"
    set "T_DRAW=EGALITE!"

    set "T_GAMES=JEUX"
    set "T_GUESS=1 - Deviner le nombre"
    set "T_RPS=2 - Pierre Papier Ciseaux"
    set "T_BACK=3 - Retour"

    set "T_GUESS_TITLE=DEVINE LE NOMBRE"
    set "T_GUESS_TEXT=Devine un nombre de 1 a 10"
    set "T_NUMBER=Nombre"

    set "T_RPS_TITLE=PIERRE PAPIER CISEAUX"
    set "T_ROCK=1 - Pierre"
    set "T_PAPER=2 - Papier"
    set "T_SCISSORS=3 - Ciseaux"

    set "T_DAY=jours"
)


:: ------------------------------------------------------------
:: CHINESE
:: ------------------------------------------------------------

if "%LANG%"=="ZH" (

    set "T_TITLE=电子宠物"
    set "T_ASKNAME=你想给你的电子宠物取什么名字"
    set "T_WELCOME=欢迎来到电子宠物世界!"

    set "T_NAME=名字"
    set "T_HEALTH=健康"
    set "T_HUNGER=饥饿"
    set "T_HAPPY=幸福"
    set "T_ENERGY=精力"
    set "T_AGE=年龄"
    set "T_COINS=金币"

    set "T_FOOD=1 - 喂食"
    set "T_PLAY=2 - 玩游戏"
    set "T_SLEEP=3 - 睡觉"
    set "T_HEAL=4 - 治疗"
    set "T_PET=5 - 抚摸"
    set "T_SAVE=6 - 保存"
    set "T_EXIT=7 - 退出"

    set "T_EATING=正在吃东西..."
    set "T_PLAYING=正在玩游戏..."
    set "T_SLEEPING=正在睡觉..."
    set "T_PETTING=你抚摸了"
    set "T_HEALED=已经恢复健康!"
    set "T_SAVED=游戏已保存!"
    set "T_BYE=再见!"
    set "T_TIRED=太累了!"
    set "T_DEAD=死了!"
    set "T_NOTENOUGH=金币不够!"
    set "T_HEALTHLOW=健康值太低!"

    set "T_WIN=你赢了!"
    set "T_LOSE=你输了!"
    set "T_DRAW=平局!"

    set "T_GAMES=游戏"
    set "T_GUESS=1 - 猜数字"
    set "T_RPS=2 - 石头剪刀布"
    set "T_BACK=3 - 返回"

    set "T_GUESS_TITLE=猜数字"
    set "T_GUESS_TEXT=猜一个1到10之间的数字"
    set "T_NUMBER=数字"

    set "T_RPS_TITLE=石头剪刀布"
    set "T_ROCK=1 - 石头"
    set "T_PAPER=2 - 布"
    set "T_SCISSORS=3 - 剪刀"

    set "T_DAY=天"
)

exit /b


:: ============================================================
:: MENU PRINCIPALE
:: ============================================================

:MAIN

:MENU

call :LIMIT

if !HEALTH! LEQ 0 goto DEAD

cls

echo.
echo =================================================================
echo.
echo                         🐣 !T_TITLE!
echo.
echo =================================================================
echo.

call :ART_HAPPY

echo.
echo   !T_NAME!       : !NAME!
echo.
echo   ❤️ !T_HEALTH!  : !HEALTH!/100
echo   🍖 !T_HUNGER!  : !HUNGER!/100
echo   😊 !T_HAPPY!   : !HAPPINESS!/100
echo   ⚡ !T_ENERGY!  : !ENERGY!/100
echo   🎂 !T_AGE!     : !AGE! !T_DAY!
echo   💰 !T_COINS!   : !COINS!
echo.
echo =================================================================
echo.
echo   !T_FOOD!
echo   !T_PLAY!
echo   !T_SLEEP!
echo   !T_HEAL!
echo   !T_PET!
echo   !T_SAVE!
echo   !T_EXIT!
echo.
echo =================================================================
echo.

choice /c 1234567 /n /m "> "

if errorlevel 7 goto EXIT
if errorlevel 6 goto SAVE_MENU
if errorlevel 5 goto PET
if errorlevel 4 goto HEAL
if errorlevel 3 goto SLEEP
if errorlevel 2 goto PLAY
if errorlevel 1 goto FOOD

goto MENU


:: ============================================================
:: ART FELICE
:: ============================================================

:ART_HAPPY

echo.
echo                 /\_/\
echo                ( ^_^ )
echo                 > ^<
echo.
exit /b


:: ============================================================
:: CIBO + ANIMAZIONE
:: ============================================================

:FOOD

cls

echo.
echo                  !NAME! !T_EATING!
echo.

echo                 /\_/\
echo                ( o.o )
echo                 > ^<
echo.
echo                    🍎

timeout /t 1 /nobreak >nul

cls

echo.
echo                  !NAME! !T_EATING!
echo.

echo                 /\_/\
echo                ( ^o^ )
echo                 > ^<
echo.
echo                   🍎

timeout /t 1 /nobreak >nul

cls

echo.
echo                  !NAME! !T_EATING!
echo.

echo                 /\_/\
echo                ( ^@^ )
echo                 > ^<
echo.
echo                  🍎

timeout /t 1 /nobreak >nul

set /a HUNGER+=25
set /a HAPPINESS+=5
set /a ENERGY-=3

call :LIMIT
call :SAVE

goto MENU


:: ============================================================
:: GIOCHI
:: ============================================================

:PLAY

if !ENERGY! LSS 15 (

    cls

    echo.
    echo                 😴 !NAME! !T_TIRED!
    echo.

    pause
    goto MENU
)

cls

echo.
echo =================================================================
echo                         !T_GAMES!
echo =================================================================
echo.
echo                         !T_GUESS!
echo                         !T_RPS!
echo                         !T_BACK!
echo.
echo =================================================================
echo.

choice /c 123 /n /m "> "

if errorlevel 3 goto MENU
if errorlevel 2 goto RPS
if errorlevel 1 goto GUESS

goto MENU


:: ============================================================
:: INDOVINA NUMERO
:: ============================================================

:GUESS

cls

set /a SECRET=%random% %% 10 + 1

echo.
echo =================================================================
echo                    !T_GUESS_TITLE!
echo =================================================================
echo.
echo                 !T_GUESS_TEXT!
echo.

set /p "GUESS=!T_NUMBER!: "

if "!GUESS!"=="!SECRET!" (

    echo.
    echo                         🎉 !T_WIN!
    echo.

    set /a HAPPINESS+=20
    set /a COINS+=10

) else (

    echo.
    echo                         ❌ !T_LOSE!
    echo                         !SECRET!
    echo.

    set /a HAPPINESS-=5
)

set /a ENERGY-=10
set /a HUNGER-=8

call :LIMIT
call :SAVE

pause
goto MENU


:: ============================================================
:: SASSO CARTA FORBICI
:: ============================================================

:RPS

cls

echo.
echo =================================================================
echo                    !T_RPS_TITLE!
echo =================================================================
echo.
echo                         !T_ROCK!
echo                         !T_PAPER!
echo                         !T_SCISSORS!
echo.

choice /c 123 /n /m "> "

set "PLAYER=!errorlevel!"
set /a CPU=%random% %% 3 + 1

if !PLAYER! EQU !CPU! (

    echo.
    echo                         😐 !T_DRAW!
    goto RPS_END
)

if !PLAYER! EQU 1 if !CPU! EQU 3 goto RPS_WIN
if !PLAYER! EQU 2 if !CPU! EQU 1 goto RPS_WIN
if !PLAYER! EQU 3 if !CPU! EQU 2 goto RPS_WIN

echo.
echo                         😭 !T_LOSE!
set /a HAPPINESS-=5
goto RPS_END


:RPS_WIN

echo.
echo                         🎉 !T_WIN!

set /a HAPPINESS+=15
set /a COINS+=5


:RPS_END

set /a ENERGY-=8
set /a HUNGER-=5

call :LIMIT
call :SAVE

pause
goto MENU


:: ============================================================
:: DORMIRE + ANIMAZIONE
:: ============================================================

:SLEEP

cls

echo.
echo                    !NAME! !T_SLEEPING!
echo.

echo                 /\_/\
echo                ( -.- )
echo                 > ^<
echo.
timeout /t 1 /nobreak >nul

cls

echo.
echo                    !NAME! !T_SLEEPING!
echo.

echo                 /\_/\
echo                ( -.- ) z
echo                 > ^<
echo.
timeout /t 1 /nobreak >nul

cls

echo.
echo                    !NAME! !T_SLEEPING!
echo.

echo                 /\_/\
echo                ( -.- ) zZ
echo                 > ^<
echo.
timeout /t 1 /nobreak >nul

cls

echo.
echo                    !NAME! !T_SLEEPING!
echo.

echo                 /\_/\
echo                ( ^_^ )
echo                 > ^<
echo.

set /a ENERGY+=40
set /a HEALTH+=5
set /a HUNGER-=10
set /a AGE+=1

call :LIMIT
call :SAVE

pause
goto MENU


:: ============================================================
:: CURA
:: ============================================================

:HEAL

cls

if !COINS! LSS 5 (

    echo.
    echo                         💸
    echo.
    echo                 !T_NOTENOUGH!
    echo.

    pause
    goto MENU
)

set /a COINS-=5
set /a HEALTH+=25
set /a HAPPINESS+=5

call :LIMIT
call :SAVE

echo.
echo                 💊 !NAME! !T_HEALED!
echo.

pause
goto MENU


:: ============================================================
:: ACCAREZZARE + ANIMAZIONE
:: ============================================================

:PET

cls

echo.
echo                 ❤️ !T_PETTING! !NAME!
echo.

echo                 /\_/\
echo                ( o.o )
echo                 > ^<
echo.

timeout /t 1 /nobreak >nul

cls

echo.
echo                 ❤️ !T_PETTING! !NAME!
echo.

echo                 /\_/\
echo                ( ^_^ )
echo                 > ^<
echo.

timeout /t 1 /nobreak >nul

cls

echo.
echo                 ❤️ !T_PETTING! !NAME!
echo.

echo                 /\_/\
echo                ( ^-^ )
echo                 > ^<
echo.

set /a HAPPINESS+=10
set /a ENERGY-=2

call :LIMIT
call :SAVE

pause
goto MENU


:: ============================================================
:: SALVATAGGIO
:: ============================================================

:SAVE_MENU

call :SAVE

cls

echo.
echo =================================================================
echo.
echo                       💾 !T_SAVED!
echo.
echo =================================================================
echo.

pause
goto MENU


:SAVE

(
echo NAME=!NAME!
echo HEALTH=!HEALTH!
echo HUNGER=!HUNGER!
echo HAPPINESS=!HAPPINESS!
echo ENERGY=!ENERGY!
echo AGE=!AGE!
echo COINS=!COINS!
) > "%SAVE%"

exit /b


:: ============================================================
:: CARICAMENTO
:: ============================================================

:LOAD

for /f "tokens=1,* delims==" %%A in (%SAVE%) do (
    set "%%A=%%B"
)

exit /b


:: ============================================================
:: LIMITI STATISTICHE
:: ============================================================

:LIMIT

if !HEALTH! GTR 100 set /a HEALTH=100
if !HEALTH! LSS 0 set /a HEALTH=0

if !HUNGER! GTR 100 set /a HUNGER=100
if !HUNGER! LSS 0 set /a HUNGER=0

if !HAPPINESS! GTR 100 set /a HAPPINESS=100
if !HAPPINESS! LSS 0 set /a HAPPINESS=0

if !ENERGY! GTR 100 set /a ENERGY=100
if !ENERGY! LSS 0 set /a ENERGY=0

:: Se la fame arriva a zero perde salute
if !HUNGER! LEQ 0 set /a HEALTH-=5

exit /b


:: ============================================================
:: MORTE
:: ============================================================

:DEAD

cls

echo.
echo =================================================================
echo.
echo                         ☠️ GAME OVER
echo.
echo =================================================================
echo.

echo                 /\_/\
echo                ( x.x )
echo                 > ^<
echo.

echo.
echo                    !NAME! !T_DEAD!
echo.
echo                    !T_AGE!: !AGE! !T_DAY!
echo.
echo =================================================================
echo.

del "%SAVE%" >nul 2>&1

pause
exit


:: ============================================================
:: USCITA
:: ============================================================

:EXIT

call :SAVE

cls

echo.
echo =================================================================
echo.
echo                          !T_BYE!
echo.
echo =================================================================
echo.

timeout /t 2 /nobreak >nul

exit
```
