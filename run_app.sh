#!/bin/bash

# Test Case Generator App Launcher
# This script sets up and runs the Streamlit app

echo "🚀 Test Case Generator App"
echo "=========================="
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

echo "✅ Python 3 found: $(python3 --version)"

# Check if required packages are installed
echo ""
echo "📦 Checking dependencies..."

if python3 -c "import streamlit" 2>/dev/null; then
    echo "✅ Streamlit installed"
else
    echo "⚠️  Streamlit not found. Installing dependencies..."
    pip3 install -r requirements.txt
fi

# Check if prompt file exists
if [ ! -f "Test_Case_Generation_Prompt.md" ]; then
    echo "❌ Test_Case_Generation_Prompt.md not found in current directory"
    echo "   Please ensure you're running this script from the testcases folder"
    exit 1
fi

echo "✅ All files found"
echo ""
echo "🌐 Starting Streamlit app..."
echo "   The app will open in your browser automatically"
echo "   Press Ctrl+C to stop the server"
echo ""

# Run Streamlit
streamlit run app.py
