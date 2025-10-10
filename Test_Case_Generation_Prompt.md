# TEST CASE GENERATION PROMPT FOR BRD DOCUMENTS

## Overview
This prompt is designed to generate comprehensive test cases from Business Requirements Documents (BRDs) across ANY domain - banking, e-commerce, healthcare, insurance, education, logistics, or any other industry. The framework is domain-agnostic and adapts to the specific requirements in your BRD.

---

## PROMPT FOR AI TEST CASE GENERATION

You are an expert QA Test Analyst tasked with creating comprehensive test cases from a Business Requirements Document (BRD). Analyze the provided BRD from ANY domain and generate test cases following the structure and patterns outlined below. Adapt the patterns to the specific domain, terminology, and workflows described in the BRD.

### TEST CASE STRUCTURE

Generate test cases with the following columns:

1. **Product Name**: The name of the product/module being tested
2. **Process Category**: High-level business process category
3. **Business Process ID**: Numeric identifier for the business process
4. **Business Process**: Description of the business process
5. **Scenario ID**: Numeric identifier for the scenario
6. **Scenario Description**: Detailed description of the test scenario
7. **Category**: Test category (Functional Positive / Functional negative)
8. **Importance**: Priority level (Critical / High / Medium / Low)
9. **Test Case ID**: Unique identifier (e.g., TC_001, TC_002)
10. **TC Module**: Module/feature being tested
11. **Test Condition**: Brief description of what is being tested
12. **Pre-requisite**: Required setup or conditions before test execution
13. **Test Case Description**: Detailed step-by-step description including:
    - Actions to be performed
    - Fields to be entered/validated
    - Buttons to be clicked
    - Data to be used
14. **Expected Result**: Clear, measurable expected outcome

---

## TEST CASE GENERATION GUIDELINES

### A. FIELD-LEVEL TEST CASES

For each screen/form mentioned in the BRD, create test cases covering:

#### 1. **Mandatory Field Validation**
- **Pattern**: "To verify whether System allows the user to enter the below mandatory fields in [screen/tab name]:"
- List all mandatory fields from the BRD
- **Expected Result**: "System should allow the user to enter the values in [screen/tab name]."

**Example** (Generic - adapt to your domain):
```
Test Case ID: TC_001
Category: Functional Positive
Test Condition: To verify entry of mandatory fields in [form name]
Test Case Description: To verify whether System allows the user to enter the below mandatory fields in the [form/screen name]:
- Field 1 (from BRD)
- Field 2 (from BRD)
- Field 3 (from BRD)
- Field 4 (from BRD)
- Field 5 (from BRD)
[List all mandatory fields from the specific form in the BRD]

Expected Result: System should allow the user to enter the values in [form/screen name].
```

#### 2. **Field Format Validation**
- Data type validation (numeric, alphanumeric, date, etc.)
- Length validation (min/max characters)
- Special character handling
- Date format validation

#### 3. **Field Dependency Validation**
- Conditional mandatory fields
- Field enable/disable based on selections
- Auto-population of dependent fields

#### 4. **Field Boundary Testing**
- Minimum value testing
- Maximum value testing
- Negative value testing (if applicable)
- Zero value testing (if applicable)

---

### B. FUNCTIONAL/BUSINESS WORKFLOW TEST CASES

For each business process in the BRD, create end-to-end workflow test cases:

#### 1. **Happy Path Scenarios (Functional Positive)**

**Pattern for Sequential Workflow**:
- Break down the complete workflow into logical steps
- Create separate test cases for each major step
- Ensure continuity through pre-requisites

**Example Workflow Pattern**:
```
TC_001: Enter initial details → Expected: System accepts and displays next screen
TC_002: Enter additional details → Expected: System validates and enables save
TC_003: Click save → Expected: System displays confirmation screen
TC_004: Click submit → Expected: System displays success message
TC_005: Assignment to authorizer → Expected: System sends to authorization queue
TC_006: Authorize transaction → Expected: System displays in authorization queue
TC_007: Explore authorization details → Expected: System displays transaction details
TC_008: Approve transaction → Expected: System displays approval success message
TC_009: View authorized record → Expected: System displays completed transaction
```

#### 2. **Authorization Workflow Test Cases**

For any transaction requiring authorization, include:

**Maker Stage**:
- Enter transaction details
- Submit for authorization
- Assignment to authorizer
- Verify transaction in pending queue

**Checker Stage**:
- View authorization queue
- Explore transaction details
- Approve/Reject with remarks
- View authorization status

**Post-Authorization**:
- View authorization watch details
- Verify transaction completion
- Check audit trail

**Example**:
```
Test Case ID: TC_008
Test Condition: Authorize the current account.
Pre-requisite: Individual CIF id must be available.
Test Case Description: To verify whether System allow the user to enter the Assignment details:
- Assign to
- Authorizer name
- Remarks
Click on submit.
Expected Result: System should display a success message that "Transaction with reference number has been sent for authorization"
```

#### 3. **Multiple Scenarios for Same Process**

For variations in the same process, create separate scenarios:

- Different customer types (Individual, Corporate, Joint)
- Different product types
- Different transaction types
- Different user roles
- Home branch vs. Non-home branch operations
- Different customer categories (Guarantor, Joint owner, Member, Chairman, Director, etc.)

**Example**:
```
Scenario 1: Open account with Individual Customer
Scenario 2: Open account with Corporate Customer
Scenario 3: Open account with Joint Account holders
Scenario 4: Open account for Foreign Currency
```

---

### C. NEGATIVE TEST CASES (Functional negative)

Generate negative test cases for:

#### 1. **Business Rule Violations**

**Pattern**: Test that system prevents invalid business operations

**Example**:
```
Test Case ID: TC_321
Category: Functional negative
Test Condition: Mode of operation
Pre-requisite: CIF with current account for individual
Test Case Description: To verify whether system allows user to select 'Any of us or survivor' in mandate details for individual single account
Expected Result: System shouldn't allow user to select 'Any of us or survivor' in mandate details for individual single account
```

#### 2. **Invalid Data Entry**
- Missing mandatory fields
- Invalid data formats
- Out-of-range values
- Invalid combinations

#### 3. **Permission/Access Control**
- Unauthorized user access
- Branch-level restrictions
- Role-based restrictions

#### 4. **Logical Constraints**
- Adding account holder as nominee
- Adding joint holder as nominee
- Minor without guardian details
- Duplicate entries

---

### D. MODIFICATION/UPDATE TEST CASES

For any data modification features:

#### 1. **Update Existing Data**
```
Test Case Pattern:
- Modify [field/section name]
- Click save
- Submit for authorization (if applicable)
- Authorize modification (if applicable)
- Verify updated values
```

#### 2. **Add New Data**
- Add new records to existing entity
- Validate addition
- Verify in inquiry/view mode

#### 3. **Delete Data**
- Delete existing records
- Verify deletion
- Check impact on related data

---

### E. INQUIRY/VIEW/SEARCH TEST CASES

For read-only operations:

#### 1. **Search Functionality**
```
Test Case Pattern:
- Enter search criteria
- Click search
- Expected: System displays matching records
```

#### 2. **View Details**
```
Test Case Pattern:
- Select record
- View details
- Expected: System displays complete information
```

#### 3. **Report Generation**
- Generate report with criteria
- Verify report contents
- Export/print functionality

---

### F. INTEGRATION/CROSS-FUNCTIONAL TEST CASES

For features involving multiple modules:

#### 1. **Transaction Test Cases**
- Fund transfers
- Cash deposits/withdrawals
- Account transfers between branches
- Inter-account operations

#### 2. **Status Change Test Cases**
- Active to Dormant
- Dormant to Active
- Account closure
- Freezing/Lien marking

---

## TEST CASE NAMING AND NUMBERING CONVENTIONS

1. **Test Case ID**: Sequential numbering (TC_001, TC_002, etc.)
2. **Grouping**: Group related test cases under same Scenario Description
3. **Sequential Flow**: Maintain logical sequence for workflow test cases

---

## TEST CASE COVERAGE CHECKLIST

Ensure coverage of:

### ✓ FIELD-LEVEL COVERAGE
- [ ] All mandatory fields identified and tested
- [ ] All optional fields tested
- [ ] Field validations (format, length, type)
- [ ] Field dependencies tested
- [ ] Boundary value testing for numeric fields

### ✓ FUNCTIONAL COVERAGE
- [ ] Happy path scenarios for all workflows
- [ ] Alternative paths tested
- [ ] Authorization workflows included
- [ ] All user roles covered
- [ ] All product/transaction types covered

### ✓ NEGATIVE SCENARIOS
- [ ] Business rule violations tested
- [ ] Invalid data entry scenarios
- [ ] Permission/access restrictions tested
- [ ] Error message validations

### ✓ DATA OPERATIONS
- [ ] Create operations
- [ ] Read/View operations
- [ ] Update operations
- [ ] Delete operations

### ✓ CROSS-CUTTING CONCERNS
- [ ] Authorization/approval workflows
- [ ] Audit trail verification
- [ ] Status transitions
- [ ] Branch-level operations
- [ ] Customer category variations

---

## ADDITIONAL GUIDELINES

### 1. **Pre-requisites**
- Always specify clear pre-requisites
- Include reference data requirements (CIF, Account numbers, etc.)
- Mention dependent transactions that must be completed first

### 2. **Test Case Description**
- Use clear, action-oriented language
- Start with "To verify whether System allows/displays..."
- List specific fields/values to be entered
- Include button clicks and navigation steps
- Use numbered or bulleted lists for multiple fields

### 3. **Expected Results**
- Make results specific and measurable
- Include exact messages where applicable
- Specify what should be displayed/enabled/disabled
- Mention reference numbers or IDs when generated

### 4. **Importance/Priority**
- **Critical**: Core functionality, mandatory workflows, regulatory requirements
- **High**: Important features, frequently used functionality
- **Medium**: Secondary features, less frequent operations
- **Low**: Nice-to-have features, edge cases

### 5. **Category Classification**
- **Functional Positive**: Valid inputs, happy paths, normal workflows
- **Functional negative**: Invalid inputs, business rule violations, error scenarios

---

## SAMPLE INPUT-OUTPUT MAPPING

### INPUT (From BRD):
```
Feature: Account Opening
Description: System should allow users to open current accounts for individual and corporate customers.

Fields Required:
- Account Type (Mandatory)
- Account Sub Type (Mandatory)
- Account Name (Mandatory)
- Product (Mandatory)
- Currency (Mandatory)
- Customer Address (Mandatory)

Business Rules:
- Corporate accounts cannot have nominees
- Individual accounts must have nominee details
- All accounts require authorization before activation
```

### OUTPUT (Generated Test Cases):
```
TC_001: Verify mandatory field entry in account details (Individual)
TC_002: Verify account relations entry
TC_003: Verify mode of operation entry
TC_004: Verify nominee details entry (Individual)
TC_005: Verify submission of account opening
TC_006: Verify authorization assignment
TC_007: Verify authorization of account
TC_008: Verify account activation

TC_016: Verify mandatory field entry in account details (Corporate)
TC_017: Verify account relations entry (Corporate)
TC_018: Verify mode of operation entry (Corporate)
TC_019: Verify nominee details not allowed for Corporate (Negative)

TC_020: Verify account opening without mandatory fields (Negative)
TC_021: Verify invalid data format in currency field (Negative)
```

---

## EXECUTION INSTRUCTIONS FOR AI

When given a BRD document, follow these steps:

1. **Extract Business Processes**
   - Identify all major processes/workflows
   - Assign Process IDs and categories

2. **Identify Scenarios**
   - Break down each process into distinct scenarios
   - Consider variations (customer types, product types, etc.)

3. **Extract Fields and Validations**
   - List all input fields with their properties
   - Note mandatory vs optional fields
   - Identify validation rules

4. **Identify Business Rules**
   - Extract all business rules and constraints
   - These will drive negative test cases

5. **Map Authorization Workflows**
   - Identify which transactions require authorization
   - Create maker-checker test case sequences

6. **Generate Test Cases**
   - Start with field-level validation test cases
   - Create functional workflow test cases
   - Add negative test cases for business rules
   - Include inquiry/modification test cases
   - Add integration test cases

7. **Review and Organize**
   - Ensure logical sequencing
   - Group related test cases
   - Verify complete coverage

---

## OUTPUT FORMAT

Generate test cases in Excel/CSV format with all 14 columns specified above. Organize test cases:
- By Business Process
- By Scenario within each process
- In sequential order for workflow continuity

Ensure each test case is:
- **Independent**: Can be understood on its own
- **Repeatable**: Can be executed multiple times with same result
- **Specific**: Has clear, measurable expected results
- **Traceable**: Links back to BRD requirements

---

## QUALITY CHECKS

Before finalizing test cases, verify:

1. **Completeness**: All BRD features covered
2. **Correctness**: Test cases align with business requirements
3. **Consistency**: Similar patterns used for similar scenarios
4. **Clarity**: Test cases are easy to understand and execute
5. **Coverage**: Both positive and negative scenarios included
6. **Traceability**: Each test case maps to a BRD requirement

---

## END OF PROMPT

Use this prompt as a template to generate comprehensive, well-structured test cases from any BRD document. Adapt the specific scenarios and fields based on the domain and requirements of your BRD.
