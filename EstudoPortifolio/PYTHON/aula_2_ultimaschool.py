#Input de variável
capital=int(input("Insira o aporte inicial (capitall): "))
taxadejuros=float(input("Insira a taxa de juros : "))
tempodeinvestimento=int(input("Insira o tempo do seu investimento: "))
numero1=float(input("Insira o primeiro numero: "))
numero2=float(input("Insira o segundo numero: "))
#CALCULO DO INVESTIMENTO
print("Qual o montante esperado?   ")
print(capital*(taxadejuros/100)*(tempodeinvestimento*365))
#operações matematicas
print("A soma é: ")
print(numero1+numero2)
print("A subtração é: ")
print(numero1-numero2)
print("A multiplicacao é: ")
print(numero1*numero2)
print("A divisão é: ")
print(numero1/numero2)
print("A exponenciação é: ")
print(numero1**numero2)
print("A divisão inteira é: ")
print(numero1//numero2)
print("O restro da divisão em modulo é: ")
print(numero1%numero2)