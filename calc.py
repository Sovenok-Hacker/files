while True:
           D = input('''Действие (+, -, *, /): ''')
           A = int(input("Число 1: "))
           B = int(input("Число 2: "))
           if D == "+":
                       C = str(A + B)
           elif D == "-":
                         C = str(A - B)
           elif D == "*":
                         C = str(A * B)
           elif D == "/":
                         C = str(A / B)
                         
                         
           print("Результат: " + C)
