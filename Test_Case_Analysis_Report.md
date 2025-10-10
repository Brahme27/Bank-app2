# TEST CASE ANALYSIS REPORT
## CASA (Current Account Savings Account) Banking Project

---

## EXECUTIVE SUMMARY

This document provides a comprehensive analysis of 490 test cases created for the CASA banking project. The analysis focuses on identifying patterns, structures, and methodologies used in test case creation to establish a reusable framework for generating similar test cases from BRD documents.

---

## 1. TEST CASE DISTRIBUTION

### 1.1 Overall Statistics
- **Total Test Cases**: 490
- **Test Category Distribution**:
  - Functional Positive: 443 (90.4%)
  - Functional positive: 35 (7.1%)
  - Functional negative: 12 (2.4%)
- **Priority Distribution**:
  - Critical: 490 (100%)

### 1.2 Module-wise Distribution
| Module | Test Cases | Percentage |
|--------|-----------|-----------|
| Demand account | 110 | 22.4% |
| Open account | 95 | 19.4% |
| Create account | 84 | 17.1% |
| Account services | 69 | 14.1% |
| Current account | 47 | 9.6% |
| Transfer Account | 11 | 2.2% |
| Quick services | 8 | 1.6% |
| Print transactions | 4 | 0.8% |
| Authorization queues | 6 | 1.2% |
| Account Details | 6 | 1.2% |
| Reports | 2 | 0.4% |
| Others | 48 | 9.8% |

---

## 2. TEST CASE STRUCTURE ANALYSIS

### 2.1 Standard Columns Used

All test cases follow a consistent 14-column structure:

1. **Product Name**: Current account
2. **Process Category**: High-level category (e.g., "Open current accounts for different customers")
3. **Business Process ID**: Numeric (1, 2, 3, etc.)
4. **Business Process**: Detailed process description
5. **Scenario ID**: Numeric identifier (1, 2, 3, etc.)
6. **Scenario Description**: Specific scenario being tested
7. **Category**: Functional Positive/Functional negative
8. **Importance**: Critical/High/Medium/Low
9. **Test Case ID**: Format: TC_XXX (e.g., TC_001, TC_002)
10. **TC Module**: Module/feature name
11. **Test Condition**: Brief description of test objective
12. **Pre-requisite**: Required setup or conditions
13. **Test Case Description**: Detailed step-by-step description
14. **Expected Result**: Expected outcome

### 2.2 Key Observations

**Consistency**:
- All test cases maintain consistent column structure
- Naming conventions are standardized
- Sequential numbering for test case IDs

**Modularity**:
- Test cases are grouped by scenarios
- Each scenario has multiple test cases covering different aspects
- Clear separation between field-level and workflow-level tests

---

## 3. FIELD-LEVEL TEST CASE PATTERNS

### 3.1 Mandatory Field Validation Pattern

**Structure Observed**:
```
Test Condition: To verify [action] for [entity] using [criteria]
Test Case Description: To verify whether System allows the user to enter the below mandatory fields in [screen/tab]:
- Field 1
- Field 2
- Field 3
...
Expected Result: System should allow the user to enter the values in [screen/tab].
```

**Example from Test Cases**:
```
TC_001:
Test Condition: To verify the opening of current account for Individual customer using Individual customer CIF.
Test Case Description: To verify whether System allows the user to enter the below mandatory fields in the account details:
- Account type
- Account sub type
- Account name
- Product
- Currency
- Account address same as customer address
- Customer address

Expected Result: System should allow the user to enter the values in the account details.
```

**Coverage Identified**:
- Account details mandatory fields
- Account relations mandatory fields
- Mode of operation mandatory fields
- Nominee details mandatory fields
- Document details mandatory fields
- General details mandatory fields

### 3.2 Field Entry Patterns

Multiple test cases created for different sections of the same form:
- **TC_001**: Account details fields
- **TC_002**: Account relations fields
- **TC_003**: Mode of operation fields
- **TC_004**: Nominee details fields

This pattern indicates separation of concerns for easier debugging and maintenance.

---

## 4. FUNCTIONAL/WORKFLOW TEST CASE PATTERNS

### 4.1 End-to-End Workflow Pattern

**Pattern Observed**: Breaking down complete workflows into sequential test cases

**Example: Account Opening Workflow**:
```
TC_001: Enter account details → Fields accepted
TC_002: Enter account relations → Relations accepted
TC_003: Enter mode of operation → Mode accepted
TC_004: Enter nominee details → Nominee screen displayed
TC_005: View nominee details → Confirmation screen with account reference
TC_006: Click submit → Success message displayed
TC_007: Proceed with success → Authorization assignment screen
TC_008: Assign to authorizer → Sent for authorization message
TC_009: View authorization queue → Transaction visible
TC_010: Explore transaction → Transaction details displayed
TC_011: Authorize transaction → Approval success message
TC_012: View authorization watch → Authorization details displayed
TC_013: Click authorization serial → Transaction details screen
TC_014: Override authorization → Transaction completed successfully
TC_015: View account reference → Account reference displayed
```

**Key Insights**:
- Each major step is a separate test case
- Pre-requisites link test cases in sequence
- Clear progression from data entry → submission → authorization → completion

### 4.2 Authorization Workflow Pattern

**Maker-Checker Pattern Consistently Applied**:

**Maker Stage**:
1. Enter transaction details
2. Submit transaction
3. Assign to authorizer
4. Verify assignment message

**Checker Stage**:
5. View authorization queue
6. Explore transaction details
7. Enter authorization action (Approve/Reject/Override)
8. Verify authorization success

**Post-Authorization**:
9. View authorization watch details
10. Verify transaction completion
11. View final record/reference number

**Example Test Cases**:
- TC_008: Assignment to authorizer
- TC_009: View in authorization queue
- TC_010: Explore transaction details
- TC_011: Authorize with remarks
- TC_012: View authorization watch
- TC_013: Click authorization serial
- TC_014: Override authorization
- TC_015: View completed account

---

## 5. SCENARIO VARIATION PATTERNS

### 5.1 Customer Type Variations

For each workflow, separate scenarios created for:
- **Individual customers**: TC_001-TC_015 range
- **Corporate customers**: TC_016-TC_030 range
- **Joint account holders**: Separate test cases
- **Different customer categories**: 
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

**Pattern**: Each customer category has 15 test cases covering the complete workflow

### 5.2 Product Type Variations

Separate scenarios for:
- Standard current account
- Foreign currency account
- Different account sub-types

**Example**:
- Scenario 1 (TC_001-TC_015): Standard account
- Scenario 3 (TC_035-TC_050): Foreign currency account

### 5.3 Branch Variations

Test cases distinguish between:
- Home branch operations
- Non-home branch operations

**Example**:
- TC_032: Opening individual CA using non-home branch customer CIF

---

## 6. NEGATIVE TEST CASE PATTERNS

### 6.1 Business Rule Violation Pattern

**Structure Observed**:
```
Test Condition: [Business rule being tested]
Test Case Description: To verify whether system allows [invalid operation]
Expected Result: System shouldn't allow [invalid operation]
```

**Examples from Test Cases**:

**Mode of Operation Restrictions**:
```
TC_321: Verify 'Any of us or survivor' for single account
Expected: System shouldn't allow
TC_322: Verify 'All or survivor' for single account
Expected: System shouldn't allow
TC_323: Verify 'Former or survivor' for single account
Expected: System shouldn't allow
TC_324: Verify 'Late or survivor' for single account
Expected: System shouldn't allow
```

**Nominee Restrictions**:
```
TC_341: Add account holder as nominee for individual
Expected: System shouldn't allow
TC_342: Add account holder as nominee for corporate
Expected: System shouldn't allow
TC_343: Add joint holder as nominee for individual
Expected: System shouldn't allow
TC_344: Add joint holder as nominee for corporate
Expected: System shouldn't allow
TC_363: Add minor without guardian for corporate
Expected: System shouldn't allow
TC_365: Add minor without guardian for individual
Expected: System shouldn't allow
```

### 6.2 Negative Test Case Coverage

**Areas Covered**:
1. **Mode of Operation**: Invalid mandate selections for account types
2. **Nominee Details**: 
   - Corporate CIF as nominee
   - Account holder as nominee
   - Joint holder as nominee
   - Minor without guardian
3. **Business Logic**: Invalid combinations and restrictions

**Insight**: Negative test cases are created for every business rule that restricts or prevents certain operations.

---

## 7. DATA MODIFICATION TEST CASE PATTERNS

### 7.1 Update Workflow Pattern

**Pattern Structure**:
```
1. Modify data
2. Save changes
3. Submit for authorization (if applicable)
4. Assign to authorizer (if applicable)
5. Authorize modification (if applicable)
6. View updated data
```

**Example: Document Details Modification**:
```
TC_058: Modify document type (ELECTRICITY BILL)
        Enter: Submitted (Yes/No), Issue date, Document reference
        Expected: System allows modification

TC_059: Submit modification
        Expected: Transaction completed successfully with reference number

TC_060: Enter assignment details
        Fields: Assign to, Authorizer name, Remarks
        Expected: Sent for authorization message

TC_061: Remove modified details
        Expected: System allows removal
```

### 7.2 Add/Delete Pattern

**Add New Data**:
- Add new nominee
- View newly added data
- Verify addition successful

**Delete Data**:
- Delete existing record
- Verify deletion
- Check impact on related data

---

## 8. INQUIRY/VIEW TEST CASE PATTERNS

### 8.1 Search and View Pattern

**Pattern Structure**:
```
1. Enter search criteria
2. Click search
3. Expected: System displays matching records
4. Select record
5. Expected: System displays details
```

**Examples**:
```
TC_015: View account reference number
        Action: Enter customer reference number and click Search
        Expected: System displays account reference number

TC_005: View nominee details
        Expected: System displays confirmation screen with account reference
```

### 8.2 Report Generation Pattern

Test cases for:
- Statement of account generation
- Duplicate statement generation
- Transaction reports
- Authorization reports

---

## 9. CROSS-FUNCTIONAL TEST CASE PATTERNS

### 9.1 Transaction Test Cases

**Identified Scenarios**:
1. **Cash Management**:
   - Branch to branch transfers
   - Vault teller to teller
   - Teller to teller
   - Teller to customer

2. **Account Transfers**:
   - Transfer between branches
   - Account details verification
   - Branch selection
   - Reason for transfer

3. **Fund Transfers**:
   - Cash deposit (home/non-home branch)
   - Withdrawal operations

### 9.2 Account Services Test Cases

**Services Covered**:
- Cheque book issue
- Cheque status management (stop, caution, lost)
- Cheque revocation
- Freezing methods
- Lien marking
- Statement generation

**Pattern**: Each service follows create → authorize → view workflow

### 9.3 Status Change Test Cases

**Scenarios Identified**:
```
TC_377: Active to Dormant (Automatic)
        Condition: No transactions for 1 year
        Expected: Automatic status change

TC_378: Dormant to Active
        Condition: Credit transaction after 1 year
        Expected: Automatic status change to active

TC_473: Active to Dormant (Manual)
        Expected: System allows manual status change
```

---

## 10. PRE-REQUISITE PATTERNS

### 10.1 Common Pre-requisites Observed

1. **CIF Requirements**:
   - "Individual CIF id must be available"
   - "Corporate CIF id must be available"
   - "CIF with current account"

2. **Transaction References**:
   - "Transaction reference number"
   - "Authorization watch serial number"
   - "Newly opened current account must be authorized"

3. **Account Requirements**:
   - "Account number must be available"
   - "CIF with current account for individual"
   - "Document type must be available"

### 10.2 Pre-requisite Chain Pattern

**Observation**: Pre-requisites create dependency chains

```
TC_001: Pre-req = Individual CIF id
TC_006: Pre-req = Individual CIF id (independent)
TC_007: Pre-req = Individual CIF id (dependent on TC_006)
TC_008: Pre-req = Individual CIF id (dependent on TC_007)
TC_009: Pre-req = Transaction reference number (dependent on TC_008)
TC_010: Pre-req = Transaction reference number (continues from TC_009)
```

---

## 11. EXPECTED RESULT PATTERNS

### 11.1 Common Expected Result Formats

**Allow/Accept Results**:
- "System should allow the user to enter the values in [section]"
- "System should allow the user to [action]"
- "System should display [screen/message]"

**Success Messages**:
- "System should display a success message"
- "Transaction completed successfully with reference number"
- "Transaction with reference number has been sent for authorization"
- "Transaction with reference number is approved"

**Restriction Results (Negative)**:
- "System shouldn't allow [action]"
- "System should not allow [operation]"

**Display Results**:
- "System should display [specific screen/details]"
- "System Should display [information] with [reference]"

### 11.2 Specificity in Expected Results

**High Specificity Examples**:
- "System should display user confirmation screen with account reference number and submit button"
- "System should display transaction details screen to the authorizer"
- "System Should display the authorization watch details with Authorization watch serial number"

**Pattern**: Expected results are action-oriented and specific about what should appear or be enabled

---

## 12. TEST CASE DESCRIPTION PATTERNS

### 12.1 Description Structure

**Standard Format**:
```
To verify whether System [allows/displays/validates] [object/action]:
[List of specific items/fields/actions]
[Additional actions like "Click on save", "Click on submit"]
```

**Examples**:

**Field Entry Description**:
```
To verify whether System allow the user to enter the below mandatory fields in the account details:
Account type,
Account sub type,
Account name,
Product,
Currency,
Account address same as customer address,
Customer address.
```

**Action-Based Description**:
```
To verify whether System allow the user to click on Submit.
```

**Authorization Description**:
```
To verify whether System allow the user to enter the Assignment details.
Assign to,
Authorizer name,
Remarks.
Click on submit.
```

### 12.2 Description Characteristics

1. **Clarity**: Always starts with "To verify whether System..."
2. **Specificity**: Lists exact fields or actions
3. **Completeness**: Includes all steps in the test
4. **Action-Oriented**: Uses verbs like enter, click, select, view
5. **Structured**: Uses bullet points or comma-separated lists for fields

---

## 13. SCENARIO GROUPING PATTERNS

### 13.1 Major Scenario Categories Identified

**Category 1: Account Opening Scenarios**
- Open account with Individual/Corporate customer (31 test cases)
- Open account with specific products (16 test cases)
- Open account for different customer categories (165 test cases total)
- Account opening from home/non-home branch (3 test cases)

**Category 2: Account Modification Scenarios**
- Modify/Add/Delete nomination details (7 test cases)
- Modification of document details (21 test cases)
- Modification of general details (5 test cases)
- Mode of operation modifications (14 test cases)

**Category 3: Account Services Scenarios**
- Cheque book operations (multiple test cases)
- Freezing methods (1 test case)
- Lien marking (1 test case)
- Statement generation (1 test case)
- Cheque status management (1 test case)

**Category 4: Transaction Scenarios**
- Cash deposits (1 test case)
- Account transfers (11 test cases)
- Cash management (multiple test cases)

**Category 5: Status Change Scenarios**
- Active to Dormant (2 test cases)
- Dormant to Active (1 test case)

**Category 6: Validation Scenarios**
- Abuser customer validation (1 test case)
- Nominee validations (12 negative test cases)
- Mode of operation validations (4 negative test cases)

### 13.2 Test Case Count per Scenario

**Observation**: Different scenarios have vastly different test case counts

- **High Count** (15-31 test cases): Complete workflows for different customer types
- **Medium Count** (5-14 test cases): Feature modifications and specific workflows
- **Low Count** (1-4 test cases): Quick validations or straightforward features

**Pattern**: Count reflects complexity and variations of the feature

---

## 14. NAMING CONVENTION PATTERNS

### 14.1 Test Case ID Pattern

**Format**: TC_XXX where XXX is a sequential number
- TC_001, TC_002, TC_003... TC_490
- No gaps in sequence
- Sequential within and across scenarios

### 14.2 Module Naming Patterns

**Observed Variations**:
- "Open account" vs "Create account" (used interchangeably)
- "Current account" vs "Current Account" (case inconsistency)
- "Demand account" (module name)
- "Account services" (generic service module)
- "Transfer Account" (specific feature)

**Insight**: Some inconsistency in module naming suggests manual creation; standardization would improve clarity

---

## 15. AUTHORIZATION TEST CASE DEEP DIVE

### 15.1 Authorization Stages Identified

**Stage 1: Submission**
```
Test Case Pattern:
- Enter transaction details
- Click submit
- Expected: Success message with reference number
```

**Stage 2: Assignment**
```
Test Case Pattern:
- Enter assignment details (Assign to, Authorizer name, Remarks)
- Click submit
- Expected: "Sent for authorization" message
```

**Stage 3: Queue Management**
```
Test Case Pattern:
- View authorization queue
- Expected: Transaction appears in queue
```

**Stage 4: Authorization**
```
Test Case Pattern:
- Explore transaction details
- Enter authorization action (Approve/Reject/Override)
- Enter remarks
- Click submit
- Expected: Authorization success message
```

**Stage 5: Post-Authorization**
```
Test Case Pattern:
- View authorization watch details
- Verify authorization serial number
- Click serial number
- View complete transaction details
- Expected: All details displayed correctly
```

### 15.2 Authorization Actions Observed

- **Approve**: Standard approval
- **Reject**: Rejection with remarks
- **Override**: Override authorization (higher authority)

**Pattern**: Each action has separate test cases with specific expected results

---

## 16. REUSABLE TEST CASE TEMPLATES

Based on the analysis, here are reusable templates:

### Template 1: Field Validation Test Case
```
Test Case ID: TC_XXX
Category: Functional Positive
Importance: Critical
TC Module: [Module Name]
Test Condition: To verify the entry of [field group] in [screen/tab name]
Pre-requisite: [Required data/state]
Test Case Description: To verify whether System allows the user to enter the below mandatory fields in [screen/tab]:
[Field 1],
[Field 2],
[Field 3],
...
Expected Result: System should allow the user to enter the values in [screen/tab].
```

### Template 2: Workflow Step Test Case
```
Test Case ID: TC_XXX
Category: Functional Positive
Importance: Critical
TC Module: [Module Name]
Test Condition: [Specific action being tested]
Pre-requisite: [Previous step completion or required data]
Test Case Description: To verify whether System allows the user to [action]:
[Detailed steps or fields]
Expected Result: System should [specific expected outcome].
```

### Template 3: Authorization Test Case
```
Test Case ID: TC_XXX
Category: Functional Positive
Importance: Critical
TC Module: [Module Name]
Test Condition: Authorize the [transaction type]
Pre-requisite: [Transaction reference number or state]
Test Case Description: To verify whether System allows the user to [authorization action]:
[Authorization details fields]
Expected Result: System should display [authorization success message/outcome].
```

### Template 4: Negative Test Case
```
Test Case ID: TC_XXX
Category: Functional negative
Importance: Critical
TC Module: [Module Name]
Test Condition: [Business rule being validated]
Pre-requisite: [Required setup]
Test Case Description: To verify whether system allows [invalid operation]
Expected Result: System shouldn't allow [invalid operation]
```

### Template 5: Inquiry Test Case
```
Test Case ID: TC_XXX
Category: Functional Positive
Importance: Critical
TC Module: [Module Name]
Test Condition: To view the [information type]
Pre-requisite: [Data must exist]
Test Case Description: To verify [view/search action]:
[Search criteria or navigation steps]
Expected Result: System should display [specific information].
```

---

## 17. KEY FINDINGS AND RECOMMENDATIONS

### 17.1 Strengths of Current Test Cases

1. **Comprehensive Coverage**: 490 test cases cover extensive scenarios
2. **Structured Approach**: Consistent 14-column structure
3. **Workflow Breakdown**: Complex workflows broken into manageable test cases
4. **Authorization Focus**: Strong emphasis on maker-checker workflows
5. **Variation Coverage**: Multiple customer types, products, and scenarios
6. **Field-Level Detail**: Explicit listing of fields to be tested
7. **Clear Expected Results**: Specific, measurable outcomes

### 17.2 Areas for Improvement

1. **Negative Test Case Ratio**: Only 2.4% negative cases; could be increased
2. **Module Naming**: Some inconsistency in module names
3. **Boundary Testing**: Limited explicit boundary value test cases
4. **Performance Testing**: No performance-related test cases observed
5. **Error Message Validation**: Limited validation of specific error messages
6. **Data Combinations**: Could include more data combination scenarios

### 17.3 Recommendations for BRD-to-Test Case Generation

1. **Maintain Structure**: Keep the 14-column structure for consistency
2. **Break Down Workflows**: Divide complex workflows into 10-15 test cases
3. **Authorization Pattern**: Apply maker-checker pattern for all transactional features
4. **Variation Matrix**: Create test cases for each customer type × product type combination
5. **Negative Coverage**: Aim for at least 10-15% negative test cases
6. **Pre-requisite Chain**: Clearly establish pre-requisite dependencies
7. **Field Grouping**: Separate test cases for different sections of forms
8. **Expected Result Specificity**: Always include specific UI elements or messages

---

## 18. TEST CASE GENERATION ALGORITHM

Based on the analysis, here's the algorithm for generating test cases from BRD:

### Step 1: Extract Requirements
- Identify all business processes
- List all screens/forms
- Extract all fields with properties
- Identify business rules and validations
- Map authorization requirements

### Step 2: Create Structure
- Define Product Name
- Define Process Categories
- Assign Business Process IDs
- Create Scenario Descriptions
- Determine importance levels

### Step 3: Generate Field-Level Test Cases
For each screen/form:
- Create test case for mandatory fields entry
- Create test cases for field validations
- Create test cases for field dependencies
- Create test cases for boundary conditions

### Step 4: Generate Workflow Test Cases
For each business process:
- Break workflow into logical steps
- Create test case for each step
- Link test cases via pre-requisites
- Add authorization test cases if applicable

### Step 5: Generate Variation Test Cases
For each base scenario:
- Create variations for customer types
- Create variations for product types
- Create variations for branch types
- Create variations for user roles

### Step 6: Generate Negative Test Cases
For each business rule:
- Create test case for rule violation
- Create test case for invalid data
- Create test case for access restrictions
- Create test case for logical constraints

### Step 7: Generate Service Test Cases
For additional features:
- Create inquiry/view test cases
- Create report generation test cases
- Create modification test cases
- Create transaction test cases

### Step 8: Review and Refine
- Check coverage completeness
- Verify pre-requisite chains
- Ensure expected results are specific
- Validate sequential numbering
- Group related test cases

---

## 19. METRICS FOR TEST CASE QUALITY

Based on analysis, quality metrics should include:

### Coverage Metrics
- **Feature Coverage**: % of BRD features with test cases
- **Field Coverage**: % of fields validated
- **Workflow Coverage**: % of workflows tested end-to-end
- **Scenario Coverage**: % of scenario variations included

### Quality Metrics
- **Specificity Score**: % of test cases with specific expected results
- **Pre-requisite Clarity**: % of test cases with clear pre-requisites
- **Description Completeness**: % of test cases with detailed descriptions
- **Negative Test Ratio**: % of negative test cases

### Consistency Metrics
- **Naming Consistency**: % of test cases following naming conventions
- **Structure Consistency**: % of test cases with all required columns
- **Pattern Adherence**: % of test cases following identified patterns

---

## 20. CONCLUSION

The analysis of 490 CASA test cases reveals a well-structured, comprehensive approach to test case creation. Key patterns identified include:

1. **Consistent 14-column structure** for all test cases
2. **Workflow breakdown** into sequential, linked test cases
3. **Strong authorization workflow** emphasis with maker-checker patterns
4. **Field-level validation** separated by form sections
5. **Extensive scenario variations** for customer types and products
6. **Clear pre-requisite chains** establishing test dependencies
7. **Specific expected results** focusing on UI elements and messages

These patterns form the foundation for the test case generation prompt, enabling creation of similar comprehensive test cases from any BRD document in the banking or related domains.

---

## APPENDIX: SAMPLE TEST CASE SEQUENCES

### Sequence A: Complete Account Opening (Individual)
```
TC_001: Enter account details
TC_002: Enter account relations
TC_003: Enter mode of operation
TC_004: Enter nominee details
TC_005: View nominee confirmation
TC_006: Click submit
TC_007: View success message
TC_008: Assign to authorizer
TC_009: View in authorization queue
TC_010: Explore transaction details
TC_011: Approve authorization
TC_012: View authorization watch
TC_013: Click authorization serial
TC_014: Override authorization
TC_015: View account reference
```

### Sequence B: Account Modification
```
TC_051: Modify nominee details
TC_055: View modified nominee
TC_056: View newly added nominee
TC_057: View available nominees
```

### Sequence C: Document Modification with Authorization
```
TC_058: Modify document type
TC_059: Submit modification
TC_060: Enter assignment details
TC_061: Remove modified details
```

### Sequence D: Negative Test Cases (Nominee Restrictions)
```
TC_341: Add account holder as nominee (Individual) - Should fail
TC_342: Add account holder as nominee (Corporate) - Should fail
TC_343: Add joint holder as nominee (Individual) - Should fail
TC_344: Add joint holder as nominee (Corporate) - Should fail
TC_363: Add minor without guardian (Corporate) - Should fail
TC_365: Add minor without guardian (Individual) - Should fail
```

---

**Report Prepared**: Based on analysis of TC_CASA_For AI.xlsx
**Total Test Cases Analyzed**: 490
**Analysis Date**: 2025-10-05
