#!/bin/bash

# Prompts the user for two numbers

read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Performs the arithmetic operations

sum=$((num1 + num2))
difference=$((num1 - num2))
product=$((num1 * num2))

# Check for division by zero
if [ "$num2" -eq 0 ]; then
    division="Undefined (Cannot divide by zero)"
else
    division=$(echo "scale=2; $num1 / $num2" | bc)
fi

# bc is used for floating-point division
division=$(echo "scale=2; $num1 / $num2" | bc)

# Display the results

echo "Results:"
echo "Addition: $num1 + $num2 = $sum"
echo "Subtraction: $num1 - $num2 = $difference"
echo "Multiplication: $num1 * $num2 = $product"
echo "Division: $num1 / $num2 = $division"

