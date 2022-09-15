"""Escopo de Variaveis

Dois casos de escopo de variaveis

1.Variáveis Globais : São reconhecidas, ou seja, seu escopo compreende todo o programa

2.Variáveis Locais : São reconhecidas apenas no bloco onde foram declaradas, ou seja, seu escopo está limitado ao bloco em que foi declarada


Para declarar variáveis em python fazemos :
nome_da_variavel = valor_da_variavel

Python é uma liguagem de tipagem dinamica que significa que ao declararmos uma variavel, nós não colocamos o tipo de dado
dela . Esse tipo é inferido ao atribuirmos o valor à mesma

c -> int numero = 42;

JAVA -> int numero = 42;

"""
numero = 42 #EXEMPLO DE VARIAVEL GLOBAL
print(numero, type(numero))

numero='geek'
print(numero, type(numero))

nao_existo = 'oi'
print(nao_existo, type(nao_existo))

novo = numero + 10 #Forma correta
numero = 43
if numero > 10:
     novo = numero + 10 (forma errada) #local
   print(novo)

