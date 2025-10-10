# TEST CASE GENERATOR APP - SETUP GUIDE

## 🚀 Quick Start

### Prerequisites
- Python 3.8 or higher
- Anthropic Claude API key ([Get one here](https://console.anthropic.com/))

### Installation Steps

#### 1. Install Dependencies
```bash
cd /Users/giritejareddy/Downloads/testcases
pip install -r requirements.txt
```

#### 2. Verify Installation
```bash
python -c "import streamlit; import anthropic; import docx; print('✅ All dependencies installed!')"
```

#### 3. Run the App
```bash
streamlit run app.py
```

The app will open automatically in your browser at `http://localhost:8501`

---

## 📖 How to Use the App

### Step 1: Get Your Claude API Key
1. Go to [Anthropic Console](https://console.anthropic.com/)
2. Sign up or log in
3. Navigate to API Keys section
4. Create a new API key
5. Copy the key (starts with `sk-ant-`)

### Step 2: Upload BRD Documents
1. Click "Browse files" in the Upload section
2. Select one or multiple BRD files:
   - Word documents (.docx)
   - PDF files (.pdf)
   - Excel spreadsheets (.xlsx, .xls)
   - Text files (.txt)
3. Files will be combined and analyzed together

### Step 3: Configure Generation Options
In the sidebar, set:
- **Target Test Case Count**: How many test cases you want (10-1000)
- **Negative Test Ratio**: Percentage of negative tests (5-25%, recommend 15%)
- **Variations**: Customer/product types to test
- **Focus Modules**: Specific modules to focus on (optional)

### Step 4: Generate Test Cases
1. Click "🚀 Generate Test Cases" button
2. Wait for AI processing (30 seconds - 2 minutes)
3. View results in the "View Results" tab

### Step 5: Review and Download
1. Review generated test cases
2. Use filters to narrow down results
3. Check statistics and distribution
4. Download as Excel (with formatting) or CSV

---

## 🎯 Features

### Document Processing
- **Multi-file support**: Upload multiple BRD documents
- **Format support**: Word, PDF, Excel, Text
- **Text extraction**: Automatic extraction from all formats
- **Table extraction**: Extracts tables from Word documents

### AI-Powered Generation
- **14-column structure**: Follows CASA framework
- **15-step workflows**: Breaks down complex processes
- **Authorization patterns**: Includes maker-checker test cases
- **Negative tests**: Generates business rule violations
- **Variations**: Creates customer/product variations

### Output Options
- **Excel format**: Formatted with colors, column widths, summary sheet
- **CSV format**: For import into other tools
- **Statistics dashboard**: View test case distribution
- **Filter capabilities**: Filter by module, category, priority

---

## 💡 Tips for Best Results

### BRD Document Quality
✅ **Good BRD includes:**
- Clear section headings
- Detailed screen/form specifications
- Field definitions (mandatory/optional, format, length)
- Business rules and validations
- Workflow descriptions
- User roles and permissions
- Authorization requirements

❌ **Avoid:**
- Vague requirements ("system should work well")
- Missing field specifications
- Incomplete workflows
- No business rules documented

### Generation Settings
- **Small BRD (10-20 pages)**: Target 50-100 test cases
- **Medium BRD (20-50 pages)**: Target 100-300 test cases
- **Large BRD (50+ pages)**: Target 300-500 test cases (or split into modules)

### Recommended Ratios
- Negative tests: **10-15%**
- Critical priority: **70%**
- High priority: **20%**
- Medium/Low: **10%**

---

## 🔧 Troubleshooting

### Issue: "ModuleNotFoundError"
**Solution**: Install missing packages
```bash
pip install -r requirements.txt
```

### Issue: "API key not working"
**Solution**: 
- Verify key is correct (starts with `sk-ant-`)
- Check you have API credits available
- Ensure no extra spaces when pasting

### Issue: "No test cases generated"
**Solution**:
- Check BRD has enough detail
- Verify extracted text looks correct (use Preview button)
- Try reducing target count
- Ensure BRD contains actual requirements

### Issue: "Generation takes too long"
**Solution**:
- Large BRDs may take 2-3 minutes
- Claude processes complex analysis
- If stuck >5 minutes, refresh and try again
- Consider splitting large BRDs into modules

### Issue: "Test cases seem generic"
**Solution**:
- Upload more detailed BRD documents
- Include field specifications and workflows
- Add business rules to BRD
- Specify customer/product variations

### Issue: "Can't open Excel file"
**Solution**:
- Download may be blocked by browser
- Check Downloads folder
- Try CSV format instead
- Ensure Excel is installed to open .xlsx files

---

## 📊 Example Usage

### Example 1: Banking Account Opening Module
```
Files: Account_Opening_BRD.docx, UI_Screens.pdf
Target Count: 150
Negative Ratio: 15%
Variations: Individual Customer, Corporate Customer, Joint Account
Focus: Account Opening

Expected Output: ~150 test cases covering:
- Field validations (30 TCs)
- Individual workflow (45 TCs)
- Corporate workflow (45 TCs)  
- Joint account workflow (45 TCs)
- Negative tests (25 TCs)
```

### Example 2: E-commerce Checkout
```
Files: Checkout_Requirements.docx, Payment_Specs.xlsx
Target Count: 80
Negative Ratio: 12%
Variations: Guest User, Registered User, Premium Member
Focus: Checkout, Payment

Expected Output: ~80 test cases covering:
- Form validations (15 TCs)
- Guest checkout (20 TCs)
- Registered checkout (20 TCs)
- Premium checkout (15 TCs)
- Negative tests (10 TCs)
```

---

## 🎨 Customization

### Modify the Prompt
Edit `Test_Case_Generation_Prompt.md` to customize:
- Test case patterns
- Coverage requirements
- Naming conventions
- Expected result formats

### Adjust App Settings
Edit `app.py` to change:
- Default values (lines 140-160)
- Column widths (lines 350-360)
- Color schemes (lines 20-40)
- Filters and options

---

## 📁 File Structure

```
testcases/
├── app.py                              # Main Streamlit application
├── requirements.txt                     # Python dependencies
├── Test_Case_Generation_Prompt.md      # AI prompt template
├── APP_SETUP_GUIDE.md                  # This file
├── CASA and TD BRD (1).docx           # Example BRD
├── TC_CASA_For AI.xlsx                # Example output
├── Test_Case_Analysis_Report.md       # Framework documentation
├── Quick_Reference_Guide.md           # Quick patterns
└── README.md                          # Package overview
```

---

## 🚀 Advanced Usage

### Batch Processing Multiple Modules
1. Create separate folders for each module
2. Run app for each module separately
3. Combine Excel files manually or using script

### Integration with Test Management Tools
**JIRA/Xray:**
- Download CSV
- Map columns to JIRA fields
- Import using JIRA import feature

**TestRail:**
- Download CSV
- Use TestRail CSV import
- Map columns accordingly

**Azure DevOps:**
- Download Excel
- Convert to work items
- Import using Azure import tool

### API Usage (Advanced)
For developers who want to integrate directly:

```python
import anthropic
from docx import Document

# Read BRD
doc = Document('BRD.docx')
brd_text = '\n'.join([p.text for p in doc.paragraphs])

# Load prompt
with open('Test_Case_Generation_Prompt.md') as f:
    prompt = f.read()

# Call Claude API
client = anthropic.Anthropic(api_key='your-key')
response = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    max_tokens=16000,
    messages=[{
        "role": "user", 
        "content": f"{prompt}\n\n{brd_text}\n\nGenerate test cases:"
    }]
)

# Process response
test_cases = response.content[0].text
```

---

## 💰 Cost Estimation

Claude API pricing (as of 2024):
- **Claude 3.5 Sonnet**: $3 per million input tokens, $15 per million output tokens

Estimated costs per generation:
- Small BRD (50 test cases): ~$0.20 - $0.40
- Medium BRD (150 test cases): ~$0.50 - $1.00
- Large BRD (300 test cases): ~$1.00 - $2.00

**Cost-saving tips:**
- Generate fewer test cases per request
- Use target count to limit output
- Focus on specific modules rather than entire BRD

---

## 🆘 Support

### Getting Help
1. Check this guide first
2. Review framework documentation
3. Check example files (CASA BRD and test cases)
4. Refer to Test_Case_Generation_Prompt.md

### Reporting Issues
When reporting issues, provide:
- Error message (full text)
- BRD file characteristics (size, format, content type)
- Generation settings used
- Screenshots if applicable

---

## 📝 Version History

**Version 1.0** (2025-10-07)
- Initial release
- Multi-file upload support
- 14-column CASA framework
- Excel and CSV export
- Statistics dashboard
- Filter capabilities

---

## 🎉 You're Ready!

Run the app now:
```bash
streamlit run app.py
```

Happy test case generation! 🚀
