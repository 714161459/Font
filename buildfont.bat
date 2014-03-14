@ECHO OFF
ECHO ************************************
ECHO *           ����ѡ��               *
ECHO ************************************
ECHO (1) ����ui_atlas
ECHO (2) ����ui_atlas_lowmem
ECHO (3) ����ppge_atlas
ECHO (4) ����ȫ��
CHOICE /C 1234 /M " ��ѡ��: "
IF ERRORLEVEL 4 GOTO runall
IF ERRORLEVEL 3 GOTO run3
IF ERRORLEVEL 2 GOTO run2
IF ERRORLEVEL 1 GOTO run1

:runall
:: ����
start /B cleandir.bat

:: ���ĸ��������������ΪRGBA4444 ����Ϊ RGBA8888
:: build ui_atlas (RGBA8888 ϵͳ�˵�)
atlastool atlasscript.txt ui 8888
:: build ui_atlas_lowmem (RGBA8888)
atlastool atlasscript_lowmem.txt ui_l 8888
copy /Y ui_l_atlas.cpp ui_atlas_lowmem.cpp
copy /Y ui_l_atlas.h ui_atlas_lowmem.h
copy /Y ui_l_atlas.zim ui_atlas_lowmem.zim
copy /Y ui_l_atlas.zim.png ui_atlas_lowmem.zim.png
del ui_l_atlas*
:: build ppge_atlas (RGBA4444, ��Ϸ�浵������)
atlastool ppge_atlasscript.txt ppge

goto END

:run1
:: build ui_atlas (RGBA8888 ϵͳ�˵�)
atlastool atlasscript.txt ui 8888
goto END

:run2
:: build ui_atlas_lowmem (RGBA8888)
atlastool atlasscript_lowmem.txt ui_l 8888
copy /Y ui_l_atlas.cpp ui_atlas_lowmem.cpp
copy /Y ui_l_atlas.h ui_atlas_lowmem.h
copy /Y ui_l_atlas.zim ui_atlas_lowmem.zim
copy /Y ui_l_atlas.zim.png ui_atlas_lowmem.zim.png
del ui_l_atlas*

goto END

:run3
:: build ppge_atlas (RGBA4444, ��Ϸ�浵������)
atlastool ppge_atlasscript.txt ppge

:END

@echo Build finished!
