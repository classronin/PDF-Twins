@echo off
:: pdf.bat
:: 无参数 = 合并 PNG 为 PDF（输出 out.pdf）
:: 有参数 = 拆分 PDF 为 PNG（自动创建文件夹）

if "%~1"=="" goto :merge

:: ========== 拆分模式 ==========
:split
if not exist "%~1" (echo 文件不存在 & exit /b 1)
set "outdir=%~n1"
if exist "%outdir%" (echo 文件夹 %outdir% 已存在，操作取消 & exit /b 1)

mkdir "%outdir%"
uv run --with pymupdf --no-project python "%~dp0PyMuPDF.py" "%~1" "%outdir%" "%~n1"
echo 完成
exit /b 0

:: ========== 合并模式 ==========
:merge
if exist "out.pdf" (echo out.pdf 已存在，操作取消 & exit /b 1)
if not exist "*-*.png" (echo 没有找到 PNG 文件 & exit /b 1)

:: 自动提取前缀
for %%i in (*.png) do set "prefix=%%~ni" & goto :do_merge
:do_merge
for /f "delims=-" %%a in ("%prefix%") do set "prefix=%%a"
:: 统一为 A4 竖版，图片自适应
img2pdf "%prefix%-*.png" -o out.pdf --pagesize A4 --fit shrink && echo 完成：out.pdf
exit /b 0
