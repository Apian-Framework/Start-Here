@echo off
rem check for git lfs support
for /f "delims=" %%a in ('git lfs version^|findstr /B /R /C:"^git-lfs/[0-9\.]* (.*)"') do @set lfsresult=%%a
if  "%lfsresult%" == "" (
  echo Git LFS not installed. see https://git-lfs.github.com/
  exit /b
)

set URL_BASE=https://github.com/Apian-Framework/
set DESTPATH=%1
if  "%DESTPATH%" == "" (
  echo usage: clone-apian-repos ^<dest-path^>
  exit /b
)

set ALL_REPOS=Apian.Net ApianAppUtils Beam.Cli Beam.Unity BeamGameCode Libp2p-Unity MqttJS-Unity NotUnityEngine P2pNet Start-Here UniLog

rem clone the repos
for %%r in (%ALL_REPOS%) do (
  echo git clone %URL_BASE%%%r.git %DESTPATH%/%%r
  git clone %URL_BASE%%%r.git %DESTPATH%\%%r
)

