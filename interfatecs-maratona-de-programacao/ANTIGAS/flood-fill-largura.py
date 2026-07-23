from time import *

def exibe(planta):
    for linha in planta:
        for coluna in linha:
            print(coluna, end=' ')
        print()
    #for linha in planta: print(linha)

def valido(L, C, planta):
    return 0 <= L < len(planta) and \
           0 <= C < len(planta[L]) and \
           planta[L][C] != '!'

def busca(planta, linha, coluna):
    fila = []
    fila.append([linha, coluna, 0]) # posição atual e passos para alcançá-la
    while fila != []:
        L, C, P = fila.pop(0) # Linha, Coluna, Passos
        if planta[L][C] == 'S': return P
        if planta[L][C] == 'O': continue
        planta[L][C] = '!'

        print('\n' * 30)
        exibe(planta)
        input()

        if valido(L-1, C, planta): fila.append([L-1, C, P+1])
        if valido(L, C+1, planta): fila.append([L, C+1, P+1])
        if valido(L+1, C, planta): fila.append([L+1, C, P+1])
        if valido(L, C-1, planta): fila.append([L, C-1, P+1])
    return -1

'''
planta = [ ['OOP.O'],
           ['S....'],
           ['..OO.'],
           ['..OO.'],
           ['...OS'] ]
'''
planta = [ ['O','O','P','.','O'],
           ['S','.','.','.','.'],
           ['.','.','O','O','.'],
           ['.','.','O','O','.'],
           ['.','.','.','O','S'] ]
