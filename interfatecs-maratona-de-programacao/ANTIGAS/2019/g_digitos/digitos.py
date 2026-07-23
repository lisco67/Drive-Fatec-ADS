'''════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Solucionador  :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Competição    :  InterFatecs 2019 - 1ª fase                                  ║
║ Programa      :  Problema G - Os dígitos de Duds                             ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.7.2)                                             ║
║ Versão        :  A (Rev. 0)                                                  ║
╚════════════════════════════════════════════════════════════════════════════'''

from math import sqrt, floor

def primo(n):
    if n % 2 == 0: return n == 2
    divisor = 3
    raiz = floor(sqrt(n))
    while divisor <= raiz and n % divisor != 0:
        divisor += 2
    return n > 1 and divisor > raiz

def digitos(n):
    qtd = [0] * 10
    while True:
        qtd[n%10] += 1
        n //= 10
        if n == 0: break
    return qtd

def intervalo(inicio, final, numeros={}):
    qtd = [0] * 10
    for n in range(inicio, final+1):
        if n not in numeros:
            numeros[n] = digitos(n) if primo(n) else None
        if numeros[n] != None:
            for dig in range(10):
                qtd[dig] += numeros[n][dig]
    return qtd

def exibe(qtd):
    for i in range(10):
        print('%d: %d' % (i, qtd[i]))

n = int(input())
for i in range(n):
    a, b = input().split()
    a, b = int(a), int(b)
    qtd = intervalo(a, b)
    print('INTERVALO', i+1)
    exibe(qtd)
