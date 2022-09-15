from typing import Any


def most_common_letter(palavra):

print("Escreva alguma palavra :")
palavra = input()
alphabet = {'a':0, 'b':0, 'c':0, 'd':0, 'e':0, 'f':0, 'g':0, 'h':0, 'i':0, 'j':0, 'k':0, 'l':0, 'm':0, 'n':0, 'o':0, 'p':0, 'q':0, 'r':0, 's':0, 't':0, 'u':0, 'v':0, 'w':0, 'x':0, 'y':0, 'z':0}

#PERCORRENDO A STRING (caractere por caractere)

for i in palavra.lower():
        alphabet[i] += 1

#VARIAVEL QUE CONTEM A CHAVES E CONTEUDO DO DICIONARIO

lista=list(alphabet.palavra())

#PRINTANDO

print(lista)

print("A letra mais comum dessa palavra é: ")

top_frequency = max(list(alphabet.values()))

most_frequent_letter = [k for k, v in alphabet.palavra() if top_frequency == v][0]

return most_frequent_letter