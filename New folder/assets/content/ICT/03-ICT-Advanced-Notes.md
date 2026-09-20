Basic Data Types and Variables
           L e c t u re # 0 6




              YASIR YOUSUF
    TODAY'S GOAL

Learn how to store and manage information in C++ programs!

Key Question: How does a program remember things?
Answer: By using Variables with the right Data Types!




                             YASIR YOUSUF
     WHAT IS DATA?

Data is information that your program works with.

Real-World Examples:
   • Your age: 20
   • Your name: "Ahmed"
   • Your GPA: 3.75
   • Are you enrolled?: Yes (true/false)
In programming, we store this data so we can use it later!


                                 YASIR YOUSUF
                              WHAT IS A VARIABLE?
A Variable is like a labeled container that stores a value in your computer's memory.

Real-Life Example: Think of variables as labeled storage boxes
  • Label on box = Variable name (like age)
  • What's inside = Value (like 20)
  • Type of box = Data type (number box, text box, etc.)

Just like you wouldn't store water in a cardboard box, you need the right type of variable for your
data!

Every Variable Has:                                                Example: int age = 20;
• A name - what you call it (like studentAge)
• A type - what kind of data it holds (number, text, etc.)         Name: age
• A value - the actual information stored                          Type: int (whole number)
• A location - where it sits in computer memory                    Value: 20


                                            YASIR YOUSUF
        What is a Data Type?
A Data Type tells the computer:
  • What kind of information you're storing
  • How much space it needs in memory
  • What you can do with it

Real-Life Example:
  • A water bottle holds liquids
  • A wallet holds money
  • A phone stores contacts                     Similarly:
                                                  • An int variable holds whole numbers
                                                  • A char variable holds a single letter
                                                  • A string variable holds text


                                     YASIR YOUSUF
                BASIC DATA TYPES IN C++
1. Integer Types - For Whole Numbers
      int (Regular whole numbers)
         • int age = 20;
         • int score = 85;
         • int year = 2025;

     When to use:
      • Counting things (number of students: 30)
      • Age (someone's age: 22)
      • Scores (test score: 95)
      • Years (year: 2025)

     Important Details:
       • Size: 4 bytes
       • Range: About -2 billion to +2 billion
       • No decimals allowed

                                          YASIR YOUSUF
                BASIC DATA TYPES IN C++
short (Smaller whole numbers)
  • short days = 30;
  • short temperature = -5;

When to use: Small numbers to save memory (rarely needed nowadays)

long long (Very large whole numbers)
   • long long population = 8000000000; // World population
   • long long distance = 384400000; // Distance to moon in meters

When to use: Really big numbers (like country populations, astronomical distances)




                                          YASIR YOUSUF
                 BASIC DATA TYPES IN C++
2. Decimal Types - For Numbers with Decimal Points

  float (Decimal numbers)
     • float price = 99.99f;
     • float temperature = 36.5f;
     • float percentage = 85.7f;

  Real-Life Uses:
    • Prices: $19.99
    • Temperature: 36.6°C
    • Measurements: 5.5 inches

  Note: Always add f at the end: 10.5f not just 10.5




                                            YASIR YOUSUF
           BASIC DATA TYPES IN C++
double (More precise decimals)
  • double gpa = 3.756;
  • double pi = 3.14159265;
When to use: When you need more accuracy (scientific calculations, precise measurements)
3. Character Type - For Single Letters/Symbols
   • char (One character only)
   • char grade = 'A';
   • char firstLetter = 'M';
   • char symbol = '$’;
Real-Life Examples:                        Important: Use single quotes 'A'
  • Grade on report card: 'A'              not double quotes "A"
  • First initial: 'S'
  • Currency symbol: '$'

                                     YASIR YOUSUF
           BASIC DATA TYPES IN C++
4. Boolean Type - For Yes/No Questions
   bool (True or False only)
     • bool isRaining = true;
     • bool hasPassed = false;
     • bool isLoggedIn = true;

  Real-Life Examples:
    • Is it raining? → true or false
    • Did student pass? → true or false
    • Is light on? → true or false

  Only two possible values: true or false


                                      YASIR YOUSUF
           BASIC DATA TYPES IN C++
5. String Type - For Text/Words
string (Multiple characters)
   • string name = "Ahmed Ali";
   • string city = "Lahore";
   • string message = "Hello World!";

Real-Life Examples:
  • Names: "Sara Khan"
  • Addresses: "123 Main Street"
  • Messages: "Welcome!"

     Important:
       • Use double quotes "Hello" not single quotes
       • Must add #include <string> at top of program

                                    YASIR YOUSUF
         TYPE        USED FOR              EXAMPLE      REAL-LIFE USE
int             Whole numbers         25             Age, count, year
float           Decimals              99.99f         Price, temperature
double          Precise decimals      3.14159        Scientific values
char            Single character      'A'            Grade, initial
bool            Yes/No                true           On/Off, Pass/Fail
string          Text                  "Hello"        Names, messages



                                   YASIR YOUSUF
         CREATING AND USING VARIABLES
                                     Method 1:
                      Create and Set Value Together (Best Way)
                                    int age = 20;
                                string name = "Ali";
                                float price = 49.99f;

           Real-Life Example:                                        Method 2:
string studentName = "Sara Ahmed";                          Create First, Set Value Later
         int rollNumber = 101;                                 int age;     // Create
            float gpa = 3.8f;                              age = 20; // Set value later
        bool isEnrolled = true;


                                     Method 3:
                             Multiple Variables at Once
                              int a = 5, b = 10, c = 15;


                                       YASIR YOUSUF
                NAMING RULES - HOW TO NAME VARIABLES

Must Follow These Rules:              Can't use special symbols
                                       int my_age; ✅
Start with letter or underscore        int my@age; ❌
 int age;     ✅                        int my#age; ❌
 int _count; ✅
 int 123abc; ❌                        Case matters
                                       int age;
No spaces allowed                       int Age;
 int student_age; ✅                     int AGE;
 int studentAge; ✅                      // These are THREE different variables!
 int student age; ❌

                                  YASIR YOUSUF
                     GOOD NAMING PRACTICES
Bad Names (Don't do this):                     Real-Life Example:
  int a;    // What is 'a'?                      // Bad
  int x;    // What does 'x' mean?               int x = 100;
  int thing; // Too vague                        int y = 50;
Good Names (Do this):                               // Good - You know exactly what these are!
  int studentAge;     // Clear meaning              int totalStudents = 100;
  int totalMarks;   // Easy to understand           int passingMarks = 50;
  int numberOfStudents; // Descriptive




                                     YASIR YOUSUF
             STUDENT REPORT CARD PROGRAM
#include <iostream>
#include <string>
using namespace std;

int main() {
  // Student Information
  string studentName = "Ahmed Khan";
  int rollNumber = 2024101;

 // Subject Marks
 int mathMarks = 85;
 int englishMarks = 78;
 int scienceMarks = 92;

 // Calculate Total and Average
 int totalMarks = mathMarks + englishMarks + scienceMarks;
 float average = totalMarks / 3.0;

                                   YASIR YOUSUF
                 STUDENT REPORT CARD PROGRAM
    // Determine Pass/Fail
    bool hasPassed = (average >= 50);

    // Display Report Card
    cout << "=== REPORT CARD ===" << endl;
    cout << "Name: " << studentName << endl;
    cout << "Roll Number: " << rollNumber << endl;
    cout << "Math: " << mathMarks << endl;
    cout << "English: " << englishMarks << endl;
    cout << "Science: " << scienceMarks << endl;
    cout << "Total: " << totalMarks << endl;
    cout << "Average: " << average << endl;
    cout << "Result: " << (hasPassed ? "PASS" : "FAIL") << endl;

    return 0;
}


                                           YASIR YOUSUF
WHAT YOU'RE NAMING      CONVENTION               EXAMPLE
Regular variables  camelCase             studentAge
Function names     camelCase             calculateTotal()
Class names        PascalCase            StudentRecord
Constants          UPPER_CASE            MAX_STUDENTS
Struct names       PascalCase            BankAccount




                          YASIR YOUSUF
                        COMMON MISTAKES TO AVOID

Mistake 1: Not Setting Initial Value

  int age;
  cout << age; // Prints random garbage!

  // Fix: Always set a starting value
  int age = 0;
  cout << age; // Prints 0




                                        YASIR YOUSUF
                   COMMON MISTAKES TO AVOID

Mistake 2: Wrong Type for Data

  int price = 99.99; // Oops! Lost the .99
  cout << price; // Shows: 99 (missing cents!)

  // Fix: Use float for prices
  float price = 99.99f;
  cout << price; // Shows: 99.99




                               YASIR YOUSUF
                    COMMON MISTAKES TO AVOID

Mistake 3: Wrong Quotes

 char letter = "A"; // Wrong! Use single quotes
 string word = 'Hello'; // Wrong! Use double quotes

 // Fix:
 char letter = 'A'; // Single quotes for char
 string word = "Hello"; // Double quotes for string




                                YASIR YOUSUF
                       COMMON MISTAKES TO AVOID

Mistake 4: Integer Division Problem

  int a = 5, b = 2;
  float result = a / b; // Shows 2.0, not 2.5!
  // Why? Both are integers, so division is integer math

  // Fix:
  float result = (float)a / b; // Shows 2.5




                                    YASIR YOUSUF
            CONSTANTS - VALUES THAT NEVER CHANGE

Sometimes you have values that should NEVER change:

 const float PI = 3.14159f;
 const int DAYS_IN_WEEK = 7;
 const string SCHOOL_NAME = "City High School";

 // PI = 3.14; // Error! Can't change a constant

 Real-Life Examples:
 • Days in a week (always 7)
 • Months in a year (always 12)
 • Speed of light (never changes)
 • Your school's name (fixed)
                                  YASIR YOUSUF
   PRACTICE EXERCISES                Exercise 2: Shopping Bill
Exercise 1: Create Your Profile      Create variables for:
Store these in variables:              • Item name
  • Your name                          • Price
  • Your age                           • Quantity
  • Your city                          • Total cost (price × quantity)
  • Your current semester
                                        Exercise 3: Temperature Converter
  • Are you a student? (yes/no)
                                        Store temperature in Celsius, convert to
                                        Fahrenheit
                                        (Formula: F = C × 9/5 + 32)




                                  YASIR YOUSUF
     ANY QUESTION ?
KEEP PRACTICING! THE MORE YOU CODE, THE BETTER YOU GET!




                      YASIR YOUSUF
