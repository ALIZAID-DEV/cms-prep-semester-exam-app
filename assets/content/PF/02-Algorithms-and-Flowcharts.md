INTRODUCTION TO

ALGORITHMS
&
FLOWCHARTS
           LECTURE # 05




                          YASIR YOUSUF
WHAT IS                                                                2


ALGORITHM
 An algorithm is simply a step-by-step recipe to solve a problem.


 KEY FEATURES:
       Ø Input - What information do you need? (Can be zero or more)
       Ø Output - What result do you want? (At least one)
       Ø Clear Steps - Each instruction must be crystal clear
       Ø Finite - Must end after a specific number of steps
       Ø Doable - Each step must be simple enough to execute
REAL-LIFE EXAMPLE                                        3


EXAMPLE-1: MAKING CHAI
  Step 1: Start
  Step 2: Fill kettle with water
  Step 3: Boil water
  Step 4: Add tea bag to cup
  Step 5: Pour hot water into cup
  Step 6: Add sugar (1 spoon)
  Step 7: Add milk
  Step 8: Stir for 10 seconds
  Step 9: Remove tea bag
  Step 10: Enjoy your chai!
  Step 11: End


  Notice: Anyone can follow these steps and make chai!
REAL-LIFE EXAMPLE
EXAMPLE-2: ORDERING FOOD ON FOODPANDA                             4

  Step 1: Start
  Step 2: Open Foodpanda app                       Notice:
  Step 3: Enter your location
                                          This includes a decision
  Step 4: Browse restaurants
  Step 5: Select a restaurant
                                      (checking if amount is enough)!
  Step 6: Add items to cart
  Step 7: If total amount > Rs. 500
       Proceed to checkout
      Else
       Add more items
  Step 8: Enter delivery address
  Step 9: Choose payment method
  Step 10: Confirm order
  Step 11: Wait for delivery
  Step 12: End
PROGRAMMING ALGORITHM

EXAMPLE-1: ADD TWO NUMBERS                                                             5


Problem: Take two numbers and find their sum.    #include <iostream>
                                                 using namespace std;

Step 1: Start
                                                 int main() {
Step 2: Create storage for num1, num2, and sum
                                                     int num1, num2, sum;
Step 3: Get num1 from user
Step 4: Get num2 from user                           cout << "Enter first number: ";
Step 5: Calculate sum = num1 + num2                  cin >> num1;
Step 6: Show the sum
                                                     cout << "Enter second number: ";
Step 7: End
                                                     cin >> num2;

                                                     sum = num1 + num2;
                                                     cout << "Sum = " << sum;

                                                     return 0;
                                                 }
PROGRAMMING ALGORITHM
EXAMPLE-2: CHECK EVEN OR ODD NUMBER                                                    6


Real-Life Context: Imagine you're organizing a   #include <iostream>
school event and need to divide students into    using namespace std;
two groups based on their roll numbers – even
roll numbers in Group A, odd in Group B.
                                                 int main() {
                                                     int num1, num2, sum;
Step 1: Start
Step 2: Get the number                               cout << "Enter first number: ";
Step 3: Divide number by 2 and check remainder       cin >> num1;
Step 4: If remainder is 0
                                                     cout << "Enter second number: ";
     Show "Even number"
                                                     cin >> num2;
    Else
     Show "Odd number"                               sum = num1 + num2;
Step 5: End                                          cout << "Sum = " << sum;

                                                     return 0;
                                                 }
                WHAT ARE
                                                        7

                FLOWCHARTS
          A flowchart is a picture-based way to show an
          algorithm using shapes and arrows.


          WHY USE FLOWCHARTS?
          Ø Visual – Like looking at a map instead of
            reading directions
          Ø Universal – Works with any programming
            language
          Ø Easy to Share – Helpful for explaining ideas to
            others


REAL-LIFE EXAMPLE:
Think of Google Maps showing your route with arrows and
symbols — that’s basically a flowchart for navigation!
EDUCATION FOR

FLOWCHART SYMBOLS   8
BASIC                                                                                     9


RULES
  Ø One Start, One End – Every flowchart should begin with a single start point and end with
    a single end point.


  Ø Top to Bottom Flow – The flow generally moves from top to bottom.


  Ø Clear Arrows – Always use arrows to clearly show the direction of flow.


  Ø No Crossed Lines – Avoid crossing lines to keep the flowchart neat and readable.


  Ø Simple Language – Use short, clear, and easy-to-understand instructions.
COMPLETE EXAMPLES                                                                         10


EXAMPLE 1: CALCULATE PIZZA BILL
Real-Life Scenario: You're at a pizza shop. You order pizzas, and the system calculates your total
bill.


Step 1: Start
Step 2: Get the number of pizzas
Step 3: Get the price per pizza
Step 4: Calculate total = number of pizzas × price per pizza
Step 5: Display the total bill
Step 6: End
COMPLETE EXAMPLES                                                                       11


EXAMPLE 2: CHECK EXAM PASS/FAIL
Real-Life Scenario: University exam system checking if a student passed (requires 50+ marks).


Step 1: Start
Step 2: Get student marks
Step 3: If marks >= 50
     Display "Pass"
    Else
     Display "Fail"
Step 4: End
COMPLETE EXAMPLES
EXAMPLE 3: FIND LARGEST OF TWO NUMBERS
                                                                                       12



Real-Life Scenario: Comparing two mobile phone prices to find which one is more expensive.

Step 1: Start
Step 2: Get price1 and price2
Step 3: If price1 > price2
     Display "First phone is more expensive"
    Else
     Display "Second phone is more expensive"
Step 4: End
QUICK

TIPS
                    DON'T SKIP             DON'T BE                    DON'T
                      STEPS                 VAGUE                  OVERCOMPLICATE
                  Include every single   Write "price = 100"        If too big, break into
                         step             not "set price"                smaller parts




              1           2         3        4          5      6          7
        THINK BEFORE        USE STANDARD              TEST WITH
          DRAWING                                                    KEEP IT SIMPLE
                              SYMBOLS                 EXAMPLES
        Plan your logic    Don't create your        Walk through         One clear
         mentally first      own shapes             with sample       instruction per
                                                     numbers              symbol
                                 14
PRACTICE

ASSIGNMENT

 Create algorithm AND
     flowchart for:
A student checking if they can
   afford a new phone. Get
  phone price, get savings
 amount. If savings >= price,
    show 'You can buy it!',
 otherwise show how much
   more money is needed.
                                                            15
KEY POINTS TO

REMEMBER                     OVAL
                           Start/End

ALGORITHM                                      PARALLELOGRAM
Step-by-step


                  a          b             c
                                                   Input/Output
instructions




                 e                     f
FLOWCHART                                            RECTANGLE
Visual diagram    Good planning
                     = Better                  Process/Calculation
using symbols
                    programs!

ALWAYS PLAN
BEFORE CODING!    g       Feel free
                           to ask!         h           DIAMOND
                                                Decision/Question
WHY THIS

MATTERS
                                                                                         16
                                 Real-World Benefit:
                       Companies like Google, Facebook, and local
                         Pakistani startups all use flowcharts to:

   PLAN NEW FEATURES                                                 WRITE BETTER CODE
                                                                                FASTER



   EXPLAIN SYSTEMS TO                                                      MAKE FEWER
   TEAM MEMBERS                                                              MISTAKES




   FIND AND FIX BUGS                                                      UNDERSTAND
   FASTER                                                            COMPLEX PROBLEMS
                                                                                EASILY


   DOCUMENT HOW                                                      COMMUNICATE YOUR
   THINGS WORK                                                           IDEAS CLEARLY
                                           17

PRACTICE PROBLEMS

PROBLEM 1: ATM WITHDRAWAL

Create algorithm and flowchart:

Ø Enter PIN
Ø Enter amount to withdraw
Ø If balance >= amount, give cash
Ø Otherwise, show "Insufficient balance"
                                       18

PRACTICE PROBLEMS

PROBLEM 2: TEMPERATURE CHECK

Create algorithm:

Ø If temp > 30: Show "Hot day"
Ø If temp < 15: Show "Cold day"
Ø Otherwise: Show "Pleasant weather"
  ANY
QUESTION
