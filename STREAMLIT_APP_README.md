# 🚀 TEST CASE GENERATOR - STREAMLIT APP

An AI-powered web application to automatically generate comprehensive test cases from BRD (Business Requirements Document) files.

---

## ✨ FEATURES

### 📤 Multi-Format Document Upload
- **Word Documents** (.docx) - Extracts text and tables
- **PDF Files** (.pdf) - Extracts text from all pages
- **Excel Spreadsheets** (.xlsx, .xls) - Reads all sheets
- **Text Files** (.txt) - Direct text input
- **Multiple Files** - Combine multiple documents for comprehensive analysis

### 🤖 AI-Powered Generation
- Uses **Claude 3.5 Sonnet** API for intelligent test case generation
- Follows **CASA banking framework** (490 test cases analyzed)
- Generates **14-column structured** test cases
- Implements **15-step workflow model**
- Includes **authorization patterns** (maker-checker)
- Creates **field-level validations**
- Generates **negative test cases** (10-15%)

### 📊 Interactive Dashboard
- **Real-time statistics** (total, positive, negative, by module)
- **Advanced filtering** (by module, category, importance)
- **Visual charts** (distribution, breakdown)
- **Export options** (Excel with formatting, CSV)

### 💾 Professional Output
- **Excel format** with:
  - Formatted headers (colored, bold)
  - Adjusted column widths
  - Summary statistics sheet
  - Professional appearance
- **CSV format** for tool integration
- **Immediate download** after generation

---

## 🚀 QUICK START

### 1️⃣ Install Dependencies
```bash
cd /Users/giritejareddy/Downloads/testcases
pip install -r requirements.txt
```

### 2️⃣ Run the App
**Mac/Linux:**
```bash
chmod +x run_app.sh
./run_app.sh
```

**Windows:**
```
run_app.bat
```

**Or manually:**
```bash
streamlit run app.py
```

### 3️⃣ Open Browser
The app automatically opens at `http://localhost:8501`

If not, manually navigate to the URL shown in terminal.

---

## 📖 USER GUIDE

### Step 1: Get Claude API Key
1. Visit [Anthropic Console](https://console.anthropic.com/)
2. Sign up or log in
3. Go to API Keys section
4. Create new key
5. Copy the key (format: `sk-ant-...`)

### Step 2: Configure App
In the **left sidebar**, enter:
- **Claude API Key** (required)
- **Target Test Case Count** (10-1000, default: 100)
- **Negative Test Ratio** (5-25%, default: 15%)
- **Customer/Product Variations** (select applicable types)
- **Focus Modules** (optional, select specific modules)

### Step 3: Upload BRD Files
1. Click **"Browse files"** button
2. Select one or more BRD files
3. Supported formats: .docx, .pdf, .xlsx, .xls, .txt
4. Files shown with size info

**Optional**: Click **"Preview Extracted Text"** to verify content

### Step 4: Generate Test Cases
1. Click **"🚀 Generate Test Cases"** button
2. Wait for processing (30 seconds to 2 minutes)
3. Progress shown with spinner
4. Success message appears when complete

### Step 5: Review Results
Navigate to **"📊 View Results"** tab:
- View all generated test cases in table
- See statistics dashboard
- Use filters to narrow down:
  - Filter by Module
  - Filter by Category (Positive/Negative)
  - Filter by Importance (Critical/High/Medium/Low)
- Expand module/category breakdowns

### Step 6: Download
Navigate to **"💾 Download"** tab:
- Click **"Download as Excel"** for formatted output
- Or click **"Download as CSV"** for simple format
- File saved with timestamp in name

---

## 🎯 USAGE EXAMPLES

### Example 1: Banking Account Opening
```
📁 Upload: Account_Opening_BRD.docx
⚙️  Settings:
   - Target: 150 test cases
   - Negative: 15%
   - Variations: Individual, Corporate, Joint
   - Focus: Account Opening

📊 Expected Output: ~150 test cases
   - Field validations: 30 TCs
   - Individual workflow: 45 TCs
   - Corporate workflow: 45 TCs
   - Joint account workflow: 45 TCs
   - Negative tests: 25 TCs
```

### Example 2: Loan Processing System
```
📁 Upload: 
   - Loan_Application_BRD.docx
   - Loan_Approval_Workflow.pdf
   - Field_Specifications.xlsx

⚙️  Settings:
   - Target: 200 test cases
   - Negative: 12%
   - Variations: Personal Loan, Home Loan, Business Loan
   - Focus: Loan Processing, Approval

📊 Expected Output: ~200 test cases
   - Field validations: 40 TCs
   - Personal loan workflow: 50 TCs
   - Home loan workflow: 50 TCs
   - Business loan workflow: 50 TCs
   - Negative tests: 25 TCs
```

### Example 3: E-commerce Checkout
```
📁 Upload: Checkout_Requirements.docx, Payment_Gateway.pdf

⚙️  Settings:
   - Target: 80 test cases
   - Negative: 15%
   - Variations: Guest User, Registered User
   - Focus: Checkout, Payment

📊 Expected Output: ~80 test cases
   - Form validations: 20 TCs
   - Guest checkout: 25 TCs
   - Registered checkout: 25 TCs
   - Negative tests: 10 TCs
```

---

## 🎨 OUTPUT FORMAT

### Excel File Structure

**Sheet 1: Test Cases**
| Column | Description | Example |
|--------|-------------|---------|
| Product Name | Product/module name | Banking Application |
| Process Category | High-level category | Account Opening |
| Business Process ID | Numeric ID | 1 |
| Business Process | Process description | Open accounts for customers |
| Scenario ID | Scenario number | 1 |
| Scenario Description | Scenario details | Open individual savings account |
| Category | Positive/Negative | Functional Positive |
| Importance | Priority level | Critical |
| Test Case ID | Unique identifier | TC_001 |
| TC Module | Module name | Account Opening |
| Test Condition | What to test | Verify mandatory fields |
| Pre-requisite | Required setup | Customer CIF available |
| Test Case Description | Detailed steps | To verify System allows... |
| Expected Result | Expected outcome | System should display... |

**Sheet 2: Summary**
- Total Test Cases
- Functional Positive count
- Functional Negative count
- Critical/High/Medium/Low counts
- Unique Modules
- Unique Scenarios

---

## 💡 TIPS FOR SUCCESS

### ✅ Good BRD Documents Include:
- **Clear structure** with section headings
- **Screen/form specifications** with field lists
- **Field properties** (mandatory/optional, format, length, validations)
- **Business rules** and constraints
- **Workflow descriptions** with steps
- **User roles** and permissions
- **Authorization requirements**
- **Error messages** and validations

### ⚠️ Common Issues to Avoid:
- ❌ Vague requirements ("system should work properly")
- ❌ Missing field specifications
- ❌ Incomplete workflows
- ❌ No business rules documented
- ❌ Unclear user roles
- ❌ Missing error handling specs

### 📏 Recommended Test Case Counts:
- **Small module** (10-20 pages BRD): 50-100 test cases
- **Medium module** (20-50 pages BRD): 100-300 test cases
- **Large module** (50-100 pages BRD): 300-500 test cases
- **Very large** (>100 pages): Split into multiple generations

### 🎯 Recommended Settings:
- **Negative ratio**: 10-15% (captures business rule violations)
- **Variations**: Include all customer/product types from BRD
- **Focus modules**: Use when BRD covers multiple unrelated modules

---

## 🔧 TROUBLESHOOTING

### Problem: Dependencies won't install
```bash
# Try upgrading pip first
pip install --upgrade pip

# Then install requirements
pip install -r requirements.txt

# If specific package fails, install individually
pip install streamlit
pip install anthropic
pip install python-docx
pip install PyPDF2
pip install openpyxl
```

### Problem: API key not working
**Symptoms**: Error message about authentication
**Solutions**:
- Verify key starts with `sk-ant-`
- Check for extra spaces when pasting
- Ensure you have API credits
- Try generating a new key

### Problem: No test cases generated
**Symptoms**: Empty results or error message
**Solutions**:
- Check BRD has detailed requirements
- Use "Preview Extracted Text" to verify content
- Try reducing target count
- Ensure BRD isn't too generic
- Check API key is valid

### Problem: Generation timeout
**Symptoms**: Stuck on "generating" for >5 minutes
**Solutions**:
- Refresh page and try again
- Reduce target test case count
- Split large BRD into smaller sections
- Check internet connection

### Problem: Test cases seem generic
**Symptoms**: Non-specific test cases
**Solutions**:
- Upload more detailed BRD with specifics
- Include field specifications in BRD
- Add workflow diagrams/descriptions to BRD
- Specify variations more clearly

### Problem: Excel file won't download
**Symptoms**: Click download but nothing happens
**Solutions**:
- Check browser's download folder
- Disable popup blocker
- Try CSV format instead
- Use different browser

---

## 🎓 ADVANCED FEATURES

### Custom Prompt Modification
Edit `Test_Case_Generation_Prompt.md` to customize:
- Test case patterns
- Field validation approach
- Workflow structure
- Expected result format
- Negative test coverage

### Batch Processing
For multiple modules:
1. Process each module separately
2. Download individual Excel files
3. Combine using Excel or Python script

### Integration with Tools
**JIRA:**
- Download CSV
- Use JIRA CSV import
- Map columns to fields

**TestRail:**
- Download Excel
- Use TestRail import
- Configure field mapping

**Azure DevOps:**
- Download CSV
- Import as test cases
- Map to work item fields

---

## 📊 COST ESTIMATION

### Claude API Pricing (2024)
- Input: $3 per million tokens
- Output: $15 per million tokens

### Estimated Costs
| BRD Size | Test Cases | Est. Cost |
|----------|-----------|-----------|
| Small (10-20 pages) | 50-100 | $0.20-$0.40 |
| Medium (20-50 pages) | 100-200 | $0.50-$1.00 |
| Large (50-100 pages) | 200-400 | $1.00-$2.00 |
| Very Large (100+ pages) | 400-600 | $2.00-$4.00 |

**Cost-saving tips:**
- Start with lower target counts
- Focus on specific modules
- Generate in batches
- Optimize BRD for clarity (reduces tokens)

---

## 🔐 SECURITY & PRIVACY

### API Key Security
- API key is stored only in browser session
- Not saved to disk or database
- Cleared when you close browser
- Use environment variables for automation

### Document Privacy
- Documents processed in memory only
- Not saved to server
- Not sent to any third party (except Claude API)
- Claude doesn't train on your data ([Details](https://www.anthropic.com/legal/commercial-terms))

### Best Practices
- Don't share your API key
- Don't upload confidential BRDs to public systems
- Use secure network connection
- Clear browser cache after use

---

## 📁 FILE STRUCTURE

```
testcases/
├── app.py                              # Main Streamlit app
├── requirements.txt                     # Dependencies
├── run_app.sh                          # Mac/Linux launcher
├── run_app.bat                         # Windows launcher
├── .streamlit/
│   └── config.toml                     # App configuration
├── Test_Case_Generation_Prompt.md      # AI prompt template
├── APP_SETUP_GUIDE.md                  # Detailed setup guide
├── STREAMLIT_APP_README.md             # This file
└── [Framework Documentation Files]     # Analysis, guides, etc.
```

---

## 🆘 SUPPORT

### Getting Help
1. **Check this README** first
2. Review **APP_SETUP_GUIDE.md** for detailed setup
3. Check **Test_Case_Analysis_Report.md** for framework details
4. Review example files (CASA BRD and test cases)

### Reporting Issues
Include:
- Error message (full text)
- Steps to reproduce
- BRD file characteristics
- Settings used
- Screenshots

---

## 🎉 SUCCESS CHECKLIST

Before generating test cases, ensure:
- [ ] Python 3.8+ installed
- [ ] All dependencies installed (`pip install -r requirements.txt`)
- [ ] Claude API key obtained
- [ ] BRD document ready with detailed requirements
- [ ] App running (`streamlit run app.py`)
- [ ] API key entered in sidebar
- [ ] Settings configured appropriately
- [ ] BRD files uploaded
- [ ] Preview looks correct (optional check)

After generation:
- [ ] Test cases generated successfully
- [ ] Statistics look reasonable
- [ ] Negative test ratio is 10-15%
- [ ] Test cases have detailed descriptions
- [ ] Pre-requisites are clear
- [ ] Expected results are specific
- [ ] Downloaded Excel/CSV file opens correctly

---

## 📝 VERSION INFO

**Version**: 1.0  
**Release Date**: October 7, 2025  
**Framework**: CASA Banking (490 test cases analyzed)  
**AI Model**: Claude 3.5 Sonnet  
**Platform**: Streamlit 1.29+  

---

## 🚀 START GENERATING!

Ready to create test cases?

**Mac/Linux:**
```bash
./run_app.sh
```

**Windows:**
```
run_app.bat
```

**Manual:**
```bash
streamlit run app.py
```

Open browser → Enter API key → Upload BRD → Generate → Download! 🎉

---

**Happy Testing! 📋✨**
