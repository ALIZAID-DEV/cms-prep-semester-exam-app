# Subject
Computer Science / C++ Programming

# Topic
Basic Data Types and Variables (Lecture #06)

# Confidence
High (90%)

# Lecture Explanation
Ye lecture C++ mein Variables aur Basic Data Types par hai. Roman Urdu + English summary:

- Variables kya hotay hain: Variable ek labeled container hai jo computer memory mein value store karta hai. (Variable = name, type, value, location).  
- Data Type kya batata hai: Data Type batata hai kis qisam ka data store hoga, kitni memory lagegi, aur uske sath kya operations ho sakte hain. (Examples: int, float, double, char, bool, string).

- Basic data types covered:
  - int: whole numbers, example int age = 20; (lecture ke mutabiq size 4 bytes, range approx ±2 billion).
  - short, long long: short for smaller ranges, long long for very large integers (e.g., population).
  - float: decimal numbers with single precision; literals usually with suffix f (e.g., 99.99f).
  - double: higher precision decimals (e.g., pi = 3.14159265).
  - char: single character, use single quotes `'A'`.
  - bool: true/false values.
  - string: text, use double quotes `"Ahmed"`, include #include <string>.

- Variable creation methods:
  - Create and initialize together: int age = 20; (recommended).
  - Declare then assign later: int age; age = 20;
  - Multiple on one line: int a = 5, b = 10;

- Naming rules and conventions:
  - Must start with letter or underscore, no spaces, no special symbols like @ or #, case sensitive.
  - Conventions: camelCase for variables/functions, PascalCase for classes/structs, UPPER_CASE for constants.

- Common mistakes shown:
  - Using uninitialized variables (garbage values) — fix: initialize.
  - Wrong type for data (e.g., int price = 99.99 loses decimals) — fix: use float/double.
  - Wrong quotes: char uses single quotes, string uses double quotes.
  - Integer division: int/int gives integer result; cast to float to get fractional result.
  - Constants: use const to define unchangeable values (const float PI = 3.14159f).

- Example program: Student Report Card program illustrating string, int, float, arithmetic, boolean check (hasPassed) and output with cout.

# Key Exam Points
- Variable = name + type + value + memory location. (Variable creation and initialization important).  
- int for whole numbers (lecture: 4 bytes, ~-2 billion to +2 billion).  
- Use float (with f suffix) or double for decimals; double for more precision.  
- char uses single quotes ('A'); string uses double quotes ("Hello").  
- bool has only true or false.  
- Integer division: a/b when both int returns integer; cast to float to get decimal result.  
- Naming rules: start with letter or underscore, no spaces, case-sensitive.  
- Use const for values that should never change; constants cannot be reassigned.  
- Initialize variables before use to avoid undefined/garbage values.  
- Good naming (descriptive identifiers) improves code readability.

# MCQs
1) Which declaration is correct for storing a single character and a word as per the lecture?  
   A) char letter = "A"; string word = 'Hello';  
   B) char letter = 'A'; string word = "Hello";  (Correct)  
   C) char letter = "A"; string word = "Hello";  
   D) char letter = 'A'; string word = 'Hello';

2) Given int a = 5, b = 2; float result = a / b; what value does result hold (per the lecture example) if no cast is used?  
   A) 2.5  
   B) 2.0  (Correct)  
   C) 0.4  
   D) Compiler error

3) Which rule about variable names is stated in the lecture?  
   A) Variable names can start with a digit.  
   B) Variable names can contain spaces.  
   C) Variable names are case sensitive and must start with a letter or underscore.  (Correct)  
   D) Variable names must be all uppercase.

4) Which data type should you use to store money values with cents (according to the lecture's "Wrong Type" example)?  
   A) int  
   B) char  
   C) float or double (use float with f suffix if using float)  (Correct)  
   D) bool

5) What happens if you declare a constant with const and then try to change it later (as shown in lecture)?  
   A) The value silently updates.  
   B) The program prints a warning but continues.  
   C) Compiler error — constants cannot be reassigned.  (Correct)  
   D) The constant becomes a variable automatically.

# Unclear or Missing Information
- Minor typographical/format artifacts from slides:
  - Title slide shows "L e c t u re # 0 6" with spaced letters — formatting artifact.
  - On one slide the line reads: char symbol = '$’; — the closing quote is a curly/right single quote (’). This appears to be a typographical error; intended was a straight single quote `'`.
- No major missing sections; the lecture appears to be a slide deck outline rather than a full textbook chapter. If you need deeper details (e.g., exact memory sizes variations across platforms, signed vs unsigned types, or range specifics for short/long long), those are not provided in this document.