# TEST CASE GENERATION CHEAT SHEET
## One-Page Quick Reference

---

## 🎯 THE 14-COLUMN STRUCTURE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ 1. Product Name          │ 2. Process Category                              │
│ 3. Business Process ID   │ 4. Business Process                              │
│ 5. Scenario ID           │ 6. Scenario Description                          │
│ 7. Category              │ 8. Importance                                    │
│ 9. Test Case ID          │ 10. TC Module                                    │
│ 11. Test Condition       │ 12. Pre-requisite                                │
│ 13. Test Case Description│ 14. Expected Result                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 🔄 THE 15-STEP WORKFLOW MODEL

```
┌──────────────────────────────────────────────────────────────────────────────┐
│                         COMPLETE WORKFLOW PATTERN                             │
├──────────────────────────────────────────────────────────────────────────────┤
│ PHASE 1: DATA ENTRY (Steps 1-5)                                              │
│ ✓ TC_001: Enter main form fields                                             │
│ ✓ TC_002: Enter section 2 fields                                             │
│ ✓ TC_003: Enter section 3 fields                                             │
│ ✓ TC_004: Enter section 4 fields                                             │
│ ✓ TC_005: View preview/confirmation                                          │
│                                                                               │
│ PHASE 2: MAKER ACTIVITIES (Steps 6-8)                                        │
│ ✓ TC_006: Submit transaction → Get reference number                          │
│ ✓ TC_007: View success message                                               │
│ ✓ TC_008: Assign to authorizer → Sent for authorization                      │
│                                                                               │
│ PHASE 3: CHECKER ACTIVITIES (Steps 9-11)                                     │
│ ✓ TC_009: View authorization queue → Transaction visible                     │
│ ✓ TC_010: Explore transaction details                                        │
│ ✓ TC_011: Approve transaction → Authorization success                        │
│                                                                               │
│ PHASE 4: POST-AUTHORIZATION (Steps 12-15)                                    │
│ ✓ TC_012: View authorization watch/audit trail                               │
│ ✓ TC_013: Click serial number → View details                                 │
│ ✓ TC_014: Override/Complete authorization                                    │
│ ✓ TC_015: View final record with reference number                            │
└──────────────────────────────────────────────────────────────────────────────┘
```

---

## 📐 TEST CASE CALCULATION FORMULA

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          TOTAL TEST CASES FORMULA                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  BASE = (Screens × 3) + (Workflows × 15)                                    │
│                                                                              │
│  VARIATIONS = BASE × Customer_Types × Product_Types × Branch_Types          │
│                                                                              │
│  NEGATIVE = Business_Rules × 1                                              │
│                                                                              │
│  OTHERS = Modification + Inquiry + Reports                                  │
│                                                                              │
│  ═══════════════════════════════════════════════════════════════            │
│  TOTAL = BASE + VARIATIONS + NEGATIVE + OTHERS                              │
│  ═══════════════════════════════════════════════════════════════            │
│                                                                              │
│  EXAMPLE:                                                                    │
│  Screens = 5, Workflows = 2, Customer Types = 3, Business Rules = 8         │
│                                                                              │
│  BASE = (5 × 3) + (2 × 15) = 15 + 30 = 45                                   │
│  VARIATIONS = 30 × 3 = 90                                                    │
│  NEGATIVE = 8                                                                │
│  OTHERS = 10                                                                 │
│  ──────────────────────                                                      │
│  TOTAL = 45 + 90 + 8 + 10 = 153 test cases                                  │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 📝 STANDARD LANGUAGE TEMPLATES

### Test Condition:
```
✓ "To verify the opening of [feature]"
✓ "To verify the entry of [section/fields]"
✓ "To verify the modification of [data]"
✓ "To view the [information]"
✓ "Authorize the [transaction]"
```

### Test Description:
```
✓ "To verify whether System allows the user to enter the below mandatory fields:
   - Field 1
   - Field 2
   - Field 3"

✓ "To verify whether System allows the user to [action]."

✓ "To verify whether system allows [invalid operation]" [NEGATIVE]
```

### Expected Result:
```
✓ POSITIVE: "System should allow the user to enter the values in [section]"
✓ POSITIVE: "System should display [specific screen/message]"
✓ NEGATIVE: "System shouldn't allow [prohibited action]"
✓ NEGATIVE: "System should display error '[specific error message]'"
```

---

## 🎨 PATTERN QUICK REFERENCE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ PATTERN                │ TEST CASES │ NOTES                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│ Field Validation        │     3-5    │ One per form section                  │
│ Simple Workflow         │      15    │ Standard 15-step model                │
│ Authorization Workflow  │     6-9    │ Maker (3) + Checker (3) + Post (2-3)  │
│ Customer Variation      │   × Type   │ Multiply base by customer types       │
│ Product Variation       │   × Type   │ Multiply base by product types        │
│ Negative per Rule       │      1     │ One test case per business rule       │
│ Modification Workflow   │     5-8    │ Modify → Save → Authorize → Verify    │
│ Inquiry/Search          │     2-3    │ Search → View → Export                │
│ Report Generation       │     3-4    │ Generate → View → Export → Schedule   │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 📊 DISTRIBUTION RATIOS

```
╔════════════════════════════════════════════════════════════════════════════╗
║                         TEST CASE DISTRIBUTION                              ║
╠════════════════════════════════════════════════════════════════════════════╣
║                                                                             ║
║  Field Validation:      ████████████░░░░░░░░░░░░░░░░░░░░  20%              ║
║  Workflow (Positive):   █████████████████████████████░░░░  55%              ║
║  Negative Tests:        ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░  10%              ║
║  Modification:          ███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░   7%              ║
║  Inquiry/Reports:       ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░   5%              ║
║  Others:                █░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░   3%              ║
║                                                                             ║
╠════════════════════════════════════════════════════════════════════════════╣
║                         PRIORITY DISTRIBUTION                               ║
╠════════════════════════════════════════════════════════════════════════════╣
║                                                                             ║
║  Critical:              ████████████████████████████░░░░░  70%              ║
║  High:                  ██████░░░░░░░░░░░░░░░░░░░░░░░░░░  20%              ║
║  Medium:                ███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░   8%              ║
║  Low:                   █░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░   2%              ║
║                                                                             ║
╚════════════════════════════════════════════════════════════════════════════╝
```

---

## ✅ PRE-REQUISITE PATTERNS

```
Common Pre-requisites:
┌──────────────────────────────────────────────────────────────────┐
│ ✓ "Individual CIF id must be available"                          │
│ ✓ "Corporate CIF id must be available"                           │
│ ✓ "Account number must be available"                             │
│ ✓ "Transaction reference number"                                 │
│ ✓ "Authorization watch serial number"                            │
│ ✓ "User logged in with [role]"                                   │
│ ✓ "Customer profile exists"                                      │
│ ✓ "[Previous step] must be completed"                            │
└──────────────────────────────────────────────────────────────────┘
```

---

## 🔄 VARIATION MULTIPLICATION TABLE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ Base      │ Customer │ Product  │ Branch  │ Total                            │
│ Workflow  │ Types    │ Types    │ Types   │ Test Cases                       │
├─────────────────────────────────────────────────────────────────────────────┤
│ 15        │ 1        │ 1        │ 1       │ 15                               │
│ 15        │ 2        │ 1        │ 1       │ 30                               │
│ 15        │ 3        │ 1        │ 1       │ 45                               │
│ 15        │ 3        │ 2        │ 1       │ 90                               │
│ 15        │ 3        │ 2        │ 2       │ 180                              │
│ 15        │ 5        │ 3        │ 2       │ 450                              │
└─────────────────────────────────────────────────────────────────────────────┘

Customer Types: Individual, Corporate, Joint, NRI, Minor, etc.
Product Types: Standard, Premium, Foreign Currency, etc.
Branch Types: Home Branch, Non-Home Branch
```

---

## ❌ NEGATIVE TEST CASE RULES

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ CREATE NEGATIVE TEST CASE WHEN BRD SAYS:                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│ ✗ "System should NOT allow..."           → Test that it's blocked           │
│ ✗ "Only users with X role can..."        → Test with wrong role             │
│ ✗ "Minimum value is X"                   → Test with less than X            │
│ ✗ "Maximum value is Y"                   → Test with more than Y            │
│ ✗ "Field is mandatory"                   → Test without the field           │
│ ✗ "Format must be XXX"                   → Test with invalid format         │
│ ✗ "Cannot be duplicate"                  → Test with duplicate value        │
│ ✗ "Age must be 18+"                      → Test with age < 18               │
│ ✗ "Balance must be sufficient"           → Test with insufficient balance   │
│ ✗ "Account must be active"               → Test with closed/frozen account  │
└─────────────────────────────────────────────────────────────────────────────┘

TARGET: 10-15% of total test cases should be negative
```

---

## 🎯 FIELD VALIDATION CHECKLIST

```
For Each Field, Test:
┌──────────────────────────────────────────────────────────────────┐
│ □ Mandatory field validation                                     │
│ □ Data type validation (numeric, text, date)                     │
│ □ Length validation (min/max characters)                         │
│ □ Format validation (email, phone, date format)                  │
│ □ Range validation (min/max value)                               │
│ □ Special characters handling                                    │
│ □ Field dependencies (auto-population)                           │
│ □ Conditional mandatory (based on other fields)                  │
│ □ Duplicate value check                                          │
│ □ Default value population                                       │
└──────────────────────────────────────────────────────────────────┘
```

---

## 📋 7-DAY IMPLEMENTATION PLAN

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ DAY 1: BRD ANALYSIS & PLANNING                                              │
│ ├─ Extract business processes (2 hours)                                     │
│ ├─ List all screens and fields (2 hours)                                    │
│ ├─ Identify business rules (1 hour)                                         │
│ ├─ Calculate test case count (1 hour)                                       │
│ └─ Create test case structure (2 hours)                                     │
│                                                                              │
│ DAY 2: FIELD-LEVEL TEST CASES (20%)                                         │
│ └─ Generate field validation test cases                                     │
│                                                                              │
│ DAYS 3-4: WORKFLOW TEST CASES (55%)                                         │
│ ├─ Day 3: Base workflows (15-step model)                                    │
│ └─ Day 4: Authorization workflows (6+ test cases each)                      │
│                                                                              │
│ DAY 5: VARIATION TEST CASES                                                 │
│ └─ Multiply base workflows by variations                                    │
│                                                                              │
│ DAY 6: NEGATIVE & OTHER TEST CASES (25%)                                    │
│ ├─ Negative test cases (10-15%)                                             │
│ ├─ Modification test cases (5-10%)                                          │
│ └─ Inquiry/report test cases (5%)                                           │
│                                                                              │
│ DAY 7: REVIEW & REFINEMENT                                                  │
│ ├─ Coverage verification                                                    │
│ ├─ Pre-requisite chain validation                                           │
│ ├─ Quality checklist review                                                 │
│ └─ Final deliverables preparation                                           │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 🚦 QUALITY GATES

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ GATE                          │ CRITERIA              │ TARGET               │
├─────────────────────────────────────────────────────────────────────────────┤
│ Structure Completeness        │ All 14 columns filled │ 100%                 │
│ Pre-requisite Clarity         │ Clear pre-requisites  │ >95%                 │
│ Expected Result Specificity   │ Specific outcomes     │ >95%                 │
│ Field Coverage                │ All fields tested     │ >95%                 │
│ Workflow Coverage             │ All workflows tested  │ 100%                 │
│ Business Rule Coverage        │ All rules tested      │ 100%                 │
│ Negative Test Ratio           │ Negative tests        │ 10-15%               │
│ Authorization Coverage        │ 6+ tests per workflow │ 100%                 │
│ Test Case Linkage             │ Pre-req dependencies  │ 100%                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 🎓 DO's AND DON'Ts

```
╔════════════════════════════════════════════════════════════════════════════╗
║ DO's ✅                              │ DON'Ts ❌                            ║
╠════════════════════════════════════════════════════════════════════════════╣
║ ✅ Break workflows into 15 steps     │ ❌ Create 100-step test cases       ║
║ ✅ List specific fields              │ ❌ Use vague "enter data"           ║
║ ✅ Create field section test cases   │ ❌ One test case for 50 fields     ║
║ ✅ Add 6+ authorization test cases   │ ❌ Skip authorization testing       ║
║ ✅ Specific expected results         │ ❌ "It should work correctly"       ║
║ ✅ Link via pre-requisites           │ ❌ Create independent silos         ║
║ ✅ 10-15% negative test cases        │ ❌ Only test happy paths            ║
║ ✅ Multiply by variations            │ ❌ Test only one customer type      ║
║ ✅ Sequential test case IDs          │ ❌ Random numbering                 ║
║ ✅ Use standard language patterns    │ ❌ Inconsistent terminology         ║
╚════════════════════════════════════════════════════════════════════════════╝
```

---

## 🔢 QUICK ESTIMATION TABLE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ FEATURE TYPE                              │ ESTIMATED TEST CASES             │
├─────────────────────────────────────────────────────────────────────────────┤
│ Simple Form (No workflow)                 │ 10-15                            │
│ Form with Basic CRUD                      │ 20-30                            │
│ Single Workflow (No authorization)        │ 15-20                            │
│ Workflow with Authorization               │ 25-35                            │
│ Complex Multi-step Workflow               │ 40-60                            │
│ Workflow with 3 Customer Variations       │ 45-90                            │
│ Complete Feature (All variations)         │ 80-150                           │
│ Small Module (3-5 workflows)              │ 100-200                          │
│ Medium Module (5-10 workflows)            │ 200-400                          │
│ Large Module (10+ workflows)              │ 400-600+                         │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 📞 EMERGENCY QUICK TIPS

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ SITUATION                              │ SOLUTION                            │
├─────────────────────────────────────────────────────────────────────────────┤
│ "I don't know how many test cases"    │ Use: (Screens × 3) + (Workflows×15)│
│ "Expected result seems vague"         │ Add: Specific screen/message name   │
│ "Test case is too long"               │ Break into 2-3 smaller test cases   │
│ "Missing authorization tests"         │ Add: 6 test cases (Maker+Checker)   │
│ "No negative test cases"              │ Create: 1 per business rule         │
│ "Unclear pre-requisites"              │ State: Exact data/state needed      │
│ "Test cases seem disconnected"        │ Link: Use pre-requisite chain       │
│ "Forgot customer variations"          │ Multiply: Base × Customer types     │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 📊 SUCCESS METRICS DASHBOARD

```
Track These Metrics:
┌──────────────────────────────────────────────────────────────────┐
│ METRIC                        │ TARGET  │ YOUR SCORE            │
├──────────────────────────────────────────────────────────────────┤
│ BRD Requirement Coverage      │ 100%    │ _____                 │
│ Field Coverage                │  >95%   │ _____                 │
│ Workflow Coverage             │ 100%    │ _____                 │
│ Negative Test Ratio           │ 10-15%  │ _____                 │
│ Authorization Test Coverage   │ 100%    │ _____                 │
│ Pre-requisite Clarity         │  >95%   │ _____                 │
│ Expected Result Specificity   │  >95%   │ _____                 │
│ Test Case Structure           │ 100%    │ _____                 │
└──────────────────────────────────────────────────────────────────┘
```

---

## 🎯 ONE-SENTENCE REMINDERS

```
💡 Every workflow = 15 test cases
💡 Every authorization = 6+ test cases
💡 Every business rule = 1 negative test case
💡 Every form section = 1 field validation test case
💡 Base workflow × Variations = Complete coverage
💡 Specific expected results = Quality test cases
💡 Pre-requisites = Test execution order
💡 14 columns = Consistent structure
💡 10-15% negative = Good balance
💡 Authorization is critical = Don't skip it
```

---

**KEEP THIS SHEET VISIBLE WHILE CREATING TEST CASES!**

Print or keep on second monitor for constant reference.
