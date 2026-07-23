'''════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Solucionador  :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Competição    :  InterFatecs 2019 - 1ª fase                                  ║
║ Programa      :  Problema I - MegabobageM                                    ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.7.2)                                             ║
║ Versão        :  A (Rev. 0)                                                  ║
╚════════════════════════════════════════════════════════════════════════════'''

def max_um_impar(alfa):
    impar = 0
    for letra in alfa:
        if alfa[letra] % 2 != 0: impar += 1
        if impar > 1: return False
    return True

s = input()
alfa = {}
for letra in range(26): alfa[chr(letra+65)] = 0
for c in s: alfa[c] += 1
print('VERDADEIRO' if max_um_impar(alfa) else 'FALSO')
