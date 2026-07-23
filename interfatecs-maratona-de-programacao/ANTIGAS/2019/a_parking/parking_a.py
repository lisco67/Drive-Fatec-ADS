'''════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Solucionador  :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Competição    :  InterFatecs 2019 - 1ª fase                                  ║
║ Programa      :  Problema A - Parking Lot                                    ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.7.2)                                             ║
║ Versão        :  A (Rev. 0)                                                  ║
╚════════════════════════════════════════════════════════════════════════════'''

n       = int(input())
entrada = []
saida   = []
for i in range(n):
    linha = [int(x) for x in input().split()]
    entrada.append(linha[0]*60 + linha[1])
    saida.append(linha[2]*60 + linha[3])
print(max(saida) - min(entrada))
