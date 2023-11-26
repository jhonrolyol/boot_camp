
# Shortcuts:
    # ctrl + s: save
    # ctrl + ñ: open terminal
    # Compile python in bash: python file_name.py
    # To view the Python version: python --version
    # Change folder: cd name_folder or cd ..

# Option 1
age = int(input("Introduce your age: "))

if (18 <= age <= 120) :
    print("You're of age")
elif (0 <= age < 18):
    print("You are a minor")
elif (age < 0):
    print("Age cannot be negative.")
else:
    print("The age entered is unusually high.")





