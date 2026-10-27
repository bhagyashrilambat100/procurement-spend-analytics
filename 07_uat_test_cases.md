
# Procurement System — UAT Test Cases

## 1. Objective

Validate that procurement reports and workflows produce the expected
results using the project's synthetic sample data.

## 2. Test Cases

| Test ID | Scenario | Test Steps | Expected Result |
|---|---|---|---|
| UAT-001 | View total procurement spend | Run the overall KPI query | Total spend is calculated as quantity multiplied by unit price |
| UAT-002 | View supplier spend | Run the supplier spend query | Spend is grouped by supplier and sorted from highest to lowest |
| UAT-003 | View monthly spend | Run the monthly analysis query | Orders are grouped into the correct calendar months |
| UAT-004 | Identify late deliveries | Run the late delivery query | Deliveries after their expected dates are identified |
| UAT-005 | Check on-time performance | Run the supplier performance query | On-time delivery percentage is calculated correctly |
| UAT-006 | Identify open orders | Run the open purchase order query | Open orders and their delivery details are displayed |
| UAT-007 | Validate purchase order data | Run the data quality checks | Invalid or incomplete records are flagged |
| UAT-008 | Reconcile records | Compare source and target counts in a migration exercise | Differences are documented and investigated |

## 3. Defect Reporting Template

- Defect ID:
- Test Case ID:
- Summary:
- Steps to Reproduce:
- Expected Result:
- Actual Result:
- Severity:
- Status:
- Evidence:

## 4. Entry Criteria

- Test data is available.
- SQL scripts are saved and reviewed.
- Expected results are defined.
- The test environment is ready.

## 5. Exit Criteria

- All planned test cases have been executed.
- Critical defects are resolved or formally accepted.
- Failed tests are documented.
- Results are reviewed by the responsible stakeholders.

## 6. Important Note

These are planned test cases for a demonstration project.
They should be marked Passed or Failed only after execution and
verification of the actual results.
