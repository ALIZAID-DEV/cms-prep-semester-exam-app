# Programming Fundamentals — Lesson 03
## Arrays, Functions, Strings, Memory, Files aur Debugging

### 1. Arrays

Array same data type ke multiple values ko continuous memory locations mein store karta hai. Indexing normally zero se start hoti hai.

```cpp
int marks[5] = {70, 65, 82, 76, 90};
cout << marks[0];
```

`marks[0]` first value ko represent karta hai. Loop use karke array ke tamam elements process kiye ja sakte hain.

### 2. Multi-dimensional arrays

Two-dimensional array rows aur columns ki form mein data store karta hai. Isay table ya matrix ki tarah samjho.

```cpp
int matrix[2][3] = {{1, 2, 3}, {4, 5, 6}};
```

### 3. Functions

Function reusable block of code hota hai. Function code ko modular, readable aur easy to test banata hai.

```cpp
int add(int a, int b) {
    return a + b;
}
```

Function ke main parts hain: return type, function name, parameters aur body. Function call karne par function execute hota hai.

### 4. Strings

String characters ka sequence hota hai. C++ mein `string` type se text store kar sakte hain.

```cpp
string name = "CMS Prep";
cout << name.length();
```

Common string operations: length, concatenation, comparison aur substring.

### 5. Pointers and references

Pointer aisa variable hota hai jo kisi doosre variable ka memory address store karta hai. Reference kisi existing variable ka alternate name hota hai. Ye advanced topics hain, isliye pehle variables aur memory ka basic concept strong karo.

### 6. Static and dynamic memory

Static memory compile-time ya fixed structure ke saath allocate hoti hai. Dynamic memory runtime par allocate ho sakti hai aur flexible size allow karti hai. Dynamic memory use karte waqt memory leak aur invalid pointer se bachna zaroori hai.

### 7. File I/O

File input/output se data ko file mein write ya file se read kar sakte hain.

```cpp
#include <fstream>
ofstream file("notes.txt");
file << "CMS Prep";
file.close();
```

File open failure check karna aur file close karna important hai.

### 8. Debugging

Debugging program ke errors identify aur fix karne ka process hai. Common errors:

- Syntax error: grammar ya punctuation mistake.
- Runtime error: program run karte waqt problem.
- Logical error: program run hota hai lekin result wrong hota hai.

Debugging method: error message read karo, problem ko small parts mein divide karo, values print karke check karo, aur ek change ke baad dobara test karo.

### 9. Practice

1. Array ke tamam elements ka sum calculate karo.
2. Array mein largest value find karo.
3. Aisi function banao jo number ka square return kare.
4. Two-dimensional array ke rows ka sum calculate karo.
5. Text file mein student name aur marks write karo.
6. Ek program mein intentional logical error identify karke fix karo.
