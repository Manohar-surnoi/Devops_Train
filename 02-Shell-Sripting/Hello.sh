#!/bin/bash

echo "Hello Manohar"
echo " My name is Manohar, I am from Hyderabad. Staying in Madhapur"

Hello()

{ echo "Hello!!!"
  echo "script name: $0"
  echo "Number of args: $#"
  echo " all args are: $@"
}
Hello $1 $2

# Parameters passed to the script are by defult not accessible by inside function