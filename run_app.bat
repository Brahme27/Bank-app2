@echo off
REM Test Case Generator App Launcher for Windows

echo.
echo ================================
echo   Test Case Generator App
echo ================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH
    echo Please install Python 3.8 or higher from python.org
    pause
    exit /b 1
)

echo Python found: 
python --version
echo.

REM Check if required packages are installed
echo Checking dependencies...
python -c "import streamlit" >nul 2>&1
if errorlevel 1 (
    echo Installing dependencies...
    pip install -r requirements.txt
) else (
    echo Dependencies installed
)

REM Check if prompt file exists
if not exist "Test_Case_Generation_Prompt.md" (
    echo Error: Test_Case_Generation_Prompt.md not found
    echo Please run this script from the testcases folder
    pause
    exit /b 1
)

echo.
echo Starting Streamlit app...
echo The app will open in your browser automatically
echo Press Ctrl+C to stop the server
echo.

REM Run Streamlit
streamlit run app.py

pause
