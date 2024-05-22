echo off
:: �رջ���
title OPPO K9 Proר��......
:: title:���ñ��⣬����ӱ�������

goto 1
:: goto��ǰ����go to����˼(Batֻ��дgoto)

:1
cls
:: ���ҳ���ϵ��ַ����˴����ڶ��ף���ֹ������ʾ����
echo **************************************
echo.
echo ��Ҫǰ�����
:: echo�����������ʾ���� 
:: echo���.����ʾ�հ���
echo.
echo 1.FastBoot��
echo.
echo 2.ADB��
echo.
echo 3.DSU��
echo.
echo 4.���ְ汾Root
echo.
echo **************************************
set /p choice=
:: set���趨 /p������ͣ choice��ֵ������
:: =�Ǹ�ֵ ����1+1=2Ӧ��д1+1==2
if "%choice%"=="1" goto FastBootMode
if "%choice%"=="2" goto ADBMode
if "%choice%"=="3" goto DSUMode
if "%choice%"=="4" goto Root
:: if�����
:: ����:
:: ��� choice ���� ĳ���ַ�(����ֻд��1 2 3��a b c d...Ҳ�ǿ��Եģ����е��ַ�����) ǰ�� ����
:: �������Ĳ��Ի��Զ����أ�������cls����
:: ����������û��ʲôע����(�ý��͵Ķ���������)

:FastBootMode
cls
echo **************************************
echo.
echo FastBoot����
echo.
echo **************************************
echo.
echo 0.������һ��
echo.
echo **************************************
echo.
echo 1.ˢ��ָ��������ָ���ļ�
echo.
echo 2.����Bootloader��
echo.
echo 3.����Bootloder
echo.
echo 4.240�汾����Bootloder��Root
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
echo ���������:
set /p name=
echo �����ļ�
set /p file=
echo ���������ʼִ��
pause
echo �����������Ϣ
echo **************************************
\platform-tools\fastboot.exe flash "%name%" "%file%"
echo **************************************
echo �����������
pause
goto FadtBootMode

:UnlockBootloader
cls
echo ���������ʼ
pause
echo �����������Ϣ
echo **************************************
\platform-tools\fastboot.exe flashing unlock
echo **************************************
echo �����������
pause
goto FastBootMode

:LockBootloader
cls
echo ���������ʼ
pause
echo �����������Ϣ
echo **************************************
\platform-tools\fastboot.exe flashing lock
echo **************************************
echo �����������
pause
goto FastBootMode

:ADBMode
cls
echo **************************************
echo.
echo 0.������һ��
echo.
echo **************************************
echo.
echo 1.����Shizuku
echo.
echo 2.��װAPK
echo.
echo 3.DSU Sideloader��װ(��ִ������ʱ)
echo.
echo **************************************
set /p choice=
if "%choice%"=="0" goto 1
if "%choice%"=="1" goto Shizuku
if "%choice%"=="2" goto installAPK
if "%choice%"=="3" goto installDSUSideloader

:Shizuku
cls
echo ���������ʼ
pause
echo �����������Ϣ
echo **************************************
\platform-tools\adb.exe shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh
echo **************************************
echo �����������
pause
goto ADBMode

:installAPK
cls
echo ����APK�ļ�
set /p file=
pause
echo ���������ʼ
pause
echo �����������Ϣ
echo **************************************
\platform-tools\adb.exe install "%file%"
echo **************************************
echo �����������
pause
goto ADBMode

:installDSUSideloader
cls
echo ���������ʼ
pause
echo �����������Ϣ
echo **************************************
\platform-tools\adb.exe shell sh "/storage/emulated/0/Android/data/vegabobo.dsusideloader/files/install"
echo **************************************

:DSUMode
cls
echo **************************************
echo.
echo 0.������һ��
echo.
echo **************************************
echo.
echo 1.������̬ϵͳ���
echo.
echo 2.�رն�̬ϵͳ���
echo.
echo **************************************
set /p choice=
if "%choice%"=="0" goto 1
if "%choice%"=="1" goto AbnormalReboot
if "%choice%"=="2" goto NormalReboot

:AbnormalReboot
cls
echo ���������ʼ
pause
echo �����������Ϣ
echo **************************************
\platform-tools\adb.exe shell gsi_tool enable
echo **************************************
echo �����������
pause
goto DSUMode

:NormalReboot
cls
echo **************************************
\platform-tools\adb.exe shell gsi_tool disable
echo **************************************
echo �����������
pause
goto DSUMode

:Root
echo **************************************
echo.
echo 0.������һ��
echo.
echo **************************************
echo.
echo ע����ҪFastBootģʽ��
echo.
echo 1.PEYM00_13.1.0.240�汾
echo. 
echo **************************************
echo �����Ҫ�����汾������������������ԭ��Boot���ṩ�汾�Ž�ͼ
if 

:240Root
cls
echo **************************************
echo.
echo 0.������һ��
echo.
echo **************************************
echo.
echo ��ѡ��汾
echo.
echo 1.Magisk 27000�ѹ�ǩ��У��
echo. 
echo 2.KernelSU 11850�ѹ�ǩ��У��(��Bug)
echo ��Reno6Pro�ں�Դ�������ģ���ʹ��
echo.
echo **************************************
set /p choice=
if "%choice%"=="0" goto 1
if "%choice%"=="1" goto 240MagiskRoot
if "%choice%"=="2" goto 240KernelSURoot



:240MagsikRoot
cls
echo ���������ʼ
pause
echo �����������Ϣ
echo **************************************
\platform-tools\fastboot.exe flash boot \files\UnofficialFiles\Boot\13.1.0.240\Magisk\boot.img
echo **************************************
echo �����������
pause
goto Root

:240KernelSURoot
cls
echo ���������ʼ
pause
echo �����������Ϣ
echo **************************************
\platform-tools\fastboot.exe flash boot \files\UnofficialFiles\Boot\13.1.0.240\KernelSU\boot.img
echo **************************************
echo �����������
pause
goto Root