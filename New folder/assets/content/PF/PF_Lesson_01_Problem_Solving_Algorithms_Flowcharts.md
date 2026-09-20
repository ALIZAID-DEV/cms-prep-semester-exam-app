# Programming Fundamentals — Lesson 01
## Problem Solving, Algorithms aur Flowcharts

### 1. Problem solving kya hoti hai?

Programming mein sab se pehle code nahi likhte. Pehle problem ko samajhte hain, required input identify karte hain, output decide karte hain, aur solution ke logical steps banate hain. Is process ko problem solving kehte hain.

Simple formula: **Problem samjho → Input lo → Process apply karo → Output do.**

### 2. Algorithm

Algorithm kisi problem ko solve karne ke clear, finite aur ordered steps ka naam hai. Algorithm language-independent hota hai, yani pehle logic banta hai aur baad mein us logic ko C++ ya kisi aur language mein code karte hain.

### 3. Example: two numbers add karna

Problem: Do numbers lo aur un ka sum display karo.

Algorithm:

1. Start.
2. Number one read karo.
3. Number two read karo.
4. Sum = number one + number two calculate karo.
5. Sum display karo.
6. End.

### 4. Flowchart

Flowchart algorithm ki graphical representation hoti hai. Common symbols:

| Symbol | Meaning |
|---|---|
| Oval | Start/End or Terminator |
| Parallelogram | Input/Output |
| Rectangle | Process/Calculation |
| Diamond | Decision/Condition |
| Arrow | Flow direction |

### 5. C++ example

```cpp
#include <iostream>
using namespace std;

int main() {
    int num1, num2, sum;
    cout << "Enter first number: ";
    cin >> num1;
    cout << "Enter second number: ";
    cin >> num2;
    sum = num1 + num2;
    cout << "Sum = " << sum;
    return 0;
}
```

### 6. Exam method

Agar question aaye “Write an algorithm and draw a flowchart to add two numbers,” to pehle inputs, process aur output clearly likho. Algorithm ke steps numbered hon. Flowchart mein Start oval, input parallelograms, process rectangle, output parallelogram aur End oval use karo.

### 7. Common mistakes

Algorithm mein step order skip na karo. Input aur output ko mix na karo. Flowchart arrows clear rakho. Decision ke liye rectangle ki jagah diamond use karo. Code likhne se pehle dry run zaroor karo.

### 8. Practice

1. Teen numbers ka average nikalne ka algorithm banao.
2. Do numbers mein se larger number find karne ka flowchart design karo.
3. Student ke marks se percentage calculate karne ke steps likho.
4. Teen numbers ka sum aur product calculate karne ka C++ program banao.
