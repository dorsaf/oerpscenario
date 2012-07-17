###############################################################################
#
#    OERPScenario, OpenERP Functional Tests
#    Copyright 2009 Camptocamp SA
#
##############################################################################
##############################################################################
# Branch      # Module       # Processes     # System
@addons       @account_voucher       @chart_of_account     @param 

Feature: Creation of a basic chart of account (not avoid demo data installation) 

  @account_voucher_init
  Scenario: Account
  
      Given I need a "account.account" with oid: scen.root
    And having:
    | name        | value               |
    | name        | Chart               |
    | code        | C0                  |
    | type        | other               |
    | user_type   | by name: Root/View  |

     Given I need a "account.account" with oid: scen.acc_fx
    And having:
    | name        | value               |
    | name        | Currency fx         |
    | code        | 666                 |
    | type        | other               |
    | parent_id   | by code: C0         |   
    | user_type   | by name: Expense    |  
    
     Given I need a "account.account" with oid: scen.acc_wo
    And having:
    | name        | value               |
    | name        | Write-off           |
    | code        | 658                 |
    | type        | other               |
    | parent_id   | by code: C0         |   
    | user_type   | by name: Expense    |  
    
     
     Given I need a "account.account" with oid: scen.acc_sales
    And having:
    | name        | value               |
    | name        | Sales               |
    | code        | 707                 |
    | parent_id   | by code: C0         |
    | type        | other               |
    | user_type   | by name: Income     |  

     Given I need a "account.account" with oid: scen.acc_purchases
    And having:
    | name        | value               |
    | name        | Purchases           |
    | code        | 607                 |
    | parent_id   | by code: C0         |
    | type        | other               |
    | user_type   | by name: Expense    |  

     Given I need a "account.account" with oid: scen.acc_dep
    And having:
    | name        | value               |
    | name        | Depreciation        |
    | code        | 6821                |
    | parent_id   | by code: C0         |
    | type        | other               |
    | user_type   | by name: Expense    |  

     Given I need a "account.account" with oid: scen.acc_pl
    And having:
    | name        | value               |
    | name        | Profit/Loss         |
    | code        | 120                 |
    | parent_id   | by code: C0         |
    | type        | other               |
    | user_type   | by name: Liability  |  
    
     Given I need a "account.account" with oid: scen.acc_receivable_eur
    And having:
    | name        | value               |
    | name        | Debtors             |
    | code        | 4111                |
    | parent_id   | by code: C0         |
    | type        | receivable          |
    | user_type   | by name: Receivable |  
    | reconcile   | true                |
    
     Given I need a "account.account" with oid: scen.acc_payable_eur
    And having:
    | name        | value               |
    | name        | Creditors           |
    | code        | 4011                |
    | parent_id   | by code: C0         |
    | type        | payable             |
    | user_type   | by name: Payable    |  
    | reconcile   | true                |
    
      Given I need a "account.account" with oid: scen.acc_asset
    And having:
    | name        | value               |
    | name        | Asset               |
    | code        | 210                 |
    | parent_id   | by code: C0         |
    | type        | other               |
    | user_type   | by name: Asset      |     
     
   Given I need a "account.account" with oid: scen.acc_bank_eur
    And having:
    | name        | value               |
    | name        | EUR bank account    |
    | code        | 5121                |
    | parent_id   | by code: C0         |
    | type        | other               |
    | user_type   | by name: Cash       |
    
    Given I need a "account.account" with oid: scen.acc_bank_usd
    And having:
    | name        | value               |
    | name        | USD bank account    |
    | code        | 5122                |
    | parent_id   | by code: C0         |
    | type        | other               |
    | user_type   | by name: Cash       |
    | currency_id | by name: USD        |

    Given I need a "account.account" with oid: scen.acc_bank_gbp
    And having:
    | name        | value               |
    | name        | GBP bank account    |
    | code        | 5123                |
    | parent_id   | by code: C0         |
    | type        | other               |
    | user_type   | by name: Cash       |
    | currency_id | by name: GBP        |
      

  @account_voucher_init
  Scenario: Company setting
    Given I need a "res.company" with oid: base.main_company
    And having:
    | name                                 | value                |
    | expense_currency_exchange_account_id | by name: Currency fx |
    | income_currency_exchange_account_id  | by name: Currency fx |
