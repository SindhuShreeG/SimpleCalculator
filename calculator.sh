#!/bin/bash

# Simple Bash Calculator

echo "Simple Calculator"
echo "-----------------"

# Function to perform addition
add() {
  result=$(echo "$1 + $2" | bc -l)
  echo "Result: $1 + $2 = $result"
}

# Function to perform subtraction
subtract() {
  result=$(echo "$1 - $2" | bc -l)
  echo "Result: $1 - $2 = $result"
}

# Function to perform multiplication
multiply() {
  result=$(echo "$1 * $2" | bc -l)
  echo "Result: $1 * $2 = $result"
}

# Function to perform division
divide() {
  if (( $(echo "$2 == 0" | bc -l) )); then
    echo "Error: Division by zero is not allowed."
  else
    result=$(echo "scale=4; $1 / $2" | bc -l) # scale for decimal places
    echo "Result: $1 / $2 = $result"
  fi
}

while true; do
  echo -e "\nSelect an operation:"
  echo "1. Addition (+)"
  echo "2. Subtraction (-)"
  echo "3. Multiplication (*)"
  echo "4. Division (/)"
  echo "5. Exit"

  read -p "Enter your choice (1-5): " choice

  if [[ "$choice" -ge 1 && "$choice" -le 4 ]]; then
    read -p "Enter first number: " num1
    read -p "Enter second number: " num2

    # Validate if inputs are numbers
    if ! [[ "$num1" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$num2" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
      echo "Error: Invalid input. Please enter numbers only."
      continue
    fi

    case $choice in
      1)
        add "$num1" "$num2"
        ;;
      2)
        subtract "$num1" "$num2"
        ;;
      3)
        multiply "$num1" "$num2"
        ;;
      4)
        divide "$num1" "$num2"
        ;;
    esac
  elif [[ "$choice" == 5 ]]; then
    echo "Exiting calculator. Goodbye!"
    break
  else
    echo "Invalid choice. Please enter a number between 1 and 5."
  fi
done
