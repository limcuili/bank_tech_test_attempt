# bank_tech_test

Note that the specifications for this projects are written at the bottom of this README  

## Get it working
1. Clone this repo to your local machine  
2. Move into repo directory: 'cd bank_tech_test_attempt'  
3. Install dependencies: 'bundle install'  
4. Boot up interactive ruby: 'irb'
5. Require relevant files: 'require './lib/account''
6. Play around in irb, beginning with 'account = Account.new"

## Run Tests
1. Check that I've tested my code with RSpec: in your terminal, enter 'rspec'.  
2. Check coverage with SimpleCov: open up coverage/index.html in your browser and check out what tests I've missed so far.

## My Reflections
Pretty much did this in one afternoon in a rush.  
Did not understand what credit and debit is, so the transaction's credit and debit may be confusing.  

This week is quite messy for me, with job searches, visa applications, and prepping for my Masters programme.  
Lesson of the week: My thought process gets quite haphazard when I'm not focused on one task.  

### Issues with this code:  
:bangbang: Tight coupling  
:bangbang: Duplication of concerns  
:bangbang: Seperation of concerns (there should not exist business logic and presentation logic in Account class)  
:bangbang: Encapsulation (there should not exists an attribute reader for account.transactions)  
:heavy_exclamation_mark: Specs test states not behaviour  
:heavy_exclamation_mark: Commits not descriptive enough

### What I could do better
- Take some time before I start the project to stop and plan out my project.
- Plan out my tests before planning my code.
- Refactor as I go
  
## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
