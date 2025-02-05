## Artihmetic Operations Script

---

## What it does

The follwoing script takes two numbers as input from the user and performs basic arithmetic operations (addition, subtraaction, multiplication, and division) and then displays all the answers of those operations in the terminal.

---

## The Scripts code

```bash

#!/bin/bash

# Prompts the user for two numbers

read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Performs the arithmetic operations

sum=$((num1 + num2))
difference=$((num1 - num2))
product=$((num1 * num2))

# bc is used for floating-point division
division=$(echo "scale=2; $num1 / $num2" | bc)

# Display the results

echo "Results:"
echo "Addition: $num1 + $num2 = $sum"
echo "Subtraction: $num1 - $num2 = $difference"
echo "Multiplication: $num1 * $num2 = $product"
echo "Division: $num1 / $num2 = $division"

```

## Key Takeaways from the script

1. Takes User Input → Uses read `-p` to get two numbers.
2. Performs Arithmetic → Uses `$((...))` for addition, subtraction, and multiplication.
3. Handles Floating-Point Division →
   
   - Bash’s `$((...))` only supports integer division (e.g., 5/2 gives 2).
   
   - `bc` (Basic Calculator) is used for precise division.
   
   - `scale=2` ensures the result has two decimal places (e.g., 5/2 → 2.50).
   
   - The pipeline `echo "scale=2; $num1 / $num2" | bc` sends the calculation to bc.

4. Displays Results → Outputs formatted calculations with `echo`.

---

## Key Bash Commands

`read -p` → Prompts the user for input

`$((...))` → Performs integer arithmetic

`bc` → Handles floating-point math

`echo` → Prints output

`scale=2` → Sets decimal precision in bc




