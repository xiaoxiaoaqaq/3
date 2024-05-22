echo off
:: 关闭回显
title OPPO K9 Pro专用......
:: title:设置标题，后面接标题名称

goto 1
:: goto是前往，go to的意思(Bat只能写goto)

:1
cls
:: 清除页面上的字符，此处用于兜底，防止连续显示两次
echo **************************************
echo.
echo 你要前往哪里？
:: echo后接文字是显示文字 
:: echo后加.是显示空白行
echo.
echo 1.FastBoot区
echo.
echo 2.ADB区
echo.
echo 3.DSU区
echo.
echo 4.部分版本Root
echo.
echo **************************************
set /p choice=
:: set是设定 /p用于暂停 choice是值的名称
:: =是赋值 所以1+1=2应该写1+1==2
if "%choice%"=="1" goto FastBootMode
if "%choice%"=="2" goto ADBMode
if "%choice%"=="3" goto DSUMode
if "%choice%"=="4" goto Root
:: if是如果
:: 翻译:
:: 如果 choice 等于 某个字符(这里只写了1 2 3，a b c d...也是可以的，所有的字符都行) 前往 名字
:: 如果输入的不对会自动返回，可以用cls兜底
:: 到这里后面就没有什么注释了(该解释的都解释完了)

:FastBootMode
cls
echo **************************************
echo.
echo FastBoot功能
echo.
echo **************************************
echo.
echo 0.返回上一级
echo.
echo **************************************
echo.
echo 1.刷入指定分区，指定文件
echo.
echo 2.解锁Bootloader锁
echo.
echo 3.锁定Bootloder
echo.
echo 4.240版本解锁Bootloder后Root
echo.
echo **************************************
set /p choice=
if "%choice%"=="0" goto 1
if "%choice%"=="1" goto Flash
if "%choice%"=="2" goto UnlockBootloader
if "%choice%"=="3" goto LockBootloader
if "%choice%"=="4" goto 240Root

:Flash
cls
echo 输入分区名:
set /p name=
echo 拖入文件
set /p file=
echo 按任意键开始执行
pause
echo 以下是输出信息
echo **************************************
\platform-tools\fastboot.exe flash "%name%" "%file%"
echo **************************************
echo 按任意键返回
pause
goto FadtBootMode

:UnlockBootloader
cls
echo 按任意键开始
pause
echo 以下是输出信息
echo **************************************
\platform-tools\fastboot.exe flashing unlock
echo **************************************
echo 按任意键返回
pause
goto FastBootMode

:LockBootloader
cls
echo 按任意键开始
pause
echo 以下是输出信息
echo **************************************
\platform-tools\fastboot.exe flashing lock
echo **************************************
echo 按任意键返回
pause
goto FastBootMode

:ADBMode
cls
echo **************************************
echo.
echo 0.返回上一级
echo.
echo **************************************
echo.
echo 1.激活Shizuku
echo.
echo 2.安装APK
echo.
echo 3.DSU Sideloader安装(到执行命令时)
echo.
echo **************************************
set /p choice=
if "%choice%"=="0" goto 1
if "%choice%"=="1" goto Shizuku
if "%choice%"=="2" goto installAPK
if "%choice%"=="3" goto installDSUSideloader

:Shizuku
cls
echo 按任意键开始
pause
echo 以下是输出信息
echo **************************************
\platform-tools\adb.exe shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh
echo **************************************
echo 按任意键返回
pause
goto ADBMode

:installAPK
cls
echo 拖入APK文件
set /p file=
pause
echo 按任意键开始
pause
echo 以下是输出信息
echo **************************************
\platform-tools\adb.exe install "%file%"
echo **************************************
echo 按任意键返回
pause
goto ADBMode

:installDSUSideloader
cls
echo 按任意键开始
pause
echo 以下是输出信息
echo **************************************
\platform-tools\adb.exe shell sh "/storage/emulated/0/Android/data/vegabobo.dsusideloader/files/install"
echo **************************************

:DSUMode
cls
echo **************************************
echo.
echo 0.返回上一级
echo.
echo **************************************
echo.
echo 1.开启动态系统黏滞
echo.
echo 2.关闭动态系统黏滞
echo.
echo **************************************
set /p choice=
if "%choice%"=="0" goto 1
if "%choice%"=="1" goto AbnormalReboot
if "%choice%"=="2" goto NormalReboot

:AbnormalReboot
cls
echo 按任意键开始
pause
echo 以下是输出信息
echo **************************************
\platform-tools\adb.exe shell gsi_tool enable
echo **************************************
echo 按任意键返回
pause
goto DSUMode

:NormalReboot
cls
echo **************************************
\platform-tools\adb.exe shell gsi_tool disable
echo **************************************
echo 按任意键返回
pause
goto DSUMode

:Root
echo **************************************
echo.
echo 0.返回上一级
echo.
echo **************************************
echo.
echo 注意在要FastBoot模式下
echo.
echo 1.PEYM00_13.1.0.240版本
echo. 
echo **************************************
echo 如果需要其他版本，请在评论区发给我原版Boot并提供版本号截图
if 

:240Root
cls
echo **************************************
echo.
echo 0.返回上一级
echo.
echo **************************************
echo.
echo 请选择版本
echo.
echo 1.Magisk 27000已过签名校验
echo. 
echo 2.KernelSU 11850已过签名校验(有Bug)
echo 用Reno6Pro内核源码编译出的，能使用
echo.
echo **************************************
set /p choice=
if "%choice%"=="0" goto 1
if "%choice%"=="1" goto 240MagiskRoot
if "%choice%"=="2" goto 240KernelSURoot



:240MagsikRoot
cls
echo 按任意键开始
pause
echo 以下是输出信息
echo **************************************
\platform-tools\fastboot.exe flash boot \files\UnofficialFiles\Boot\13.1.0.240\Magisk\boot.img
echo **************************************
echo 按任意键返回
pause
goto Root

:240KernelSURoot
cls
echo 按任意键开始
pause
echo 以下是输出信息
echo **************************************
\platform-tools\fastboot.exe flash boot \files\UnofficialFiles\Boot\13.1.0.240\KernelSU\boot.img
echo **************************************
echo 按任意键返回
pause
goto Root