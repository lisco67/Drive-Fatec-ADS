'''════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Solucionador  :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Competição    :  InterFatecs 2019 - 1ª fase                                  ║
║ Programa      :  Problema J - Jogo da Vida                                   ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.7.2)                                             ║
║ Versão        :  A (Rev. 0)                                                  ║
╚════════════════════════════════════════════════════════════════════════════'''

from copy import deepcopy
# https://www.geeksforgeeks.org/copy-python-deep-copy-shallow-copy/

def vizinhos_vivos(m, L, C):
    vv = 0
    if 0 <= L-1        and m[L-1][C]=='1': vv += 1 # cima
    if C+1 < len(m[L]) and m[L][C+1]=='1': vv += 1 # direita
    if L+1 < len(m)    and m[L+1][C]=='1': vv += 1 # baixo
    if 0 <= C-1        and m[L][C-1]=='1': vv += 1 # esquerda

    if 0 <= L-1     and C+1 < len(m[L]) and  m[L-1][C+1]=='1': vv += 1 # cima-direita
    if L+1 < len(m) and C+1 < len(m[L]) and  m[L+1][C+1]=='1': vv += 1 # baixo-direita
    if L+1 < len(m) and 0 <= C-1        and  m[L+1][C-1]=='1': vv += 1 # baixo-esquerda
    if 0 <= L-1     and 0 <= C-1        and  m[L-1][C-1]=='1': vv += 1 # cima-esquerda

    return vv

def evolui(m, T):
    for instante in range(T):
        c = deepcopy(m)
        for i in range(len(m)):
            for j in range(len(m[i])):
                vv = vizinhos_vivos(c, i, j)
                if vv < 2: m[i][j] = '0'
                elif vv > 3: m[i][j] = '0'
                elif vv == 3: m[i][j] = '1'

def exibe(m):
    for i in range(len(m)):
        for j in range(len(m[i])):
            print(m[i][j], end='')
        print()

L, C = [int(x) for x in input().split()]
m = []
for i in range(L):
    linha = input()
    m.append([item for item in linha])
T = int(input())
evolui(m, T)
exibe(m)
