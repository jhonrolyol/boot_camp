# Shortcuts:
    # ctrl + s: save
    # ctrl + ñ: open terminal
    # Compile python in bash: python file_name.py
    # To view the Python version: python --version
    # Change folder: cd name_folder or cd ..


''' Challenge 1: Number Reversal

    Write a Python function called "reverse_number" that takes 
    an integer as an argument and returns the reverse of 
    that number. For example, if the input is 123, the
    function should return 321.

'''

# Solution:

def reverse_number(number):
    # Convert the number to a string and reverse it
    reversed_str = str(number)[::-1]
    # Convert the reversed string back to an integer
    reversed_number = int(reversed_str)
    return reversed_number

# Test the function
input_number = int(input("Enter a number: "))
result = reverse_number(input_number)
print(f"The reverse of {input_number} is: {result}")





