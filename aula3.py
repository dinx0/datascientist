#Entrada de dados
print("Qual é o nome? ")
nome=input() #Input -> Entrada
#Processamento
#print("Seja bem vindo(a) %s" %nome)
print("Seja bem vindo(a) {0}" .format(nome))
#Saida dos dados
print("Qual a sua idade? ")
idade=input()

#EXEMPLO DE PRINT ANTIGO
#print("A %s tem %s anos" % (nome, idade))
print("A {0} tem {1} anos" .format(nome,idade)) #Exemplo de print novo


print(f'A {nome} tem {idade} anos')


#CAST É A CONVERSÃO DE UM TIPO DE DADO PARA OUTRO

#int(idade) => cast para inteiro para calculo
print(f'A {nome} nasceu em {2022 -int(idade)}')

