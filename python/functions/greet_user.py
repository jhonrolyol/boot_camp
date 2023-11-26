# Shortcuts:
    # ctrl + s: save
    # ctrl + ñ: open terminal
    # Compile python in bash: python file_name.py
    # To view the Python version: python --version
    # Change folder: cd name_folder or cd ..

# Option 1
def greet_user():
    i = int(input("Introduce a number: "))
    if i == 2:
        name = input("Introduce your name: ")
        print(f"Hello, {name}")
    else:
        print("Invalid value for i")

# Call the function
greet_user()


# Option 2
def greet(name):
    return f"Hello, {name}! How are you today?"

message = greet("Alice")
print(message)  # Output: Hello, Alice! How are you today?

