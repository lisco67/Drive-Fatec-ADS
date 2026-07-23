#S=input()
#teste=sorted(S)
#for i in range(len(S)-1):
#    contar=


#string = input
#saída = verdadeiro => par (tudo), impar (1)
#saída = falso = mais que um ímpar

#S = str(input())
#teste = sorted(S)
#erro = 0
#impar = 0
#soma = 0

#for i in range(len(teste)-1):
#    if teste[i] == teste [i+1]:
#        soma += 1
        
#    else:
#        if soma % 2 != 0:
#            impar += 1
#            soma = 0


#if impar > 1:
#    print('Falso')

#else:
#    print('True')

soma = 0
impar = 0
cont = 0

s = str(input())
tam = len(s)

for i in s:
    while cont < tam:
        if i == s[cont]:
            soma += 1
            print(soma)
        cont += 1

    if soma % 2 != 0:
        impar += 1
        print(impar)
    soma = 0
    cont = 0

if impar == 0 or impar == 1:
    print('Verdadeiro')

else:
    print('False')































    
        

    

