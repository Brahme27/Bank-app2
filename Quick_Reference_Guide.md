# QUICK REFERENCE GUIDE
## Test Case Generation Patterns from CASA Project

---

## 📋 TEST CASE STRUCTURE (14 Columns)

| # | Column Name | Description | Example |
|---|-------------|-------------|---------|
| 1 | Product Name | Product/module being tested | Current account |
| 2 | Process Category | High-level process category | Open current accounts for different customers |
| 3 | Business Process ID | Numeric identifier | 1 |
| 4 | Business Process | Detailed process description | Open current accounts for different customers |
| 5 | Scenario ID | Scenario numeric ID | 1 |
| 6 | Scenario Description | Specific scenario | Open account with Individual Customer |
| 7 | Category | Test type | Functional Positive / Functional negative |
| 8 | Importance | Priority | Critical / High / Medium / Low |
| 9 | Test Case ID | Unique identifier | TC_001 |
| 10 | TC Module | Module/feature name | Open account |
| 11 | Test Condition | Test objective | To verify account opening |
| 12 | Pre-requisite | Required setup | Individual CIF id must be available |
| 13 | Test Case Description | Detailed steps | To verify whether System allows... |
| 14 | Expected Result | Expected outcome | System should allow/display... |

---

## 🎯 COMMON TEST CASE PATTERNS

### Pattern 1: Field Validation Test Case
```
Test Condition: To verify the entry of [section name]
Test Case Description: 
  To verify whether System allows the user to enter the below mandatory fields in [screen/tab]:
  - Field 1
  - Field 2
  - Field 3
Expected Result: System should allow the user to enter the values in [screen/tab].
```

### Pattern 2: Button/Action Test Case
```
Test Condition: [Action to perform]
Test Case Description: To verify whether System allows the user to [action]
Expected Result: System should display [expected screen/message]
```

### Pattern 3: Authorization Assignment
```
Test Condition: Authorize the [transaction type]
Test Case Description: 
  To verify whether System allows the user to enter the Assignment details:
  - Assign to
  - Authorizer name
  - Remarks
  Click on submit.
Expected Result: System should display "Transaction with reference number has been sent for authorization"
```

### Pattern 4: View Authorization Queue
```
Test Condition: Authorize the [transaction type]
Pre-requisite: Transaction reference number
Test Case Description: To verify whether System allows the user to authorize the [transaction]
Expected Result: System should display transaction reference in authorization queue
```

### Pattern 5: Authorization Approval
```
Test Condition: Authorize the [transaction type]
Pre-requisite: Transaction reference number
Test Case Description: 
  To authorize whether System allows the user to enter the authorization details:
  - Actions
  - Remarks
  Click on submit.
Expected Result: System should display "Transaction with reference number is approved"
```

### Pattern 6: View/Inquiry Test Case
```
Test Condition: To view the [information type]
Pre-requisite: [Data must exist]
Test Case Description: To view the [details] and click on save
Expected Result: System should display [specific information]
```

### Pattern 7: Negative Test Case
```
Category: Functional negative
Test Condition: [Business rule]
Test Case Description: To verify whether system allows [invalid operation]
Expected Result: System shouldn't allow [invalid operation]
```

---

## 🔄 WORKFLOW BREAKDOWN PATTERN

### Standard Account Opening Workflow (15 Steps)

| Step | Test Case | Action | Expected Result |
|------|-----------|--------|-----------------|
| 1 | TC_001 | Enter account details | Fields accepted |
| 2 | TC_002 | Enter account relations | Relations accepted |
| 3 | TC_003 | Enter mode of operation | Mode accepted |
| 4 | TC_004 | Enter nominee details | Nominee screen displayed |
| 5 | TC_005 | View nominee details | Confirmation screen with reference |
| 6 | TC_006 | Click submit | Success message |
| 7 | TC_007 | Proceed with success | Authorization assignment screen |
| 8 | TC_008 | Assign to authorizer | Sent for authorization |
| 9 | TC_009 | View authorization queue | Transaction visible |
| 10 | TC_010 | Explore transaction | Transaction details displayed |
| 11 | TC_011 | Authorize transaction | Approval success |
| 12 | TC_012 | View authorization watch | Authorization details |
| 13 | TC_013 | Click authorization serial | Transaction details screen |
| 14 | TC_014 | Override authorization | Completed successfully |
| 15 | TC_015 | View account reference | Account reference displayed |

---

## 🎨 SCENARIO VARIATION STRATEGY

### Create Variations For:

**Customer Types**:
- Individual customer → 15 test cases
- Corporate customer → 15 test cases  
- Joint account → 15 test cases

**Customer Categories** (each gets 15 test cases):
- Guarantor
- Joint owner
- Member
- Chairman
- Authorized signatory
- Secretary
- Trustee
- Guardian
- Director
- Owner
- Connected party
- Share holder public

**Product Types**:
- Standard account → Full workflow
- Foreign currency account → Full workflow
- Each product variation → Full workflow

**Branch Types**:
- Home branch operations
- Non-home branch operations

**Result**: Base workflow (15 test cases) × Variations = Comprehensive coverage

---

## 📝 DESCRIPTION WRITING TEMPLATES

### Template 1: Field Entry Description
```
To verify whether System allows the user to enter the below mandatory fields in the [section]:
[Field 1],
[Field 2],
[Field 3],
...
```

### Template 2: Action Description
```
To verify whether System allows the user to [action].
```

### Template 3: Complex Action Description
```
To verify whether System allows the user to [action]:
[Item 1],
[Item 2],
[Item 3].
Click on [button].
```

### Template 4: View/Inquiry Description
```
To view the [information].
Enter the [criteria] and click on [button].
```

### Template 5: Modification Description
```
To modify the [field/section]:
[Action 1],
[Action 2].
Click on save.
```

---

## ✅ EXPECTED RESULT TEMPLATES

### Positive Results:
```
✓ System should allow the user to enter the values in [section]
✓ System should allow the user to [action]
✓ System should display [screen name]
✓ System should display a success message
✓ System should display "Transaction completed successfully with reference number"
✓ System should display "Transaction with reference number has been sent for authorization"
✓ System should display "Transaction with reference number is approved"
✓ System should display transaction reference in authorization queue
✓ System should display the [specific details]
```

### Negative Results:
```
✗ System shouldn't allow the user to [invalid action]
✗ System should not allow [invalid operation]
✗ System shouldn't allow user to select [invalid option]
```

---

## 🔗 PRE-REQUISITE PATTERNS

### Common Pre-requisites:
```
✓ Individual CIF id must be available
✓ Corporate CIF id must be available
✓ CIF with current account
✓ CIF with current account for individual
✓ Account number must be available
✓ Transaction reference number
✓ Authorization watch serial number
✓ Newly opened current account must be authorized
✓ Document type must be available
```

### Pre-requisite Dependency Chain:
```
TC_001-008: Pre-req = Initial setup (CIF, etc.)
TC_009-011: Pre-req = Transaction reference number (from TC_008)
TC_012-013: Pre-req = Authorization watch serial number (from TC_011)
TC_014-015: Pre-req = Previous step completion
```

---

## 📊 TEST CASE DISTRIBUTION GUIDE

### Recommended Distribution:

| Category | Percentage | Description |
|----------|-----------|-------------|
| Field Validation | 20-25% | Mandatory fields, validations, formats |
| Happy Path Workflow | 55-65% | End-to-end positive scenarios |
| Negative Scenarios | 10-15% | Business rule violations, invalid inputs |
| Inquiry/Reports | 5-10% | View, search, report generation |
| Modifications | 5-10% | Update, delete operations |

### Priority Distribution:

| Priority | Percentage | Usage |
|----------|-----------|-------|
| Critical | 70-80% | Core functionality, mandatory workflows |
| High | 15-20% | Important features, frequent operations |
| Medium | 5-10% | Secondary features |
| Low | 0-5% | Edge cases, nice-to-have |

---

## 🎯 FIELD-LEVEL TEST CASE CHECKLIST

For each screen/form, create test cases for:

### ✅ Input Validation
- [ ] Mandatory fields entry
- [ ] Optional fields entry
- [ ] Field format validation (date, numeric, alphanumeric)
- [ ] Field length validation (min/max)
- [ ] Special characters handling
- [ ] Dropdown/selection validations

### ✅ Field Dependencies
- [ ] Conditional mandatory fields
- [ ] Auto-population of dependent fields
- [ ] Field enable/disable based on selections
- [ ] Cross-field validations

### ✅ Boundary Testing
- [ ] Minimum value
- [ ] Maximum value
- [ ] Zero value (if applicable)
- [ ] Negative value (if applicable)

---

## 🔄 AUTHORIZATION WORKFLOW CHECKLIST

For each transactional feature:

### Maker Stage:
- [ ] Enter transaction details
- [ ] Click submit button
- [ ] Verify success message with reference
- [ ] Enter assignment details (Assign to, Authorizer, Remarks)
- [ ] Click submit assignment
- [ ] Verify "Sent for authorization" message

### Checker Stage:
- [ ] View authorization queue
- [ ] Verify transaction appears in queue
- [ ] Click on transaction to explore
- [ ] View complete transaction details
- [ ] Enter authorization action (Approve/Reject/Override)
- [ ] Enter remarks
- [ ] Click submit authorization
- [ ] Verify authorization success message

### Post-Authorization:
- [ ] View authorization watch tab
- [ ] Verify authorization watch serial number
- [ ] Click on serial number
- [ ] View complete transaction details screen
- [ ] Verify final status
- [ ] View reference number of completed transaction

---

## ❌ NEGATIVE TEST CASE CHECKLIST

### Business Rule Violations:
- [ ] Invalid combinations (e.g., single account with joint mandate)
- [ ] Restricted operations (e.g., account holder as nominee)
- [ ] Type mismatches (e.g., corporate CIF for individual account)
- [ ] Missing required relationships (e.g., minor without guardian)

### Data Validations:
- [ ] Missing mandatory fields
- [ ] Invalid data formats
- [ ] Out-of-range values
- [ ] Duplicate entries
- [ ] Invalid characters

### Access Control:
- [ ] Unauthorized user access
- [ ] Branch-level restrictions
- [ ] Role-based access restrictions
- [ ] Status-based operation restrictions

---

## 🚀 QUICK START GUIDE

### Step 1: Analyze BRD
- Extract all business processes
- Identify all screens and fields
- List business rules and validations
- Map authorization requirements

### Step 2: Create Structure
- Define test case columns
- Assign process IDs and scenario IDs
- Determine test priorities

### Step 3: Generate Field Test Cases (20-25%)
- One test case per form section
- Cover all mandatory fields
- Add validation test cases

### Step 4: Generate Workflow Test Cases (55-65%)
- Break workflow into 10-15 steps
- Create sequential test cases
- Link via pre-requisites
- Add authorization test cases

### Step 5: Generate Variations
- Customer types × Base workflow
- Product types × Base workflow
- Branch types × Base workflow

### Step 6: Generate Negative Test Cases (10-15%)
- One per business rule
- Invalid data scenarios
- Access restriction scenarios

### Step 7: Add Service Test Cases (5-10%)
- Inquiry/view test cases
- Report generation
- Modifications

### Step 8: Review
- Check coverage completeness
- Verify pre-requisite chains
- Ensure expected results are specific
- Validate sequential numbering

---

## 📌 QUICK TIPS

### DO's:
✅ Use consistent structure for all test cases  
✅ Break complex workflows into smaller steps  
✅ List fields explicitly in descriptions  
✅ Link test cases through pre-requisites  
✅ Include specific UI elements in expected results  
✅ Create variations for different user/product types  
✅ Add maker-checker pattern for all transactions  
✅ Use standard phrases for descriptions and results  

### DON'Ts:
❌ Don't create overly long test case descriptions  
❌ Don't use vague expected results like "works correctly"  
❌ Don't skip authorization workflow test cases  
❌ Don't forget negative test cases  
❌ Don't mix multiple validations in one test case  
❌ Don't ignore pre-requisite dependencies  
❌ Don't use inconsistent terminology  

---

## 🎓 EXAMPLES BY TYPE

### Example 1: Mandatory Fields
```
TC_001
Condition: To verify the opening of current account
Description: To verify whether System allows the user to enter the below mandatory fields:
  Account type, Account sub type, Account name, Product, Currency
Expected: System should allow the user to enter the values
```

### Example 2: Submit Action
```
TC_006
Condition: Click on submit
Description: To verify whether System allows the user to click on Submit
Expected: System should display a success message
```

### Example 3: Authorization
```
TC_008
Condition: Authorize the current account
Pre-req: Individual CIF id must be available
Description: To verify whether System allows the user to enter Assignment details:
  Assign to, Authorizer name, Remarks. Click on submit.
Expected: System should display "Transaction has been sent for authorization"
```

### Example 4: Negative
```
TC_341
Category: Functional negative
Condition: Nominee
Description: To verify whether system allows user to add account holder as nominee
Expected: System shouldn't allow user to add account holder himself as nominee
```

---

## 📞 COMMON PHRASES LIBRARY

### Test Condition Phrases:
- "To verify the opening of..."
- "To verify the entry of..."
- "To verify the modification of..."
- "To view the..."
- "Authorize the..."
- "Click on..."
- "Proceed with..."

### Description Start Phrases:
- "To verify whether System allows the user to..."
- "To verify whether System displays..."
- "To verify the..."
- "To authorize..."
- "To view..."
- "To modify..."

### Expected Result Phrases:
- "System should allow the user to..."
- "System should display..."
- "System should display a success message"
- "System shouldn't allow..."
- "System should not allow..."

---

## 📈 COVERAGE CHECKLIST

### Functional Coverage:
- [ ] All CRUD operations (Create, Read, Update, Delete)
- [ ] All screens/forms from BRD
- [ ] All workflows end-to-end
- [ ] All business rules validated
- [ ] All authorization workflows
- [ ] All user roles/types
- [ ] All product/transaction types

### Technical Coverage:
- [ ] All mandatory fields
- [ ] All optional fields
- [ ] All field validations
- [ ] All business rule validations
- [ ] All integration points
- [ ] All error scenarios

### Scenario Coverage:
- [ ] Happy path (positive)
- [ ] Alternative paths
- [ ] Negative scenarios
- [ ] Edge cases
- [ ] Boundary conditions

---

## 🎯 KEY SUCCESS METRICS

**Quality Indicators:**
- Test cases with clear pre-requisites: >95%
- Test cases with specific expected results: >95%
- Workflow continuity (pre-req chains): 100%
- Negative test case ratio: 10-15%
- Authorization workflow coverage: 100%

**Coverage Indicators:**
- Fields covered / Total fields: >95%
- Workflows covered / Total workflows: 100%
- Business rules covered / Total rules: 100%
- Scenario variations: Customer types × Product types × Branch types

---

**Use this guide as a quick reference when generating test cases from BRD documents.**
