# Programming Fundamentals — Lesson 02
## Programming Basics, Variables, Operators, Conditions aur Loops

### 1. Programming language

Programming language woh language hai jis se hum computer ko instructions dete hain. C++ ek general-purpose programming language hai. Compiler source code ko machine-understandable form mein translate karta hai, jabke linker required library aur object files ko combine karta hai.

### 2. Variables and data types

Variable memory ka named storage location hota hai. Data type batata hai ke variable mein kis type ka data store hoga.

| Data type | Example | Use |
|---|---|---|
| int | 25 | Whole numbers |
| float | 3.14f | Decimal values |
| double | 12.567 | More precise decimals |
| char | 'A' | Single character |
| bool | true/false | Logical condition |
| string | "CMS Prep" | Text |

### 3. Input and output

C++ mein output ke liye `cout` aur input ke liye `cin` use hota hai.

```cpp
int age;
cout << "Enter age: ";
cin >> age;
cout << "Age = " << age;
```

### 4. Operators

Arithmetic operators: `+`, `-`, `*`, `/`, `%`.

Comparison operators: `==`, `!=`, `>`, `<`, `>=`, `<=`.

Logical operators: `&&` means AND, `||` means OR, and `!` means NOT.

### 5. Conditional statements

Condition ka use decision lene ke liye hota hai. `if` statement tab execute hoti hai jab condition true ho. `else` alternative block hota hai.

```cpp
if (marks >= 50) {
    cout << "Pass";
} else {
    cout << "Fail";
}
```

### 6. Loops

Loop kisi statement ko repeatedly execute karta hai. `for` loop tab useful hota hai jab repetitions ka number known ho. `while` loop condition true rehne tak run hota hai.

```cpp
for (int i = 1; i <= 5; i++) {
    cout << i << " ";
}
```

### 7. Exam strategy

Code likhne se pehle variable list, input, formula, condition aur expected output likho. Dry run table bana kar har step ki value check karo. Braces, semicolon, comparison operator aur loop update ko carefully verify karo.

### 8. Practice

1. Student ke marks input lekar Pass/Fail program banao.
2. Do numbers mein larger number find karo.
3. 1 se 10 tak numbers print karne ka `for` loop likho.
4. Number even ya odd check karo.
5. Teen numbers ka average calculate karo.
