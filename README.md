进销存管理系统

windows bat 脚本:
@echo off
taskkill /F /IM javaw.exe
start /b javaw -jar D:\jar\ruoyi-admin.jar
taskkill /F /IM nginx.exe
start /b /d "D:\nginx-1.27.4" nginx.exe